const pageTitle=document.getElementById('page-title');
const updateName=()=>{if(pageTitle.textContent.includes('Alex'))pageTitle.textContent='Good morning, Myisha'};
new MutationObserver(updateName).observe(pageTitle,{childList:true,subtree:true,characterData:true});
updateName();
