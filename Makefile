setup:
	python3 -m venv venv
	source venv/bin/activate 


install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb

lint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
    chmod +x /bin/hadolint
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test