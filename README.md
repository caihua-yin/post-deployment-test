# Post Deployment Test
- Run test locally: `make`
- Build test docker image: `make image`
- Push docker image to docker hub: `make push`

# Docker Run
`docker run -e "ENDPOINT=http://192.168.33.22" yinc2/post-deplopment-test:latest`
