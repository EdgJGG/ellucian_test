<!doctype html>
<html lang="en">
  <head>

    <meta name="headerAttributes" content=""/>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Financiamiento</title>
    %{--<meta name="menuDefaultBreadcrumbId" content=""/>--}%

    



    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cheatsheet/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <asset:stylesheet href="stylesheets/studentSSB-eds.css"/>
    

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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

      table {
        width: 50%;
        height: 200px;
      }
    </style>

  
    <article class="my-3" id="tables">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Financiamiento</h3>
        <!-- <a class="d-flex align-items-center" href="../content/tables/">Documentation</a> -->
        <br> 
        <br> 

      </div>

    <p>Cargos pendientes por pagar </p>
    <hr class="my-4">

      <div>
        <div class="bd-example">
        <table class="table table-striped">
          <thead>
          <tr>
            <th scope="col">Año</th>
            <th scope="col">Código de detalle</th>
            <th scope="col">Descripción</th>
            <th scope="col">Fecha</th>
            <th scope="col">Cargo</th>
            <th scope="col">Pago</th>
            <th scope="col">Saldo</th>
          </tr>

          </thead>
          <tbody>
          <tr>
            <%-- <th scope="row">1</th> --%>
            <td>2021</td>
            <td>MATR</td>
            <td>Matricula</td>
            <td>31-AGO-2022</td>
            <td>120.000,00</td>
          </tr>
          <tr>
            <%-- <th scope="row">1</th> --%>
            <td>2021</td>
            <td>ARAN</td>
            <td>Arancel</td>
            <td>31-AGO-2022</td>
            <td>3.500.000,00</td>
          </tr>
          </tbody>
        </table>
        </div>

        <br> 
        <p>Saldo de cuenta: $3.620.000,00 </p>
        <br> 
        <br> 

        <hr class="my-4">

        <p>Detalle de cuenta </p>
        <hr class="my-4">

        <div class="bd-example">
          <table class="table table-striped">
            <%-- <thead>
            <tr>
              <th scope="col">Año</th>
              <th scope="col">Código de detalle</th>
              <th scope="col">Descripción</th>
              <th scope="col">Fecha</th>
              <th scope="col">Cargo</th>
              <th scope="col">Pago</th>
              <th scope="col">Saldo</th>
            </tr>

            </thead> --%>
            <tbody>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>31-AGO-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>15-SEP-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>30-SEP-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>15-OCT-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>31-OCT-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>15-NOV-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>30-NOV-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>15-DIC-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>31-DIC-2022</td>
              <td>350.000,00</td>
            </tr>
            <tr>
              <%-- <th scope="row">1</th> --%>
              <td>2021</td>
              <td>CPLA</td>
              <td>MENSUALIDAD PLAN MOD MATR CHIL</td>
              <td>15-ENE-2022</td>
              <td>350.000,00</td>
            </tr>

            </tbody>
          </table>
        </div>





        
        <button class="btn btn-primary btn-xs" type="continuar">Continuar</button>
        &nbsp;
        <button class="btn btn-primary btn-xs" type="regresar">Regresar</button>
        



    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      <script src="cheatsheet.js"></script>
  </body>
</html>
