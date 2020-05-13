# QR-WEB

A python web app to generate QR code using Flask and docker-compose.

## Build

```bash
docker-compose build
```

## Run

```bash
docker-compose up -d
```

## Use

```bash
curl  http://localhost:8080/qr?content=my+content -o qr.png
```