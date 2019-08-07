<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmAddEdit.aspx.cs" Inherits="GoTDb.ConfirmAddEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link rel="Stylesheet" type="text/css" href="main.css" />
	<style>
		.valueCell{
			color:dodgerblue;
		}
	</style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="div_main">
		<table>
			<tr>
				<td colspan="2">
					<label>Please confirm the Scene details below.</label>
				</td>
			</tr>
			<tr>
				<td style="width:100px;"
					<label>Season: </label>
				</td>
				<td>
					<label class="valueCell" runat="server" id="lblSeason"></label>
				</td>
			</tr>
			<tr>
				<td>
					<label>Episode: </label>
				</td>
				<td>
					<label class="valueCell" runat="server" id="lblEpisode"></label>
				</td>
			</tr>
			<tr>
				<td>
					<label>Timestamp: </label>
				</td>
				<td>
					<label class="valueCell" runat="server" id="lblTimestamp"></label>
				</td>
			</tr>
			<tr>
				<td>
					<label>Location: </label>
				</td>
				<td>
					<label class="valueCell" runat="server" id="lblLocation"></label>
				</td>
			</tr>
			<tr>
				<td class="table_cell_confirmAddEdit" colspan="2">
					<label>Description:</label>			
					<br />
				<%--	<label class="sceneDescriptionLabel, valueCell" runat="server" id="lblDescription"></label>--%>
					<asp:TextBox CssClass="valueCell" Enabled="false" runat="server" ID="txtDescription" Width="300" Height="200" TextMode="MultiLine" BackColor="White" Font-Names="Tahoma,Verdana"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="table_cell_confirmAddEdit">
					<label>Keywords:</label>
				</td>
				<td>
					<label class="valueCell" runat="server" id="lblKeywords"></label>
				</td>
			</tr>
			<tr>
				<td class="table_cell_confirmAddEdit" colspan="2">
					<label>Character(s)</label>
					<br />
					<asp:ListBox runat="server" ID="lstCharacters" DataTextField="FullName" Height="150" Width="300" CssClass="valueCell"></asp:ListBox>
				</td>
			</tr>
		</table>
		<br />
		<asp:Button runat="server" ID="btnCommitScene" Text="Commit To Database" OnClick="btnCommitScene_Click" />
		&nbsp;&nbsp;
		<asp:Button runat="server" ID="btnCancel" Text="Cancel/Make Changes" OnClick="btnCancel_Click" />
    </div>
    </form>
</body>
</html>
