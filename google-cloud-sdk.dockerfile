FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine
RUN apk --update add openjdk8-jre
RUN gcloud components install app-engine-java kubectl