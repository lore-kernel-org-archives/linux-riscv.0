Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D147C77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SoatbYUVuoI4G2K+kyXXc8smx/n2iUhIYUIOykpE8r8=; b=1wjmxlT13um6m6
	o6gzns+P2XhSSMbeRnYQzgZiLVgIpSnmKF1L8ftHdzJUD/eRJ5CvuIy4dNwQDJbW00Gd3Mgxt78rA
	L6hVUoMIMUEqaPOC2ahgdZ3aUMm6LkkOnpok5luHG9rXsR9AOz5faJP41uS08VPFGdbvEa7GXX1zb
	hskAjGSOKFv5cFiyXMq2Jmn7NfGeynZV9SoaOblgW2lRzl8Zd2vw1xDcfiHW3x9SpVn6N1jcTi1Dx
	6Y6U0P0T9U8Oro9iwuptNwOdPBLAfryhusPaDgni+Df/MhTVAXOBqYLzLmsTdqanJ4FnuleKczNbG
	npyNZKaRB9EcyocSv8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puq9z-009x70-1Z;
	Fri, 05 May 2023 07:47:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puq9x-009x6W-2B;
	Fri, 05 May 2023 07:47:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f19323259dso14331635e9.3;
        Fri, 05 May 2023 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683272839; x=1685864839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNV1oA5bifbHrVzVGDwGABZ92MbgAi9sOiOOiEw4RrY=;
        b=lkg+LH04TwCQLhmLbRKDg/dBJWQ7XdfptJmigPx/HjYBXY0JRepARb5d/8OAgeih30
         3s4tXEUw9Eyzzf6rPHJisFmt66eFJtGTRs0+k7bGdujqpSbJM4E5IQ7BCKaxvynwbRGA
         mJV3MzMugU0NIXgPwW4Ydux0lvBTjIwHjJw13UBxeyldqBJyTDc8XMZydN5t31/e1Ql/
         Gz32EkDcx+AeFOVED0YbBJ8E0NpUnnrwX5MhiJJ1kkFyR7H4D8l+1EL8ZOeYFjy5m2zh
         rJr/4WDj4rDXo6MBKHzKd+T57LDftmdNnEZgDlp6IQW/vY/Ec/nq7wWhUtLHN9iY7Ppq
         7HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683272839; x=1685864839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNV1oA5bifbHrVzVGDwGABZ92MbgAi9sOiOOiEw4RrY=;
        b=R1+mKbLU3699WXq43lTLv0vQkzHluB3DQgCof9cUrBESnO2Wpk57PdeisJowDbvghX
         7fGmJau1bsDZbyRflB3DU+tkG6tCEtLnv/MlMp642VglH3V9vXcLv+x18mAiK8YJKQ9y
         dZE2oZNX38SPnFRn94RnBTkfY9sXlgWgF3kpATWHP19f98hGuBYOC6fj6ZOmbN1aJpF9
         I7x+oo31zu0OQ1yVRIkf4sBKVmGnnDdLnaRwhp7aX2LfjXWnYe4ZH8Mw0c+otJmouNEM
         +YrIEQwq3/RL2Ev3op72M7yIWU2Ap9zNPTuZaLawGsiOSiSvkWhn2tyGHtH7kZ9RtuTX
         1w+A==
X-Gm-Message-State: AC+VfDzjRHKlfQQ76vhevYBsWxdLp/tlRsYYQvlAEgeno1BmS1Zy17aW
	HHN4DQGo7Llg+9V+iojym1k=
X-Google-Smtp-Source: ACHHUZ78e8aWw5mYmh7dTuHHV6lAjpYMYlKpnXW26CWTb45fLRd/NUafiy9B/9qFUCG0CUV5EcoWJw==
X-Received: by 2002:a1c:4b0a:0:b0:3ee:96f0:ea31 with SMTP id y10-20020a1c4b0a000000b003ee96f0ea31mr375663wma.18.1683272839493;
        Fri, 05 May 2023 00:47:19 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d5648000000b003062cdc6ac5sm1482198wrw.89.2023.05.05.00.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:47:19 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: robh+dt@kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Date: Fri,  5 May 2023 10:46:51 +0300
Message-Id: <20230505074701.1030980-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_004721_732439_37ABF00B 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
This controller is already supported by sun8i-h3-spi driver.
So let's add its DT node.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..d2de211d67d7 100644
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
@@ -447,6 +453,20 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		spi0: spi@4025000 {
+			compatible = "allwinner,sun8i-h3-spi";
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
