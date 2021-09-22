FROM python:3

ARG GITHUB_REPOSITORY
ARG GITHUB_REVISION

LABEL org.opencontainers.image.title        "rembg-server"
LABEL org.opencontainers.image.description  "rembg is a tool to remove images background."
LABEL org.opencontainers.image.revision     "${GITHUB_REVISION}"
LABEL org.opencontainers.image.source       "https://github.com/${GITHUB_REPOSITORY}"
LABEL org.opencontainers.image.authors      "Daniel Heene <daniel@muelheim-modular.de>"

RUN pip install torch==1.7.1+cpu torchvision==0.8.2+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install rembg

WORKDIR "/root"

EXPOSE 5000
VOLUME ["/root/.u2net"]

CMD ["rembg-server"]