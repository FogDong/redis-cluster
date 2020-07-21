#基础镜像来自：https://github.com/docker-library/redis/blob/9c63bd5fc7b52cc3d8f3441a660a593028a0ed15/4.0/alpine/Dockerfile)
FROM test.cargo.io/library/redis:4.0.6-alpine

copy start.sh /


CMD [ "sh" ,"-c","/start.sh" ]
