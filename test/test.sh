#!/bin/bash
curl -i -X POST -H "Content-Type: multipart/form-data" -F "image=@imageTest.jpeg" http://localhost:3000/api/image-upload > /dev/null
sleep 1
res=$(curl -s http://localhost:3000/api/get-images/) > /dev/null
sleep 1
for u in "${res[@]}" ; do
    if [[ $u == *"imageTest.jpeg"* ]] ; then
        matchU=$u
        echo "Upload and read tests successful!"
    fi
done
if [ "$matchU" == "" ]; then
    echo "Upload test failed."
fi
sleep 1
curl -i -s -X POST -H "Content-Type: application/json" --data "{\"forDeletion\":$matchU}" http://localhost:3000/api/image-deletion/ > /dev/null
for d in "${res[@]}" ; do
    if [[ $d == *"imageTest.jpeg"* ]] ; then
        matchd=$d
    fi
done
if [[ $string == *"imageTest.jpeg"* ]]; then
  echo "Deletion test failed."
else
  echo "Deletion test successful!"
fi