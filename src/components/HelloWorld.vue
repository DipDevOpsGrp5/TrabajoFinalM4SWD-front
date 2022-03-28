<template>
  <div class="hello">
    <div id="inputs">
      <h2>Ingresar ahorro y sueldo</h2>
      <span>Ahorro: </span><input id="ahorro-input" v-model="ahorro" placeholder="Ingresar ahorro" />
      <br /><br />
      <span>Sueldo: </span><input id="sueldo-input" v-model="sueldo" placeholder="Ingresar sueldo" />
      <p style="color:red;">{{ mensajeError }}</p>
    </div>
    <div id="calculador">
      <h2>Calcular 10%, Impuesto y Saldo Restante</h2>
      <button v-on:click="getDxc">Calcular</button>
      <p>Su 10% es: <b id="dxc">{{ diezPorCiento }}</b></p>
      <p>Su impuesto es: <b id="impuesto">{{ impuesto }}</b></p>
      <p>Su saldo restante es: <b id=saldo-restante>{{ saldoRestante }}</b></p>
      <br /><br />
      <p>Valor UF: <b id="valor-uf">{{ valorUf }}</b></p>
      <p>Ahorro consultado: <b id="ahorro-consultado">{{ ahorroConsultado }}</b></p>
      <p>Sueldo consultado: <b id="sueldo-consultado">{{ sueldoConsultado }}</b></p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data() {
    return {
      loading: true,
      ahorro: 0,
      sueldo: 0,
      diezPorCiento: "-",
      impuesto: "-",
      saldoRestante: "-",
      ahorroConsultado: "-",
      sueldoConsultado: "-",
      valorUf: "-",
      mensajeError: "",
    }
  },
  methods: {
    getDxc: function () {
      console.log("ahorro: ", this.ahorro)
      console.log("sueldo: ", this.sueldo)
      var request = "http://localhost:8081/rest/msdxc/dxc?sueldo=" + this.sueldo + "&ahorro=" + this.ahorro
      console.log("url: ", request)

      axios
      .get(request)
      .then(response => {
        this.diezPorCiento = response.data.dxc 
        this.impuesto = response.data.impuesto
        this.saldoRestante = response.data.saldo
        this.ahorroConsultado = response.data.ahorro
        this.sueldoConsultado = response.data.sueldo
        this.valorUf = response.data.uf
        this.mensajeError = ""
        console.log(response)
        console.log(response.data)
      })
      .catch(error => {
        console.log(error.response)
        this.mensajeError = "Error (" + error.response.status + "): " + error.response.data.message
      })
    }
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
