---
title: "🖼️ Muestra: Diseño de una tesis doctoral"
summary: "Ejemplo de mi trabajo en el ámbito de maquetación e ilustración."
date: 2024-12-18
series: []
weight: 1
aliases: ["/project-phd-thesis"]
tags: ["layout-design", "illustration", "InDesign", "Illustrator", "publishing"]
author: ["Sara DM"]
ShowToc: false
ShareButtons: twitter, bluesky
---

El año pasado tuve la oportunidad de diseñar e ilustrar una tesis doctoral. Como es habitual, el proyecto requería cierta flexibilidad para adaptar las ilustraciones según la autora lo requería. Era el momento ideal para utilizar pinceles personalizados, ya que permiten flexibilidad para aplicar cambios así como están pensadas para replicar patrones siguiendo un trazo. Tomé la idea de [biorender](https://www.biorender.com/) y la adapté al entorno de Adobe Illustrator e InDesign, con mis diseños para cada tipo de célula.

Aquí una muestra del resultado final —puedes navegar por las páginas y ampliarlas.

<div id="pdf-viewer">
  <div class="book-container">
    <div class="book">
      <div class="page" id="leftPage"></div>
      <div class="page" id="rightPage"></div>
    </div>
    <div class="controls">
      <button id="prevBtn"><</button>
      <div class="page-numbers">
        <span id="currentPages">0-0</span>&nbsp;de&nbsp;<span id="totalPages">0</span>
      </div>
      <button id="nextBtn">></button>
    </div>   
  </div>
</div>

<!-- Modal -->
<div id="pageModal" class="modal">
  <div class="modal-content">
    <span class="close-button">&times;</span>
    <div class="modal-book-container">
      <div class="modal-page" id="modalLeftPage"></div>
      <div class="modal-page" id="modalRightPage"></div>
    </div>
  </div>
</div>

<style>
.book-container {
    display: flex;
    flex-direction: column;
    gap: 10px;
    align-items: center;
    min-height: 80vh;
    padding: 20px;
    margin: 20px 0;
}

.book {
    display: flex;
    background: white;
    box-shadow: 0 0 20px var(--tertiary);
    position: relative;
}

.page {
    width: 400px;
    height: 600px;
    background: white;
    margin: 0 2px;
    overflow: hidden;
    cursor: pointer;
    transition: transform 0.2s;
}

/* Responsive styles for smaller screens */
@media (max-width: 850px) {
    .page {
        width: 300px;
        height: 450px;
    }
    
    .book {
        transform: scale(0.9);
    }
    img.gif-image{
        min-width: 80%
    }
}

@media (max-width: 650px) {
    .page {
        width: 200px;
        height: 300px;
    }
    
    .book {
        transform: scale(0.85);
    }
    img.gif-image{
        min-width: 100%;
    }
}

.page canvas:hover {
    transform: scale(1.02);
    cursor: zoom-in;
}

.page canvas {
    width: 100%;
    height: 100%;
}

.controls {
    left: 50%;
    display: flex;
    gap: 10px;
    padding: 10px;
    border-radius: 5px;
    z-index: 1000;
}

.controls button {
    padding: 8px 16px;
    border: none;
    background: var(--secondary);
    color: white;
    border-radius: 50%;
    cursor: pointer;
    transition: background 0.3s;
}

.controls button:hover {
    background: var(--tertiary);
}

.controls button:disabled {
    background: #ccc;
    cursor: not-allowed;
}

.page-numbers {
    display: flex;
    align-items: center;
    padding: 0 10px;
    font-family: Arial, sans-serif;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    z-index: 2000;
}

.modal-content {
    position: relative;
    width: 95%;
    height: 95%;
    margin: 1% auto;
    background: white;
    padding: 20px;
    border-radius: 8px;
    overflow: auto;
}

.modal-book-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 4px;
    height: 100%;
    width: 100%;
}

