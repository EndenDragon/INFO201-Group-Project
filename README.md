# The Dig on the Unofficial UW Discord Server
An INFO 201 Group Project, Spring 2018

## Project Description
We will be using the dataset from [Discord App](https://discordapp.com/)
throughout the project. The Discord platform is built with gamers in mind.
Because of the _sleek user interface_ and their _excellent freemium model_
which does not interrupt basic features of a chat software, many people
have adopted Discord as their primary go-to place for their social interactions.

This project was ever-so-slightly inspired by the [pisg](http://pisg.sourceforge.net/) software,
the IRC Statistics Generator written in Perl lang. Although the user interface
of pisg is outdated along with the IRC technology itself, the statistics and
graphs generated still holds to this day.

The intended audience would be users whom are curious about the UW
Discord in general. New members, for example, may be wondering how
active the chat would be before taking a dive and joining in on the
socialization. Current Discord users may find it intriguing to know
whom is the most active user. By the conclusion of the
project, we would hope to answer these following questions:

- **When is peak hour(s) of the given days?**
- **Who are the most active user(s) in the server?**
- **What are the most spoken words?**

## Technical Description
Using Discord API, we can retreive different "_objects_" that the Discord client
keeps track of. We'll primarily be interacting with the messages
endpoint to read the messages objects since the last few months of the
server's existance. The user endpoint also provides details about certain
users, if needed. The messages endpoint provides timestamp of when the
message has been sent. This can be useful for determining when the peak
hour of the given day.

The documentation for Discord API can be found here - [https://discordapp.com/developers](https://discordapp.com/developers)

In order to keep the API calls to Discord to a minimum, our team would need
to do an initial scraping of the messages and save it as `.json` files. Doing this process would prevent us from hitting the API rate limit in the long run. We will
be using Shiny app to present our product. Some major challenges that we
anticipate would be group coordination and wrangling with Discord's data. Building
an awesome frontend is also crucial to success in presentation. By using Shiny
for our project, we can utilize it's interactivity and let the user be in the
driver's seat. Such interactivity like a custom date range would enhance the
presentation.
