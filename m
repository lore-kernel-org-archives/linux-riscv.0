Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EE4CCA473
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQHEsTd7SWJrJRE/6PfFLR+HE4HXsBioJg2GByple9Y=; b=gTb62x/Rdcuacm
	nWBQ3Ioo63IT9CyGznfPUSbCn1kgnmPRxqNmh/x4YERoFbWNlztKFHWoA5IgmTzBaeBhzPdnS6NcZ
	Fe6EtnN5FjS4Nc1umdRai9wPIm4fJvFAWtlZWTvlaeGMwBTLDpmXXVZ5/TN8nb4tot/7k7oLmVZJS
	PgA32yKj3rcbJwfcMzOw+9W+24AmdFB8qIZBIsomp5LHHNkZ/6aM+Ac2Z6XUcFmQCOeBvcrr2AHRM
	pwI/Wi2IL9f1oup60uXljVzDKU9jtoRrMcPFBhXHgN8oQbdvjYmD6j/E6PXgocEZTMUPxA8Snrdj8
	tyIDFhRewac56xnPTa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcm-00BHkV-OO; Sat, 18 Jun 2022 12:32:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XcY-00BHVx-Ry
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id s1so8792950wra.9
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L+tGP5Kq7UIoKfqvhhTL1feo63GGQB6sV6O4YA0h7fw=;
        b=FT1arqVk/Zlcb2OUrG6d3Sn9DZeje/ii6sl5Uni+VBpFsvXiKa+0JDIldNCdJotMw7
         CRpLTSb3ESJ0HokBPy0el7SGci1FfbxA+8wCxZIJ7ulCcboVF51hooukHRDzmLMbRR0S
         XBJnx2JFmdByuvY20d6dYTvwK7qC7rx7qIAnRhOsjpxRiPq6vAAXZl0nYIzJrI7Vxq5a
         0u9HsombL5Oqr8Yt/nNdt/EdlFxqSnraietS8QZ8XqK44mg3l5R6iYQaeNegXu3wf+A8
         QWmt7cEOMYQvDEem63UF12OK4msfj3cqaZZbwH4ynxKqnTmdUxxCtXz6hgblI8B3t413
         8dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+tGP5Kq7UIoKfqvhhTL1feo63GGQB6sV6O4YA0h7fw=;
        b=EZmAXc39BKmkB803TUgNb4ZRFtE8YBkezliEf1avq7rZgNuCJvbu5z9kFhfEBv4gT0
         xyohAL/oqQaaksn4yHze7YWFFAI9wys8L1SsEAKTX1LrP3xD6KLQUI9ybJe1A0tA1IYr
         aQZMXym3R6tRsnsy1XW6Vae9QzhcArWyCi3DQ8PCGk7WhBfoVAtt/cIYRcAj2qzbjFZV
         Zpqc4ARJsZI46b/LuhQHod7mIOIzJzF5ouJV7Z03RS5SIDbinTBas2jQx1aAVoi4MbeU
         uB2i2bgzbTHpl2MRF2Qb/AECMFG0hjqNohIe/E+AB+B1g+i2f+SmYB7ZuP8ZNGK13RCv
         LK+A==
X-Gm-Message-State: AJIora9c6s5LlD4G57tncSVbBKoFPpmY4v/lTB/mO0iJ/e0jomEgi3ra
	ensP731EX+1N2EY/epWEkwPKPg==
X-Google-Smtp-Source: AGRyM1s/yZlVNkGYb597Qf+BVjq6aStv7uTGIe67UVjRHSrjyShDdJGYNTreuTc/Z5+aeiaThr9pvg==
X-Received: by 2002:a5d:4a0b:0:b0:21b:88f3:3784 with SMTP id m11-20020a5d4a0b000000b0021b88f33784mr758684wrq.69.1655555524669;
        Sat, 18 Jun 2022 05:32:04 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:04 -0700 (PDT)
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
Subject: [PATCH 03/14] ASoC: dt-bindings: convert designware-i2s to dt-schema
Date: Sat, 18 Jun 2022 13:30:25 +0100
Message-Id: <20220618123035.563070-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053210_999309_E21E5C31 
X-CRM114-Status: GOOD (  18.58  )
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

Convert the Synopsys DesignWare I2S controller binding to dt-schema.
There was no listed maintainer but Jose Abreu was the last editor of the
txt binding so add him as maintainer.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
deleted file mode 100644
index 6a536d570e29..000000000000
--- a/Documentation/devicetree/bindings/sound/designware-i2s.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-DesignWare I2S controller
-
-Required properties:
- - compatible : Must be "snps,designware-i2s"
- - reg : Must contain the I2S core's registers location and length
- - clocks : Pairs of phandle and specifier referencing the controller's
-   clocks. The controller expects one clock: the clock used as the sampling
-   rate reference clock sample.
- - clock-names : "i2sclk" for the sample rate reference clock.
- - dmas: Pairs of phandle and specifier for the DMA channels that are used by
-   the core. The core expects one or two dma channels: one for transmit and
-   one for receive.
- - dma-names : "tx" for the transmit channel, "rx" for the receive channel.
-
-Optional properties:
- - interrupts: The interrupt line number for the I2S controller. Add this
-   parameter if the I2S controller that you are using does not support DMA.
-
-For more details on the 'dma', 'dma-names', 'clock' and 'clock-names'
-properties please check:
-	* resource-names.txt
-	* clock/clock-bindings.txt
-	* dma/dma.txt
-
-Example:
-
-	soc_i2s: i2s@7ff90000 {
-		compatible = "snps,designware-i2s";
-		reg = <0x0 0x7ff90000 0x0 0x1000>;
-		clocks = <&scpi_i2sclk 0>;
-		clock-names = "i2sclk";
-		#sound-dai-cells = <0>;
-		dmas = <&dma0 5>;
-		dma-names = "tx";
-	};
diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
new file mode 100644
index 000000000000..5ac9c00157bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DesignWare I2S controller
+
+maintainers:
+  - Jose Abreu <joabreu@synopsys.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: canaan,k210-i2s
+          - const: snps,designware-i2s
+      - enum:
+          - snps,designware-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      The interrupt line number for the I2S controller. Add this
+      parameter if the I2S controller that you are using does not
+      support DMA.
+    maxItems: 1
+
+  clocks:
+    description: Sampling rate reference clock
+
+  clock-names:
+    const: i2sclk
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+    minItems: 1
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+    minItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: canaan,k210-i2s
+
+then:
+  properties:
+    "#sound-dai-cells":
+      const: 1
+
+else:
+  properties:
+    "#sound-dai-cells":
+      const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+oneOf:
+  - required:
+      - dmas
+      - dma-names
+  - required:
+      - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc_i2s: i2s@7ff90000 {
+      compatible = "snps,designware-i2s";
+      reg = <0x7ff90000 0x1000>;
+      clocks = <&scpi_i2sclk 0>;
+      clock-names = "i2sclk";
+      #sound-dai-cells = <0>;
+      dmas = <&dma0 5>;
+      dma-names = "tx";
+    };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
