import { Interactable } from 'SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable';
import { InteractorEvent } from 'SpectaclesInteractionKit.lspkg/Core/Interactor/InteractorEvent';
import { SIK } from 'SpectaclesInteractionKit.lspkg/SIK';

/**
 * Manages 7 audio tracks with interactive buttons
 * Ensures only one track plays at a time - prevents audio collision
 * CRITICAL: This script must be on an ENABLED object!
 */
@component
export class AudioButtonManager extends BaseScriptComponent {
    
    // Interactive buttons (must have Interactable component)
    @input
    button1: SceneObject;
    @input
    button2: SceneObject;
    @input
    button3: SceneObject;
    @input
    button4: SceneObject;
    @input
    button5: SceneObject;
    @input
    button6: SceneObject;
    @input
    button7: SceneObject;

    // Audio components for each track
    @input
    audioComponent1: AudioComponent;
    @input
    audioComponent2: AudioComponent;
    @input
    audioComponent3: AudioComponent;
    @input
    audioComponent4: AudioComponent;
    @input
    audioComponent5: AudioComponent;
    @input
    audioComponent6: AudioComponent;
    @input
    audioComponent7: AudioComponent;

    // Optional debug display
    @input
    debugText: Text;
    
    // Scene object with behavior script to send animation triggers to
    @input
    animationObject: SceneObject;

    // -- ROTATION INPUTS --
    @input
    meshObjects: SceneObject[]; // Drag all meshes you want to rotate here

    @input
    rotationSpeed: number = 90;  // Degrees per second around Y

    private buttons: SceneObject[] = [];
    private audioComponents: AudioComponent[] = [];
    private currentlyPlayingIndex: number = -1;
    private isInitialized: boolean = false;

    // Rotation state
    private rotationDirection: number = 1; // 1 = clockwise, -1 = counter-clockwise

    // Called after all objects are instantiated
    onAwake(): void {
        print("AudioButtonManager: Awake");
        
        // Create an event that will be triggered once SIK is fully initialized
        this.createEvent('OnStartEvent').bind(() => {
            this.onStartSetup();
        });
        
        // Setup arrays for easier management
        this.setupArrays();
        
        // Stop all audio initially
        this.stopAllAudio();
        
        if (this.debugText) {
            this.debugText.text = "Audio Ready";
        }
    }
    
    // Called when the script component is started
    onStart(): void {
        print("AudioButtonManager: Start");
        // We'll let the OnStartEvent handle the actual setup 
        // to ensure SIK is fully initialized
    }
    
    // Setup that runs after SIK is properly initialized
    private onStartSetup(): void {
        print("AudioButtonManager: Running OnStartSetup");
        this.validateComponents();
        
        // Don't try to initialize if critical components are missing
        if (!this.checkRequiredComponents()) {
            print("AudioButtonManager: Missing critical components, initialization skipped");
            return;
        }
        
        this.setupButtonListeners();
    }
    
    // Setup arrays for easier component management
    private setupArrays(): void {
        this.buttons = [
            this.button1, this.button2, this.button3, this.button4,
            this.button5, this.button6, this.button7
        ];
        
        this.audioComponents = [
            this.audioComponent1, this.audioComponent2, this.audioComponent3,
            this.audioComponent4, this.audioComponent5, this.audioComponent6,
            this.audioComponent7
        ];
    }
    
    // Perform components validation with helpful error messages
    private validateComponents(): void {
        // Check buttons and their interactable components
        for (let i = 0; i < this.buttons.length; i++) {
            if (!this.buttons[i]) {
                print(`ERROR: Button ${i + 1} not set`);
            } else if (!this.buttons[i].getComponent(Interactable.getTypeName())) {
                print(`ERROR: Button ${i + 1} has no Interactable component!`);
            }
        }
        
        // Check audio components
        for (let i = 0; i < this.audioComponents.length; i++) {
            if (!this.audioComponents[i]) {
                print(`WARNING: Audio Component ${i + 1} not set`);
            }
        }
        
        // Check animation object
        if (!this.animationObject) {
            print("WARNING: Animation Object not set - no animation triggers will be sent");
        }
        
        // Check mesh rotation objects
        if (!this.meshObjects || this.meshObjects.length === 0) {
            print("WARNING: No mesh objects assigned for rotation (optional)");
        }
        
        // Check if SIK is available
        if (!SIK.InteractionManager) {
            print("CRITICAL ERROR: SIK Interaction Manager not found!");
        }
    }
    
