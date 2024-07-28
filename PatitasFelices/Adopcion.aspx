<%@ Page Title="Adopción" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adopcion.aspx.cs" Inherits="PatitasFelices.Adopcion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../Styles/Adopcion.css" rel="stylesheet" type="text/css" />
    <script src="../JavaScript/Adopcion.js" defer></script>

    <div class="container">
        <div class="center-div">
            <h1>Adopción</h1>
            <div class="accordion" id="AccordionFilters">
                <div class="accordion-item">
                    <span class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">Filtros</span>
                    <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="filtros-busqueda">
                                <div class="texto-buscar">
                                    <asp:TextBox ID="TxtBuscar" runat="server" />
                                </div>
                                <div class="btn-buscar">
                                    <asp:Button CssClass="btn btn-success btn-buscar" ID="BtnBuscar" Text="Buscar" runat="server" />
                                </div>
                            </div>
                            <div class="filtros-campos">
                                <div class="filtros-label">
                                    <asp:Label Text="Comportamiento" runat="server" />
                                    <asp:Label Text="Edad" runat="server" />
                                    <asp:Label Text="Sexo" runat="server" />
                                    <asp:Label Text="Tamaño" runat="server" />
                                    <asp:Label Text="Especie" runat="server" />
                                </div>
                                <div class="filtros-value">
                                    <div class="filtro-comportamiento">
                                        <asp:DropDownList ID="DdlComportamientos" runat="server" AutoPostBack="false" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0" Text="-" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="filtro-edad">
                                        <asp:DropDownList ID="DdlEdades" runat="server" AutoPostBack="false" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0" Text="-" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="filtro-sexo">
                                        <asp:DropDownList ID="DdlSexos" runat="server" AutoPostBack="false" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0" Text="-" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="filtro-tamaño">
                                        <asp:DropDownList ID="DdlTamaños" runat="server" AutoPostBack="false" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0" Text="-" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="filtro-tipo">
                                        <asp:DropDownList ID="DdlTipos" runat="server" AutoPostBack="false" AppendDataBoundItems="true">
                                            <asp:ListItem Value="0" Text="-" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- PAGINADO top --%>
        <footertemplate class="pagination-top">
            <div class="div-container-paginado">
                <ul class="pagination">
                    <li class="page-item"><%= GetPaginacion() %></li>
                </ul>
            </div>
        </footertemplate>

        <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-4 galeria">
            <asp:Repeater ID="RepeaterMascotas" runat="server">
                <ItemTemplate>
                    <a href="<%# Eval("Link") %>" class="card-link">
                        <div class="card col">
                            <div class="card-img-top carousel slide carousel-fade stl-container-carousel" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <asp:Repeater ID="RepeaterMascotasImagenes" runat="server" DataSource='<%# Eval("Imagenes") %>'>
                                        <ItemTemplate>
                                            <div data-bs-interval="<%= GetNumRandom() %>" class="stl-div-item-carousel carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                                <img src="<%# Eval("Link") %>" class="d-block w-100 stl-img-carousel" alt="<%# Eval("Alternate_Text") %>">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="card-pet-name">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                            </div>
                            <div class="card-body">
                                <div class="card-body-txt">
                                    <div class="div-ubicacion">
                                        <div class="div-ubicacion-logo">
                                            <img src="../Multimedia/Adopcion/mapa.png" alt="map">
                                        </div>
                                        <div class="div-ubicacion-texto"><%# Eval("Ubicacion") %></div>
                                    </div>
                                    <div class="div-texto">
                                        <div class="div-texto-label">
                                            <p class="card-text">Color:</p>
                                            <p class="card-text">Edad:</p>
                                            <p class="card-text">Raza:</p>
                                            <p class="card-text">Sexo:</p>
                                            <p class="card-text">Tamaño:</p>
                                        </div>
                                        <div class="div-texto-value">
                                            <p class="card-text"><%# Eval("Color") %></p>
                                            <p class="card-text"><%# Eval("Edad") %></p>
                                            <p class="card-text"><%# Eval("Raza") %></p>
                                            <p class="card-text"><%# Eval("Sexo.Descripcion") %></p>
                                            <p class="card-text"><%# Eval("Tamaño.Descripcion") %></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-btn">
                                    <span class="btn btn-success">+ INFORMACIÓN</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-- PAGINADO bottom --%>
        <footertemplate class="pagination-bottom">
            <div class="div-container-paginado">
                <ul class="pagination">
                    <li class="page-item"><%= GetPaginacion() %></li>
                </ul>
            </div>
        </footertemplate>

    </div>

</asp:Content>
