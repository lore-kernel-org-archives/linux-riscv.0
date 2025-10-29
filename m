Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68123CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyll5aJ5/q7ytwux8tlHoGA4cGNJhp/QHmKHY9+/0kw=; b=ZUCNUxclTyZ3Z5
	ST4fAuPg/ulZkxfrmc+oJKgHGt2rxu8QNvK85Zqf5vGZVIjZjBk9KNAHT+SXims3fPbC1WGbNoMfx
	TZ+0HGkPlO9agzsgdMN+PhBDRJGUjwf5g1a32SLID0U48J21r8wNIQyU7Th3mqqEZyoWhGm/2o1gl
	kYtp4Zv4JlKj2ZXpQ2IEVfovD7xMJkvD3AY+O3Fqm/ptOXJEf3xEDerZNkrajzaH9UAOKHYk9Jptg
	u40KaxIi7x1Vj7QBTFdH8yxuPv+j5GTgcnTlBZ6MUn56m23KHDJmZSo1vPb2z3FwbZpm8wALlXhD6
	aFroeWIgHPDcs1ysfAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8lz-00000001wci-3UyR;
	Wed, 29 Oct 2025 16:11:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8lx-00000001wbV-2rNu
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6521B43C91;
	Wed, 29 Oct 2025 16:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E642C116B1;
	Wed, 29 Oct 2025 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761754301;
	bh=4kdgWfgvg7oJNRXLjBlOXle1kvB7aBe2YNXbD+Y8Wc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fA2O1tJpjhyVcByXd5DncoIYTApookFFqCDKIZGPVqRjefyNz4lrk7Rn+AF3Lk5VR
	 9NoEKm4rKP6AztvLlrZPxedFaP/t8UHp5gfE/Qw9OPlqvqCSOvHyeAObXn18N5ACZp
	 vFl0KHqwQ/xKYOpYSIGpuTbLDxguUuuWMXYsfjWynbaw3+oyqT9OugWoI3aDfOfhDd
	 JQSKj8Qwd6dJTn8mjf2vmtvL7p5mRPEe7jr9C/AVmiimIRwiCkGXbkzU4qeFRCVnoR
	 77pbvRmEk9yQfbK63TTqZqUDqJrQ0q1Q3MK2lTUkHFqiGyowEnPoZ2F59LR842+qpK
	 xSNokMN91RH9A==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: clk: microchip: mpfs: remove first reg region
Date: Wed, 29 Oct 2025 16:11:18 +0000
Message-ID: <20251029-unwatched-family-e47cb29ea815@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3LZvSpbfmHa0zvD2pQSWl0P8VI7zypG9G9PgJJXjfzU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlMNuvyX8YrL94jPHv+yWCr81IVlppiJ7tZn344oM587 8Oza/m1HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiI0HOG/5X5vVL37hzODdGf YG7z0qlfe86G+Vym82wVl3PESe/a/Y/hf9bsWT1XuxveGhf63J14a9tP+/U7G579TWr89v3XnZ2 +C3kA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_091141_764466_7A27A8B9 
X-CRM114-Status: GOOD (  10.80  )
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
index e4e1c31267d2..ee4f31596d97 100644
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
