# mod4-front

## Correr local
```
# yarn
yarn install
yarn serve --port 3000

# npm
npm install
npm run serve -- --port 3000
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### Correr con docker
```
docker build -t mod4 .
docker run -it --rm -v ${pwd}:/app -p 3000:3000 --workdir /app mod4
```
