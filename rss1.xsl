<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" version="1.0" encoding="UTF-8"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<title><xsl:value-of select="/rss/channel/title"/> RSS</title>
	<meta charset="UTF-8" />
	<meta http-equiv="content-language" content="en_US" />
	<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no" />
	<meta name="referrer" content="none" />
	<link rel="icon" type="image/x-icon" href="favicon.ico" />
	<link href="baki.css" rel="stylesheet" />
</head>
<body>
<p class="titolo"><img width="30" class="titolo" src="bakititolo.png" /></p>
<p align="center">
	RSS | 
	<xsl:value-of select="/rss/channel/title"/> | 
	<xsl:value-of select="/rss/channel/description"/> |
	<a hreflang="en" target="_blank">
		<xsl:attribute name="href">
			<xsl:value-of select="/rss/channel/link"/>
		</xsl:attribute>
	</a>
</p>


<xsl:for-each select="/rss/channel/item">
	<h3>
		<a hreflang="en" target="_blank">
			<xsl:attribute name="href">
				<xsl:value-of select="link"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</a>
	</h3>
	<div><xsl:value-of select="description"/></div>
	<div>Published: <xsl:value-of select="pubDate" /></div>
</xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>