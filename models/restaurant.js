const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const restaurantSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    address: {
        type: String,
        required: true
    },
    rating: {
        type: Number,
    },
    phoneNum: {
        type: String
    },
    reviews: [{
        type: Schema.Types.ObjectId,
        ref: 'Review'
    }],
    picture: {
        data: Buffer,
        contentType: String
    }
});

module.exports = mongoose.model('Restaurant', restaurantSchema);
