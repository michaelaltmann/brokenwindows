<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Crime Search</title>
<g:javascript src="jquery/jquery-1.9.1.min.js" />
<g:javascript src="jquery-ui/ui/jquery-ui.js" />
 
<g:javascript type="text/javascript">
	var lat, lng;
	jQuery(document).ready(function() {
		jQuery("#startDate").datepicker({
			dateFormat : 'yy/mm/dd'
		});
		jQuery("#endDate").datepicker({
			dateFormat : 'yy/mm/dd'
		});
		jQuery('#search').attr('disabled','disabled');
	});
	function onGeocode(data) {
		if (data.lat != null && data.lng != null) {
			jQuery('#lat').val(data.lat);
			jQuery('#lng').val(data.lng);
			jQuery('#location').html( '('+ data.lat+', '+ data.lng +')');
			jQuery('#search').removeAttr('disabled');
		} else {
			jQuery('#location').html('Failed to geocode address');
			jQuery('#location').addClass('error');
		}
	};
	function geocodeAddress(address) {
		jQuery('#search').attr('disabled','disabled');
		jQuery('#location').html('');
		jQuery('#location').removeClass('error');

		address = address + ", St Paul, MN";
		
		jQuery.ajax({
		url : "geocode",
		data : {'address': address},
		dataType : 'json',
		success : onGeocode
		});
	};
</g:javascript>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}
#location {
	font-size: small;
	height: 1.8em;
	padding: 0.2em 0.4em 0.2em 0.4em;
	color: gray;
}
#location.error  {
	color: red;
}
.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 1em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>

	<div id="page-body" role="main">
		<H3>Find Crimes Near You</H3>
		<g:formRemote name="searchCrimes" update="crimeRows"
			url="[controller:'crime', action:'search']">
			<input id='lat' name='lat' type='hidden' />
			<input id='lng' name='lng' type='hidden' />
			<table>
				<tbody>
					<tr class="prop">
						<td class="name" valign="top">Street Address (ex. 480 Snelling Ave S)</td>
						<td class="value" valign="top"><input type="text"
							name="address" value = "" onblur="geocodeAddress(this.value)"/>
							<div id='location' />
							</td>
					</tr>
					<tr class="prop">
						<td class="name" valign="top">Start date</td>
						<td class="value" valign="top"><input type="text"
							id="startDate" name="startDate" value="2011/02/28"></td>
					</tr>
					<tr class="prop">
						<td class="name" valign="top">End date</td>
						<td class="value" valign="top"><input type="text"
							id="endDate" name="endDate" value="2012/06/15"/></td>
					</tr>
					<tr class="prop">
						<td class="name" valign="top">Distance (meters)</td>
						<td class="value" valign="top"><input type="text"
							name="distance" value="1000"/></td>
					</tr>
					<tr>
					<td></td>
					<td><g:submitButton id='search' name="Search" /></td>
					</tr>
				</tbody>
			</table>
			
		</g:formRemote>
		<table>
			<thead>
				<tr>
					<th>Date</th>
					<th>Crime</th>
					<th>Address</th>
				</tr>
			</thead>
			<tbody id="crimeRows">
			</tbody>
		</table>
</body>
</html>
