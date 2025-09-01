Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D4CA0FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFVI15eiltlFGxRzX5YgFC2HFGKYuR6Ff51Eqn9rPjU=; b=aDwwJjFu5ifrNF
	a/DImaON2qMKyXSAQWBZ+IgsLhjOHdOxigjXRuE8TZGRJVDTgAvYHX7wePi4v1yZTY/G3TEH0JX7+
	C5z6oRRKSPi1HqbcWPk1F7roy0JFVuw+PBrpuDzLkGDzkE9WuF47eARQYGaKBFQ0wFnHaAKGl8xUP
	K/O5H7xHcumYXILOCRZ6lplybbmzAoly9PkA5Tzl7+vaXmKjxv5p53vmnmbFLGC7+PKbkQ1rrJZdF
	61YgKgplYWgVOm5brOxzYu0MvC187N6JCkHYJphME+wMM/2akkDvKzmxmsvBIaRzCn0xl4swLk9kj
	bi7VM2QdvyobKvQRLfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4DV-0000000Cck0-2JmJ;
	Mon, 01 Sep 2025 13:05:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2Lb-0000000BzWr-3F3s
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8232644E8D;
	Mon,  1 Sep 2025 11:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8F0C4CEF4;
	Mon,  1 Sep 2025 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724715;
	bh=fQK9+TNjOMxzSGZmUzRv58YbqcykvxbEivMK+1aMTn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efgIlOcAI2kQOApbNt+qj1Jyf/++Vs+a1C1c4TpD/3JwgkW0e66UnxmhtmkW4Xv4r
	 8Cy+aBiWGg3flujNmmEJmFSw+VaAyvI1jNH5xT61K3+rJ0s7n/mthq+4V1yziulHpV
	 G3gwbhhlLdVS/39WRhOWcDIFdm6hBUqEPeYnmlHkPgUY7h+ocqHaf7WHNhOisf83rM
	 EUVqMf26lYscHxGuUYpm1tLXDcPHADNam7KBHmdJfRvMYAPDLSq8ypvtUEpapWiGoD
	 KUdrXBHEdXsdDdb5Qs5jaWgtszZyYJpbiNWqwg4FPrVHGMboidxybGP8Ls97ayZW1d
	 t7Q2KPVcINQyQ==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [PATCH v4 5/9] dt-bindings: clk: microchip: mpfs: remove first reg region
Date: Mon,  1 Sep 2025 12:04:17 +0100
Message-ID: <20250901-properly-banister-ccf27886c8e6@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901-rigid-sacrifice-0039c6e6234e@spud>
References: <20250901-rigid-sacrifice-0039c6e6234e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TTW8V6IURt0fNsC7kk6IUVDimqCXtE9Vfhk8Glza/xk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlba9ex+L08wxr2YGfkncVTAi0qzyT//jbp7zfmvZ/uJ 0zW+mjW0VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ1H9mZNi9/5B1//PXk7Tn zmqqmaESb1zmYs0147OXsks07/p8vycM/8ylMv7O/VL/vdvNd3PGkY5Tm2a6VMgc0px1t1lGhbN pMRMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_040515_857622_7B80147A 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

The first reg region in this binding is not exclusively for clocks, as
evidenced by the dual role of this device as a reset controller at
present. The first region is however better described by a simple-mfd
syscon, but this would have require a significant re-write of the
devicetree for the platform, so the easy way out was chosen when reset
support was first introduced. The region doesn't just contain clock and
reset registers, it also contains pinctrl and interrupt controller
functionality, so drop the region from the clock binding so that it can
be described instead by a simple-mfd syscon rather than propagate this
incorrect description of the hardware to the new pic64gx SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index e4e1c31267d2a..ee4f31596d978 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -22,16 +22,23 @@ properties:
     const: microchip,mpfs-clkcfg
 
   reg:
-    items:
-      - description: |
-          clock config registers:
-          These registers contain enable, reset & divider tables for the, cpu,
-          axi, ahb and rtc/mtimer reference clocks as well as enable and reset
-          for the peripheral clocks.
-      - description: |
-          mss pll dri registers:
-          Block of registers responsible for dynamic reconfiguration of the mss
-          pll
+    oneOf:
+      - items:
+          - description: |
+              clock config registers:
+              These registers contain enable, reset & divider tables for the, cpu,
+              axi, ahb and rtc/mtimer reference clocks as well as enable and reset
+              for the peripheral clocks.
+          - description: |
+              mss pll dri registers:
+              Block of registers responsible for dynamic reconfiguration of the mss
+              pll
+        deprecated: true
+      - items:
+          - description: |
+              mss pll dri registers:
+              Block of registers responsible for dynamic reconfiguration of the mss
+              pll
 
   clocks:
     maxItems: 1
@@ -69,11 +76,12 @@ examples:
   - |
     #include <dt-bindings/clock/microchip,mpfs-clock.h>
     soc {
-            #address-cells = <2>;
-            #size-cells = <2>;
-            clkcfg: clock-controller@20002000 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            clkcfg: clock-controller@3E001000 {
                 compatible = "microchip,mpfs-clkcfg";
-                reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
+                reg = <0x3E001000 0x1000>;
                 clocks = <&ref>;
                 #clock-cells = <1>;
         };
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
