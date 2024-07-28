<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PatitasFelices.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../Styles/Index.css" rel="stylesheet" type="text/css" />
    <script src="../JavaScript/Index.js" defer></script>

    <div class="container">
        <div class="left-div"></div>
        <div class="center-div">
            <h1 class="banner-h1">Encuentra a tu</h1>
            <h1 class="banner-h1">mejor amigo hoy</h1>
            <a href="Adopcion.aspx" id="btnAdoptar" class="btn btn-lg btn-success">ADOPTÁ AHORA</a>
            <div class="div-h2">
                <h2 class="banner-h2">Adoptá, no compres</h2>
                <h2 class="banner-h2">Salva una vida</h2>
            </div>
            <div class="right-div"></div>
        </div>
    </div>

</asp:Content>
