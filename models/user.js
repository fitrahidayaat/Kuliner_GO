const mongoose = require('mongoose');
const Schema = mongoose.schema;

const userSchema = new Schema({
    username: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    picture: {
        data: Buffer,
        contentType: String
    },
    address: {
        type: String,
        required: true
    }
});

module.exports = mongoose.model('User', userSchema);
