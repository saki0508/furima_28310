window.addEventListener('load', function(){
  const inputPrice = document.getElementById("item-price")
  //const salesFee = document.getElementById("add-tax-price")
  //const salesProfit = document.getElementById("profit")

  
 
  
  inputPrice.addEventListener('keydown', function(){
    const salesFee = document.getElementById("add-tax-price")
    const HTML = `
    <input class="price-input" id="item-price" placeholder="例）300" type="text" name="item[price]">`;
    salesFee.insertAdjacentHTML("afterend", HTML);
  })



})









