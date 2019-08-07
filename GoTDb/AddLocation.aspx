<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLocation.aspx.cs" Inherits="GoTDb.AddLocation" %>

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
					<label class="div_main">Add Location</label>
					<br />&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<label>Name</label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:TextBox runat="server" ID="txtLocationName" Width="300" MaxLength="200"></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ID="NameValidator" ControlToValidate="txtLocationName" Text="required"></asp:RequiredFieldValidator>
				</td>	
			</tr>
			<tr>
				<td>
					<label>Notes</label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:TextBox runat="server" ID="txtLocationNotes" Width="300" Height="200" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
				</td>	
			</tr>
		</table>
		<asp:Button runat="server" ID="btnAddLocation" Text="Add Location" OnClick="btnAddLocation_Click" />
		&nbsp;
		<asp:Button runat="server" ID="btnCancelAddLocation" Text="Cancel" OnClick="btnCancelAddLocation_Click" CausesValidation="false" />
		<br />
		<br />
		<label runat="server" id="lblLocationExists" style="color:red;" visible="false">> Location already exists!</label>   
    </div>
    </form>
</body>
</html>
