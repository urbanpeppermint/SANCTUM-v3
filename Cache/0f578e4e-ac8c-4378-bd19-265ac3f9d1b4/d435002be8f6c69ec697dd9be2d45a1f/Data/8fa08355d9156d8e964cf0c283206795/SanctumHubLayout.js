"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEFAULT_HUB_LAYOUT = void 0;
exports.contentWidth = contentWidth;
exports.DEFAULT_HUB_LAYOUT = {
    panelWidth: 30,
    panelPadding: 1.6,
    buttonHeight: 3.4,
    rowGap: 0.6,
    viewportHeight: 22,
    statusHeight: 3.2,
    intentHeight: 2.6,
    titleHeight: 3.2,
    backRowHeight: 3.6,
    contentZ: 0.6,
    hubLocalPosition: new vec3(28, 8, -115),
    visionLocalPosition: new vec3(-24, 6, -95),
    visionScale: new vec3(36, 36, 1),
    fontHeadline: 46,
    fontBody: 30,
    fontCaption: 28,
    fontButton: 30,
};
function contentWidth(cfg) {
    return cfg.panelWidth - cfg.panelPadding * 2;
}
//# sourceMappingURL=SanctumHubLayout.js.map