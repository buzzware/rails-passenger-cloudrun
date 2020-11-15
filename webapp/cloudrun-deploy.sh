#!/usr/bin/env sh
GCP_PROJECT_ID=yourproject
CI_PROJECT_NAME=webapp
docker build -t gcr.io/$GCP_PROJECT_ID/$CI_PROJECT_NAME:latest .

docker push gcr.io/$GCP_PROJECT_ID/$CI_PROJECT_NAME:latest
#gcloud run services add-iam-policy-binding $CI_PROJECT_NAME --project $GCP_PROJECT_ID --member="allUsers" --role="roles/run.invoker" --region asia-northeast1
gcloud run deploy $CI_PROJECT_NAME --image gcr.io/$GCP_PROJECT_ID/$CI_PROJECT_NAME:latest --platform managed --allow-unauthenticated --region asia-northeast1
