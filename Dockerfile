FROM python:3.9
ENV PYTHONUNBUFFERED 1
RUN mkdir ./code
WORKDIR /code
ADD PROJECTNAME/Pipfile /code/
ADD PROJECTNAME/Pipfile.lock /code/
RUN pip install --upgrade pip
RUN pip install pipenv
RUN pipenv install --system --ignore-pipfile --deploy
RUN apt update -y
RUN apt install git -y
ADD . /code/