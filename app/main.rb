# frozen_string_literal: true

require 'securerandom'
require 'aws-sdk-s3'
require 'mini_magick'
require 'uri'
require 'net/http'
require 'logger'
require 'dotenv/load'

args = {}
ARGV.each do |arg|
  arg_arr = arg.split('=')
  args[arg_arr[0]] = arg_arr[1]
end
logger = Logger.new($stdout)
logger.info("#{args['aws_s3_bucket_name']}/#{args['aws_s3_secret_access_key']}")
# s3_client = Aws::S3::Client.new(
#   region: args['aws_s3_region'],
#   credentials: Aws::Credentials.new(args['aws_s3_access_key_id'], args['aws_s3_secret_access_key'])
# )
# logger = Logger.new($stdout)
#
# directory = File.join(__dir__, 'tmp', SecureRandom.uuid)
# FileUtils.mkdir_p(directory) unless File.exist?(directory)
#
# file_name = File.join(directory, File.basename(args['aws_s3_object_path']))
# File.open(file_name, 'wb') do |file|
#   s3_client.get_object({ bucket: args['aws_s3_bucket_name'], key: args['aws_s3_object_path'] }, target: file)
# end
#
# options = JSON.parse(args['imagemagick_options'])
# MiniMagick::Image.new(file_name) do |b|
#   options.each do |option|
#     if option.instance_of?(Array)
#       b.public_send(option[0], option[1])
#     elsif option.instance_of?(String)
#       b.public_send(option)
#     end
#   end
# end
# s3_client.put_object(body: file_name, bucket: args['aws_s3_bucket_name'], key: args['aws_s3_output_object_path'])
#
# if args['callback']
#   url = URI(args['callback'])
#   res = Net::HTTP.get_response(url)
#   logger.info("Called #{arg['callback']}.") if res.is_a?(Net::HTTPSuccess)
# end
