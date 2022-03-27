<template>
  <div class="hello">
    <div id="inputs">
      <h2>Ingresar ahorro y sueldo</h2>
      <span>Ahorro: </span><input id="ahorro-input" v-model="ahorro" placeholder="Ingresar ahorro" />
      <br /><br />
      <span>Sueldo: </span><input id="sueldo-input" v-model="sueldo" placeholder="Ingresar sueldo" />
    </div>
    <div id="calculador">
      <h2>Calcular 10%, Impuesto y Saldo Restante</h2>
      <button v-on:click="getDxc">Calcular</button>
      <p>Su 10% es: <b id="dxc">{{ diezPorCiento }}</b></p>
      <p>Su impuesto es: <b id="impuesto">{{ impuesto }}</b></p>
      <p>Su saldo restante es: <b id=saldo-restante>{{ saldoRestante }}</b></p>
      <br /><br />
      <p>Valor UF: </p> <b id="valor-uf">{{ valorUf }}</b>
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
      ahorro: null,
      sueldo: null,
      diezPorCiento: "-",
      impuesto: "-",
      saldoRestante: "-",
      ahorroConsultado: "-",
      sueldoConsultado: "-",
      valorUf: "-"
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
        this.diezPorCiento = response.dxc 
        this.impuesto = response.impuesto
        this.saldoRestante = response.saldo
        this.ahorroConsultado = response.ahorro
        this.sueldoConsultado = response.sueldo
        this.valorUf = response.uf
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
