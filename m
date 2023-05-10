Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55658C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDdjNAQZiyNJ2kYQBGHjQ7ZY/cvLQHHLfuW5sCvhotI=; b=JZnSnRIhtNLEoP
	R+mqO+VUp/qlT0DfiGolUJUYVsJ3g1zUuzJYGAN2jjL1RU0BUXWNd0DF2NQVfbO2cNQ8MVAmcaNgi
	4qWAYOSh5hYaqO+kWjqmvAoK/SGjqlLi+Lkf4EhF72sKLMj9d/FpgaKubxabPmlC+OCew8bj5JmjW
	DzB0hoWGV9z5UVJ3N6A8Q7wIo369SgfQnW4Q7u0Hd6tHA/nsJn/BLXO70VaWwqHmExZ0vnYffUjgk
	QYfUseLgmMenLbEqY6LrWu1A81ciIQ3Ft0YV0LygnTOkqlkXeT281kykapClJ7ZXaNg53E8WVIvlZ
	Jt/i7zUpKCW+BzfEqwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevy-005U5b-0i;
	Wed, 10 May 2023 08:12:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevt-005U0t-0L;
	Wed, 10 May 2023 08:12:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso4528980f8f.0;
        Wed, 10 May 2023 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706339; x=1686298339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ziv+62Y+GAylpM/ibpSxQKGKhNzMiq6MRDwumNWDsYk=;
        b=VT0u/vcYhd5TFnEjTToBKJ/wdwffJ2L0okYTTCOhTHsgU8erF1p5oh+r9iXPW4wbu/
         JnTop+tXh8VrgSxnao1lkFM/+EBiicRqWgtiLTRyblzOZnarhN2C1fvW4sK5B3VxXHpF
         8FCZFeOgbkMduNe6GUL8qaFECRy9lAdSf8+8D4Y6X08m1sNwovljZAD5RT+YxswVePUH
         VOR8QElPUjAYXoUHoO+8GoCjVE1jPjgoHFcw46x7PiFzo7xQS6zIZTxOQHV68TNo4ouP
         L6luZ0nnd42ACFwel/2uGTpmtIKFHO65j7ENNms8hLs9EdPypPORR8im6mEBhNXO61Ov
         F6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706339; x=1686298339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ziv+62Y+GAylpM/ibpSxQKGKhNzMiq6MRDwumNWDsYk=;
        b=AQXqQeZbxdpqoNIhmwM9Ls43vcYi2b+xXaI7iQ7+Q06aHna/Jez7J8vXO5P49OPIPI
         vP+Xnsw7MNtbFtUJqwp461mi+aYXzOywrqwt8JwKZi31hU/I+DkKHVjFwFLQF+fi76HS
         ojyCeLSe11kaYUXsrSl42aOjQA0zvvAxKUoB9SfAdu25+Ro4CYZNCc2hO/D/GwZQZeIc
         hnqknF//3WUub6KaCiIITiUhtHx5p6I2QJ9heHK3p3XbIOOvMoPUFmrydZRMWxT0/HHV
         B8JPj0kETz6hm69F4yFK7axCeHt4Vznj/q3EaoJdk+sVPyPOrGR1/nYNCD+JT5FL+Il5
         hyvw==
X-Gm-Message-State: AC+VfDwrO0GgnVWF980qzdjMnWfAJCu88DeRf1oHdSmN+AEcE0DDkREc
	8WrWGDPEJkFIeBlW4pW4WLw=
X-Google-Smtp-Source: ACHHUZ5sd70u2BkeoYnaZa5+eyQCVzqpqKrugxquzDd2XRbo7GFO2hlIBYRs0XLRBwAUP6Sj3isaqQ==
X-Received: by 2002:adf:ecc4:0:b0:2f9:ee8c:a2fa with SMTP id s4-20020adfecc4000000b002f9ee8ca2famr12260618wro.64.1683706339136;
        Wed, 10 May 2023 01:12:19 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:12:18 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Wed, 10 May 2023 11:11:12 +0300
Message-Id: <20230510081121.3463710-6-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510081121.3463710-1-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_011221_146182_2CCEECB7 
X-CRM114-Status: GOOD (  12.22  )
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
