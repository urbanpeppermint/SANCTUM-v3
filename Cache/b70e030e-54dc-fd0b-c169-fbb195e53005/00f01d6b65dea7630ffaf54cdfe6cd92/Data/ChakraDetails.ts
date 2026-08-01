import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable";
import { InteractorEvent } from "SpectaclesInteractionKit.lspkg/Core/Interactor/InteractorEvent";

/**
 * Optional label script for chakra orb buttons.
 * Shows chakra name on hover/trigger when debugText is wired.
 */
@component
export class ChakraDetails extends BaseScriptComponent {
  @input
  @label("Chakra Name")
  chakraName: string = "";

  @input
  @label("Debug Text (optional)")
  debugText: Text;

  onAwake(): void {
    const interactable = this.sceneObject.getComponent(Interactable.getTypeName()) as Interactable;
    if (!interactable || !this.debugText) return;

    interactable.onInteractorTriggerStart.add((_event: InteractorEvent) => {
      if (this.chakraName) {
        this.debugText.sceneObject.enabled = true;
        this.debugText.text = this.chakraName + " Chakra";
      }
    });
  }
}
