# CircuitVerse Mobile

## Description
This is the Mobile Version of CircuitVerse.org to view current task assigment status, trending Projects and also view your groups and related projects

## Environment Setup
### Requirements

To run this project make sure these requirements are installed on your local computer.
| tools   | version |
|---------|---------|
| flutter | 1.12.13 |

## Build Instruction
First we need to get all dependencies for flutter projects.
1. `flutter pub get`
2. open `lib/utils/constants.dart` and changes `BASE_URL` to your local CircuitVerse url (i recommend using [ngrok](https://ngrok.com/) for local development)

## Test Instruction
run `flutter test`

## Run Instruction
run `flutter run`
if you have more than one connected devices then run `flutter run -d <device-id>`

## Sample Screen
<img src="https://github.com/Miftahunajat/CircuitVerse-Mobile/blob/master/assets/new_sample.gif" height="320">
