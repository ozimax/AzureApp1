
RESOURCE_GROUP="testoz-grp444"
LOCATION="uksouth"
PLAN_NAME="myFreePlan444"
APP_NAME="ozan-azureapp1-444"        # must be unique
GITHUB_REPO="https://github.com/ozimax/AzureApp1"
BRANCH="main"

az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku F1

az webapp create \
  --name "$APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --runtime "dotnet|8"

az webapp deployment source config \
  --name "$APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --repo-url "$GITHUB_REPO" \
  --branch "$BRANCH" \
  --github-action true

