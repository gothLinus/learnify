// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import FileUploadController from "./file_upload_controller";
application.register("file-upload", FileUploadController);
eagerLoadControllersFrom("controllers", application)
