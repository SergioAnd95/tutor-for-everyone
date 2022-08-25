FROM python:3.9.13-slim

RUN apt-get update
RUN apt-get install -y libpq-dev gcc postgresql postgresql-contrib

RUN pip install poetry

WORKDIR /app

COPY ./src /app/src
#COPY poetry.lock /app
COPY pyproject.toml /app
#
#RUN poetry init
RUN poetry install

RUN cd src
CMD ["poetry", "run", "python", "manage.py", "runserver"]
