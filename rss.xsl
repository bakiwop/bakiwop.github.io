<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" version="1.0" encoding="UTF-8"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<title><xsl:value-of select="/rss/channel/title"/> rss</title>
	<meta charset="UTF-8" />
	<meta http-equiv="content-language" content="en_US" />
	<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no" />
	<meta name="referrer" content="none" />
	<link rel="icon" type="image/x-icon" href="favicon.ico" />
	<link href="baki.css" rel="stylesheet" />
</head>
<body>
<p align="center"><a href="https://baki.cc"><img width="30" class="titolo" src="bakititolo.png" /></a></p>
<p align="center">baki rss</p>


<xsl:for-each select="/rss/channel/item">
	<h2>
		<a hreflang="en" target="_blank">
			<xsl:attribute name="href">
				<xsl:value-of select="link"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</a>
	</h2>
	<div align="Center"><xsl:value-of select="description"/></div>
	<p class="piccolanormale" align="Center">Published: <xsl:value-of select="pubDate" /></p>
	<hr />
</xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>