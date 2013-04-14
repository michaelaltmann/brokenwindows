<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Crime Application</title>
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
		<h1>Twin Cities Crime Notification Application</h1>
		<p>This application demonstrates some of the services that could
			be provided to residents if we had a real-time feed of data from the
			Twin Cities police departments. For example, a resident could request
			that an e-mail or SMS text message be sent if a crime is reported
			within a certain distance of the resident's home.</p>
		<p>
			This is a Groovy-Grails web application that utilizes a database of
			crimes in St Paul, MN. The data were harvested from Excel
			spreadsheets that the St Paul police dept posts weekly on the <A
				href="http://www.stpaul.gov/DocumentCenter/">government web site</A>
			using  <a href="https://scraperwiki.com/scrapers/stpaulcrimestat/">scraperwikis</a>
			and  then stored in a <a
				href="https://www.google.com/fusiontables/DataSource?docid=1nSF0DFb9b_q-YcLnLWSSTdB8HmgxbBZJJ2HGY00">Google
				Fusion table</a>.
		</p>

		<div id="controller-list" role="navigation">
			<h2>Available Services</h2>
			<ul>
				<A href="crime/index">Search for crimes</A>
			</ul>
		</div>

	</div>
</body>
</html>
