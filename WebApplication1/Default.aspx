<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <link href="Styles/jqx.base.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jqx.classic.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jqxcore.js" type="text/javascript"></script>
    <script src="Scripts/jqxbuttons.js" type="text/javascript"></script>
    <script src="Scripts/jqxdata.js" type="text/javascript"></script>
    <script src="Scripts/jqxgrid.js" type="text/javascript"></script>
    <script src="Scripts/jqxgrid.selection.js" type="text/javascript"></script>
    <script src="Scripts/jqxmenu.js" type="text/javascript"></script>
    <script src="Scripts/jqxscrollbar.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //Getting the source data with ajax GET request
            source = {
                datatype: "xml",
                datafields: [
                { name: 'CompanyName' },
                { name: 'ContactName' },
                { name: 'ContactTitle' },
                { name: 'City' },
                { name: 'Country' },
                { name: 'Address' }
                ],
                async: false,
                record: 'Table',
                url: 'Default.aspx/GetCustomers',
            };
            var dataAdapter = new $.jqx.dataAdapter(source,
                {  contentType: 'application/json; charset=utf-8'}
            );
            $("#jqxgrid").jqxGrid({
                source: dataAdapter,
                theme: 'classic',
                columns: [
                    { text: 'Company Name', dataField: 'CompanyName', width: 250 },
                    { text: 'Contact Name', dataField: 'ContactName', width: 150 },
                    { text: 'Contact Title', dataField: 'ContactTitle', width: 180 },
                    { text: 'Address', dataField: 'Address', width: 180},
                    { text: 'City', dataField: 'City', width: 80 },
                    { text: 'Country', dataField: 'Country', width: 100}
                ]
            });
        });
    </script>

    <div id="jqxgrid"></div>
</asp:Content>