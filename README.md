# The Dig on the Unofficial UW Discord Server
An INFO 201 Group Project, Spring 2018

## Project Description
### Dataset
We will be using the dataset from [Discord App](https://discordapp.com/)
throughout the project. The Discord platform is built with gamers in mind, but
because of the _sleek user interface_ and their _excellent freemium model_
which does not interrupt basic features of a chat software, many people
have adopted Discord as their primary go-to place for their social interactions,
even if their topic is completely irrelevant to games.

This project was ever-so-slightly inspired by the [_pisg_](http://pisg.sourceforge.net/)
software, the IRC Statistics Generator written in Perl programming language.
Although the user interface of _pisg_ is outdated along with the IRC technology
itself, the statistics and graphs generated still holds to this day.

The data we will be working with is dynamically collected by Discord. We will
access the data via the Application Programming Interface (API) offered by
Discord. The data is not static; it is live and will change with activities of
the users of the Discord platform.

### Target Audience
The intended audience would be users whom are curious about the Discord
channel of University of Washington (UW) in general. New members, for example,
may be wondering how active the chat would be before taking a dive and joining
in on the socialization. Current Discord users may find it intriguing to know
whom is the most active user.

By the conclusion of the project, we would hope to answer these following
questions:
- **When is peak hour(s) of the given days?**
- **Who are the most active user(s) in the server?**
- **What are the most spoken words?**

## Technical Description
### Data Retrieving
By using Discord API, we can retreive different "_objects_" that the Discord
client keeps track of. We will primarily be interacting with the _messages_
endpoint to read the messages objects since the last few months of the
server's existence. The _user_ endpoint also provides details about certain
users, if needed. The _messages_ endpoint provides timestamp of when the
message has been sent. This can be useful for determining when the peak
hour of the given day.

The documentation for Discord API can be found here: [https://discordapp.com/developers](https://discordapp.com/developers)

### Data Wrangling
In order to keep the API calls to Discord to a minimum, our team would need
to do an initial scraping of the messages and save it as `.json` files. Doing
this process would prevent us from hitting the API rate limit in the long run.

To answer the questions we wish to solve for our audience, we will need to
transform some of the data gathered from Discord API. For instance, in order to
answer the question _"what are the most spoken words"_, we will decompose every
message we read from the API into separate words, count occurrences of each
word, and store the statistics into a new data frame.

### Libraries Used by This Project
- We are using `tm`, especially its `removePunctuation()` function, for removing
  punctuation marks from chat messages we scraped from Discord API.
- We are using [`pluralize`](https://github.com/hrbrmstr/pluralize) to transform
  words in plural form into singular form.
- We are using `shiny`, the library for Shiny app, to present our product.

### Anticipated Challenges
Some major challenges that we anticipate would be group coordination and
wrangling with Discord's data. Building an awesome front end is also crucial to
success in presentation. By using Shiny for our project, we can utilize its
interactivity and let the user be in the driver's seat. Such interactivity like
a custom date range would enhance the presentation.
