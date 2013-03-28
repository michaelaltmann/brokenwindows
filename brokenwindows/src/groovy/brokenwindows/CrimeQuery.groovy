package brokenwindows
/*
 *@Grapes ([
	@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.5.2' ),
])

 */
import groovyx.net.http.HttpResponseDecorator
import groovyx.net.http.HttpURLClient
import static groovyx.net.http.Method.GET
import static groovyx.net.http.ContentType.JSON

import groovy.grape.Grape
import java.sql.Timestamp
import java.text.DateFormat
import java.text.SimpleDateFormat

class CrimeQuery {
	static String APPLICATION_KEY
	static {
		Properties p = new Properties()
		p.load(CrimeQuery.class.getResourceAsStream("/app.properties"))
		APPLICATION_KEY = p.getProperty("google.api.key")
	}
	public List getCrimes(String homeAddress, Date startDate, Date endDate, int distance ) {
		HttpURLClient http = new HttpURLClient()
		
		SimpleDateFormat format = new SimpleDateFormat('yyyy-MM-dd\'T\'HH:mm:ss')
		String startString = format.format(startDate)
		String endString = format.format(endDate)
		String sql ="""SELECT  * FROM 1nSF0DFb9b_q-YcLnLWSSTdB8HmgxbBZJJ2HGY00 
WHERE DATE > '${startString}' 
and  DATE < '${endString}' 
AND  ST_INTERSECTS(ADDRESS,CIRCLE(LATLNG(44.928516, -93.17721),$distance)) order by DATE limit 10"""
		
		
		
		HttpResponseDecorator response =  http.request(
				url : 'https://www.googleapis.com',
				path: '/fusiontables/v1/query' ,
				query : [ key : APPLICATION_KEY,
					typed : 'true',
					sql : (sql)],
				method: GET,
				contentType: JSON,
				headers:[Accept : 'application/xml','User-Agent':'Mozilla/5.0 Ubuntu/8.10 Firefox/3.0.4'] )


		List crimes = []
		// response handler for a success response code:
		if (response.getStatus() < 400)  {
			def json = response.getData()
			def cols = json.columns
			def dateIndex = cols.indexOf("DATE")
			def addressIndex = cols.indexOf("ADDRESS")
			def descriptionIndex = cols.indexOf("DESCRIPTION")
			json.rows.each {
				def address = it[addressIndex]
	//			println it[dateIndex] + " " + it[descriptionIndex] + " " +it[addressIndex]
				Crime crime = new Crime()
				crime.address = it[addressIndex]
				crime.date = format.parse(it[dateIndex])
				crime.description = it[descriptionIndex] 
				crimes.add(crime)
			}
		}
		return crimes
	}
	
	public static void main(String[] args) {
		CrimeQuery cq = new CrimeQuery()
		cq.getCrimes()	
	}
}
