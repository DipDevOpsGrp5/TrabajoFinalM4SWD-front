# mod4-front

Para la ejecución de este proyecto se puede hacer de las siguientes formas:

## Correr local
```
# Con yarn
yarn install
yarn serve --port 3000

# Con npm
npm install
npm run serve -- --port 3000
```

### Correr con docker
```
docker build -t mod4 .
docker run -it --rm -v ${pwd}:/app -p 3000:3000 --workdir /app mod4
```
