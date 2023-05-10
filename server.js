const mysql = require('mysql2');
const path = require('path');
const express = require('express');
const app = express();

const dbPool = mysql.createPool({
  host: process.env.NODE_ENV === 'development' ? 'localhost' : 'server-mysql',
  user: 'root',
  password: '6bf7f8',
  database: 'serve',
});

const query = function (sql, options = []) {
  return new Promise((resolve, reject) => {
    dbPool.query(sql, options, function (error, results, fields) {
      if (error) {
        return reject(error);
      }

      return resolve(results);
    });
  })
};

app.use(express.json());
app.use(express.static(path.resolve(__dirname, './public')));

app.get('/', (req, res) => {
  res.status(200).sendFile(path.resolve(__dirname, './list.html'));
});

app.get('/post', (req, res) => {
  res.status(200).sendFile(path.resolve(__dirname, './post.html'));
});

app.get('/getList', async (req, res) => {
  const {pub_env, vpc_env, beta_env, is_modify, region} = req.query;
  const condition = [];
  const params = [];

  console.info(req.query);

  if (!!pub_env) {
    condition.push('pub_env = ?');
    params.push(pub_env);
  }

  if (!!vpc_env) {
    condition.push('vpc_env = ?');
    params.push(vpc_env);
  }

  if (!!beta_env) {
    condition.push('beta_env = ?');
    params.push(beta_env);
  }

  if (!!is_modify) {
    condition.push('is_modify = ?');
    params.push(is_modify);
  }

  if (!!region) {
    condition.push('region LIKE ?');
    params.push(`%${region}%`);
  }

  const data = await query(
    `
      SELECT * 
      FROM host
      ${condition.length ? `WHERE ${condition.join(' AND ')}` : ''}
      ORDER BY host;
    `,
    condition.length ? params : []
  );

  res.send({
    status: 200,
    list: data
  });
});

app.patch('/patchModify', async (req, res) => {
  const body = req.body;
  const option = [
    body.is_modify ? 1 : 0,
    body.host,
  ];

  try {
    await query(
      `
        UPDATE host
          SET is_modify = ?
        WHERE host = ?;
      `,
      option
    );
    res.status(200).end();
  } catch (error) {
    res.status(400).send({
      error,
    });
  }
});

app.delete('/deleteItem', async (req, res) => {
  const params = req.query;

  try {
    const host = await query(
      `
      SELECT * 
      FROM host
      WHERE host = ?;
    `,
      [params.host]
    );

    console.info('host: ');
    console.info(host);

    if (!!host || host.length !== 0) {
      await query(
        `
        DELETE FROM host
        WHERE host = ?;
      `,
        [params.host]
      );
      await query(
        `
        INSERT INTO deleted_host(host, ip, project, port, beta_env, pub_env, vpc_env) VALUES(?, ?, ?, ?, ?, ?, ?);
      `,
        Object.values(host[0]),
      );

      res.status(200).end();
    }
  } catch (error) {
    console.info(error);
    res.status(400).send({
      error,
    })
  }
});

app.post('/project', async (req, res) => {
  const body = req.body;
  let options = [
    body.host,
    body.project,
    body.beta_env,
  ];

  const host = await query(
    `
      SELECT * 
        FROM host 
      WHERE host=?;
    `,
    [body.host]
  );

  console.info(host);

  if (!host || !host.length) {
    try {
      await query('INSERT INTO host(host, project, beta_env) VALUES(?, ?, ?);', options);
      res.status(200).end();
    } catch (error) {
      res.status(400).send({
        error
      });
    }
  } else {
    options = [
      (host[0].project || '') + ',' + body.project,
      body.host,
    ];
    await query(
      `
        UPDATE host 
          SET project = ?
        WHERE host = ?;
      `,
      options);
    res.status(200).end();
  }
});

app.post('/modifyProject', async (req, res) => {
  const body = req.body;
  const options = [
    body.project,
    body.host,
  ];

  try {
    await query(
      `
      UPDATE host 
        SET project = ?
      WHERE host = ?;
    `,
      options);
    res.status(200).end();
  } catch (error) {
    res.status(400).end();
  }

});

app.post('/modifyRegion', async (req, res) => {
  const body = req.body;
  const options = [
    body.region,
    body.host,
  ];

  try {
    await query(
      `
      UPDATE host 
        SET region = ?
      WHERE host = ?;
    `,
      options);
    res.status(200).end();
  } catch (error) {
    res.status(400).end();
  }

});

app.post('/', async (req, res) => {
  const body = req.body;
  const options = [
    body.host,
    body.ip,
    body.project,
    body.port,
    body.beta_env,
    body.pub_env,
    body.vpc_env,
  ];

  const host = await query(
    `
      SELECT * 
        FROM host 
      WHERE host=?;
    `,
    [body.host]
  );

  if (!host || !host.length) {
    try {
      await query('INSERT INTO host(host, ip, project, port, beta_env, pub_env, vpc_env) VALUES(?, ?, ?, ?, ?, ?, ?);', options);
      res.status(200).end();
    } catch (error) {
      res.status(400).send({
        error
      });
    }
  } else {
    res.status(400).send({
      message: 'host already exists!'
    })
  }

});

app.listen(2009, () => {
  console.info('server open at http://localhost:2009');
});