.modal-page {
    height: 100%;
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal-page canvas {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}

.close-button {
    position: absolute;
    top: 10px;
    right: 20px;
    font-size: 30px;
    cursor: pointer;
    color: #333;
    z-index: 2001;
}
img.gif-image{
    max-width: 75%;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
<script>
pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

class PDFBookViewer {
    constructor(pdfPath) {
        this.pdfDoc = null;
        this.pageNum = 1;
        this.pdfPath = pdfPath;
        this.leftPage = document.getElementById('leftPage');
        this.rightPage = document.getElementById('rightPage');
        this.modalLeftPage = document.getElementById('modalLeftPage');
        this.modalRightPage = document.getElementById('modalRightPage');
        this.prevBtn = document.getElementById('prevBtn');
        this.nextBtn = document.getElementById('nextBtn');
        this.currentPages = document.getElementById('currentPages');
        this.totalPagesSpan = document.getElementById('totalPages');
        this.modal = document.getElementById('pageModal');
        this.closeButton = document.querySelector('.close-button');
        
        this.loadPDF(pdfPath);
        this.setupButtons();
        this.setupModal();
    }

    async loadPDF(path) {
        try {
            const loadingTask = pdfjsLib.getDocument(path);
            this.pdfDoc = await loadingTask.promise;
            this.totalPagesSpan.textContent = this.pdfDoc.numPages;
            this.updateButtons();
            this.renderPages();
        } catch (error) {
            console.error('Error cargando el PDF:', error);
        }
    }

    async renderPage(pageNum, container, scale = 1) {
        if (pageNum > this.pdfDoc.numPages || pageNum < 1) {
            container.innerHTML = '';
            return;
        }

        const page = await this.pdfDoc.getPage(pageNum);
        const canvas = document.createElement('canvas');
        const context = canvas.getContext('2d');
        
        const viewport = page.getViewport({ scale: 1 });
        const containerWidth = container.clientWidth;
        const containerHeight = container.clientHeight;
        
        const widthScale = containerWidth / viewport.width;
        const heightScale = containerHeight / viewport.height;
        const baseScale = Math.min(widthScale, heightScale);
        const finalScale = baseScale * scale;
        
        const scaledViewport = page.getViewport({ scale: finalScale });

        canvas.width = scaledViewport.width;
        canvas.height = scaledViewport.height;

        await page.render({
            canvasContext: context,
            viewport: scaledViewport
        }).promise;

        container.innerHTML = '';
        container.appendChild(canvas);
    }

    async renderPages(isModal = false) {
        const leftContainer = isModal ? this.modalLeftPage : this.leftPage;
        const rightContainer = isModal ? this.modalRightPage : this.rightPage;
        const scale = isModal ? 1.5 : 1;

        await Promise.all([
            this.renderPage(this.pageNum, leftContainer, scale),
            this.renderPage(this.pageNum + 1, rightContainer, scale)
        ]);
        
        this.updatePageNumbers();
    }

    updatePageNumbers() {
        const rightPageNum = Math.min(this.pageNum + 1, this.pdfDoc.numPages);
        this.currentPages.textContent = `${this.pageNum}-${rightPageNum}`;
    }

    setupButtons() {
        this.prevBtn.onclick = () => {
            if (this.pageNum > 1) {
                this.pageNum -= 2;
                this.renderPages();
                if (this.modal.style.display === 'block') {
                    this.renderPages(true);
                }
                this.updateButtons();
            }
        };

        this.nextBtn.onclick = () => {
            if (this.pageNum < this.pdfDoc.numPages - 1) {
                this.pageNum += 2;
                this.renderPages();
                if (this.modal.style.display === 'block') {
                    this.renderPages(true);
                }
                this.updateButtons();
            }
        };
    }

    setupModal() {
        const handlePageClick = () => {
            if (window.innerWidth <= 850) {
                // Open PDF in new tab for small screens
                window.open(this.pdfPath, '_blank');
            } else {
                // Show modal for larger screens
                this.openModal();
            }
        };

        // Click handlers for pages
        this.leftPage.onclick = handlePageClick;
        this.rightPage.onclick = handlePageClick;

        // Close modal when clicking the close button
        this.closeButton.onclick = () => this.closeModal();

        // Close modal when clicking outside the content
        this.modal.onclick = (e) => {
            if (e.target === this.modal) {
                this.closeModal();
            }
        };

        // Close modal with escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                this.closeModal();
            }
        });

        // Handle window resize
        window.addEventListener('resize', () => {
            if (window.innerWidth <= 850 && this.modal.style.display === 'block') {
                this.closeModal();
            }
        });
    }

    async openModal() {
        this.modal.style.display = 'block';
        await this.renderPages(true);
    }

    closeModal() {
        this.modal.style.display = 'none';
    }

    updateButtons() {
        this.prevBtn.disabled = this.pageNum <= 1;
        this.nextBtn.disabled = this.pageNum >= this.pdfDoc.numPages - 1;
    }
}

// Initialize when the document is fully loaded
document.addEventListener('DOMContentLoaded', () => {
    const siteBasePath = window.location.pathname.split('/').slice(0, -4).join('/') || '/';
    console.log(siteBasePath);
    const pdfPath = `${siteBasePath}/showcases/phd/phd-thesis-example.pdf`;
    const viewer = new PDFBookViewer(pdfPath);
});
</script>

{{< callout type="info" title="Leer más..." >}}
Puedes leer la tesis entera [aquí](https://helda.helsinki.fi/items/a2f3cf73-a7e5-4c6c-932c-e20dc515a8ea). (En inglés).
{{< /callout >}}

## Sacando brillo a los pinceles
Aquí una muestra de los pinceles que diseñé para este proyecto.

<img class="gif-image" id="example-gif" />
<script>
const Gif = document.getElementById('example-gif');
document.addEventListener('DOMContentLoaded', () => {
    const siteBasePath = window.location.pathname.split('/').slice(0, -4).join('/') || '/';
    const gifPath = `${siteBasePath}/showcases/phd/example-brush.gif`;
    Gif.src=gifPath;
});
</script>

Illustrator permite manipular las siguientes opciones del pincel:
- espaciado entre elementos, 
- dirección de rotación,
- ajustes de dimensiones,
- distribución del patrón.

Tal como se muestra en el ejemplo, los elementos se ajustan cuando amplío o reduzco el trazo, para mantener las opciones definidas de espaciado y distribución de elementos.