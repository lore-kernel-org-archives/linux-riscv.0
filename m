Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100FAC77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDdjNAQZiyNJ2kYQBGHjQ7ZY/cvLQHHLfuW5sCvhotI=; b=hbbOT0h6nv/pn3
	2IklUcErzRBPmFqlkh7vxYUb+BcIkdevV5FXEP/KPMWhbNMfkO3lXF8bxkor0vdlkO2yTNBKkBJBa
	n50ZXLtGqX2Bv34122nv6Ax4cORJVKmMM3hzy2e3NkYh3BpWuO978ZwqYV+pLPfKBof6J6CXkfhlv
	2PQpG9d6DE2ZQMblupyBQury2P2gPV1Ynm1l0/HnqNMRIY+kF3f0YbmN8KLCeMXez0PMkld6EuHYN
	qyexU/OqHlIo1cg8LcaNNg+mqReaofWaeid7vvBc3OkF657/CDuOyXmuFTbRlReyr7Z6s7QIMyYvU
	fukpIExkhuZZJjz6GkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfxm-00GFbj-0o;
	Sun, 07 May 2023 15:06:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvfxg-00GFXR-2R;
	Sun, 07 May 2023 15:06:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3063b5f32aaso2269111f8f.2;
        Sun, 07 May 2023 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471967; x=1686063967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ziv+62Y+GAylpM/ibpSxQKGKhNzMiq6MRDwumNWDsYk=;
        b=sRTmU8JbDncgX6NXneNlIuiUj6m6ACDXUTCTvC8rFEGY/QPS4SM8iQwXH/DSfPKc/K
         JQYtiAT+eOKtjCqorW6x+aQpfPEPIDq9FZiSVgNPkymU+XzUMkNki17jRHfHPQjfltWE
         2FrvxzITEUZo/8nOnTmTxLc+Ghh0dXdKALZR7E1GyEXJkQVGQe3F34+mvWpeeTaJ0B4i
         2DFcnEvEvVCBtSNWKA6EX2ZcrwFdlV32CV4Ij7HVvJEqIm5pvWDQ/LluaNxstTTMWYhO
         EgM7gNmxO2KFZBqBlHKhjmyvL2I6mYn/95rj85cljFIjkqIbRYV091+oNPDqRiPMFq2v
         CTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471967; x=1686063967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ziv+62Y+GAylpM/ibpSxQKGKhNzMiq6MRDwumNWDsYk=;
        b=aUqHc2DggZqG0BkMApaYEJkyUBQbON37sgbZeGHtDREWwUUP5W9q5LLdSkUksYpDM6
         FfqT2Qe+RV+XBHqNsOtE/N3XH6M/uLzIucNZv1/T1HuzQ0gWge6AvWT6Fk0zIJ0TD7rh
         LMVoKGFf/oMEjvX5REMsa82Mtrn+z9ZWTzqCJNjeCP0jyCda191Iup5vKKLf86AnB9au
         GwpSIBb+AUTp1KQz9HuGeyqXN4D5MFUEbJr/MF4yG9P26yMSJQcHejvEhLEsn3KZvl5x
         UaG2PXr/mWAJmU5mo2uNaadLjyZylpKXtgld83RtogMJLpk1gzblm15c61Cr7d8ORBwU
         UsMw==
X-Gm-Message-State: AC+VfDxXHP3GtlVdE/pQhLCVReFpJj+75kDfwNZIPMv1W/mc4SlcXZxG
	M+muLWyebNGRcJGb589VIaw=
X-Google-Smtp-Source: ACHHUZ6j8yqhFjZ0rqUBjPV5gzZfUrJxy8WXKvBq6Dbeit0CPEpd8ylflGfJYynkyLbuiKrRSZ46TA==
X-Received: by 2002:adf:e341:0:b0:307:5097:ab60 with SMTP id n1-20020adfe341000000b003075097ab60mr5133166wrj.63.1683471966755;
        Sun, 07 May 2023 08:06:06 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b0030771c6e443sm8437998wri.42.2023.05.07.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 08:06:06 -0700 (PDT)
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
Subject: [PATCH v4 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Sun,  7 May 2023 18:03:37 +0300
Message-Id: <20230507150345.1971083-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507150345.1971083-1-bigunclemax@gmail.com>
References: <20230507150345.1971083-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_080608_791513_7049B44B 
X-CRM114-Status: GOOD (  11.70  )
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
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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
