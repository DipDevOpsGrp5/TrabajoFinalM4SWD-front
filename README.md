# mod4-front

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn serve
```

### Compiles and minifies for production
```
yarn build
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### Correr con docker
```
docker build -t mod4 .
docker run -it --rm -v ${pwd}:/app -p 8080:8080 --workdir /app .
```
