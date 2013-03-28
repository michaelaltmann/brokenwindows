package brokenwindows

import grails.converters.JSON
class CrimeController {
	CrimeQuery query = new CrimeQuery()
	def index () {
		render (view: "search")
	}
	def search ()  {
		def distance = params.int('distance')
		if (distance == null) distance = 1000
		Date startDate = Date.parse('yyyy/mm/dd', params.startDate)
		Date endDate =  Date.parse('yyyy/mm/dd', params.endDate)
		List crimes = query.getCrimes(params.address, startDate, endDate, distance)
		render(template: "crimes", collection: crimes)
	}
}


class Address {
	String street
	String city
	String state
}
/*
class Geocoder {
	String base = 'http://maps.google.com/maps/api/geocode/xml?'
	
	void fillInLatLng(Address address) {
		String urlEncodedAddress =
				[address.street, address.city, address.state].collect {
					URLEncoder.encode(it,'UTF-8')
				}.join(',+')
		String url = base + [sensor:false, address:urlEncodedAddress].collect { it }.join('&')
		def response = new XmlSlurper().parse(url)
		String latitude = response.result.geometry.location.lat[0] ?: "0.0"
		String longitude = response.result.geometry.location.lng[0] ?: "0.0"
	}
}
*/