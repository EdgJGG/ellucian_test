<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        
         <meta name="layout" content="bannerWebPage"/>
        <meta name="menuEndPoint" content="${request.contextPath}/ssb/menu"/>
        <meta name="menuBaseURL" content="${request.contextPath}/ssb"/>
            <title>Datos personales</title>
            <link rel="canonical"
                href="https://getbootstrap.com/docs/5.1/examples/checkout/">
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> --%>
            <%-- <asset:stylesheet href="modules/accountDetailLTR-mf.css"/> --%>
            <%-- <asset:stylesheet href="bootstrap/bootstrap.min.css"/> --%>
    <header id='banner-header-main-section' class='banner-header-theme' role='banner'>
        <div id='banner-header-main-section-west-part'>
            <div id='brandingDiv' title="${message(code: 'aurora.areas_label_home_title')}" tabindex='-1'>
                <a id='branding' aria-label="${message(code: 'aurora.areas_label_home_description')}"
                   alt="${message(code: 'aurora.areas_label_branding')}" href='javascript:void(0);'
                    class='institutionalBranding'></a>
            </div>
        </div>
    </header>

    <!-- Bootstrap core CSS -->
            <style>
                .bd-placeholder-img {
                    font-size: 1.125rem;
                    text-anchor: middle;
                    -webkit-user-select: none;
                    -moz-user-select: none;
                    user-select: none;
                }

                @media (min-width: 768px) {
                    .bd-placeholder-img-lg {
                        font-size: 3.5rem;
                    }
                }
            </style>    
            <!-- Custom styles for this template -->
            <link href="form-validation.css" rel="stylesheet">
        </head>

    
        <body class="bg-light">
        <div id="content" class="container-fluid" keyboard-shortcut ng-app="accountDetailApp">
    <div ui-view></div>
