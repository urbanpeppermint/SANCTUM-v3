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
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Core"}
// @input SceneObject sanctumControllerObject {"label":"Sanctum Controller"}
// @input SceneObject audioManagerObject {"label":"Audio Manager (BUTTONS)"}
// @input SceneObject spinner
// @input Component.Image visionImage
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Hub Placement"}
// @input vec3 panelPosition = {28,8,-115} {"label":"Panel position (cm, camera-local)"}
// @input SceneObject hubParentObject {"label":"Hub parent (scene object)", "hint":"Drag Camera here. Defaults to Camera when empty."}
// @input SceneObject hubAnchorObject {"label":"Hub anchor (optional)", "hint":"Use this object's local position instead of Panel position."}
// @input float panelWidth = 28 {"label":"Panel width (cm)"}
// @input float panelPadding = 1.4 {"label":"Panel padding (cm)"}
// @input float buttonHeight = 3.8 {"label":"Button height (cm)"}
// @input float rowGap = 0.65 {"label":"Row gap (cm)"}
// @input float viewportHeight = 18 {"label":"View area height (cm)"}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Hub Typography (cm em-square)"}
// @input float fontHeadline = 46
// @input float fontBody = 32
// @input float fontCaption = 30
// @input float fontButton = 32
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Vision Display"}
// @input vec3 visionLocalPosition = {-24,6,-95} {"label":"Vision local position (cm)"}
// @input vec3 visionScale = {36,36,1} {"label":"Vision scale"}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Legacy Menu (hide after hub builds)"}
// @input SceneObject legacyBreathingButton
// @input SceneObject legacyAcupressureButton
// @input SceneObject legacyManifestButton
// @input bool hideLegacyMenu = true {"label":"Hide legacy ground lotus buttons"}
// @ui {"widget":"group_end"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Assets/SCRIPTS/Sanctum/SanctumMainManager");
Object.setPrototypeOf(script, Module.SanctumMainManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("panelPosition", []);
    checkUndefined("panelWidth", []);
    checkUndefined("panelPadding", []);
    checkUndefined("buttonHeight", []);
    checkUndefined("rowGap", []);
    checkUndefined("viewportHeight", []);
    checkUndefined("fontHeadline", []);
    checkUndefined("fontBody", []);
    checkUndefined("fontCaption", []);
    checkUndefined("fontButton", []);
    checkUndefined("visionLocalPosition", []);
    checkUndefined("visionScale", []);
    checkUndefined("hideLegacyMenu", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
