
function decreaseQuantity() {
    var quantityInput = document.getElementById('quantityInput');
    var currentQuantity = parseInt(quantityInput.value);

    if (currentQuantity > 1) {
        quantityInput.value = currentQuantity - 1;
    }
}

function increaseQuantity() {
    var quantityInput = document.getElementById('quantityInput');
    var currentQuantity = parseInt(quantityInput.value);

    quantityInput.value = currentQuantity + 1;
}
function getStarIcons(rate) {
    let starIcons = '';
    for (let i = 1; i <= 5; i++) {
        if (i <= rate) {
            starIcons += '★'; // Unicode character for a filled star
        } else {
            starIcons += '☆'; // Unicode character for an empty star
        }
    }
    return starIcons;
}
function viewMoreComments() {
        var commentList = document.getElementById('commentList');
        var comments = commentList.getElementsByClassName('comment');

        for (var i = 5; i < comments.length; i++) {
            comments[i].style.display = 'block';
        }

        document.getElementById('viewMoreBtn').style.display = 'none';
    }
