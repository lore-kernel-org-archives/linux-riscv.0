Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068DDC7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTUYSRUQ7wiChQxJZwd/QpbZwgBNh9hcm143S4Whda8=; b=fHwSeNM7la9/7j
	eqK9GY4bXHQ2LoBPNjso4D+y4DdCa1+CwLHClOzTRNO/arlwI/hQNzu4tPkKUvAjJE3Gbp48y8N6S
	a4cfVctNZftkk2ZRkYl1vIGokMQesnzRCKzKPEec5mZu8sAwoQIcUajG35ZwyFIa4rJw1afavzgzQ
	5F8Brz0xoAh0mikKke40hPwwFyMKRIrfuOv8inNfTzYyv4FA4CtD85zsRPFdDrC5GJBe94nsRmb0U
	H8GeL2xPoHjb9wnHD81ou87q+Om1KT1XIiFz7lsBjoYt2TRzBDI8XF50OzfQ27NFTewVSBskv2nlA
	1W1AVGi6dvs7niK1L2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk3w-00000003QXQ-3SKP;
	Mon, 23 Jun 2025 16:30:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgjV-00000002nBS-0g2Y
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 12:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21F5A5C5D43;
	Mon, 23 Jun 2025 12:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063DBC4CEF0;
	Mon, 23 Jun 2025 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683428;
	bh=6Ucfb1L2qIWPZPYszOsiQY5ELklXZC8qWZBX6OzDPyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrmrexSb7s2B0rwEd3k6FjaQH9FDthqJ78OwE105n2ChC8RJ+fOH+6Fy1mDMBQmKX
	 TVbUWV2HEuzd1h4frHvAtTePvUUX+/qMRGNwG/v82+MzHlPRg7ZhfkE16EiFcqw046
	 0ogEwBwvtxJsBYJlwygufv6S2OY5kopxjCGxY6xKLV+HvZ2EJxVcxPkRAoRK0sFbqx
	 QDlRcESNbq4rrvaEbEn/HCET+1MWbgA07yS0VvL16THp7xZ5V89BxMHSremTIWQe+D
	 FjthczL/uZsLG9fAgCZavnwvxfb1cYGW1FxXuUrpKM3GRoIH7FTAIogtJthNa+DTAA
	 9QM4VUxJ2wQfg==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] dt-bindings: clk: microchip: mpfs: remove first reg region
Date: Mon, 23 Jun 2025 13:56:19 +0100
Message-ID: <20250623-hypnotist-research-c6e8af149d02@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UdUqQObnXpHYaHDeBwfkNqw526ibviGaaI8ii4cMcNg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfh/eO/tU9G0JrHy57NtajeBnCyofGSw9tfmIqNlup lffWI986yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE6t4zMuxq3H2r44Vbvb3A qvtThDtevXt52n8Rjxbfmjm2u8RruL8wMky7Llr1KGnV7Zc5mXdWbfHI6FQvq77xSmm/yAqORWz zTzICAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_055709_285437_CB42EE01 
X-CRM114-Status: GOOD (  11.24  )
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
