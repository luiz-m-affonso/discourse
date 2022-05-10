import Controller from "@ember/controller";
import ModalFunctionality from "discourse/mixins/modal-functionality";
import { action } from "@ember/object";
import { notEmpty } from "@ember/object/computed";

export default Controller.extend(ModalFunctionality, {
  userStatus: "",
  statusIsSet: notEmpty("userStatus"),
  showDeleteButton: false,

  onShow() {
    if (this.currentUser.customStatus?.description) {
      this.setProperties({
        userStatus: this.currentUser.customStatus?.description,
        showDeleteButton: true,
      });
    }
  },

  @action
  delete() {
    this.set("userStatus", "");
    this.currentUser.customStatus = null;
    this.send("closeModal");
  },

  @action
  saveAndClose() {
    if (this.userStatus) {
      this.currentUser.customStatus = {
        emoji: "mega",
        description: this.userStatus,
      };
    }

    this.send("closeModal");
  },
});
