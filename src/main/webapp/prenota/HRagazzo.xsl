
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema" version="1.0">
<xsl:import href="${AppThemes}/atlanta-1.1.0-SNAPSHOT/xsl/theme.xsl"/>
<xsl:import href="${AppThemes}/atlanta-1.1.0-SNAPSHOT/xsl/forms2.xsl"/>
<xsl:import href="${AppXSL}/app.xsl"/>

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
	<xsl:call-template name="baseForm" >
		<xsl:with-param name="AggiungiAncora">true</xsl:with-param>	
		<xsl:with-param name="tooltips">true</xsl:with-param>		
	</xsl:call-template>
</xsl:template>

<xsl:template name="CssSpec" >
	<style>
	.cis-field-container .cis-label {
		width:150px;
	}
	/*.cis-field-container .cis-value {
		width:350px;
	}*/
	</style>
</xsl:template>

<xsl:variable name="TitoloPagina"><xsl:value-of select="$tipo_transaz"/>Ragazzo</xsl:variable>

<xsl:template  name="def_javascript">
function getTitolo(){
  return '  '  + '<xsl:value-of select="$tipo_transaz"/>' + ' <xsl:value-of select="$TitoloPagina"/>' + '   ';
}	

</xsl:template>

<xsl:template name="Titolo" >
	<xsl:value-of select="$TitoloPagina"/>
</xsl:template>

<xsl:template match="DOCUMENTO" >
    <xsl:call-template  name="Comandi" />
    
    <xsl:apply-templates select = "Ragazzo"/>
    
    <xsl:call-template name = "Errori"/>
</xsl:template>

 
<xsl:template match="Ragazzo">

	<xsl:apply-templates select="IdSoggRagazzo" mode="CampoIntero">
		<xsl:with-param name="size">10</xsl:with-param>
		<xsl:with-param name="chiave">true</xsl:with-param>
		<xsl:with-param name="caption">IdSoggRagazzo</xsl:with-param>
	</xsl:apply-templates>

	<xsl:apply-templates select="NomeRagazzo" mode="CampoTesto">
		<xsl:with-param name="size">10</xsl:with-param>
		
		<xsl:with-param name="caption">NomeRagazzo</xsl:with-param>
	</xsl:apply-templates>

	<xsl:apply-templates select="EmailRagazzo" mode="CampoTesto">
		<xsl:with-param name="size">10</xsl:with-param>
		
		<xsl:with-param name="caption">EmailRagazzo</xsl:with-param>
	</xsl:apply-templates>

</xsl:template>
</xsl:stylesheet>
