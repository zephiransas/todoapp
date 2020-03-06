require 'aws-sdk-s3'
require 'aws-sdk-codedeploy'


namespace :deploy do
  desc "create revision"
  task :create_revision do

    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    app_name = "todoapp"
    s3_key = "#{app_name}-#{timestamp}.zip"

    with_zip_file(s3_key) do |zip_file_name|
      register_revision(zip_file_name)
    end
  end
end


def register_revision(dist_zip)

  s3_bucket = "todoapp-codedeploy-bucket"

  puts "Uploading dist zip"
  Aws::S3::Resource.new.bucket(s3_bucket).object(dist_zip).upload_file(dist_zip)

  revision = {
      revision_type: 'S3',
      s3_location: {
          bucket: s3_bucket,
          key: dist_zip,
          bundle_type: 'zip'
      }
  }
  puts "register revision #{revision}"
  Aws::CodeDeploy::Client.new.register_application_revision(application_name: "todoapp", revision: revision)

  revision
end

def with_zip_file(s3_key)
  `git archive HEAD --output=#{s3_key}`
  begin
    yield s3_key
  ensure
    File.delete(s3_key)
  end
end