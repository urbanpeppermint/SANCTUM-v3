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
// @ui {"widget":"group_start", "label":"Display"}
// @input Component.Text textDisplay
// @input Component.Image image
// @input SceneObject spinner
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Voice Settings"}
// @input string voiceInstructions = "Wise zen master or therapist tone. Calm, grounding, deeply peaceful voice. Speak slowly with intentional pauses between phrases." {"widget":"text_area"}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Practice Buttons"}
// @input SceneObject breathingButton
// @input SceneObject acupressureButton
// @input SceneObject manifestationButton
// @input SceneObject vaultButton
// @input bool startPracticeOnTap {"label":"Run On Tap"}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Chakra Buttons"}
// @input SceneObject rootChakraButton
// @input SceneObject sacralChakraButton
// @input SceneObject solarPlexusChakraButton
// @input SceneObject heartChakraButton
// @input SceneObject throatChakraButton
// @input SceneObject thirdEyeChakraButton
// @input SceneObject crownChakraButton
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Manifestation"}
// @input string customManifestIntent {"label":"Custom Intent (optional)", "widget":"text_area"}
// @input SceneObject saveVisionButton
// @input SceneObject vaultNextButton
// @input SceneObject vaultPrevButton
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Chakra Audio"}
// @input SceneObject audioManagerObject {"label":"AudioButtonManager host (BUTTONS)"}
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
var Module = require("../../../../../Modules/Src/Assets/SCRIPTS/Sanctum/SanctumController");
Object.setPrototypeOf(script, Module.SanctumController.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("voiceInstructions", []);
    checkUndefined("startPracticeOnTap", []);
    checkUndefined("customManifestIntent", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
