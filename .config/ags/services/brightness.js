import Service from "resource:///com/github/Aylur/ags/service.js";
import * as Utils from "resource:///com/github/Aylur/ags/utils.js";
const { exec, execAsync, monitorFile } = Utils;

const clamp = (num, min, max) => Math.min(Math.max(num, min), max);

// assuming only one backlight device
class BrightnessService extends Service {
  static {
    Service.register(
      this,
      { "screen-changed": ["float"] },
      { "screen-value": ["float", "rw"] },
    );
  }

  #screenValue = 0;
  #max = Number(exec("brightnessctl m"));;

  #interface = exec("sh -c 'ls -w1 /sys/class/backlight | head -1'");

  // the getter has to be in snake_case
  get screen_value() {
    return this.#screenValue;
  }

  // the setter has to be in snake_case too
  set screen_value(percent) {
    percent = clamp(percent, 0, 1);
    execAsync(`brightnessctl s ${percent * 100}% -q`)
      .catch(print);
  }

  constructor() {
    super();
    // setup monitor
    const brightness = `/sys/class/backlight/${this.#interface}/brightness`;
    monitorFile(brightness, () => this.#onChange());

    // initialize
    this.#onChange();
  }

  #onChange() {
    this.#screenValue = Number(exec('brightnessctl get')) / this.#max;

    // signals have to be explicity emitted
    this.emit('changed'); // emits "changed"
    this.notify('screen-value'); // emits "notify::screen-value"

    // or use Service.changed(propName: string) which does the above two
    // this.changed('screen-value');

    // emit screen-changed with the percent as a parameter
    this.emit('screen-changed', this.#screenValue);
  }
  // overwriting connectWidget method, lets you
  // change the default event that widgets connect to
  connectWidget(widget, callback, event = "screen-changed") {
    super.connectWidget(widget, callback, event);
  }
}

// the singleton instance
const service = new BrightnessService();

// make it global for easy use with cli
globalThis.brightness = service;

// export to use in other modules
export default service;
