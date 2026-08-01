"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEFAULT_HUB_LAYOUT = void 0;
exports.contentWidth = contentWidth;
exports.DEFAULT_HUB_LAYOUT = {
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
function contentWidth(cfg) {
    return cfg.panelWidth - cfg.panelPadding * 2;
}
//# sourceMappingURL=SanctumHubLayout.js.map