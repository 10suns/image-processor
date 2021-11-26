#!/bin/sh
bundle exec ruby app/main.rb aws_s3_bucket_name=${AWS_S3_BUCKET_NAME} \
            aws_s3_object_path=${AWS_S3_OBJECT_PATH} \
            aws_s3_output_object_path=${AWS_S3_OUTPUT_OBJECT_PATH} \
            aws_s3_access_key_id=${AWS_S3_ACCESS_KEY_ID} \
            aws_s3_secret_access_key=${AWS_S3_SECRET_ACCESS_KEY} \
            aws_s3_region=${AWS_S3_REGION} \
            callback=${CALLBACK} \
            imagemagick_options=${IMAGEMAGICK_OPTIONS}
