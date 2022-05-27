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
							<fo:inline>Time Log Billing
							</fo:inline>
						</fo:block>
						<fo:table border="solid .1mm black" table-layout="fixed"
							width="100%">
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body border="inherit">
								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Claim ID
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_ClaimNumber" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Edison #
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_EdisonID" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Interpreter /
											Organization Name
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="Interpreter_Name" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Credentials
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_InterpreterCertification" />

										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Address
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of
												select="concat(ACAP_AddressStreet,'&#10;',ACAP_Address2)" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt"> City
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmCity" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">State
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmState" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Zip
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmZipcode" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Phone
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_PhoneNumber" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Language
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" text-align="left" padding-before="2pt"
										padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_InterpreterLanguages" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Email
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" text-align="left" padding-before="2pt"
										padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_PrimaryEmailAddress" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Service Date
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//ACAP_DateofDisposition" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Hourly Rate
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
										<xsl:value-of
												select="//attorneyfeeclaim//itemizedExpense//ClaimExpenseUnitCostPrice" /> 
										
											<!-- <xsl:value-of
												select="//attorneyfeeclaim//itemizedExpense//CostForEachClient" /> -->
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">County
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" text-align="left" padding-before="2pt"
										padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_CourtCounty" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Court
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_Court" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
									<fo:table-cell padding-left="3pt" border="inherit"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Travel Time
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" margin-left="80pt"
										padding-before="2pt" padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test=" //attorneyfeeclaim//itemizedExpense//TravelTimeExpenses//AuditApprovedTotalCost != '0.00'">
												<xsl:value-of
													select='format-number(sum( //attorneyfeeclaim//itemizedExpense//TravelTimeExpenses//AuditApprovedTotalCost),"##.00" )' />
											</xsl:if>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>


							</fo:table-body>
						</fo:table>
					</fo:block>

					<xsl:if test="//attorneyfeeclaim//InterpreterJudges">
						<xsl:for-each select="//attorneyfeeclaim//InterpreterJudges//Judge">
							<xsl:variable name="currentJudge" select="JudgeName" />
							<fo:block margin-top="5mm">
								<fo:table border="solid .1mm black">
									<fo:table-column column-width="10%" />
									<fo:table-column column-width="30%" />
									<fo:table-column column-width="30%" />
									<fo:table-column column-width="30%" />
									<fo:table-body border="inherit">
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Judge</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="JudgeName" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Court Wait Time </fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">
													<xsl:if test="./case/JudgeName = $currentJudge">
														<xsl:value-of select="./case/WaitingHours" />
													</xsl:if>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
								<fo:table border="solid .1mm black">
									<fo:table-column column-width="10%" />
									<fo:table-column column-width="10%" />
									<fo:table-column column-width="10%" />
									<fo:table-column column-width="10%" />
									<fo:table-column column-width="10%" />
									<fo:table-column column-width="20%" />
									<fo:table-column column-width="20%" />
									<fo:table-column column-width="10%" />
									<fo:table-body border="inherit">
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit"
												number-rows-spanned="2" text-align="center" display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Case / &#x2028; Docket No.(s) &#x2028;</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit"
												number-columns-spanned="3" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Client Name</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit"
												number-rows-spanned="2" text-align="center" display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Indigent?</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit"
												number-rows-spanned="2" text-align="center" display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">&#x2028;TCA</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit"
												number-rows-spanned="2" text-align="center" display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">&#x2028;Activity</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit"
												number-rows-spanned="2" text-align="center" display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Hours&#x2028;(Tenths)</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">First&#x2028;Name</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Middle&#x2028;Name</fo:block>
											</fo:table-cell>
											<fo:table-cell border="inherit" text-align="center"
												display-align="before">
												<fo:block font-weight="bold" font-family="Arial"
													font-size="8pt">Last&#x2028;Name</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<xsl:for-each
											select="//attorneyfeeclaim//InterpreterJudges//Judge//case">
											<fo:table-row border="inherit">
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./Case_Number" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./ClientFirst" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./ClientMiddle" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./ClientLast" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./indigent" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./tca" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./activity" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="inherit" text-align="center"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:if test="./JudgeName = $currentJudge">
															<xsl:value-of select="./hours" />
														</xsl:if>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:for-each>
									</fo:table-body>
								</fo:table>
							</fo:block>
						</xsl:for-each>
					</xsl:if>


					<xsl:if
						test="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses and //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//ExpenseType!=''">
						<fo:block margin-top="5mm">
							<fo:table>

								<fo:table-column column-width="25%" />
								<fo:table-column column-width="25%" />
								<fo:table-column column-width="25%" />
								<fo:table-column column-width="25%" />
								<fo:table-header>

									<fo:table-cell border="solid .1mm black"
										text-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Expense Description
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Expense Units
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Expense Rate
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Expense Total
										</fo:block>
									</fo:table-cell>
								</fo:table-header>
								<fo:table-body>
									<xsl:if
										test="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses">
										<xsl:for-each
											select="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses">
											<xsl:if test="ExpenseType!=''">
												<fo:table-row>

													<fo:table-cell border="solid .1mm black"
														text-align="center">
														<fo:block font-family="Arial" font-size="8pt">
															&#x00A0;
															<xsl:value-of select="ClaimExpenseDescription" />
														</fo:block>
													</fo:table-cell>
													<fo:table-cell border="solid .1mm black"
														text-align="center">
														<fo:block font-family="Arial" font-size="8pt">
															&#x00A0;
															<xsl:value-of select="AuditApprovedQuantity" />

														</fo:block>
													</fo:table-cell>
													<fo:table-cell border="solid .1mm black"
														text-align="center">
														<fo:block font-family="Arial" font-size="8pt">
															&#x00A0;
															<xsl:value-of select="ClaimExpenseUnitCost" />

														</fo:block>
													</fo:table-cell>
													<fo:table-cell border="solid .1mm black"
														text-align="center">
														<fo:block font-family="Arial" font-size="8pt">
															&#x00A0;
															<xsl:value-of select="AuditApprovedTotalCost" />

														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>

								</fo:table-body>
							</fo:table>
						</fo:block>
					</xsl:if>
					<xsl:if
						test="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses and //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//ExpenseType=''">
						<fo:block margin-top="5mm">
							<fo:table border="solid .1mm black" table-layout="fixed"
								width="100%">
								<fo:table-column column-width="25%" />
								<fo:table-column column-width="25%" />
								<fo:table-column column-width="25%" />
								<fo:table-column column-width="25%" />
								<fo:table-body border="inherit">
									<fo:table-row>
										<fo:table-cell border="solid .1mm black"
											text-align="center">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">Expense Description
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black"
											text-align="center">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">Expense Units
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black"
											text-align="center">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">Expense Rate
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="solid .1mm black"
											text-align="center">
											<fo:block font-weight="bold" font-family="Arial"
												font-size="8pt">Expense Total
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:block>
					</xsl:if>
					<fo:block margin-top="5mm">
						<fo:table table-layout="fixed" width="100%">

							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />


							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total Clients
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_NumberofClients" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total Hours
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test=" //attorneyfeeclaim//itemizedExpense//TotalQuantity != '0.00'">
													<xsl:value-of
														select="//attorneyfeeclaim//itemizedExpense//TotalQuantity" />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total Hours
											Amount
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>

												<xsl:value-of
													select="//attorneyfeeclaim//itemizedExpense//ExpenseTotalCost" />

											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total Expense
											amount
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test=" //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost != '0.00'">
													<xsl:value-of
														select='format-number(sum( //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost),"##.00" )' />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Hours Adjustment
											 Amount
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>

												<xsl:value-of
													select="//attorneyfeeclaim//itemizedExpense//HoursAdjustment" />

											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
										
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Total
											Reimbursement Amount
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>

												<xsl:value-of
													select='format-number(sum(//attorneyfeeclaim//itemizedExpense//Words//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//Hours//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost),"##.00" )' />

											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt"></fo:block>
									</fo:table-cell>


									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" text-align="left" padding-before="2pt"
										padding-after="2pt" display-align="before">
										<fo:block font-family="Arial" font-weight="bold"
											font-style="italic" font-size="8pt">In accordance with Tennessee
											Supreme Court Rule 13, Section 4, the court order approving
											the services must be uploaded onto the interpreter claim on
											the online system. The interpreter must also upload any
											necessary receipts pursuant to Tennessee Supreme Court Rule
											13.&#x2028;&#x2028; I certify that the foregoing represents
											an accurate, complete statement of time and expenses in
											connection with the above action or proceedings.&#x2028;
										</fo:block>
									</fo:table-cell>



								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Judge
											Approved Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//SubmitforAOCReview or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//Paid">
													<xsl:value-of
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//JudgeApprovedTotalCost | //attorneyfeeclaim//JudgeHoursAdjust),"##.00" )'/>
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>


								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">Auditor
											Signature </fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test="ACAP_AuditorLogin !='' and (//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//Paid or //attorneyfeeclaim//ACAP_ProcessEscalationReason ='Escalate to Batch')">
												<!-- approved electronically by &#160; -->
												<xsl:value-of select="ACAP_AuditorLogin" />
											</xsl:if>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>


								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">AOC Payment
											Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test="//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//Paid">
												<!-- <xsl:value-of
													select='format-number(sum(//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.00" )' /> -->
													<xsl:value-of
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//Words//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//Hours//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.00" )' />
											</xsl:if>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Interpreter
											Signature</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if test="//attorneyfeeclaim//Interpreter_Name !=''">
												<fo:inline>
													<xsl:value-of select="Interpreter_Name" />

												</fo:inline>
											</xsl:if>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										padding-left="3pt" display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Judge
											Signature </fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if
												test="//attorneyfeeclaim//ACAP_AssignedJudge !='' and (//attorneyfeeclaim//SubmitforAOCReview or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//Paid)">
												<!-- <fo:inline>
													approved electronically by
													<xsl:value-of select="ACAP_AssignedJudge" />
												</fo:inline> -->
											</xsl:if>
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