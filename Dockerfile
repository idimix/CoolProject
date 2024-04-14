FROM python:3.8-slim

ARG ENVIROMENT

WORKDIR /app

RUN python -m pip install --no-cache-dir poetry==1.8.2

COPY poetry.lock pyproject.toml ./

RUN echo asdasd
RUN echo ENVIROMENT=$ENVIROMENT

RUN if [ "$ENVIROMENT" = "prod" ]; \
    then \
        echo install prod dependencies...; poetry install --only main; \
    else \
        echo install dev dependencies...; poetry install; \
    fi

COPY ./app/app.py ./

CMD ["poetry", "run", "python", "app.py"]
