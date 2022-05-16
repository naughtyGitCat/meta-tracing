#!/bin/bash

sed -i "s/\"datasource\": {}/\"datasource\": \"loki\"/g" panels/*
