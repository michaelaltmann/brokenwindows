This is a Groovy-Grails web application that utilizes a database of crimes in St Paul, MN.   The database
was harvested from Excel spreadsheets that the St Paul police dept posts weekly on the government web site 
using a [scraperwiki](https://scraperwiki.com/scrapers/stpaulcrimestat/).

It is designed to show off the sorts of services that could enabled if a police department makes crime data
available in a timely and detailed fashion.  

As an example, on the "Crime Search" page you can enter an address, which will be geocoded, 
and then a date range and distance.  Then the first 10 crimes that meet the criteria will be displayed.

Currently the application is hosted as a [Google App Engine project](http://broken-windows.appspot.com) because 
I wanted a free place to host the application.  That made it harder to use Grails because several Grails plugins,
such as the Resources plugin, are incompatible with GAE.