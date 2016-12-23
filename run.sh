#!/bin/bash
echo "Run tests against $ENDPOINT..."
nosetests -v testcases
