<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculo de IMC</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
  <body>
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h3 class="panel-title" align="center">Calculo do Indice de Massa Corporal - IMC</h3>
                </div>
                <div class="panel-body">
                <form name="formulario">
                    <fieldset>
                        <div class="form-group">
                            <p>Sexo:</p>
							<select id = "sexo" name="Sexo" class="form-control">
							  <option></option>
							  <option value = "fem">Feminino</option>
							  <option value = "mas">Masculino</option>
							</select></br></br>
							<p>Peso:</p> <input class="form-control" id = "peso" type="text" name="Peso" placeholder="Peso" >
							<p>(Ex: 85, 67)</p>
							</br>
							<p>Altura:</p> <input class="form-control" id= "altura" type="text" name="Altura" placeholder="Altura" >
							<p>(Ex: 1.6, 1.85)</p>
							</br>
                        </div>
                        <button class="btn btn-sm btn-success">Calcular</button>
                    </fieldset>
                </form>
            </div>
        </div>

<!-- Scriptlet. Código Java na página JSP. -->
<%
float peso = 0;
float altura = 0;
java.util.Formatter formatter = new java.util.Formatter();
String resultado = "";
String tipoMensagem = "";
//Recebe valores de peso e altura
String p = request.getParameter("Peso");
String a = request.getParameter("Altura");
String sexo = request.getParameter("Sexo");
if(p != null && a != null && sexo != null ){
	//trasforma em float
	peso = Float.valueOf(p).floatValue();
	altura = Float.valueOf(a).floatValue();
	//C�lculo do imc
	float imc = peso / (altura * altura);
	System.out.println(sexo);
	System.out.println(imc);
	if(sexo.equals("fem")){
		//Regras para mulher
			if(imc <= 19.1){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nAbaixo do peso.";
				tipoMensagem = "danger";
	        }else if(imc > 19.1 && imc <= 25.8){
	        	resultado = "IMC = " + formatter.format("%.2f", imc) + "\nPeso normal.";
	        	tipoMensagem = "success";
			}else if(imc >= 25.8 && imc <= 27.3){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nMarginalmente acima do peso.";
				tipoMensagem = "warning";
			}else if(imc >= 27.3 && imc <= 32.3){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nAcima do peso ideal.";
				tipoMensagem = "danger";
			}else if(imc > 32.3 ){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nObesa.";
				tipoMensagem = "danger";
			}
	}
	if(sexo.equals("mas")){
			//Regras para homem
	        if(imc <= 20.7){
	        	resultado = "IMC = " + formatter.format("%.2f", imc) + "\nAbaixo do peso.";
	        	tipoMensagem = "danger";
	        }else if(imc > 20.7 && imc <= 26.4){
	        	resultado = "IMC = " + formatter.format("%.2f", imc) + "\nPeso normal.";
	        	tipoMensagem = "success";
			}else if(imc >= 26.4 && imc <= 27.8){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nMarginalmente acima do peso.";
				tipoMensagem = "warning";
			}else if(imc >= 27.8 && imc <= 31.1){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nAcima do peso ideal.";
				tipoMensagem = "danger";
			}else if(imc > 31.1 ){
				resultado = "IMC = " + formatter.format("%.2f", imc) + "\nObeso.";
				tipoMensagem = "danger";
			}
	}
}else{resultado = "Preencha todos campos corretamente!";}
%>
      
      <div class="alert alert-<%=tipoMensagem%>" role="alert" style="margin-top:45px"><%=resultado%></div>
    </div>
  </body>
</html>