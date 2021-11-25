## Overview

A mini application to execute Imagemagick via Docker.

To execute, please run
```
docker run \
    -e AWS_S3_BUCKET_NAME='xxx' \
    -e AWS_S3_OBJECT_PATH='xxx' \
    -e AWS_S3_OUTPUT_OBJECT_PATH='xxx' \
    -e AWS_S3_ACCESS_KEY_ID='xxx' \
    -e AWS_S3_SECRET_ACCESS_KEY='xxx' \
    -e AWS_S3_REGION='us-east-1' \
    -e CALLBACK="" \
    -e IMAGEMAGICK_OPTIONS="[[\"resize\",\"250x200\"],[\"rotate\",\"-90\"],\"flip\"]" \
    imagemagick-worker
```