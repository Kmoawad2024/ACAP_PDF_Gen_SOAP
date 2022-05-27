<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
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
					<fo:block font-size="10pt" font-family="Arial">
					<fo:block  font-family="Arial" font-size="20pt">Attorney Fee Capital Claim</fo:block>
						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="40%" />
							<fo:table-column column-width="12%" />
							<fo:table-column column-width="6%" />
							<fo:table-column column-width="6%" />
							<fo:table-column column-width="6%" />
							<fo:table-column column-width="6%" />
							<fo:table-column column-width="10%" />
							<fo:table-column column-width="12%" />

							<fo:table-body>

								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Claim Type Title</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black" number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline>Attorney Fee Capital Claim</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								<xsl:choose>
									<xsl:when test="ACAP_ClaimNumber">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Document ID</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"   number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_ClaimNumber" />
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
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Form:  AF – 2 (Rev 2017)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline>AF – 2 (Rev 2017)</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								<xsl:choose>
									<xsl:when test="ACAP_CourtCounty">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">County</fo:block>
											</fo:table-cell>
 
											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
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
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Court</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_Court" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ACAP_CourtCoun">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"  
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Complex   Complex or No</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_ClaimantLog" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="ACAP_CourtCoun">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"  
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Sealed      Sealed or No</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_ClaimantLog" />
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
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Name of Client</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="concat(ACAP_ClientFirst,'&#10;', ACAP_ClientMiddle,'&#10;',ACAP_ClientLast,attribution)" />
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
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Case Docket No.</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_CaseNumbers" />
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
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Original Offense</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline font-weight="bold">First Degree Murder</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">TCA Section</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline font-weight="bold">
													&#160;&#160;39-13-102&#160;&#160;
												</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Class (from TCA Code service)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline font-weight="bold">M</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								<xsl:choose>
									<xsl:when test="ACAP_OffenseType">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Type of Case ( user selected)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_OffenseType" />
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
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Death penalty</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline>No</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_DateofWithdrawl != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">If notice was withdrawn give date </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_DateofWithdrawl" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//cocounselReleieve//Yes">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Order Relieving the Co-Counsel</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//cocounselReleieve//Yes" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_DateofDisposition != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Date of Disposition</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_DateofDisposition" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//lastActivityDate">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Date of last activity</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//lastActivityDate" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_Disposition != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Disposition of Case</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_Disposition" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//lastActivityDate">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Conviction Offense</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//lastActivityDate" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_Outcome !=''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Sentence received</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_Outcome" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_EdisonID != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Edison No</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_EdisonID" />
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
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Signature of Attorney </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial" font-weight="bold"
													font-size="8pt">I certify that the foregoing represents an accurate, complete statement of time and expenses in connection with the above action or proceedings.</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								<xsl:choose>
									<xsl:when test="ACAP_First">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Attorney Signature will be displayed with the text "signed electronically by &#60;Attorney FName&#62; &#60;MI&#62; &#60;LName&#62; </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="concat(ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last,attribution)" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose><xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmName">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Attorney/Firm  (Payee Information) Attorney Name AND Firm Name</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmName" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose><xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_Address2 != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Address (Payee)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_Address2" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose><xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmCity != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">City (Payee)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmCity" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmState != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">State(Payee)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmState" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmZipcode != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Zip  (Payee) </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmZipcode" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose><xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_PhoneNumber != ''">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Phone(Payee)</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_PhoneNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								
								
								
								<fo:table-row>
									<fo:table-cell border="solid .1mm black" number-rows-spanned="3">
										<fo:block-container margin-top="2mm">
											<fo:block text-align="left" font-family="Arial" font-weight="bold"
												font-size="8pt">
												<fo:inline>Summary of Activity.  (in-court, out of court hrs and dollars total and expense total (mileage, copies, etc).</fo:inline>
											</fo:block>
										</fo:block-container>
								 	</fo:table-cell>
								 	<fo:table-cell border="solid .1mm black" 
									text-align="center" 
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">SUMMARY OF ACTIVITY TOTALS
										(Itemized list on
										second
										page)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">(A)&#x2028;
										IN-COURT HOURS&#x2028;
										(Tenths)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">Dollar&#x2028;
										Amount
									</fo:block>
								</fo:table-cell>
								  <fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
										(B)&#x2028;
										OUT-OF-COURT HOURS&#x2028;
										(Tenths)
									</fo:block>
								</fo:table-cell>  
								<fo:table-cell border="solid .1mm black"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">Dollar&#x2028;
										Amount
									</fo:block>
								</fo:table-cell> 
									<fo:table-cell border="solid .1mm black"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">(C)&#x2028;
										NECESSARY EXPENSES
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">REIMBURSEMENT TOTAL</fo:block>
								</fo:table-cell>
								
								
								</fo:table-row>
								<fo:table-row>
									
								 	<fo:table-cell border="solid .1mm black" 
									text-align="center" 
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">ATTORNEY&#x2028; REIMBURSEMENT TOTALS
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
									</fo:block>
								</fo:table-cell>
								  <fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
										
									</fo:block>
								</fo:table-cell>  
								<fo:table-cell border="solid .1mm black"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
									</fo:block>
								</fo:table-cell> 
									<fo:table-cell border="solid .1mm black"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt"></fo:block>
								</fo:table-cell>
								
								
								</fo:table-row>
								<fo:table-row>
									
								 	<fo:table-cell border="solid .1mm black" 
									text-align="center" 
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">JUDGE APPROVED &#x2028;AMOUNT
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black" number-columns-spanned="5"
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								
								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Signature of Judge  Blank for Wet Signature</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Subject to the provisions of  T.C.A. ' 40-14-207, the Court finds this to be 
reasonable compensation for work done in the above-style case/appeal.</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Judge Signature will be displayed with the text "approved electronically by &#60;First&#62; &#60;MI&#62; &#60;Last&#62;” for online judges.  Offline judges will require the space for the actual signature. </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Judge Name: &#60;First&#62; &#60;MI&#62; &#60;Last&#62; </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
																<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">AOC Payment Approval Amount</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  number-columns-spanned="7"
												text-align="center" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost" />
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
						<fo:block margin-top="3mm">
						<fo:table>
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="40%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="10%" />
							<fo:table-column column-width="10%" />
							<fo:table-header>
							<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item&#x2028;Service Date
										
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									
									<fo:block font-weight="bold" font-family="Arial"
										font-size="6pt">
										Line Item Type(in-court,out-court,expense)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item
										Description(free from text)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item&#x2028;
										QTY&#x2028;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Dollar&#x2028;
										Amount
									</fo:block>
								</fo:table-cell>
							</fo:table-header>
							<fo:table-body>							
								 <!--<xsl:for-each select="//itemizedExpense//expense">
									<fo:table-row>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="date"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="activity"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="inCourt"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="outCourt"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="expenseamount"/></fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>-->
								<!--<xsl:choose>-->
									<xsl:if test="//attorneyfeeclaim//itemizedExpense//Incourt">
						
								<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//Incourt">
									<fo:table-row>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ServiceDate"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ClaimExpenseDescription"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ExpenseType"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">
												<xsl:choose>
											         	<xsl:when test="//attorneyfeeclaim//JudgeType">
															&#x00A0;<xsl:value-of select="AuditApprovedQuantity"/>
														</xsl:when>
														<xsl:otherwise>
															&#x00A0;<xsl:value-of select="ClaimExpenseQuantity"/>
														</xsl:otherwise>
											    </xsl:choose>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">
												<xsl:choose>
											         	<xsl:when test="//attorneyfeeclaim//JudgeType">
															&#x00A0;<xsl:value-of select="AuditApprovedTotalCost"/>
														</xsl:when>
														<xsl:otherwise>
															&#x00A0;<xsl:value-of select="ClaimExpenseTotalCost"/>
														</xsl:otherwise>
											    </xsl:choose>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
								</xsl:if>
								
								
								<xsl:if test="//attorneyfeeclaim//itemizedExpense//OutCourt">
								
								<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//OutCourt">
									<fo:table-row>
									<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ServiceDate"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ClaimExpenseDescription"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ExpenseType"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">
												<xsl:choose>
											         	<xsl:when test="//attorneyfeeclaim//JudgeType">
															&#x00A0;<xsl:value-of select="AuditApprovedQuantity"/>
														</xsl:when>
														<xsl:otherwise>
															&#x00A0;<xsl:value-of select="ClaimExpenseQuantity"/>
														</xsl:otherwise>
											    </xsl:choose>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">
												<xsl:choose>
											         	<xsl:when test="//attorneyfeeclaim//JudgeType">
															&#x00A0;<xsl:value-of select="AuditApprovedTotalCost"/>
														</xsl:when>
														<xsl:otherwise>
															&#x00A0;<xsl:value-of select="ClaimExpenseTotalCost"/>
														</xsl:otherwise>
											    </xsl:choose>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
								</xsl:if>
								
								<xsl:if test="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses">
								<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses">
									<fo:table-row>
									<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ServiceDate"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ClaimExpenseDescription"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="ExpenseType"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">
												<xsl:choose>
											         	<xsl:when test="//attorneyfeeclaim//JudgeType">
															&#x00A0;<xsl:value-of select="AuditApprovedQuantity"/>
														</xsl:when>
														<xsl:otherwise>
															&#x00A0;<xsl:value-of select="ClaimExpenseQuantity"/>
														</xsl:otherwise>
											    </xsl:choose>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">
												<xsl:choose>
											         	<xsl:when test="//attorneyfeeclaim//JudgeType">
															&#x00A0;<xsl:value-of select="AuditApprovedTotalCost"/>
														</xsl:when>
														<xsl:otherwise>
															&#x00A0;<xsl:value-of select="ClaimExpenseTotalCost"/>
														</xsl:otherwise>
											    </xsl:choose>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
								</xsl:if>
								<!--</xsl:choose>-->
							</fo:table-body>
						</fo:table>
					</fo:block>



				</fo:flow>
			</fo:page-sequence>

		</fo:root>

	</xsl:template>
</xsl:stylesheet>
