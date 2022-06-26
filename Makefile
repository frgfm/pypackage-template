template:
	# Generate the project
	cookiecutter . -o ../

# this target runs checks on all files
quality:
	python -c "from cookiecutter.main import cookiecutter; cookiecutter('.', no_input=True)"
	pip install -e "awesome_lib/.[quality]"
	cd awesome_lib && isort . -c
	cd awesome_lib && flake8 ./
	cd awesome_lib && mypy
	cd awesome_lib && pydocstyle awesome_lib/
	cd awesome_lib && black --check .
	rm -r awesome_lib

# Run tests for the library
test:
	python -c "from cookiecutter.main import cookiecutter; cookiecutter('.', no_input=True)"
	pip install -e "awesome_lib/.[test]"
	cd awesome_lib && coverage run -m pytest tests/
	rm -r awesome_lib

# Check that docs can build
docs:
	python -c "from cookiecutter.main import cookiecutter; cookiecutter('.', no_input=True)"
	pip install -e "awesome_lib/.[docs]"
	sphinx-build awesome_lib/docs/source awesome_lib/docs/build -a -v
	rm -r awesome_lib
