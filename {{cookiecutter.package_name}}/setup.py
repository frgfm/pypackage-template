# Copyright (C) 2022, {{cookiecutter.full_name}}.

# This program is licensed under the Apache License version 2.
# See LICENSE or go to <https://www.apache.org/licenses/LICENSE-2.0.txt> for full license details.


import os
from pathlib import Path

from setuptools import setup

PKG_NAME = "{{cookiecutter.package_name}}"
VERSION = os.getenv("BUILD_VERSION", "0.1.0.dev0")


if __name__ == "__main__":

    print(f"Building wheel {PKG_NAME}-{VERSION}")

    # Dynamically set the __version__ attribute
    cwd = Path(__file__).parent.absolute()
    with open(cwd.joinpath("{{cookiecutter.package_name}}", "version.py"), "w", encoding="utf-8") as f:
        f.write(f'__version__ = "{VERSION}"\n')

    setup(name=PKG_NAME, version=VERSION)
