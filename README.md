# Project on Docker (Django)
Djangoプロジェクトを本リポジトリ内にクローンして開発するためのコンテナです。クローンするプロジェクトを変えることで開発環境を維持しながら開発可能です。サンプルとして（simple-django-project）をクローンします。

## Architecture
* Python 3.9
* Django
* Gunicorn
* Nginx
* Pipenv

## Usage
### 1.サンプルプロジェクトをクローン

    $ git clone https://github.com/nobnov/simple-django-project.git

### 2.プロジェクトディレクトリ名を変更

#### Dockerfile

    ADD PROJECTNAME/Pipfile /code/
    ADD PROJECTNAME/Pipfile.lock /code/
    ↓
    ADD simple-django-project/Pipfile /code/
    ADD simple-django-project/Pipfile.lock /code/

#### docker-compose.yml

    web:
    ...
    command: gunicorn WSGIPATH.wsgi:application --bind 0.0.0.0:8000
    volumes:
        - ./PROJECTNAME:/code
    ↓
    command: gunicorn config.wsgi:application --bind 0.0.0.0:8000
    volumes:
        - ./simple-django-project/config/:/code


    nginx:pw
    ...
    volumes:
            - ./PROJECTNAME/static:/static
    ↓
    volumes:
            - ./simple-django-project/config/static:/static

### 3.実行コマンド

    $ docker-compose build

    $ docker-compose up -d

## Shell（コンテナ内に入る）

    $ docker-compose exec web bash