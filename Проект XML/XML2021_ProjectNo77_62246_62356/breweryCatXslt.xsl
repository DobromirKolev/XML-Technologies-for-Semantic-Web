<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="html"/> 
  <xsl:template match="/">
    <html>
	<head>
	<title>Бирарии в България</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<script>
		function showBreweries() {
			document.getElementById('breweryContainer').style.display = 'inline';
                        document.getElementById('beertypeContainer').style.display = 'none';
			document.getElementById('regionContainer').style.display = 'none';
    };
		function showBeersByType() {
            		document.getElementById('breweryContainer').style.display = 'none';
           		document.getElementById('beertypeContainer').style.display = 'inline';
			document.getElementById('regionContainer').style.display = 'none';
    };
		function showRegions() {
            		document.getElementById('breweryContainer').style.display = 'none';
            		document.getElementById('beertypeContainer').style.display = 'none';
			document.getElementById('regionContainer').style.display = 'inline';
    }
      </script>

     <body>
	<h1> Бирарии в България</h1>
	<button class="button" onclick="showBreweries();">
			Бирарии
  	</button>
  	<button class="button" onclick="showBeersByType()">
			Тип бира
  	</button>
	<button class="button" onclick="showRegions()">
			Региони
  	</button>
       <xsl:apply-templates/>
    </body></html>
  </xsl:template>

  
  <xsl:template match="/breweriesInBG/breweryList">
    <div id="breweryContainer">
    	<xsl:for-each select="/breweriesInBG/breweryList/brewery/breweryInformation[id &lt; 14]">
				<div style="color:white;" class="brewery">
				   <img src="images/{id}.jpg"/>
					<p id="breweryName"><xsl:value-of select="name"/></p>
					<div id="breweryInfo">
					   <p id="label" >Град</p>
					   <p><xsl:value-of select="location"/></p>
					   <p id="label">Регион</p>
					   <p><xsl:value-of select="region"/></p>
					</div>
					<div id="extraInfo">
						<p id="label" >Година</p>
						<p><xsl:value-of select="year"/></p>
						<p id="label">Разнообразие от бири</p>
						<p><xsl:value-of select="beerRange"/></p>
					</div>
					<div id="contacts">
						<p id="label" >Тел.</p>
						<p><xsl:value-of select="telephone"/></p>
					<xsl:if test="telephoneExtra">
						<p id="label" >Доп.тел</p>
						<p><xsl:value-of select="telephoneExtra"/></p>
					</xsl:if>
					</div>
					<div id="online">
					   <xsl:if test="site">
						<p id="label" >Сайт</p>
						<a href="{site/@href}"><xsl:value-of select="site"/></a>
 					  </xsl:if>
					</div>
					<div class="dropdown">
						<p id="label">Списък с бири</p>
						<div class="dropdown-content">
						  <xsl:for-each select="../beerList/beer">
						     <p id="beer"><xsl:value-of select="."/></p>
						  </xsl:for-each>
						</div>
					</div>
				
				</div> 
  		</xsl:for-each>
  	</div>
  </xsl:template>

<xsl:template match="/breweriesInBG/beertypeList">
    <div id="beertypeContainer" style="display:none;">
  		<xsl:for-each select="/breweriesInBG/beertypeList/beertypeInfo">
				<xsl:variable name="bName"><xsl:value-of select="beertypeName"/></xsl:variable>
				<xsl:variable name="bId"><xsl:value-of select="type/@typeIdRef"/></xsl:variable>
		<div style="color:white;" class="beerType">
				<p id="beertypeLabel"><xsl:value-of select="beertypeName"/></p>
					<div>
					 <xsl:for-each select="/breweriesInBG/breweryList/brewery/breweryInformation[beertypeId = $bId]">							
						<div style="color:white;" class="sortByType">
						    <img src="images/{id}.jpg"/>
							<p id="breweryName"><xsl:value-of select="name"/></p>
							   <div id="beertInfo">
								<p id="label" >Град</p>
								<p><xsl:value-of select="location"/></p>
								<p id="label" >Година</p>
								<p><xsl:value-of select="year"/></p>
								<xsl:if test="beerRange">
								  <p id="label" >Разнообразие от бири</p>
								  <p><xsl:value-of select="beerRange"/></p>
								</xsl:if>
							  </div>
							  <div id="contacts">
								<p id="label" >Тел.</p>
								<p><xsl:value-of select="telephone"/></p>
								<xsl:if test="telephoneExtra">
								  <p id="label" >Доп.тел</p>
								  <p><xsl:value-of select="telephoneExtra"/></p>
								</xsl:if>
								<xsl:if test="site">
								  <p id="label" >Сайт</p>
								  <a href="{site/@href}"><xsl:value-of select="site"/></a>
								</xsl:if>
							  </div>
							  <div class="dropdown">
								<p id="label">Списък с бири</p>
								<div class="dropdown-content">
							  	  <xsl:for-each select="../beerList/beer">
									<p id="beer"><xsl:value-of select="."/></p>
								  </xsl:for-each>
								</div>
							  </div>
						</div>
					</xsl:for-each>
				</div>
		     </div>
		</xsl:for-each>
	</div>
</xsl:template>

<xsl:template match="/breweriesInBG/regionList">
    <div id="regionContainer" style="display:none;">
  		<xsl:for-each select="/breweriesInBG/regionList/regionInfo">
				<xsl:variable name="rName"><xsl:value-of select="regionName"/></xsl:variable>
				<xsl:variable name="rId"><xsl:value-of select="reg/@regIdRef"/></xsl:variable>
		<div style="color:white;" class="region">
				<p id="regionLabel"><xsl:value-of select="regionName"/></p>
					<div>
					 <xsl:for-each select="/breweriesInBG/breweryList/brewery/breweryInformation[regionId = $rId]">							
						<div style="color:white;" class="specialRegion">
						    <img src="images/{id}.jpg"/>
							<p id="breweryName"><xsl:value-of select="name"/></p>
							   <div id="regInfo">
								<p id="label" >Град</p>
								<p><xsl:value-of select="location"/></p>
								<p id="label" >Година</p>
								<p><xsl:value-of select="year"/></p>
								<xsl:if test="beerRange">
								  <p id="label" >Разнообразие от бири</p>
								  <p><xsl:value-of select="beerRange"/></p>
								</xsl:if>
							  </div>
							  <div id="contacts">
								<p id="label" >Тел.</p>
								<p><xsl:value-of select="telephone"/></p>
								<xsl:if test="telephoneExtra">
								  <p id="label" >Доп.тел</p>
								  <p><xsl:value-of select="telephoneExtra"/></p>
								</xsl:if>
								<xsl:if test="site">
								  <p id="label" >Сайт</p>
								  <a href="{site/@href}"><xsl:value-of select="site"/></a>
								</xsl:if>
							  </div>
							  <div class="dropdown">
								<p id="label">Списък с бири</p>
								<div class="dropdown-content">
							  	  <xsl:for-each select="../beerList/beer">
									<p id="beer"><xsl:value-of select="."/></p>
								  </xsl:for-each>
								</div>
							  </div>
						</div>
					</xsl:for-each>
				</div>
		     </div>
		</xsl:for-each>
	</div>
</xsl:template>

</xsl:stylesheet>