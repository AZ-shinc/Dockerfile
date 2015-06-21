#!/bin/bash

echo "输入镜像名称及TAG(nester/base:1):"
read imageName

echo "输入dockerfile文件路径(./Base):"
read path

docker build -t $imageName $path
