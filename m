From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 29 Jun 2018 11:01:22 -0700
Subject: [RFC PATCH 1/2] dt-binding: RISC-V local timer docs.
In-Reply-To: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1530295283-191270-2-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch adds documentation for the RISC-V local timer node which
defines per-hart based timer interrupts. This is specified by RISC-V
supervisor manual.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 Documentation/devicetree/bindings/riscv/timer.txt | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/timer.txt

diff --git a/Documentation/devicetree/bindings/riscv/timer.txt b/Documentation/devicetree/bindings/riscv/timer.txt
new file mode 100644
index 0000000..8dcc930
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/timer.txt
@@ -0,0 +1,35 @@
+* RISC-V local timer
+
+RISC-V supervisor manual specifies that timer interrupt is connected to
+individual harts directly to minimize the interrupt latency. These per
+hart timer is connected via Hart Level Interrupt Controller (HLIC). The
+HLIC will also act as the interrupt parent for timer interrupt.
+
+Required properties:
+
+- compatible : "riscv,local-timer"
+- interrupts : Should be Timer interrupt number. Current supervisor manual
+	       defines it be 5.
+- interrupt-parent : Should point to local interrupt-controller phandle.
+
+Example:
+	cpus {
+    		#address-cells = <0x00000001>;
+    		..
+		..
+		cpu at 0 {
+      		..
+		..
+		timer {
+        		interrupts = <0x00000005>;
+        		interrupt-parent = <0x00000004>;
+        		compatible = "riscv,local-timer";
+      		}
+      		interrupt-controller {
+			..
+			..
+			compatible = "riscv,cpu-intc";
+			linux,phandle = <0x00000004>;
+			phandle = <0x00000004>;
+			}
+		}
-- 
2.7.4
