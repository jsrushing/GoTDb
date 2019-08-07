<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GoTDb._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" type="text/css" href="main.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager runat="server" ID="mgr1"></asp:ScriptManager>
		<div id="wrapper">

			<div class="div_main">
				<asp:UpdatePanel runat="server" ID="pnlSeasonSelect" >
					<ContentTemplate>
						<table>
							<tr>
								<td colspan="3" align="center">
									<br />
									<label>Enter Search Criteria OR </label>
									<asp:Button runat="server" ID="btnAddScene" Text="Add A New Scene" OnClick="btnAddScene_Click" />
									<br />&nbsp;
								</td>
							</tr>
							<tr>
								<td>
								<label>Season</label>
								</td>
								<td>
									<label>Episode</label>
								</td>
								<td>
									<label>Location</label>
									&nbsp;&nbsp;
									<%--<a style="font-size:12px;" href="AddLocation.aspx">Add New Location</a>--%>
									<%--<asp:Button runat="server" ID="btnAddLocation" Text="Add New Location" OnClick="btnAddLocation_Click" Visible="false" />--%>
								</td>
							</tr>
							<tr>
								<td>
									<asp:DropDownList ID="ddlSeason" runat="server" OnSelectedIndexChanged="ddlSeason_SelectedIndexChanged" AutoPostBack="true">
										<asp:ListItem Text="Any" Value="0"></asp:ListItem>
										<asp:ListItem Text="1" Value="1"></asp:ListItem>
										<asp:ListItem Text="2" Value="2"></asp:ListItem>
										<asp:ListItem Text="3" Value="3"></asp:ListItem>
										<asp:ListItem Text="4" Value="4"></asp:ListItem>
										<asp:ListItem Text="5" Value="5"></asp:ListItem>
										<asp:ListItem Text="6" Value="6"></asp:ListItem>
										<asp:ListItem Text="7" Value="7"></asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="ddlEpisode" runat="server" DataValueField="EpisodeCount" DataTextField="EpisodeCount">
										<asp:ListItem Text="Any" Value="0"></asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:DropDownList ID="ddlLocation" runat="server" Width="190" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
								</td>
							</tr>
						</table>
					</ContentTemplate>
				</asp:UpdatePanel>
				<table>
					<tr>
						<td>
							<br />
							<label>Character(s)</label>
							&nbsp;&nbsp;&nbsp;
							<asp:Button runat="server" ID="btnClearCharacters" Text="Clear All" OnClick="btnClearCharacters_Click" />
							<br />
							<label>1)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter1" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>2)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter2" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>3)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter3" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>4)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter4" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>5)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter5" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>6)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter6" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>7)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter7" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>8)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter8" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
							<label>9)</label>
							&nbsp;&nbsp;
							<asp:DropDownList runat="server" ID="ddlCharacter9" Width="300" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
							<br />
						</td>
					</tr>
					<tr>
						<td>
							<asp:RadioButton runat="server" ID="radAndComparison" Checked="true" GroupName="radsComparison" Text="include ALL selected characters" />
							<br />
							<asp:RadioButton runat="server" ID="radOrComparison" Checked="false" GroupName="radsComparison" Text="include ANY selected characters" />

						</td>
					</tr>
					<tr>
						<td>
							<br />
							<label>Keywords(s) (comma-delimited)</label>
							<br />
							<asp:TextBox ID="txtKeywords" runat="server" Width="300"></asp:TextBox>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" />
						</td>
					</tr>
				</table>
				<br />
				<label runat="server" id="lblNoResults" visible="false" style="color:red;">No Results Found</label>
			</div>
			<br />
			<br />
			<div id="divSearchResults" class="div_searchResults">
						<asp:GridView ID="gridSceneSearchResults" runat="server" Width="1300"
							CssClass="mGrid" EnableViewState="true"
							HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-BackColor="#ffffff"
							HeaderStyle-ForeColor="White"
							RowStyle-BackColor="#c6ffee"
							RowStyle-ForeColor="White"
							AlternatingRowStyle-BackColor="White" 
							BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
							CellPadding="3" Font-Size="Smaller"
							HorizontalAlign="Left" 
							OnSelectedIndexChanged="gridSceneSearchResults_SelectedIndexChanged" OnRowCreated="gridSceneSearchResults_RowCreated"
							OnRowDataBound="gridSceneSearchResults_RowDataBound" EnableModelValidation="True" AutoGenerateColumns="false" 
							 AllowPaging="False" PagerSettings-NextPageText="&gt;Next Page" PagerSettings-Mode="NumericFirstLast" PagerSettings-LastPageText="&gt;Last Page" 
							 OnPageIndexChanging ="gridSceneSearchResults_PageIndexChanging">
								<RowStyle Wrap="true" />
								<AlternatingRowStyle BackColor="#F7F7F7" />   
								<Columns>
									<asp:CommandField ShowSelectButton="True" ShowHeader="false" SelectText="edit"></asp:CommandField>
									<asp:BoundField DataField="SceneId" HeaderText="dd"/>
									<asp:BoundField DataField="Season" HeaderText="Sea." />
									<asp:BoundField DataField="Episode" HeaderText="Epi." />
									<asp:BoundField DataField="Timestamp" HeaderText="Time" />
									<asp:BoundField DataField="LocationName" HeaderText="Location" HeaderStyle-Width="150" >
									<HeaderStyle Width="150px"></HeaderStyle>
									</asp:BoundField>
									<asp:TemplateField HeaderText="Characters">
										<ItemTemplate>
											<asp:DropDownList runat="server" ID="ddlFoundCharacters" DataTextField="FullName" DataValueField="Id" Width="220" Font-Size="12px"></asp:DropDownList>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:BoundField DataField="Description" HeaderText="Description"/>
								</Columns>										                                                                                                               
								<FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
								<HeaderStyle BackColor="#cccccc" ForeColor="White" Font-Bold="True" />
								<PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" PageButtonCount="4" />
								<RowStyle BackColor="#ffffff" ForeColor="#4A3C8C" Font-Names="Tahoma,Verdana" />
						</asp:GridView>
			</div>
			<br />&nbsp;<br />&nbsp;		
		</div>
    </form>
</body>
</html>
