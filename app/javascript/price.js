window.addEventListener('load', function(){
  const inputPrice = document.getElementById("item-price")
  
  inputPrice.addEventListener('input', function(){
    const price = inputPrice.value;
    const salesFee = document.getElementById("add-tax-price")
    const salesProfit = document.getElementById("profit")

    if ( salesFee.textContent != ""){
    salesFee.textContent = null
    }

    fee = Math.floor(price * 0.1)
    salesFee.append(fee);

    if ( salesProfit.textContent != ""){
      salesProfit.textContent = null
    }
    profit = Math.floor(price - fee)
    salesProfit.append(profit);
  })
})
