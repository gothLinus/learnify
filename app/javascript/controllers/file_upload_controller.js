import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input", "preview"];

    triggerFileInput() {
        this.inputTarget.click();
    }

    addFiles(event) {
        this.previewTarget.innerHTML = "";

        Array.from(event.target.files).forEach((file, index) => {
            const reader = new FileReader();
            reader.onload = (e) => {
                const previewElement = document.createElement("div");
                previewElement.classList.add("relative", "p-2", "border", "rounded-md", "bg-gray-100", "dark:bg-gray-700", "flex", "items-center", "space-x-2");

                if (file.type.startsWith("image/")) {
                    previewElement.innerHTML = `
            <img src="${e.target.result}" alt="${file.name}" class="w-16 h-16 object-cover rounded-md">
            <p class="text-xs text-gray-700 dark:text-gray-300">${file.name}</p>
            <button type="button" data-index="${index}" class="text-red-500 text-xs mt-1 remove-file">✖</button>
          `;
                } else {
                    const fileType = file.type.includes("pdf") ? "📄 PDF" : "📃 Document";
                    previewElement.innerHTML = `
            <span class="text-lg">📄</span>
            <p class="text-xs text-gray-700 dark:text-gray-300">${fileType}: ${file.name}</p>
            <button type="button" data-index="${index}" class="text-red-500 text-xs mt-1 remove-file">✖</button>
          `;
                }

                this.previewTarget.appendChild(previewElement);
            };

            reader.readAsDataURL(file);
        });

        // Remove File Handler
        this.previewTarget.addEventListener("click", (e) => {
            if (e.target.classList.contains("remove-file")) {
                this.removeFile(e.target.dataset.index);
            }
        });
    }

    removeFile(index) {
        let filesArray = Array.from(this.inputTarget.files);
        filesArray.splice(index, 1);

        const dataTransfer = new DataTransfer();
        filesArray.forEach((file) => dataTransfer.items.add(file));

        this.inputTarget.files = dataTransfer.files;
        this.addFiles({ target: this.inputTarget }); // Refresh preview
    }
}
