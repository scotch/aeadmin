# -*- coding: utf-8 -*-
"""
aeadmin
============


Quick links
-----------

- `User Guide <http://code.scotchmedia.com/aeadmin>`_
- `Repository <http://github.com/scotch/aeadmin>`_
- `Issue Tracker <https://github.com/scotch/aeadmin/issues>`_

"""
from setuptools import setup

setup(
    name = 'aeadmin',
    version = '0.1.0',
    license = 'Apache Software License',
    url = 'http://code.scotchmedia.com/engine-auth',
    description = "Adds an Admin interface to Google App Engine",
    long_description = __doc__,
    author = 'Kyle Finley',
    author_email = 'kyle.finley@gmail.com',
    zip_safe = True,
    platforms = 'any',
    packages = [
        'aeadmin',
        ],
    include_package_data=True,
    install_requires=[
        'aecore',
        'aeauth',
        'aerest',
        ],
    classifiers = [
        'Development Status :: 2 - Pre-Alpha',
        'Environment :: Web Environment',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
        'Topic :: Software Development :: Libraries :: Python Modules',
        ]
)