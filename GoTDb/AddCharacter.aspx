<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCharacter.aspx.cs" Inherits="GoTDb.AddCharacter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link rel="Stylesheet" type="text/css" href="main.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="div_Location div_main">
		<table>
			<tr>
				<td align="center">
					<label class="div_main">Add Character</label>
					<br />&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<label>First Name</label>
					<br />
					<asp:TextBox runat="server" ID="txtCharacterFirstName" Width="125" MaxLength="100"></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ID="characterFirstNameValidator" ControlToValidate="txtCharacterFirstName" Text="required"></asp:RequiredFieldValidator>
				</td>	
			</tr>
			<tr>
				<td>
					<label>Last Name</label>
					<br />
					<asp:TextBox runat="server" ID="txtCharacterLastName" Width="125" MaxLength="100"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<label>Notes</label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:TextBox runat="server" ID="txtCharacterNotes" Width="300" Height="200" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
				</td>	
			</tr>
		</table>
		<asp:Button runat="server" ID="btnAddCharacter" Text="Add Character" OnClick="btnAddCharacter_Click" />
		&nbsp;
		<asp:Button runat="server" ID="btnCancelAddCharacter" Text="Cancel" OnClick="btnCancelAddCharacter_Click" CausesValidation="false" />
		<br />
		<br />
		<label runat="server" id="lblCharacterExists" style="color:red;" visible="false">> Character already exists!</label>    
    </div>
    </form>
</body>
</html>
