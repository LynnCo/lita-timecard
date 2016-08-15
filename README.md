# lita-timecard

[![Build Status](https://travis-ci.org/lynnco/lita-timecard.png?branch=master)](https://travis-ci.org/lynnco/lita-timecard)
[![Coverage Status](https://coveralls.io/repos/lynnco/lita-timecard/badge.png)](https://coveralls.io/r/lynnco/lita-timecard)

TODO: Add a description of the plugin.

## Installation

Add lita-timecard to your Lita instance's Gemfile:

``` ruby
gem "lita-timecard"
```

## Configuration

Add the name of the user providing support for this plugin to lita_config.rb:

``` ruby
 config.handlers.timecard.support: "@cyrin"
```

## Usage

```
@lita timecard 30m worked on lita-timecard
@lita timecard 1h worked on lita-timecard
```
