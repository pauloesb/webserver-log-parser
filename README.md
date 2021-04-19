## Webserver Log Parser

- This is a Webserver Log Parser to verify log accesses:

## Usage

- `bin/parser ./data/webserver.log`

## Explanation

- This will render the total URL accesses by IP Address and also it will also render the unique acesses to URL also.
- It also have a validation to verify if the data is correct if it's outside pattern it will raise an error.

## Structure

- `Parser::Input` responsible to fetch the log, validate and normalize the data.
- `Parser::Analyzer` responsible to analyze the log by acceses and count the total per URL, unique or not.
- `Parser::Output` responsible to prepare the log to be printed regarding the access.
- `Parser::Parse` this is the entrypoint that organize the execution of the parse process.

## Author

- Paulo Eduardo Souza Borba
- pauloesb@gmail.com