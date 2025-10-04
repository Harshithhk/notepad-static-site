# Static Site

This repo will be built on jenkins using seedjob

## Run following commands to run the image

- ```docker build -t static-site .```
- ```docker run -d -p 8080:8080 --name my-static-site static-site```
