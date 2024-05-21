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

- **Long URL Character Limits:**\
Regarding the character limitation for long URLs, the maximum URL length varies between different browsers and web servers. The following table summarizes the maximum URL lengths for popular web browsers [(Ref-1)](https://saturncloud.io/blog/what-is-the-maximum-length-of-a-url-in-different-browsers/):

    
    | Browser | Maximum URL Length |
    | --- | ----------- |
    | Chrome | 2,083 characters |
    | Firefox | 65,536 characters |
    | Safari | 80,000 characters |
    | Internet Explorer | 2,083 characters |
    | Edge | 2,083 characters |

    It's worth noting that 2,083 characters is the maximum length supported by most web servers and browsers. However, in practice, URLs longer than a few hundred characters are rare. Therefore, for practicality and storage efficiency considerations, we've set a 2,083-character limit for long URL data entry.

- **Short URL Character Limitation:**\
To determine how long a short URL should be, I have to find out how many URLs are daily generated. The number of URLs generated per day is difficult to pinpoint precisely, but estimates can be made based on various sources and indicators such as new website registrations.\
It is reasonable to estimate that millions of new URLs are generated daily across the web. While it's challenging to provide an exact number, the scale is undoubtedly in the millions.\
Assumptions are:
    - *100 million* URLs are genereted per day.
    - The URL Shortener wil run for 10 years, which means it should support at least *100 million * 365 * 10 = 365 billion* records.
    - Short URL consist of characters from *[0-9, a-z, A-Z]* which are *10 + 26 + 26 = 62* possible characters.

    The smallest *n* that *62^n ≥ 365 billion*. When *n = 7*, *62^n = 3.5 trillion*, 3.5 trillion is more than enough to hold *365 billion* URLs, so the lengh of Short URL is limited by 7.