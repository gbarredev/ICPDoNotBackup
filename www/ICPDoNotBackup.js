var exec = require('cordova/exec');

exports.setDoNotBackup = function(success, error) {
    //exec(success, error, "ICPDoNotBackup", "coolMethod", [arg0]);
    successCallback = success || function(){};
	exec(successCallback, null, "ICPDoNotBackup", "setDoNotBackup", []);
};