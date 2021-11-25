FROM ruby:3.0.2

# install modules
RUN apt-get update -qq && \
    apt-get install -y build-essential && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y imagemagick

RUN mkdir /imagemagick-worker
WORKDIR /imagemagick-worker
COPY Gemfile /imagemagick-worker/Gemfile
COPY Gemfile /imagemagick-worker/Gemfile.lock
RUN gem install bundle && \
    bundle install
COPY . /imagemagick-worker/

ENTRYPOINT ruby app/main.rb aws_s3_bucket_name=${AWS_S3_BUCKET_NAME} \
            aws_s3_object_path=${AWS_S3_OBJECT_PATH} \
            aws_s3_output_object_path=${AWS_S3_OUTPUT_OBJECT_PATH} \
            aws_s3_access_key_id=${AWS_S3_ACCESS_KEY_ID} \
            aws_s3_secret_access_key=${AWS_S3_SECRET_ACCESS_KEY} \
            aws_s3_region=${AWS_S3_REGION} \
            callback=${CALLBACK}
            imagemagick_options=${IMAGEMAGICK_OPTIONS}