    // Check if we have the minimum required components to function
    private checkRequiredComponents(): boolean {
        // Need SIK interaction manager
        if (!SIK.InteractionManager) {
            return false;
        }
        
        // Need at least one button-audio pair to function
        for (let i = 0; i < this.buttons.length; i++) {
            if (this.buttons[i] && this.audioComponents[i] && 
                this.buttons[i].getComponent(Interactable.getTypeName())) {
                return true;
            }
        }
        
        return false;
    }
    
    // Set up event listeners for all buttons
    private setupButtonListeners(): void {
        print("Setting up button listeners");
        
        for (let i = 0; i < this.buttons.length; i++) {
            if (this.buttons[i] && this.audioComponents[i]) {
                const interactable = this.buttons[i].getComponent(Interactable.getTypeName()) as Interactable;
                if (interactable) {
                    const buttonIndex = i; // Capture index for closure
                    
                    const onTriggerEndCallback = (event: InteractorEvent) => {
                        print(`Button ${buttonIndex + 1} pressed`);
                        this.playAudioTrack(buttonIndex);
                        this.sendAnimationTrigger();
                        this.flipRotationDirection(); // CHANGE DIRECTION ON BUTTON PRESS
                    };
                    
                    interactable.onInteractorTriggerEnd.add(onTriggerEndCallback);
                    print(`Button ${i + 1} listener added`);
                }
            }
        }
        
        this.isInitialized = true;
        print("All button listeners set up!");
    }
    
    // Flip rotation direction (called every button press)
    private flipRotationDirection(): void {
        this.rotationDirection *= -1;
        const dirStr = this.rotationDirection > 0 ? "Clockwise" : "Counter-Clockwise";
        print("Rotation direction changed to: " + dirStr);
        if (this.debugText) {
            this.debugText.text = "Direction: " + dirStr;
        }
    }

    // Play specific audio track and stop any currently playing
    private playAudioTrack(trackIndex: number): void {
        // Validate track index
        if (trackIndex < 0 || trackIndex >= this.audioComponents.length) {
            print(`Error: Invalid track index ${trackIndex}`);
            return;
        }
        
        // Check if audio component exists
        if (!this.audioComponents[trackIndex]) {
            print(`Error: Audio component ${trackIndex + 1} is not assigned`);
            return;
        }
        
        // Stop currently playing track if any (collision prevention)
        if (this.currentlyPlayingIndex !== -1) {
            this.stopCurrentTrack();
        }
        
        // Play the new track
        try {
            // Enable the audio component's parent SceneObject if it's disabled
            const audioObject = this.audioComponents[trackIndex].getSceneObject();
            if (audioObject && !audioObject.enabled) {
                audioObject.enabled = true;
            }
            
            // Play the track in loop mode (-1 means infinite loop)
            this.audioComponents[trackIndex].play(-1);
            this.currentlyPlayingIndex = trackIndex;
            print(`Playing audio track ${trackIndex + 1} in loop mode`);
            
            // Update debug text
            if (this.debugText) {
                this.debugText.text = `Playing Track ${trackIndex + 1}`;
            }
            
        } catch (error) {
            print(`Error playing audio track ${trackIndex + 1}: ${error}`);
        }
    }
    
    // Stop the currently playing track
    private stopCurrentTrack(): void {
        if (this.currentlyPlayingIndex !== -1 && 
            this.audioComponents[this.currentlyPlayingIndex]) {
            
            this.audioComponents[this.currentlyPlayingIndex].stop(false);
            
            // Optionally disable the audio object to save resources
            const audioObject = this.audioComponents[this.currentlyPlayingIndex].getSceneObject();
            if (audioObject) {
                audioObject.enabled = false;
            }
            
            print(`Stopped audio track ${this.currentlyPlayingIndex + 1}`);
            this.currentlyPlayingIndex = -1;
            
            if (this.debugText) {
                this.debugText.text = "Audio Ready";
            }
        }
    }
    
