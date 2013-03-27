package brokenwindows

import grails.converters.JSON
import java.awt.TexturePaintContext.Int;

class CrimeController {
	CrimeQuery query = new CrimeQuery()
	def index () {
		render (view: "search")
	}
	def search ()  {
		def distance = params.int('distance')
		if (distance == null) distance = 1000
		List crimes = query.getCrimes(distance)
		def json =  crimes as JSON
		render json
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