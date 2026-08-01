if (script.onAwake) {
    script.onAwake();
    return;
}
function checkUndefined(property, showIfData) {
    for (var i = 0; i < showIfData.length; i++) {
        if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]) {
            return;
        }
    }
    if (script[property] == undefined) {
        throw new Error("Input " + property + " was not provided for the object " + script.getSceneObject().name);
    }
}
// @input SceneObject button1
// @input SceneObject button2
// @input SceneObject button3
// @input SceneObject button4
// @input SceneObject button5
// @input SceneObject button6
// @input SceneObject button7
// @input Component.AudioComponent audioComponent1
// @input Component.AudioComponent audioComponent2
// @input Component.AudioComponent audioComponent3
// @input Component.AudioComponent audioComponent4
// @input Component.AudioComponent audioComponent5
// @input Component.AudioComponent audioComponent6
// @input Component.AudioComponent audioComponent7
// @input Component.Text debugText
// @input SceneObject animationObject
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Packages/BUTTONS");
Object.setPrototypeOf(script, Module.AudioButtonManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("button1", []);
    checkUndefined("button2", []);
    checkUndefined("button3", []);
    checkUndefined("button4", []);
    checkUndefined("button5", []);
    checkUndefined("button6", []);
    checkUndefined("button7", []);
    checkUndefined("audioComponent1", []);
    checkUndefined("audioComponent2", []);
    checkUndefined("audioComponent3", []);
    checkUndefined("audioComponent4", []);
    checkUndefined("audioComponent5", []);
    checkUndefined("audioComponent6", []);
    checkUndefined("audioComponent7", []);
    checkUndefined("debugText", []);
    checkUndefined("animationObject", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
