docker build -t api .
docker run --name api -p 3000:3000 -v ${PWD}:/app api
