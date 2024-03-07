This thesis aims to implement an edge detection application in real time, through the Sobel filter, using the PYNQ-Z1 board of the Xilinx company. 
For implementation, the board's high-resolution HDMI input accepts video from a device with an HDMI output. Next, the color image is converted to a grayscale image, 
then the edges are generated through the Sobel filter, and finally, the generated frames of the video sequence are output to the board's high-resolution HDMI output. 
From the HDMI output of the PYNQ-Z1 board, the video is projected on a screen, at a rate of sixty frames per second.
The edge detection system, with the Sobel filter, is designed in VHDL hardware description language. To implement the circuit, the Vivado programming environment of 
the Xilinx company is used. The input and output circuits of the digital video are implemented with IP (intellectual property) stages so that the circuit can then be 
tested on the Zynq 7000 device of the PYNQ-Z1 board. The PYNQ-Z1 board emerges as an easy-to-use design tool for digital video applications at a relatively low cost.

Η παρούσα διπλωματική εργασία έχει σκοπό την υλοποίηση εφαρμογής ανίχνευσης ακμών σε πραγματικό χρόνο, μέσω του φίλτρου Sobel, με χρήση της πλακέτας PYNQ-Z1 της εταιρίας Xilinx. 
Για την υλοποίηση, η είσοδος υψηλής ανάλυσης HDMI της πλακέτας δέχεται video από μία συσκευή με έξοδο HDMI. Στην συνέχεια, η έγχρωμη εικόνα μετατρέπεται σε εικόνα αποχρώσεων του γκρι, 
έπειτα παράγονται οι ακμές μέσω του φίλτρου Sobel και τέλος, τα παραγόμενα πλαίσια της ακολουθίας video εξάγονται στην έξοδο υψηλής ανάλυσης HDMI της πλακέτας. Από την έξοδο HDMI της 
πλακέτας PYNQ-Z1, το  video προβάλλεται σε οθόνη, με ρυθμό εξήντα πλαισίων το δευτερόλεπτο.
To σύστημα ανίχνευσης ακμών, με το φίλτρο Sobel, σχεδιάζεται σε γλώσσα περιγραφής υλικού VHDL. Για την υλοποίηση του κυκλώματος, γίνεται χρήση του προγραμματιστικού περιβάλλοντος Vivado 
της εταιρείας Xilinx. Τα κυκλώματα εισόδου και εξόδου του ψηφιακού βίντεο, υλοποιούνται με βαθμίδες IP (intellectual property) ώστε το κύκλωμα στην συνέχεια να δοκιμασθεί στη διάταξη 
Zynq 7000 της πλακέτας PYNQ-Z1. Η πλακέτα PYNQ-Z1 αναδεικνύεται σε ένα εύχρηστο εργαλείο σχεδίασης εφαρμογών ψηφιακού βίντεο, με σχετικά χαμηλό κόστος.
