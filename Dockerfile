FROM node:14-alpine AS builder
WORKDIR /app
COPY . /app/
RUN yarn

FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app /app/
ENV NODE_ENV=production

EXPOSE 2009
CMD ["npm", "run-script", "start-prod"]
