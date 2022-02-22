(:~ Consulta para obtener el resultado de la encuesta ~:)

declare variable $participantes := count(db:open("tech_survey")//encuesta/encuestado);

<analisis_encuesta participantes="{$participantes}">

	<resultado categoria="lenguajes_conoce">
	{
		for $lenguaje in db:open("tech_survey")//tecnologias/lenguajes/lenguaje
		return
		<tecnologia
		nombre="{$lenguaje}"
		respuestas="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='lenguajes_conoce']/lenguaje[@nombre=$lenguaje])
		}"
		porcentaje="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='lenguajes_conoce']/lenguaje[@nombre=$lenguaje]) div $participantes
		}"
		/>
	}
	</resultado>

	<resultado categoria="lenguajes_interes">
	{
		for $lenguaje in db:open("tech_survey")//tecnologias/lenguajes/lenguaje
		return
		<tecnologia
		nombre="{$lenguaje}"
		respuestas="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='lenguajes_interes']/lenguaje[@nombre=$lenguaje])
		}"
		porcentaje="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='lenguajes_interes']/lenguaje[@nombre=$lenguaje]) div $participantes
		}"
		/>
	}
	</resultado>
	
	<resultado categoria="bases_datos">
	{
		for $bd in db:open("tech_survey")//tecnologias/bases_datos/bd
		return
		<tecnologia
		nombre="{$bd}"
		respuestas="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='bases_datos']/base_datos[@nombre=$bd])
		}"
		porcentaje="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='bases_datos']/base_datos[@nombre=$bd]) div $participantes
		}"
		/>
	}
	</resultado>
	
	<resultado categoria="editores">
	{
		for $editor in db:open("tech_survey")//tecnologias/editores/editor
		return
		<tecnologia
		nombre="{$editor}"
		respuestas="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='editores']/editor[@nombre=$editor])
		}"
		porcentaje="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='editores']/editor[@nombre=$editor]) div $participantes
		}"
		/>
	}
	</resultado>
	
	<resultado categoria="frameworks_web">
	{
		for $framework in db:open("tech_survey")//tecnologias/frameworks_web/framework
		return
		<tecnologia
		nombre="{$framework}"
		respuestas="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='framework_web']/framework[@nombre=$framework])
		}"
		porcentaje="{
			count(db:open("tech_survey")//encuesta/encuestado/pregunta[@nombre='framework_web']/framework[@nombre=$framework]) div $participantes
		}"
		/>
	}
	</resultado>

</analisis_encuesta>
