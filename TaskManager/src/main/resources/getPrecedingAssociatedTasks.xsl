<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0"
	xmlns:ns0="http://www.intalio.com/BPMS/Workflow/TaskManagementServices-20051109/" 
	xmlns:b4p="http://www.intalio.com/bpms/workflow/ib4p_20051115"
	exclude-result-prefixes="ns0">

	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="placement" />

	<xsl:template match="ns0:getAssociatedTasksResponse">
		<b4p:tasks>
			<xsl:choose>
				<xsl:when test="$placement = 'PRECEDING'">
					<xsl:for-each select="ns0:task">
						<xsl:if test="((ns0:taskState='READY') and (ns0:adhocPlacement='PRECEDING') and (ns0:adhocRelation='CURRENT'))">
							<b4p:task>
								<xsl:value-of select="ns0:taskId" />
							</b4p:task>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="$placement = 'PARALLEL'">
					<xsl:for-each select="ns0:task">
						<xsl:if test="((ns0:taskState='READY') and (ns0:adhocPlacement='PRECEDING') and (ns0:adhocRelation='CURRENT'))
						           or ((ns0:taskState='READY') and (ns0:adhocPlacement='PRECEDING') and (ns0:adhocRelation='PARENT'))">
							<b4p:task>
								<xsl:value-of select="ns0:taskId" />
							</b4p:task>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="$placement = 'SUCCEEDING'">
					<xsl:for-each select="ns0:task">
						<xsl:if test="((ns0:taskState='READY') and (ns0:adhocPlacement='PRECEDING') and (ns0:adhocRelation='CURRENT'))
				                   or ((ns0:taskState='READY') and (ns0:adhocPlacement='PRECEDING') and (ns0:adhocRelation='PARENT'))
								   or ((ns0:taskState='READY') and (ns0:adhocPlacement='PARALLEL') and (ns0:adhocRelation='PARENT'))
								   or ((ns0:taskState='READY') and (ns0:isAdhocTask='false') and (ns0:adhocRelation='CURRENT'))">
							<b4p:task>
								<xsl:value-of select="ns0:taskId" />
							</b4p:task>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="ns0:task">
						<xsl:if test="((ns0:taskState='READY') and (ns0:adhocPlacement='PRECEDING') and (ns0:adhocRelation='CURRENT'))">
							<b4p:task>
								<xsl:value-of select="ns0:taskId" />
							</b4p:task>
						</xsl:if>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</b4p:tasks>
	</xsl:template>
</xsl:stylesheet>