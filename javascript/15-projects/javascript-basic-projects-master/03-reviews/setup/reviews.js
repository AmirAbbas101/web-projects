// local reviews data
const reviews = [
    {
      id: 1,
      name: 'susan smith',
      job: 'web developer',
      img: 'https://www.course-api.com/images/people/person-1.jpeg',
      text: "I'm baby meggings twee health goth +1. Bicycle rights tumeric chartreuse before they sold out chambray pop-up. Shaman humblebrag pickled coloring book salvia hoodie, cold-pressed four dollar toast everyday carry",
    },
    {
      id: 2,
      name: 'anna johnson',
      job: 'web designer',
      img: 'https://www.course-api.com/images/people/person-2.jpeg',
      text: 'Helvetica artisan kinfolk thundercats lumbersexual blue bottle. Disrupt glossier gastropub deep v vice franzen hell of brooklyn twee enamel pin fashion axe.photo booth jean shorts artisan narwhal.',
    },
    {
      id: 3,
      name: 'peter jones',
      job: 'intern',
      img: 'https://www.course-api.com/images/people/person-4.jpeg',
      text: 'Sriracha literally flexitarian irony, vape marfa unicorn. Glossier tattooed 8-bit, fixie waistcoat offal activated charcoal slow-carb marfa hell of pabst raclette post-ironic jianbing swag.',
    },
    {
      id: 4,
      name: 'bill anderson',
      job: 'the boss',
      img: 'https://www.course-api.com/images/people/person-3.jpeg',
      text: 'Edison bulb put a bird on it humblebrag, marfa pok pok heirloom fashion axe cray stumptown venmo actually seitan. VHS farm-to-table schlitz, edison bulb pop-up 3 wolf moon tote bag street art shabby chic. ',
    },
  ];

//   select elements
const author = document.querySelector('#author');
const job = document.querySelector('#job');
const img = document.querySelector('#person-img');
const info = document.querySelector('#info');

const btnNext = document.querySelector('.next-btn');
const btnPrevious = document.querySelector('.prev-btn');
const btnRandom = document.querySelector('.random-btn');

let currentItem = 0;

window.addEventListener('DOMContentLoaded', function() {
    loadContent();
});

function loadContent() {
    const item = reviews[currentItem];
    console.log(item.text);
    author.textContent = item.name;
    job.textContent = item.job;
    img.src = item.img;
    info.textContent = item.text;
}

btnNext.addEventListener('click', function() {
    if(currentItem >= reviews.length-1) {
        currentItem = 0;
    }
    else{
        currentItem += 1;
    }
    console.log(currentItem);
    loadContent();
});

btnPrevious.addEventListener('click', function() {
    if(currentItem == 0) {
        currentItem = reviews.length-1;
    }
    else{
        currentItem -= 1;
    }
    console.log(currentItem);
    loadContent();
});

btnRandom.addEventListener('click', function() {
    currentItem = getRandomVal();
    loadContent();
});

function getRandomVal() {
    const randomVal = Math.floor(Math.random() * reviews.length);
    console.log(randomVal);
    return randomVal;
}