</div>
<asset:javascript src="modules/accountDetailAppJS-mf.js"/>

            <div class="profile-nonCollapse" role="navigation">
                <div class="navbar-noti profile-block">

                    <div class="container">
                        <main>
                            <div class="py-5 text-center">
                                <img class="d-block mx-auto mb-4"
                                    src="../assets/brand/bootstrap-logo.svg"
                                    alt="" width="72"
                                    height="57">
                                <h2>Datos personales</h2>
                                <%-- <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required
                    form group has a validation state that can be triggered by attempting to submit the form without
                    completing it.</p> --%>
            </div>
            

            <body>Datos personales </body>
            <hr class="my-4">

                <div class="col-md-7 col-lg-8">
                    <%-- <h4 class="mb-3">Billing address</h4> --%>
                    <form class="needs-validation" novalidate>

                        
                        <div class="col-md-5">
                            <label for="country" class="form-label">Nacionalidad</label>
                            <select class="form-select" id="country" required>
                                <option value="">Seleccionar</option>
                                <option>United States</option>
                                <option>México</option>
                                <option>Chile</option>
                                <option>Colombia</option>
                                <option>Brasil</option>
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid country.
                            </div>
                        </div>
                        <br>


                    <div class="row g-3">
                        <div class="col-md-5">
                            
                            <label for="day" class="form-label">Fecha de nacimiento</label>
                            <select class="form-select" id="day" required>
                                <option value="">Día</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        

                        <div class="col-md-5">
                            <label for="month" class="form-label"> ㅤ</label>
                            <select class="form-select" id="month" required>
                                <option value="">Mes</option>
                                <option>Enero</option>
                                <option>Febrero</option>
                                <option>Marzo</option>
                                <option>Abril</option>
                                <option>Mayo</option>
                                <option>Junio</option>
                                <option>Julio</option>
                                <option>Agosto</option>
                                <option>Septiembre</option>
                                <option>Octubre</option>
                                <option>Noviembre</option>
                                <option>Diciembre</option>
                                
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>


                         <div class="col-sm-6">
                                <label for="year" class="form-label"></label>
                                <input type="text" class="form-control" id="year" placeholder="Año" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>

                    </div>
                        <br>
                        <br>
                        <br>
                        <div class="col-12">
                            <label for="email" class="form-label">Email Personal <span
                                    class="text-muted">(Requerido)</span></label>
                            <input type="email" class="form-control" id="email" placeholder="you@example.com">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>
                        <br>
                        
                        <div class="col-12">
                            <label for="email2" class="form-label">Email Institucional <span
                                    class="text-muted"></span></label>
                            <input type="email2" class="form-control" id="email2" placeholder="you@example.com">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>
                         <br> <br>

                        <div class="col-md-5">
                            <label for="pueblo" class="form-label">¿Se identifica con algún pueblo originario? </label>
                            <select class="form-select" id="pueblo" required>
                                <option value="">Seleccionar</option>
                                <option>Mestizo</option>
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        <br> <br>


                        <body>Información de Residencia de Origen</body>
                        <hr class="my-4">

                        <div class="col-sm-6">
                                <label for="Address" class="form-label">Dirección</label>
                                <input type="text" class="form-control" id="Address" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                        </div>
                        <br>

                        <div class="col-md-5">
                            <label for="region" class="form-label">Región </label>
                            <select class="form-select" id="region" required>
                                <option value="">Seleccionar</option>
                                <option>Coquimbo</option>
                                <option>Valparaíso</option>
                                <option>Metropolitana</option>
                                <option>O'Higgins</option>

                                
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        <br>



    <body ng-app="paso1App">
            <div ng-controller="paso1Controller">  
                   <%-- {{varHolaMundo}}    --%>
                   <label for="comunasList"> Comunas</label>
                    <select name="comuna" id="comunasList" ng-model="comunas" class="form-control">
                        <option ng-repeat="rec in comunas" value="{{rec.comunaCode}}">{{rec.comunaDesc}}</option>
                    </select>
            </div>

        <asset:javascript src="modules/paso1-mf.js"/>
    </body>


                            <br>

                        <div class="col-md-5">
                            <label for="city" class="form-label">Ciudad </label>
                            <select class="form-select" id="city" required>
                                <option value="">Seleccionar</option>
                                <option>Viña del Mar</option>
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        <br>

                        <div class="col-sm-6">
                                <label for="telephone" class="form-label">Teléfono</label>
                                <input type="text" class="form-control" id="telephone" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                        </div>
                        <br>

                        <div class="col-sm-6">
                                <label for="celphone" class="form-label">Celular</label>
                                <input type="text" class="form-control" id="celphone" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                        </div>
                        <br>

                        <body>Actualizar información de Aval </body>
                        <hr class="my-4">

                            
                            
                            <div class="col-sm-6">
                                <label for="rut" class="form-label">Rut</label>
                                <input type="text" class="form-control" id="rut" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>
                            <br>
                        
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">Nombre(s)</label>
                                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>
                            <br>


                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="plastName" class="form-label">Apellidos</label>
                                    <input type="text" class="form-control" id="plastName" placeholder="Paterno" value="" required>
                                    <div class="invalid-feedback">
                                        Valid last name is required.
                                    </div>
                                </div>

                              <div class="col-sm-6">
                                    <label for="mlastName" class="form-label">ㅤ</label>
                                    <input type="text" class="form-control" id="mlastName" placeholder="Materno" value="" required>
                                    <div class="invalid-feedback">
                                        Valid last name is required.
                                    </div>
                                </div>
                            </div>
                            <br>

                            <div class="col-md-5">
                            
                                <label for="country" class="form-label">Nacionalidad</label>
                                <select class="form-select" id="country" required>
                                    <option value="">Seleccionar</option>
                                    <option>Chilena</option>
                            
                                </select>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid day.
                                </div>
                            </div>
                            <br>



                            <div class="col-12">
                                <label for="address" class="form-label">Dirección</label>
                                <input type="text" class="form-control" id="address" placeholder="Calle/Número/Depto"
                                    required>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>
                            <br>

                            <div class="col-md-5">
                                <label for="comunaAval" class="form-label">Comuna</label>
                                <select class="form-select" id="comunaAval" required>
                                    <option value="">Seleccionar</option>
                                    <option>Valparaíso</option>
                                    <option>Casablanca</option>
                                    <option>Concón</option>
                                    <option>Viña del Mar</option>

                                    
                                </select>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid day.
                                </div>
                            </div>
                            <br>

                            <div class="col-md-5">
                                <label for="cityAval" class="form-label">Ciudad </label>
                                <select class="form-select" id="cityAval" required>
                                    <option value="">Seleccionar</option>
                                    <option>Viña del Mar</option>
                                </select>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid day.
                                </div>
                            </div>
                            <br>

                            <div class="col-sm-6">
                                    <label for="telephoneAval" class="form-label">Teléfono</label>
                                    <input type="text" class="form-control" id="telephoneAval" placeholder="" value="" required>
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                            </div>
                            <br>

                            <div class="col-sm-6">
                                    <label for="celphoneAval" class="form-label">Celular</label>
                                    <input type="text" class="form-control" id="celphoneAval" placeholder="" value="" required>
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                            </div>
                            <br>

                            <div class="col-12">
                                <label for="emailAval" class="form-label">Email <span
                                        class="text-muted">(Requerido)</span></label>
                                <input type="emailAval" class="form-control" id="emailAval" placeholder="you@example.com">
                                <div class="invalid-feedback">
                                    Please enter a valid email address for shipping updates.
                                </div>
                            </div>
                            <br>




                        </div>
                        <body>Información de residencia del lugar de Estudio. </body>
                        <hr class="my-4">
                            <div class="col-sm-6">
                                <label for="AddressPlace" class="form-label">Dirección</label>
                                <input type="text" class="form-control" id="AddressPlace" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>

                                                    <div class="col-md-5">
                            <label for="regionPlace" class="form-label">Región </label>
                            <select class="form-select" id="regionPlace" required>
                                <option value="">Seleccionar</option>
                                <option>Coquimbo</option>
                                <option>Valparaíso</option>
                                <option>Metropolitana</option>
                                <option>O'Higgins</option>

                                
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        <br>

                        <div class="col-md-5">
                            <label for="comunaPlace" class="form-label">Comuna </label>
                            <select class="form-select" id="comunaPlace" required>
                                <option value="">Seleccionar</option>
                                <option>Valparaíso</option>
                                <option>Casablanca</option>
                                <option>Concón</option>
                                <option>Viña del Mar</option>

                                
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        <br>

                        <div class="col-md-5">
                            <label for="city" class="form-label">Ciudad </label>
                            <select class="form-select" id="city" required>
                                <option value="">Seleccionar</option>
                                <option>Viña del Mar</option>
                            </select>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid day.
                            </div>
                        </div>
                        <br>




                        <hr class="my-4">

                        <%-- <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="same-address">
                            <%-- <label class="form-check-label" for="same-address">Shipping address is the same as my
                                billing address</label>
                        </div> --%>
<%-- 
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="save-info">
                            <label class="form-check-label" for="save-info">Save this information for next time</label>
                        </div>

                        <hr class="my-4">

                        <hr class="my-4"> --%>
                            
                        <button class="btn btn-primary btn-xs" type="submit onclick="location.href='https://www.google.com'">Continuar</button>
                        <%-- <button onclick="location.href='https://www.facebook.com'">Llévame a otro lado</button> --%>
                    </form>
                </div>
            </div>
        </main>

        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">&copy; 2022 Ellucian Company</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Support</a></li>
            </ul>
        </footer>
    </div>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

    <script src="form-validation.js"></script>
</html>