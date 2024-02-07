import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
const { Box, Window } = Widget;

// TODO: what the fuck how can i reuse the code to make sideleft dont close when lose focus
// how to make it entensible????
export default ({ name, child, showClassName, hideClassName, ...props }, extraSetup = () => { }) =>
  Window({
    name,
    popup:true,
    visible: false,
    layer: "overlay",
    ...props,

    child: Box({
      className: `${showClassName} ${hideClassName}`,
      attribute: {
        toggle: (self, visible) => {
          self.toggleClassName(hideClassName, visible)
        }
      },
      setup: self => {
        self.hook(App, (self, currentName, visible) => {
          if (currentName === name) {
            self.attribute.toggle(self, !visible);
          }
        }, "window-toggled")
        extraSetup(self)
      },
      child: child,
    }),
  });
