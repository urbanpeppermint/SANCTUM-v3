/** Tunable hub panel + vision frame layout (Inspector on SanctumMainManager). */
export interface SanctumHubLayoutConfig {
  panelWidth: number;
  panelPadding: number;
  buttonHeight: number;
  rowGap: number;
  viewportHeight: number;
  statusHeight: number;
  intentHeight: number;
  titleHeight: number;
  backRowHeight: number;
  contentZ: number;
  hubLocalPosition: vec3;
  visionLocalPosition: vec3;
  visionScale: vec3;
  fontHeadline: number;
  fontBody: number;
  fontCaption: number;
  fontButton: number;
}

export const DEFAULT_HUB_LAYOUT: SanctumHubLayoutConfig = {
  panelWidth: 28,
  panelPadding: 1.4,
  buttonHeight: 3.8,
  rowGap: 0.65,
  viewportHeight: 18,
  statusHeight: 3.0,
  intentHeight: 2.4,
  titleHeight: 2.4,
  backRowHeight: 4.0,
  contentZ: 0.6,
  hubLocalPosition: new vec3(28, 8, -115),
  visionLocalPosition: new vec3(-24, 6, -95),
  visionScale: new vec3(36, 36, 1),
  fontHeadline: 46,
  fontBody: 32,
  fontCaption: 30,
  fontButton: 32,
};

export function contentWidth(cfg: SanctumHubLayoutConfig): number {
  return cfg.panelWidth - cfg.panelPadding * 2;
}
