document.addEventListener('DOMContentLoaded', function() {
    console.log("JavaScript is working!");

    // Função para verificar o nível de luminosidade de uma cor
    function verificarLuminosidade(cor) {
        // Extrair os componentes R, G e B da cor
        var r, g, b;

        if (cor.startsWith('rgb')) {
            var rgbValues = cor.match(/\d+/g);
            r = parseInt(rgbValues[0]);
            g = parseInt(rgbValues[1]);
            b = parseInt(rgbValues[2]);
        } else if (cor.startsWith('#')) {
            r = parseInt(cor.substring(1, 3), 16);
            g = parseInt(cor.substring(3, 5), 16);
            b = parseInt(cor.substring(5, 7), 16);
        } else {
            return 0;
        }

        // Calcular a luminosidade usando a fórmula correta
        var luminosidade = (0.2126 * r + 0.7152 * g + 0.0722 * b);
        return luminosidade;
    }

    // Obter o elemento do header
    var header = document.querySelector('header');

    if (header) {
        // Obter a cor de fundo do header
        var corFundoHeader = getComputedStyle(header).backgroundColor;

        // Verificar o nível de luminosidade da cor de fundo
        var luminosidade = verificarLuminosidade(corFundoHeader);

        // Escolher a cor do texto com base na luminosidade
        var corTexto = luminosidade > 128 ? '#000' : '#fff';

        // Aplicar a cor de texto ao h1
        var headerText = document.getElementById('headerText');
        if (headerText) {
            headerText.style.color = corTexto;
        }
    } else {
        console.error('Elemento header não encontrado');
    }
});