    // Send custom trigger to animation object
    private sendAnimationTrigger(): void {
        if (!this.animationObject) {
            print("Cannot send animation trigger - Animation Object not assigned");
            return;
        }
        
        try {
            const behaviorScript = this.animationObject.getComponent("Component.ScriptComponent");
            const api = behaviorScript ? (behaviorScript as any).api : null;
            if (api && typeof api.sendCustomTrigger === "function") {
                api.sendCustomTrigger("animation");
                print("Animation trigger sent to behavior script!");
            }
        } catch (error) {
            print(`Error sending animation trigger: ${error}`);
        }
    }
    
    // Play a chakra healing tone (0 = root … 6 = crown)
  public playChakraTrack(trackIndex: number): void {
    this.playAudioTrack(trackIndex);
    this.sendAnimationTrigger();
  }

  // Public method to stop all audio (can be called from other scripts)
    public stopAllAudio(): void {
        for (let i = 0; i < this.audioComponents.length; i++) {
            if (this.audioComponents[i]) {
                this.audioComponents[i].stop(false);
                
                // Disable audio objects to save resources
                const audioObject = this.audioComponents[i].getSceneObject();
                if (audioObject) {
                    audioObject.enabled = false;
                }
            }
        }
        this.currentlyPlayingIndex = -1;
        print("Stopped all audio tracks");
        
        if (this.debugText) {
            this.debugText.text = "Audio Ready";
        }
    }
    
    // Public method to get currently playing track index (-1 if none)
    public getCurrentlyPlayingTrack(): number {
        return this.currentlyPlayingIndex;
    }
    
    // Public method to check if any track is playing
    public isAnyTrackPlaying(): boolean {
        return this.currentlyPlayingIndex !== -1;
    }
    
    // Public method to play specific track (can be called from other scripts)
    public playTrack(trackIndex: number): void {
        this.playAudioTrack(trackIndex);
    }

    // -------------------------------------------------
    // ROTATION LOOP (runs every frame infinitely)
    // -------------------------------------------------
    onUpdate(): void {
        // Rotate assigned mesh objects continuously around local Y
        if (this.meshObjects && this.meshObjects.length > 0) {
            this.rotateMeshObjects();
        }
    }

    // Apply rotation to every assigned mesh object
    private rotateMeshObjects(): void {
        if (!this.meshObjects || this.meshObjects.length === 0) return;

        const dt = getDeltaTime();
        const speed = (this.rotationSpeed !== undefined && this.rotationSpeed !== null) ? this.rotationSpeed : 90;
        const deltaAngle = speed * dt * this.rotationDirection;

        for (let i = 0; i < this.meshObjects.length; i++) {
            const mesh = this.meshObjects[i];
            if (!mesh) continue;

            try {
                const transform = mesh.getTransform();
                const currentRot = transform.getLocalRotation();

                // -------------------------------------------------
                // ROTATION IMPLEMENTATION
                // -------------------------------------------------
                // This assumes Rotation is accessible as Euler angles (X, Y, Z).
                // If your Lens Studio version uses quaternion Rotation:
                //   1. Replace with:  const euler = currentRot.toEulerAngles();
                //   2. Modify:        euler.y += deltaAngle;
                //   3. Apply:         const newRot = Rotation.fromEulerAngles(euler);
                // -------------------------------------------------
                const newRot = new Rotation(
                    currentRot.x,
                    currentRot.y + deltaAngle,
                    currentRot.z
                );
                transform.setLocalRotation(newRot);
                // -------------------------------------------------

            } catch (error) {
                // Only log once to avoid spam; adjust if needed
                if (i === 0) {
                    print("Mesh rotation error (check Rotation API): " + error);
                }
            }
        }
    }
}