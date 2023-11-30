Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C606CC07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6l/+se5w/VHtru0eWazUqy5Vdjfvq6AXmUV5NZWkJQ=; b=vLM6k+tGQtPMP6
	DbPQHQDXSePYq+JUK0/ZpBsmd5AejeNQHYL7qpF71n4WKgQ+KadbkWKifBo5K3t5QAobV16kyMuIi
	AgSBAtQ4WaF0X2ISRQvs+6O7VqZi99B7ldSR4rRdI6mKL1bU9Rip8VLNQfWGkFwcRugMh4eOHcLpW
	aiuz5bt10KGoWuS2oBdKkuaAEt2l0GufgzcTYA+6vnSuJ5Ij6MwUMlzjkxCemFmBKIp/oHFacaXaI
	7W5yOT0LTrk40dO+vMAc2HhPZtAWjhO9JQ4TUlDRHE0xQJnv00hSNZtGK3ZATZrZQQW/cnYOp0N6K
	sbCWayiyX9smtWhcoiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iqH-00BBsc-33;
	Thu, 30 Nov 2023 15:20:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iqF-00BBql-1o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:40 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A196F40DAE
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357637;
	bh=3BV4Vz9z3QHFiX3Dv1bjv4P8f3k40Tur0+jRMIWhjwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=FmlErw+HiaJMs1JB12hxFfs+q4OSvVMt2YJ1zQmak5jfXG16EPwsA8OSLEwJYVmbo
	 J/VTYDyTQqhftDJLqBV0i9KeFJ8VQj/x2ENl8C0gG3ctq6hQBiEyhbkAgSlY81NDEX
	 ashAC0L9xZY8z4WhhQmrhusk0aOD3+/bCbwd+YDeg62xxgRZQAwySSBGabrFczWrCN
	 Z5/6BU4WYgnRkNsn7rI8MLRO0QqbzMzzLUHoqZiS7C/pBeVCvMPpe6HMEpuaqDPb6H
	 2px2A4/nQNm1+VJSKasGDdRyBnrEyuQ043JHAh0eubkqVKr0Vz4kLU6pQt06m2UG/R
	 ZVTktMCDeyvSw==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b2ecaf68dbso1198326b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357636; x=1701962436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BV4Vz9z3QHFiX3Dv1bjv4P8f3k40Tur0+jRMIWhjwA=;
        b=azNXtJ06fhU8HyKL4xsj6TktzLIVgITOfkH/aSp2Gn0kdJEc4WhjwBgBJPbY+ncLX7
         ZCwP7nlOj+wTh5v1ZnBzUzMdFD4kCyUNoDhZSTJNLIwwDiSBJ8PRRCkhZNPmgXjsPGCr
         Q/T0hsT13ZWytC2jplg7J1QwaSzuPz7ykKOTpmd84OyS+KkhDMZLY+0cxzwQZAB8LSqk
         iaid1r1vfdvAFoqSzFYLnUqwON7GUFerOOLZK5XdNlfgRmEDzfOs+v3x+OVFehT/iz3k
         qDZeK+pHxI0QSSk6mZSc4NQcLo4+iHwbPj8Md+LLoUSWslcIneZZHLgaR1kvDG9dWC3V
         rY/w==
X-Gm-Message-State: AOJu0YxBTcemBZW1ea7MNZt9GL/3C0iyF/BBG7Opw66l+cAhMDNyyGsU
	nO+9Itk3lb/sUvbTkAVLH9RphbGV6+dEyIcOLiUn30VpBp++ySSorZNZjetugc09WFjSOsGAJIt
	Lu0WlwBc855/s7lR2MPtvnl3rDp45FUOWnXw00nY599wd62OEqaSRpA==
X-Received: by 2002:a05:6808:e83:b0:3b6:a7f2:f1fe with SMTP id k3-20020a0568080e8300b003b6a7f2f1femr26367628oil.47.1701357636382;
        Thu, 30 Nov 2023 07:20:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2rYNqi7HKvMn1CUtmkwOZKqWlU0WJNU5JfZrmmn+Bj6zgpLKPHoDP66fIgr2qToAWBfFRIA==
X-Received: by 2002:a05:6808:e83:b0:3b6:a7f2:f1fe with SMTP id k3-20020a0568080e8300b003b6a7f2f1femr26367602oil.47.1701357636165;
        Thu, 30 Nov 2023 07:20:36 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:35 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] riscv: dts: starfive: Enable SD-card on JH7100 boards
Date: Thu, 30 Nov 2023 16:19:31 +0100
Message-Id: <20231130151932.729708-8-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072039_736081_122CF164 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add pinctrl and MMC device tree nodes for the SD-card on the
BeagleV Starlight and StarFive VisionFive V1 boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index 3af88e6970a3..adcdbbc4f57f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -12,6 +12,7 @@
 
 / {
 	aliases {
+		mmc0 = &sdio0;
 		serial0 = &uart3;
 	};
 
@@ -108,6 +109,43 @@ GPO_I2C2_PAD_SDA_OEN,
 		};
 	};
 
+	sdio0_pins: sdio0-0 {
+		clk-pins {
+			pinmux = <GPIOMUX(54, GPO_SDIO0_PAD_CCLK_OUT,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+		sdio-pins {
+			pinmux = <GPIOMUX(55, GPO_LOW, GPO_DISABLE,
+				  GPI_SDIO0_PAD_CARD_DETECT_N)>,
+				 <GPIOMUX(53,
+				  GPO_SDIO0_PAD_CCMD_OUT,
+				  GPO_SDIO0_PAD_CCMD_OEN,
+				  GPI_SDIO0_PAD_CCMD_IN)>,
+				 <GPIOMUX(49,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT0,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT0,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT0)>,
+				 <GPIOMUX(50,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT1,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT1,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT1)>,
+				 <GPIOMUX(51,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT2,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT2,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT2)>,
+				 <GPIOMUX(52,
+				  GPO_SDIO0_PAD_CDATA_OUT_BIT3,
+				  GPO_SDIO0_PAD_CDATA_OEN_BIT3,
+				  GPI_SDIO0_PAD_CDATA_IN_BIT3)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
 	uart3_pins: uart3-0 {
 		rx-pins {
 			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
@@ -178,6 +216,15 @@ &osc_aud {
 	clock-frequency = <27000000>;
 };
 
+&sdio0 {
+	broken-cd;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_pins>;
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
