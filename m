Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D6CCA48A
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hy7NlBH/iLXRhb7L1AjIIsOA+zTskS1A3llb8mMw7+o=; b=iMgqWmiO7h+/X0
	BoobjmhQQZ9NIgdoJXYto4JpgP+ukW6+hZRhPppW7AVnZMBsDJ8r7rgWXo3RAk+qzbP/ds+x/rUqO
	UQ2BsaXjYx3agW9+iQImMLTpU2IE94+4k/YEJ0timleGJlPHcI3frKL/zbYtYmQwOu7Z04btKwAY2
	ZTBBhLkWDu5q2O8WM6OFpaJtcCuJgt+XP8a1ap5Q+gPUYviBLigTe5rdEaergQYAZMRy8WDKXc6en
	Y3BsbCIDE1i1iXT/nTotnsQU8Yhz0j0PC8K3zQvekJSteIFPVZBX6aqUa/S+6pGpgrfdzOE7Jl6+e
	lze6TxIusGsTs7UzO4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xch-00BHfk-R2; Sat, 18 Jun 2022 12:32:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XcY-00BHW0-Rz
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m1so1046282wrb.2
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n9g/PqG7lJoC3tmWnVa7QkZ4DkjcrfTJ4GH+uywTgjo=;
        b=YKP/o6CNE+lQ/JvutgsR0jZOXfHfDWCY/dQhqMKd5OzvitLi7mgxOOlC22neXUi3t3
         BN9TvFhMfSVyIRalfKp0Va337xJ573OA/jlHmNvKMC9gL9WCqqIk9PYa0TsCVpUjtR8B
         tbSkAAYjMwonv2CjEuI0NKpP3MKNtmcrz4U2Kau04jp49doWSVikIYXLNtIJ0CbxpRRk
         ACyFnBPLFEDO8mQ9dOPY47H5osv138u3PU28fgbHfr0fyUMw+29W9vwD1hyvLo5Y4+V/
         UZtdS0DFsqY5lgkZ/53LD/FQ/OdBPmTBXN7bsmN9ILMpN1rxcP2HcJnRbBzUtni7FWjs
         qlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n9g/PqG7lJoC3tmWnVa7QkZ4DkjcrfTJ4GH+uywTgjo=;
        b=A2L4gEAnrQm2Kqw19hyP+JR7lKCi+m71+/Zzji+RP5uqjXy5ObI2DE2mNto8ME8kNA
         kgwgviSaazpyZcRhx5qBnZuAI0XDw2rcw6GZqzVDpEnyj+mAJ/I5GUr+yBv485uQc7aW
         pi/G5G9abgbE+V1G+E9kqxnCkW4c9WElPa9S5U6ZIeIjVC13uvtyXiIjLthdy5XiRsFA
         5lZkXxrY0yXPy3uIuEdKhdysBH0yN5fRLU/tovX4yvIRzsXndq8L9NlkX+1VQZSEpcwm
         MJ6VU7FDQq7s8K0HtFRSHHZOb7dPGTUlM5fCw/eP+2XxKJKP8WHINLOhe4Z0t60nY2s5
         ITiw==
X-Gm-Message-State: AJIora9vZjuZ+pQx4L/mfGNKr499ghMcdMLA5PBe80Ohfahy2WVXlG6j
	s4oTu/cUSDclKh8RM7KXuH19ag==
X-Google-Smtp-Source: AGRyM1uLcJx1fdLcx/uXs4UMpQTYdcZbfApX1+t2jE32dzxYMzfs1UyeNBdv+e0Fp23i7qfwRgxtPQ==
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id s17-20020a5d4251000000b0021b885b2fccmr1452539wrr.52.1655555526382;
        Sat, 18 Jun 2022 05:32:06 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:05 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys DesignWare DMA
Date: Sat, 18 Jun 2022 13:30:26 +0100
Message-Id: <20220618123035.563070-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053210_983701_4AF9625A 
X-CRM114-Status: GOOD (  13.08  )
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

The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
controller, but according to the documentation & devicetree it has 6
interrupts rather than the standard one. Add a custom compatible that
supports the 6 interrupt configuration which falls back to the standard
binding which is currently the one in use in the devicetree entry.

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..bc85598151ef 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -18,9 +18,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - snps,axi-dma-1.01a
-      - intel,kmb-axi-dma
+    oneOf:
+      - items:
+          - const: canaan,k210-axi-dma
+          - const: snps,axi-dma-1.01a
+      - enum:
+          - snps,axi-dma-1.01a
+          - intel,kmb-axi-dma
 
   reg:
     minItems: 1
@@ -33,9 +37,6 @@ properties:
       - const: axidma_ctrl_regs
       - const: axidma_apb_regs
 
-  interrupts:
-    maxItems: 1
-
   clocks:
     items:
       - description: Bus Clock
@@ -92,6 +93,22 @@ properties:
     minimum: 1
     maximum: 256
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: canaan,k210-axi-dma
+
+then:
+  properties:
+    interrupts:
+      maxItems: 6
+
+else:
+  properties:
+    interrupts:
+      maxItems: 1
+
 required:
   - compatible
   - reg
@@ -105,7 +122,7 @@ required:
   - snps,priority
   - snps,block-size
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -113,12 +130,12 @@ examples:
      #include <dt-bindings/interrupt-controller/irq.h>
      /* example with snps,dw-axi-dmac */
      dmac: dma-controller@80000 {
-         compatible = "snps,axi-dma-1.01a";
+         compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
          reg = <0x80000 0x400>;
          clocks = <&core_clk>, <&cfgr_clk>;
          clock-names = "core-clk", "cfgr-clk";
          interrupt-parent = <&intc>;
-         interrupts = <27>;
+         interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
          #dma-cells = <1>;
          dma-channels = <4>;
          snps,dma-masters = <2>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
