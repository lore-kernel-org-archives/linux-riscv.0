Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335A3C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4n0K6l6gA0GgZS6MOqHcsznemuBcr8en4ElctJ6kvx4=; b=QSEsLC3V1ITNtA
	8Dpx3lrdx2VJFJj9K8yjoZP1geSb7TjjWonKxybGlyJN70quOCn4dBIFcfBUgAP52SeTZZlMI3VVn
	TW61OKlggJpNEpdKJUESmqdncKD+GOuvW/8KpSkOxhCYPt+45liHsrCWYqTZ0e4zQi0SI1LPGw8HV
	NXn38K9R3XMPsjKZQtZ+o+iOMI6Yb+vNFII8ZLikvVISmY4Io2amSUVUXhjd0XveUEAzVST7y6tLe
	N+ZNR6is53uLaVWahcChwIbeYabObG3/LP5KWUb4Kr2rEKIpmCqGoW9oRa2fbxZk4COKpqm0UDGYt
	p39AzlnX1NZ+mIJuS0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJl-00EadK-2E;
	Sat, 06 May 2023 23:27:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJe-00EaVp-0e;
	Sat, 06 May 2023 23:27:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-306dbad5182so1998549f8f.1;
        Sat, 06 May 2023 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415666; x=1686007666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aWNeOXwnkGXx7BWbyXaj7Kul1oiC8tUChPKVcUGoAU=;
        b=hqBI5AfOQOQd86X8mkaZPkW/VEcSlmA4PGHENrf374QREkEIM45HC5HiV9T6St+Ol9
         L+Z73x/dc4oo7oWgjad8xZXH4eN5TH+0SyRBktv5r0Srl8Fvu7otgt10ZGBJYiLPxEM6
         EgqlXZvWGYllVgMEzgOKLIhC0VNANn0LrNFjDJgmzg0BTt8ow+gn6t1wuLeuAtFBrzc3
         92eek28suumx+hJ7ZjxgUJ/Sc2J8eRroFAEJ7I4h9nzEEcmEQEfTbimX685sW95CEOgr
         3OCX5KcftyL2ce9y2tltYrPuuH06OzzYlTXN7GAZhn2nAmwNWHxXztLeJVHlPXbyfH9f
         rDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415666; x=1686007666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aWNeOXwnkGXx7BWbyXaj7Kul1oiC8tUChPKVcUGoAU=;
        b=BnEBCtIgSDo9+/1LHzheH78Yt9Omz+Fw16l0p8SZREcw8MM09yYNL5lQu2+vleLugm
         SfjmFgHUSVHGMqIayDdHQMHUfFflKpSoEW0IPdcAy6l2MbnpQTqMtAdEJpf9wEk60Xbn
         9okM3ewgjuY2b78sOVlYkkLuKfvdSOVW4YKnxtDp1eJmfYOYMrcx9zNLltTtREh4+4WZ
         19RtlWHzTKYp4xjm1ttBsz2sTqlwHJFtyxjxvDJD7GEj4Sw3HrSBzpksyAcYtnJLdIV2
         cg2vckGxeijXB7B52i499I6rCoC6eTtzAhxQcDeEBJ1cbM//epRNbufpkcQHzFW4T2hh
         AuOQ==
X-Gm-Message-State: AC+VfDz62tA9NnfpaoLr/hYE6ILb9GfQPSIX5yijD6r8xln/EOwtCmRZ
	WhDkTawN1lXH0wZqBqiuseY=
X-Google-Smtp-Source: ACHHUZ7FTYmJxCyZm2ZCulaucrLFWOmqwq91uFwSGOBEAyYGzAOiOr1CSWhB+1vUVvzDTMOTN3LASA==
X-Received: by 2002:adf:db84:0:b0:306:28dd:5fb with SMTP id u4-20020adfdb84000000b0030628dd05fbmr3881083wri.62.1683415666151;
        Sat, 06 May 2023 16:27:46 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:45 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Sun,  7 May 2023 02:26:08 +0300
Message-Id: <20230506232616.1792109-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506232616.1792109-1-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_162750_257381_BE1BD697 
X-CRM114-Status: GOOD (  11.84  )
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

Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
an optional SPI flash that connects to the SPI0 controller.

This controller is the same for R329/D1/R528/T113s SoCs and
should be supported by the sun50i-r329-spi driver.

So let's add its DT nodes.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..1bb1e5cae602 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -108,6 +108,12 @@ rmii_pe_pins: rmii-pe-pins {
 				function = "emac";
 			};
 
+			/omit-if-no-ref/
+			spi0_pins: spi0-pins {
+				pins = "PC2", "PC3", "PC4", "PC5";
+				function = "spi0";
+			};
+
 			/omit-if-no-ref/
 			uart1_pg6_pins: uart1-pg6-pins {
 				pins = "PG6", "PG7";
@@ -447,6 +453,37 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		spi0: spi@4025000 {
+			compatible = "allwinner,sun20i-d1-spi",
+				     "allwinner,sun50i-r329-spi";
+			reg = <0x04025000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
+			clock-names = "ahb", "mod";
+			dmas = <&dma 22>, <&dma 22>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_SPI0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		spi1: spi@4026000 {
+			compatible = "allwinner,sun20i-d1-spi-dbi",
+				     "allwinner,sun50i-r329-spi-dbi",
+				     "allwinner,sun50i-r329-spi";
+			reg = <0x04026000 0x1000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(16) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
+			clock-names = "ahb", "mod";
+			dmas = <&dma 23>, <&dma 23>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_SPI1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		usb_otg: usb@4100000 {
 			compatible = "allwinner,sun20i-d1-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
