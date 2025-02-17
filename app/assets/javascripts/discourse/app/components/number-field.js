import TextField from "discourse/components/text-field";
import { allowOnlyNumericInput } from "discourse/lib/utilities";
import discourseComputed from "discourse-common/utils/decorators";
import I18n from "discourse-i18n";

export default TextField.extend({
  classNameBindings: ["invalid"],

  keyDown: function (event) {
    allowOnlyNumericInput(event, this._minNumber && this._minNumber < 0);
  },

  get _minNumber() {
    if (!this.get("min")) {
      return;
    }
    return parseInt(this.get("min"), 10);
  },

  get _maxNumber() {
    if (!this.get("max")) {
      return;
    }
    return parseInt(this.get("max"), 10);
  },

  @discourseComputed("number")
  value: {
    get(number) {
      return parseInt(number, 10);
    },
    set(value) {
      const num = parseInt(value, 10);
      if (isNaN(num)) {
        this.set("invalid", true);
        return value;
      } else {
        this.set("invalid", false);
        this.set("number", num);
        return num.toString();
      }
    },
  },

  @discourseComputed("placeholderKey")
  placeholder(key) {
    return key ? I18n.t(key) : "";
  },
});
