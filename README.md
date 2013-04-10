This is a Groovy-Grails web application that utilizes a database of crimes in St Paul, MN.   The database
was harvested from Excel spreadsheets that the St Paul police dept posts weekly on the government web site 
using a [scraperwiki](https://scraperwiki.com/scrapers/stpaulcrimestat/) and are then stored in a [Google Fusion table](https://www.google.com/fusiontables/DataSource?docid=1nSF0DFb9b_q-YcLnLWSSTdB8HmgxbBZJJ2HGY00).

It is designed to show off the sorts of services that could enabled if a police department makes crime data
available in a timely and detailed fashion.  

As an example, on the "Crime Search" page you can enter an address, which will be geocoded, 
and then a date range and distance.  Then the first 10 crimes that meet the criteria will be displayed.

Currently the application is hosted as a [Google App Engine project](http://broken-windows.appspot.com) because 
I wanted a free place to host the application.  That made it harder to use Grails because several Grails plugins,
such as the Resources plugin, are incompatible with GAE.

The application uses the Google API to query against the fusion table.  To do this, it must use my personal
API key, which is NOT provided as part of this GitHub version. 
If you want to run this application yourself, you will need to provide your own Google API key.  Once you have
obtained that ket, created a file called app.properties in brokenwindows/grails-app/conf and add a line like

    google.api.key=ABCDEFG12345678
