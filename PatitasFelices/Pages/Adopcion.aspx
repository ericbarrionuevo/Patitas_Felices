<%@ Page Title="Adopción" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adopcion.aspx.cs" Inherits="PatitasFelices.Pages.Adopcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../Styles/Adopcion.css" rel="stylesheet" type="text/css" />
    <script src="../JavaScript/Adopcion.js" defer></script>

    <div class="container">
        <div class="center-div">
            <!--<h1>Mascotas en <br class="br-h1"></h1>-->
            <h1>Adopción</h1>
            <div class="mt-5 filtros">
                <div class="form-group">
                    <label for="tipo">Tipo:</label>
                    <select id="tipo" class="form-control">
                        <option value="todos" selected="selected">-</option>
                        <option value="Perro">Perro</option>
                        <option value="Gato">Gato</option>
                    </select>
                </div>
                <br>
                <div class="form-group">
                    <label for="tipo">Edad:</label>
                    <select id="edad" class="form-control">
                        <option value="todas" selected="selected">-</option>
                        <option value="Cachorro">Cachorro</option>
                        <option value="Adulto">Adulto</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- <div class="container mt-4 top">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center" id="pagination"></ul>
            </nav>
        </div> -->
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 row-cols-lg-4 row-cols-xl-4 row-cols-xxl-4 galeria">
            <asp:Repeater ID="RepeaterMascotas" runat="server">
                <ItemTemplate>
                    <a href="<%# Eval("Link") %>" class="card-link">
                        <div class="card col">
                            <div class="card-img-top carousel slide carousel-fade stl-container-carousel" data-bs-ride="carousel">
                                <%--<div class="carousel-indicators">
                                    <asp:Repeater ID="Repeater_Imagenes_Mascota1" runat="server" DataSource='<%# Eval("Imagenes") %>'>
                                        <ItemTemplate>
                                            <a role="button" style="display: none;" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%# Container.ItemIndex %>" class="<%# Container.ItemIndex == 0 ? "active" : "" %>" <%# Container.ItemIndex == 0 ? "aria-current=\"true\"" : "" %> aria-label="Slide <%# Container.ItemIndex + 1 %>"></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>--%>
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
                                    <p class="card-text">
                                        <div class="div-ubicacion">
                                            <div class="div-ubicacion-logo">
                                                <img src="../Multimedia/Adopcion/mapa.png" alt="map">
                                            </div>
                                            <div class="div-ubicacion-texto"><%# Eval("Ubicacion") %></div>
                                        </div>
                                    </p>
                                    <%--<p class="card-text">&nbsp;Tipo: <%# Eval("Tipo.Descripcion") %></p>--%>
                                    <p class="card-text">&nbsp;Edad: <%# Eval("Edad") %></p>
                                    <%--<p class="card-text">Color: <%# Eval("Color") %></p>--%>
                                    <p class="card-text">&nbsp;Raza: <%# Eval("Raza") %></p>
                                    <p class="card-text">&nbsp;Sexo: <%# Eval("Sexo.Descripcion") %></p>
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
        <div id="paginationDiv" class="mt-4 bottom">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center" id="pagination"></ul>
            </nav>
        </div>
    </div>

    <div class="modal fade" id="noResultsModal" tabindex="-1" aria-labelledby="noResultsModalLabel" aria-hidden="true"
        data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="noResultsModalLabel">Sin Resultados</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    No se han encontrado resultados
                    <br>
                    Intente cambiando sus preferencias
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
