import Typed from 'typed.js';

const initTyped = () => {
    var options = {
    strings: ['after a mojito.', 'at the beach.'],
    typeSpeed: 70,
    loop: true,
    loopCount: Infinity,
  };

  var typed = new Typed('#typed', options);
}

export { initTyped };
