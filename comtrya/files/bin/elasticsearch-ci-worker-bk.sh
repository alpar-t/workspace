#!/bin/bash

IMAGE=$1
if [ -z "$IMAGE" ] ; then 
  echo "usage: $0 image-family"
  exit 1
fi

KIND=${KIND:-cloud-ci}

# this is what CI uses
SIZE="--custom-cpu 32 --custom-memory 98304MB"
if ! [ -z "$2" ] ; then 
    case $2 in 
        "PACK")
            SIZE="--custom-cpu 16 --custom-memory 32768MB"
            ;;
        "VMX")
            SIZE="--custom-cpu 32 --custom-memory 65536MB"
            ;;
        *)
            SIZE=$2
            ;;
    esac
fi

NAME=alpar-ci-$IMAGE

gcloud beta compute \
   --project=elastic-cloud-dev \
   instances create $NAME \
    --zone=us-central1-a \
    $SIZE \
    --subnet=default --network-tier=PREMIUM \
    --no-restart-on-failure --maintenance-policy=TERMINATE \
   --image-family=family/ci-ubuntu-2004 \
   --image-project=elastic-images-qa \
   --boot-disk-size=350GB --boot-disk-type=pd-ssd \
   --min-cpu-platform="Intel Skylake"  \
   --local-ssd=interface=NVME

sleep 40
elasticsearch-ci-ssh.sh $NAME 


