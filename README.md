# My Node.js Photo App

This is a simple Node.js application that allows you to upload photos and filter them by coordinates. During the upload phase, a thumbnail of each photo is created. The application also maintains a JSON file that stores the name of each photo as a key and the latitude and longitude where it was taken as values.

## Features

- Upload images
- List all images
- Delete one or multiple images
- List all images that belong to a certain coordinate (latitude and longitude) square

## How to Run

To run the application, simply execute the `run.sh` script in the root directory of the project:

```bash
./run.sh
```

## Testing

### Test script

There is a `test` folder that contains a single test image that can be used to test basic functionality. To run the test, ensure that the API is already running, navigate to the `test` folder, and execute the `test.sh` script:

```bash
cd test
./test.sh
```

Please note that the test assumes that the API is already running.

### HTTP Requests Collection

The `HTTPrequests.postman_collection.json` file is a collection of HTTP requests exported from Postman.

To use this collection, import it into Postman. You can then send the requests to the server to test the API endpoints.

## Frontend

The frontend of the application provides a simple interface for uploading images, listing all images, deleting images, and listing images by coordinate square.

Enjoy using the app!

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.