Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EEC7EE2C
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3HsibQhqOwry4n1I6QGsOkW7wWUxcwgBD8wF6beODo=; b=A4zRq21BcZtz9N
	a6dKFGWcVu1GnjkePN/R677mFOgNkAlznsOLCDym3nTfMJYK3OKUqHj1QDGqhpJiRKbez14FNCw/O
	5SOJP9FtXDK6O6SB6Vxnd64xV4h9aEyvlNEDAKNh57pjkBnWcBrx+0rWbGCoe49QvhhDjB/iXoE5E
	8podLNetU8qJPKnTW+JJB1MH6vPtEB/6OFdbx0Y7AND2C+JYtFFfGTsA7VKa4tnPbkp5lKvBUbxHT
	Q4d9BX2yR2T44IwM/k51stUtCltKZO8/UD9/jutYQaiX3C4nCAr4SGOnqXxXyCfm5No5qGOp2XalJ
	X51L2nKkNq1cHcc9lSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCPa-00Cn1J-2B;
	Sat, 06 May 2023 07:32:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCPW-00Cmy2-1N;
	Sat, 06 May 2023 07:32:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30771c68a9eso2079612f8f.2;
        Sat, 06 May 2023 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358373; x=1685950373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWuJ3928FeRTXQHnTSMxeQkrFwzW1lu8cWO5/HghD9g=;
        b=SxlItSYNZ/2N62zQ8HfucNmvZcoo/BQ4uyVe4rxcCiyML65I125OynPbPBNPH3zYiL
         yPg6jxtKxtCPSdyVoOkztDZ6/RMNvOlkAnO1EREyP9+eXaoqHxfsetThSDFthHdWeddJ
         l+14hEIcR9ZJtg3tZQ+QFVU75bRNgHcNwSUCH5EvYzUbTNodGUQkLh3Ai/bUzhN/WG15
         uL23qvhTXUo+Iq5qNsZG2H/70+M9qBOi6XH3v4A9TsebybJJiezSTnqM2WqLRqCC8opk
         wId8FaN/uvkZ7k8Lq//3xBclUyATUr0Mc/VPhlvR/1YcMw6ryBp8342rOZQ8VTdymWGv
         22dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358373; x=1685950373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWuJ3928FeRTXQHnTSMxeQkrFwzW1lu8cWO5/HghD9g=;
        b=fdFxQHGVVuRz8mRlfq/x4/mreOp7vo9eczaMFYiLILuKjbXcnwr4bWAcSIPp20C51x
         OuEqiFEgNAkN3VABe+j5YFoq2q3BkOPgiVh52k+M1l3qxlXOWLtqec7ot6idh9A2eOou
         XtD8S8CBMGPVmaSIMrIPa1/vfnYwe6deYugyLCjk2dISYxkjsTPD4uQCQt5ElHHa9AMw
         ChiDOmnGAQ5Fsp71PJQivPDFPcz+nCGho7oO52Epg1UsH8J4umwMh7SlQD5Q31rQiKTc
         BtJHCwys9a9npZk3wIhdXHzPlU69du7t87oCDim+82dgoVXqja80eLZUIF161hSLs6mN
         wTHA==
X-Gm-Message-State: AC+VfDzf+9Clt6GkgyBGdYmZDMyEGp2PIWFPevzhBgvSgyAkMvv1mi2J
	5f11AZADM81YADOJcYLHClo=
X-Google-Smtp-Source: ACHHUZ4CkzM5IntmGzc8H9/kN5AIgGpbIpiHnLmq347VIXPzfjwWlxjDpZCmmsWECMktlC6y4X8xEw==
X-Received: by 2002:adf:f552:0:b0:306:772:5c2e with SMTP id j18-20020adff552000000b0030607725c2emr2669948wrp.70.1683358372892;
        Sat, 06 May 2023 00:32:52 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:52 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
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
Subject: [PATCH v2 6/6] riscv: dts: allwinner: d1: Add SPI0 controller node
Date: Sat,  6 May 2023 10:30:14 +0300
Message-Id: <20230506073018.1411583-7-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_003254_467389_4CE514D1 
X-CRM114-Status: GOOD (  12.00  )
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

So let's add its DT node.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..a52999240a8e 100644
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
@@ -447,6 +453,21 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		spi0: spi@4025000 {
+			compatible = "allwinner,sun20i-d1-spi",
+				     "allwinner,sun50i-r329-spi";
+			reg = <0x04025000 0x300>;
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
 		usb_otg: usb@4100000 {
 			compatible = "allwinner,sun20i-d1-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
