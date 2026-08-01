export enum AvaliableApiTypes {
  Snap3D = "Snap3D",
  OpenAI = "OpenAI",
  Gemini = "Gemini",
  DeepSeek = "DeepSeek",
}

@component
export class RemoteServiceGatewayCredentials extends BaseScriptComponent {
  @input
  apiToken: string = "";
  @ui.label(
    '<span style="color: red;">⚠️ Do not include your API token when sharing or uploading this project to version control.</span>'
  )
  private static token: string = "";
  onAwake() {
    RemoteServiceGatewayCredentials.token = this.apiToken;
  }

  static getApiToken(avaliableType: AvaliableApiTypes) {
    return RemoteServiceGatewayCredentials.token;
  }
}
