/* Path: paymentPage\payment.js */
const payment = document.getElementById('payment');
const paymentForm = document.getElementById('paymentForm');
const paymentBtn = document.getElementById('paymentBtn');

paymentBtn.addEventListener('click', () => {
    paymentForm.classList.toggle('active');
    payment.classList.toggle('active');
});
