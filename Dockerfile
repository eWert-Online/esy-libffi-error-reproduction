FROM esydev/esy:nightly-alpine-latest

RUN apk add --no-cache --update bash make curl perl-utils git patch gcc g++ \
  postgresql-libs postgresql-dev

WORKDIR /app

COPY ./esy.json ./

RUN esy install -vvv && esy build-dependencies -vvv

COPY . .

CMD [ "/bin/bash" ]