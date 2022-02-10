let $up := <encuestado nombre="Daniel">
		<pregunta nombre="lenguajes_conoce">
			<lenguaje nombre="java"/>
			<lenguaje nombre="php"/>
			<lenguaje nombre="javascript"/>
		</pregunta>
		<pregunta nombre="lenguajes_interes">
			<lenguaje nombre="kotlin"/>
		</pregunta>
		<pregunta nombre="bases_datos">
			<base_datos nombre="mysql"/>
			<base_datos nombre="sqlite"/>
			<base_datos nombre="oracle"/>
		</pregunta>
		<pregunta nombre="sistemas_operativos">
			<sistema_operativo nombre="windows"/>
		</pregunta>
		<pregunta nombre="framework_web">
			<framework nombre="laravel"/>
		</pregunta>
	</encuestado>

  return

insert node $up as last into db:open("tech_survey")/encuesta
