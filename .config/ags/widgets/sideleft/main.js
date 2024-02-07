import PopupWindow from "../../lib/popupwindow.js";
import { SideLeft, pinned } from "./sideleft.js";

export default () => PopupWindow({
  // receive keyboard input if focused
  keymode: "on-demand",
  anchor: ["left", "top", "bottom"],
  popup: false,
  name: "sideleft",
  layer: "top",
  showClassName: "sideleft-show",
  hideClassName: "sideleft-hide",
  child: SideLeft(),
});
