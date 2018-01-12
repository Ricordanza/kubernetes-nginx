#!/bin/sh

PRAM=$1

if [ "$PRAM" = "" ]; then
  echo "パラメータが何も入力されませんでした。"
  exit -1
elif [ "$PRAM" = "c" ]; then
  CMD="kubectl create -f deployment.yml -f service.yml --record"
elif [ "$PRAM" = "d" ]; then
  CMD="kubectl delete -f deployment.yml -f service.yml"
elif [ "$PRAM" = "a" ]; then
  CMD="kubectl apply -f deployment.yml -f service.yml --record"
elif [ "$PRAM" = "g" ]; then
  CMD="kubectl get deployments,replicasets,pods,service --selector=run=nginx"
elif [ "$PRAM" = "h" ]; then
  CMD="kubectl rollout history deployment nginx"
elif [ "$PRAM" = "r" ]; then
  CMD="kubectl rollout undo deployment nginx"
else
  echo "不正なパラメータ: $PRAM"
  exit -1
fi

echo $CMD
eval $CMD

exit 0
