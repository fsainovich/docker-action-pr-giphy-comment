#!/bin/bash
GITHUB_TOKEN=$1
GIPHY_API_KEY=$2

pull_request_number=$(jq --raw-output .pull_request.number "$GITHUB_EVENT_PATH")
echo -e "PR NUMBER - $pull_request_number"

giphy_reponse=$(curl -s "https://api.giphy.com/v1/gifs/random?api_key=$GIPHY_API_KEY&tag=thank%20you&rating=g")
echo -e "Giphy Response - $giphy_reponse"

gif_url=$echo "$giphy_reponse" | jq --raw-output .data.images.donwsized.url)

echo -e "GIPHY_URL - $gif_url"

comment_reponse=$( curl -sx POST -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d 


)