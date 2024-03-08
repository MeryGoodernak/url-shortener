# URL-Shortener

A URL shortener is a web service that converts long URLs into shorter, more manageable links. These shortened URLs are easier to share, especially on platforms with character limits, and they redirect users to the original, longer URL when clicked.

## Installation

First clone the repository. Then on your terminal go to the root directory of the project and run:

```
bundle install
```

This command installs all the dependencies.

## Run


## Test and Lint

Rspec is utilized to write test and Rubocop to lint the code. To run
tests run:

```
bundle exec rspec
```

and to run rubocop:

```
 bundle exec rubocop
```

## Design Approach


### Requirments

- Regarding the character limitation for long URLs, it's worth noting that 2048 characters is the maximum length supported by most web servers and browsers. However, in practice, URLs longer than a few hundred characters are rare. Therefore, for practicality and storage efficiency considerations, we've set a 700-character limit for long URL data entry.