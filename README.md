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

- Regarding the character limitation for long URLs, the maximum URL length varies between different browsers and web servers. The following table summarizes the maximum URL lengths for popular web browsers [(link)](https://saturncloud.io/blog/what-is-the-maximum-length-of-a-url-in-different-browsers/):

    | Browser | Maximum URL Length |
    | --- | ----------- |
    | Chrome | 2,083 characters |
    | Firefox | 65,536 characters |
    | Safari | 80,000 characters |
    | Internet Explorer | 2,083 characters |
    | Edge | 2,083 characters |

    It's worth noting that 2,083 characters is the maximum length supported by most web servers and browsers. However, in practice, URLs longer than a few hundred characters are rare. Therefore, for practicality and storage efficiency considerations, we've set a 2,083-character limit for long URL data entry.
