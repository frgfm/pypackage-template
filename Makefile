# this target runs checks on all files
quality:
	isort . -c -v
	flake8 ./
	black --check .

# this target runs checks on all files and potentially modifies some of them
style:
	isort .
	black .

# Create a new project from here
test:
	cookiecutter . -o ../ --default-config
