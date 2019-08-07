<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditScene.aspx.cs" Inherits="GoTDb.EditScene" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" type="text/css" href="main.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="div_main">
		<label runat="server" id="lblHiddenSceneId" visible="false"></label>
		<label>Season: </label>
		<label runat="server" id="lblSeasonNumber"></label>
		<br />
		<label>Episode: </label>
		<label runat="server" id="lblEpisodeNumber"></label>
		<br />
		<label>Keywords: </label>
		<br />
		<asp:TextBox runat="server" ID="txtKeywords" TextMode="MultiLine" Width="300" Height="50"></asp:TextBox>
		<br />
		<label>Timestamp: </label>
		<asp:TextBox runat="server" ID="txtTimeStamp" Width="40" MaxLength="5"></asp:TextBox>
		<asp:RequiredFieldValidator runat="server" ID="validateTimeStamp" ControlToValidate="txtTimeStamp" ErrorMessage="required"></asp:RequiredFieldValidator>
		<br />
		<br />
			<table>
				<tr>
					<td>
						<label>Location</label>
						&nbsp;&nbsp;
						<asp:Button runat="server" ID="btnAddLocation" Text="Add New Location" OnClick="btnAddLocation_Click" CausesValidation="false" />
					</td>
				</tr>
				<tr>
					<td>
						<asp:DropDownList ID="ddlLocation" runat="server" Width="190" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
					</td>
				</tr>
			</table>
		<br />
		<label>Characters</label>
		&nbsp;&nbsp;
		<asp:Button runat="server" ID="btnAddCharacter" Text="Add New Character" OnClick="btnAddCharacter_Click" CausesValidation="false" />
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
		<br />
		<label>Description:</label>
		<br />
		<asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Width="350" Height="100" Font-Names="Tahoma,Verdana"></asp:TextBox>
		<br />
		<asp:Button runat="server" ID="btnUpdateScene" Text="Update Scene" OnClick="btnUpdateScene_Click" />
		&nbsp;
		<asp:Button runat="server" ID="btnCancelUpdate" Text="Cancel" OnClick="btnCancelUpdate_Click" CausesValidation="false" />
		<br />
		<label runat="server" id="lblSceneExists" style="color:red;" visible="false"></label>
		<label runat="server" id="lblTimeStampInvalid" style="color:red;" visible="false"></label>
		<label runat="server" id="lblCharacterRequired" style="color:red;" visible="false"></label>
		<label runat="server" id="lblUncodedError" style="color:red;" visible="false"></label>
		<label runat="server" id="lblDuplicateCharacter" style="color:red;" visible="false">> You entered the character '{0}' more than once.  Please review the selected characters.</label>
    </div>
    </form>
</body>
</html>
