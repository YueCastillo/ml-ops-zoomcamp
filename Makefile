PROJECT_NAME := $(notdir $(basename $(MAKEFILE_DIR)))


install:
		# Get the most recent version of pip and then install dependencies
		pip install --upgrade pip &&\
				pip install -r requirements.txt

test:
		# Automated testing with pytest
		python -m pytest -vv --cov $(PROJECT_NAME) 

format:
		# Code formatting
		black *.py 

lint: 
		# Checking for errors in the code, disabling refactoring and conventions
		pylint --disable=R,C hello.py

all: install lint test format