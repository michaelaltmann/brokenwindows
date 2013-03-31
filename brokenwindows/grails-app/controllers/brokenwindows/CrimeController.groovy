package brokenwindows

import grails.converters.JSON
class CrimeController {
	CrimeQuery query = new CrimeQuery()
	def index () {
		render (view: "search")
	}
	def geocode() {
		String address = params.address
		def latlng = query.geocode(address)
		render latlng as JSON
	}
	def search ()  {
		def distance = params.int('distance')
		if (distance == null) distance = 1000
		Date startDate = Date.parse('yyyy/mm/dd', params.startDate)
		Date endDate =  Date.parse('yyyy/mm/dd', params.endDate)
		String address = params.address + ", St Paul, MN"
		double lat = params.double('lat')
		double lng = params.double('lng')
		List crimes = query.getCrimes(lat, lng, startDate, endDate, distance)
		render(template: "crimes", collection: crimes)
	}
}


class Address {
	String street
	String city
	String state
}
