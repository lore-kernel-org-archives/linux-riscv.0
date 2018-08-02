From: hch@lst.de (Christoph Hellwig)
Date: Thu,  2 Aug 2018 13:49:58 +0200
Subject: [PATCH 01/11] dt-bindings: Correct RISC-V's timebase-frequency
In-Reply-To: <20180802115008.4031-1-hch@lst.de>
References: <20180802115008.4031-1-hch@lst.de>
Message-ID: <20180802115008.4031-2-hch@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Palmer Dabbelt <palmer@sifive.com>

Someone must have read the device tree specification incorrectly,
because we were putting timebase-frequency in the wrong place.  This
corrects the issue, moving it from

/ {
        cpus {
                timebase-frequency = X;
        }
}

to

/ {
        cpus {
                cpu at 0 {
                        timebase-frequency = X;
                }
        }
}

This is great, because the timer's frequency should really be a per-cpu
quantity on RISC-V systems since there's a timer per CPU.  This should
lead to some cleanups in our timer driver.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
index adf7b7af5dc3..b0b038d6c406 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.txt
+++ b/Documentation/devicetree/bindings/riscv/cpus.txt
@@ -93,9 +93,9 @@ Linux is allowed to run on.
         cpus {
                 #address-cells = <1>;
                 #size-cells = <0>;
-                timebase-frequency = <1000000>;
                 cpu at 0 {
                         clock-frequency = <1600000000>;
+                        timebase-frequency = <1000000>;
                         compatible = "sifive,rocket0", "riscv";
                         device_type = "cpu";
                         i-cache-block-size = <64>;
@@ -113,6 +113,7 @@ Linux is allowed to run on.
                 };
                 cpu at 1 {
                         clock-frequency = <1600000000>;
+                        timebase-frequency = <1000000>;
                         compatible = "sifive,rocket0", "riscv";
                         d-cache-block-size = <64>;
                         d-cache-sets = <64>;
@@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
 This device tree matches the Spike ISA golden model as run with `spike -p1`.
 
         cpus {
+                timebase-frequency = <1000000>;
                 cpu at 0 {
                         device_type = "cpu";
                         reg = <0x00000000>;
-- 
2.18.0
