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
	<link href="https://baki.cc/baki.css" rel="stylesheet" />
</head>
<body>
<p class="xslpagina" align="center"><a href="https://baki.cc"><img width="30" class="titolo xslpagina" src="bakititolo.png" /></a></p>
<!-- works but not what i want
<p class="verde" align="center"><xsl:value-of select="/rss/channel/title"/> rss :: <xsl:value-of select="/rss/channel/description"/></p>
-->
<p class="verde xslpagina" align="center">baki rss<br />caveat lector</p>


<xsl:for-each select="/rss/channel/item">
	<h2>
		<a hreflang="en">
			<xsl:attribute name="href">
				<xsl:value-of select="link"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</a>
	</h2>
	<div align="center"><xsl:value-of select="description"/></div>
	<p class="piccolanormale xslpagina" align="center">Published: <xsl:value-of select="pubDate" /></p>
	<hr />
</xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>