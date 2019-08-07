<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddScene.aspx.cs" Inherits="GoTDb.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" type="text/css" href="main.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="div_main">
        <table>
			<tr>
				<td colspan="3" align="center">
					<br />
					<label>Enter Scene Information</label>
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
					<asp:Button runat="server" ID="btnAddLocation" Text="Add New Location" OnClick="btnAddLocation_Click" CausesValidation="false" />

                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlSeason" runat="server" OnSelectedIndexChanged="ddlSeason_SelectedIndexChanged" AutoPostBack="true">
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
					</asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddlLocation" runat="server" Width="190" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                </td>
            </tr>
			<tr>
				<td colspan="3">
					<label>Timestamp ([min]:[sec]) </label>
					<asp:TextBox runat="server" ID="txtTimeStamp" Width="40" MaxLength="5"></asp:TextBox>
					<asp:RequiredFieldValidator runat="server" ID="validateTimeStamp" ControlToValidate="txtTimeStamp" ErrorMessage="required"></asp:RequiredFieldValidator>
				</td>
			</tr>
		</table>
		<table>
            <tr>
                <td>
					<br />
					<label>Character(s)</label>
					&nbsp;&nbsp;
					<asp:Button runat="server" ID="btnAddCharacter" Text="Add New Character" OnClick="btnAddCharacter_Click" CausesValidation="false" />
					&nbsp;&nbsp;&nbsp
					<asp:Button runat="server" ID="btnClearCharacters" Text="Clear All" OnClick="btnClearCharacters_Click" CausesValidation="false" />
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
                </td>
			</tr>
			<tr>
				<td>
					<label>Scene Description</label>
					<br />
					<asp:TextBox runat="server" ID="txtDescription" Width="350" Height="200" TextMode="MultiLine" Font-Names="Tahoma,Verdana"></asp:TextBox>
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
		<asp:Button runat="server" ID="btnAddScene" Text="Add Scene" OnClick="btnAddScene_Click" />
		&nbsp;
		<asp:Button runat="server" ID="btnCancelAddScene" Text="Cancel" OnClick="btnCancelAddScene_Click" CausesValidation="false" />
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
