<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:template name="replace-string">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="with" />
		<xsl:choose>
			<xsl:when test="contains($text,$replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$with" />
				<xsl:call-template name="replace-string">
					<xsl:with-param name="text"
						select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="with" select="$with" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="attorneyfeeclaim">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simpleA4"
					page-height="29.7cm" page-width="21cm" margin-top="2cm"
					margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simpleA4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						
						<fo:block font-family="Arial" font-size="20pt">
							<fo:table table-layout="fixed" width="100%">
								<fo:table-column column-width="50%" />
								<fo:table-column column-width="50%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding-left="3pt" text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
											<fo:block font-family="Arial" font-size="20pt">Expert or Witness Claim
											</fo:block>
										</fo:table-cell>
										<xsl:choose>
											<xsl:when test="ACAP_ClaimDate">
												<fo:table-cell padding-left="3pt" border="solid .2mm black" text-align="left" padding-before="2pt" padding-after="2pt"
													display-align="before">
													<fo:block font-family="Arial" font-size="12pt">Submission Date:
														<xsl:value-of select="ACAP_ClaimDate" />
													</fo:block>
												</fo:table-cell>

											</xsl:when>
											<xsl:otherwise>

											</xsl:otherwise>
										</xsl:choose>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:block>

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body>

								<xsl:choose>
									<xsl:when test="ACAP_ClaimNumber">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Claim ID
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="ACAP_ClaimNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="ACAP_CourtCounty">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">County
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="ACAP_CourtCounty" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ACAP_Court">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Court
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="ACAP_Court" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="ACAP_AssignedJudge">

										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Judge
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">

													<fo:inline>
														<xsl:value-of select="ACAP_AssignedJudge" />
													</fo:inline>

												</fo:block>
											</fo:table-cell>

										</fo:table-row>

									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test=" ACAP_Sealed">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Sealed
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:if test="ACAP_Sealed ='' or ACAP_Sealed ='No'">
														No
													</xsl:if>
													<xsl:if test="ACAP_Sealed ='Yes'">
														Yes
													</xsl:if>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ACAP_ClientFirst">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Name of
													Client
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of
														select="concat(ACAP_ClientFirst,'&#10;', ACAP_ClientMiddle,'&#10;',ACAP_ClientLast,attribution)" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ACAP_CaseNumbers">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Case/
													Docket No.(s)
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:call-template name="replace-string">
														<xsl:with-param name="text" select="ACAP_CaseNumbers" />
														<xsl:with-param name="replace" select="','" />
														<xsl:with-param name="with" select="'&#x2028;'" />
													</xsl:call-template>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ACAP_CaseType">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Type of
													Case
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<fo:inline>
														<xsl:value-of select="ACAP_CaseType" />
													</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>


								<xsl:choose>
									<xsl:when test="ACAP_PreApprovalNumber">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Approval
													OrderID
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<fo:inline>
														<xsl:value-of select="ACAP_PreApprovalNumber" />
													</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>


								<xsl:choose>
									<xsl:when test="ACAP_First">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Vendor
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<fo:inline>

														<xsl:if test="//attorneyfeeclaim//ACAP_FirmName != ''">

															<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmName" />
														</xsl:if>

														<xsl:if test="//attorneyfeeclaim//ACAP_First !=''">
															of
															<xsl:value-of
																select="concat(ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last,attribution)" />
														</xsl:if>
														&#160;

													</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>


								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Expert Type
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline></fo:inline>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmStreet">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Address

												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of
														select="concat(ACAP_FirmStreet,'&#10;',ACAP_FirmAddress2)" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>



								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmCity">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">City

												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmCity" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmState">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">State
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmState" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>



								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmZipcode">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Zip
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmZipcode" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>





								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_PhoneNumber">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Phone
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_PhoneNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>


								<xsl:choose>
									<xsl:when test="ACAP_PrimaryEmailAddress">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Email
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<fo:inline>
														<xsl:value-of select="ACAP_PrimaryEmailAddress" />
													</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>

									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_EdisonID">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Edison #
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_EdisonID" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//LatestServiceDate">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Last Activity Date
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="concat(substring(//attorneyfeeclaim//LatestServiceDate, 6, 2),  '/',  substring(//attorneyfeeclaim//LatestServiceDate, 9, 2),  '/', substring(//attorneyfeeclaim//LatestServiceDate, 1, 4))" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="ACAP_First">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">Name of
													Attorney
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<fo:inline>
														<xsl:value-of
															select="concat(ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
													</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>

									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>





								<xsl:choose>
									<xsl:when test="ACAP_First">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Attorney
													Signature
												</fo:block>
											</fo:table-cell>

												<fo:table-cell border="solid .1mm black"
													margin-left="80pt" padding-before="2pt" padding-after="2pt"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:choose>
															<xsl:when test="//attorneyfeeclaim//ACAP_ProcessStatus ='AOC Staff Created'">
																<xsl:choose>
																	<xsl:when test="//attorneyfeeclaim//ACAP_ClaimantSignDate !=''">
																		<fo:inline>
																			<xsl:value-of
																			select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																			on
																			<xsl:value-of select="ACAP_ClaimantSignDate" />
																		</fo:inline>
																	</xsl:when>
																	<xsl:otherwise>
																		<fo:inline>
																			Claim Entered on Behalf of Claimant
																		</fo:inline>
																	</xsl:otherwise>
																</xsl:choose>
																
															</xsl:when>
															<xsl:otherwise>
																<xsl:choose>
																	<xsl:when test="//attorneyfeeclaim//ACAP_ClaimantSignDate !=''">
																		<fo:inline>
																			<xsl:value-of
																			select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																			on
																			<xsl:value-of select="ACAP_ClaimantSignDate" />
																		</fo:inline>
																	</xsl:when>
																	<xsl:otherwise>
																		<fo:inline>
																			<xsl:value-of
																				select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																			</fo:inline>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:otherwise>
														</xsl:choose>
													</fo:block>
													</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>






							</fo:table-body>
						</fo:table>
					</fo:block>



					<fo:block margin-top="5mm">
						<fo:table>

							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />

							<fo:table-body>
								<fo:table-row>


									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">
											Hours&#x2028;
											(Tenths)&#x2028;&#x2028; </fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Hours&#x2028;
											Amount&#x2028;&#x2028; </fo:block>
									</fo:table-cell>


									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">
											Expenses&#x2028;&#x2028; </fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">
											Hours Adjustment&#x2028;&#x2028; </fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">&#x2028;Reimbursement Total&#x2028;&#x2028;
										</fo:block>
									</fo:table-cell>


								</fo:table-row>
								<fo:table-row>


									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:choose>
													<xsl:when
														test="//attorneyfeeclaim//itemizedExpense//lineItem//Hours = 'Hours'">
														<xsl:value-of
														select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity[@expenseType='Hours']),'##.00' )" />															
													</xsl:when>
													<xsl:otherwise>
														<fo:inline />
													</xsl:otherwise>
												</xsl:choose>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:choose>
													<xsl:when
														test="//attorneyfeeclaim//itemizedExpense//lineItem//Hours = 'Hours'">
														<xsl:value-of
														select="format-number(round( 100.0000000001 * sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Hours'])) div 100,'##.00' )" />																
													</xsl:when>
													<xsl:otherwise>
														<fo:inline />
													</xsl:otherwise>
												</xsl:choose>
											</fo:inline>
										</fo:block>
									</fo:table-cell>


									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>

												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//Expenses = 'Expenses'">
													<xsl:value-of
													select="format-number(round( 100.0000000001 *sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Expenses'])) div 100,'##.00' )" />																
												</xsl:if>

											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<!-- Added for defect 338  -->
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>

												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//HoursAdjustment != '0.00'">
													<xsl:value-of
														select='//attorneyfeeclaim//itemizedExpense//HoursAdjustment' />
												</xsl:if>

											</fo:inline>
										</fo:block>
									</fo:table-cell>
									
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Hours'] != '0.00' or //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Expenses'] != '0.00'">
													<xsl:value-of
														select="format-number(round( 100.0000000001 *sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Hours'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Expenses'])) div 100,'##.00' )" />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

							</fo:table-body>

						</fo:table>

					</fo:block>










					<fo:block margin-top="5mm">
						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body>

								<fo:table-row>


									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">

										</fo:block>
									</fo:table-cell>


									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" text-align="left" padding-before="2pt"
										padding-after="2pt" display-align="after">
										<fo:block font-family="Arial" font-weight="bold"
											font-style="italic" font-size="8pt">I certify that the foregoing
											represents an accurate, complete statement of time and/or
											expenses in connection with the above action or proceedings.
										</fo:block>
									</fo:table-cell>










								</fo:table-row>

								<xsl:choose>
									<xsl:when test="ACAP_Vendor_Name">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Vendor
													Signature
												</fo:block>
											</fo:table-cell>
											
											<fo:table-cell border="solid .1mm black"
											margin-left="80pt" padding-before="2pt" padding-after="2pt"
											display-align="before">
											<fo:block font-family="Arial" font-size="8pt">
												<xsl:choose>
													<xsl:when test="//attorneyfeeclaim//ACAP_ProcessStatus ='AOC Staff Created'">
														<xsl:choose>
															<xsl:when test="//attorneyfeeclaim//ACAP_VendorSignDate !=''">
																<fo:inline>
																	<xsl:value-of
																	select="concat('Signed electronically by ',ACAP_Vendor_Name,'&#10;')" />
																	on
																	<xsl:value-of select="ACAP_VendorSignDate" />
																</fo:inline>
															</xsl:when>
															<xsl:otherwise>
																<fo:inline>
																	Claim Entered on Behalf of Claimant
																</fo:inline>
															</xsl:otherwise>
														</xsl:choose>
														
													</xsl:when>
													<xsl:otherwise>
														<xsl:choose>
															<xsl:when test="//attorneyfeeclaim//ACAP_VendorSignDate !=''">
																<fo:inline>
																	<xsl:value-of
																	select="concat('Signed electronically by ',ACAP_Vendor_Name,'&#10;')" />
																	on
																	<xsl:value-of select="ACAP_VendorSignDate" />
																</fo:inline>
															</xsl:when>
															<xsl:otherwise>
																<fo:inline>
																	<xsl:value-of
																		select="concat('Signed electronically by ',ACAP_Vendor_Name,'&#10;')" />
																	</fo:inline>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:otherwise>
												</xsl:choose>
											</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>



								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Auditor
											Signature
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test="ACAP_AuditorLogin !='' and (//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid or //attorneyfeeclaim//ACAP_ProcessEscalationReason ='Escalate to Batch')">
												<!-- approved electronically by &#160; -->
													<xsl:choose>
														<xsl:when test="//attorneyfeeclaim//ACAP_AuditorSignDate !=''">
															<fo:inline>
															<xsl:value-of
																select="ACAP_AuditorLogin" />
																on
																<xsl:value-of select="ACAP_AuditorSignDate" />
															</fo:inline>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline>
																<xsl:value-of
																	select="ACAP_AuditorLogin" />
																</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
											</xsl:if>

										</fo:block>
									</fo:table-cell>

								</fo:table-row>


								<xsl:choose>
									<xsl:when
										test="//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												padding-left="3pt" display-align="after">
												<fo:block font-family="Arial" font-size="8pt">AOC Payment
													Amount
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:if
														test="//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid">
														<xsl:value-of
														select= 'format-number(round (100.0000000001 *sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType="Hours"] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType="Expenses"] | //attorneyfeeclaim//itemizedExpense//HoursAdjustment)) div 100,"##.00" )' />
													</xsl:if>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>




							</fo:table-body>

							`
						</fo:table>
					</fo:block>


					<fo:block margin-top="20mm">
						<fo:table>
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />

							<fo:table-header>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">&#x2028;Line Item Service Date

									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">&#x2028;Line Item TYPE
									</fo:block>

								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">&#x2028;Line Item Description
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">&#x2028;
										Line Item QTY&#x2028; </fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">&#x2028;Dollar&#x2028;
										Amount
									</fo:block>
								</fo:table-cell>

							</fo:table-header>
							<fo:table-body>
<!--Added for AR-613 -->
<xsl:if test="//attorneyfeeclaim//itemizedExpense//lineItem">

									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//lineItem">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select="concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>

												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!--End of added for AR-613 -->
								<!--<xsl:if test="//attorneyfeeclaim//itemizedExpense//Hours">

									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//Hours">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select=" concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
													<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>
											
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />

													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>


								<xsl:if test="//attorneyfeeclaim//itemizedExpense//Expenses">

									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//Expenses">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select=" concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
													<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>
											
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />

													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>-->


								<fo:table-row>
									<fo:table-cell number-columns-spanned="3"
										text-align="right">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>Total:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="left" display-align="after" margin-left="2pt">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity != '0.00'">
													<xsl:value-of
														select= 'format-number(round (100.0000000001 *sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity )) div 100 ,"##.00" )' />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="left" display-align="after" margin-left="2pt">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost != '0.00'">
													<xsl:value-of
														select= 'format-number(round (100.0000000001 *sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost)) div 100,"##.00" )' />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>