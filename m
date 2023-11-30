Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98BFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRjWBR8n5yOM2GhbY4VIhRRx80p3489tBlOtI7hKJE4=; b=xwIQryl9DTMKDr
	pFexcxyX0yv8VlyClGq7IGi9LBqWxOvj3RwWS0Iki1c7Et5nJl2/BRLZXCqVlxhnLQ6B9H52aC8hA
	hEAgvqOV7B90Qa51ceAKzsZDweq8u/kXbaN7+ofVb/C0nXnQmPUeioAjqmMIBDde1em35OhR4cmNJ
	ZldUe0oKtP8hWqPQIba1FikF2vxEVc4RQBAcCiZS2VTZpBktBECZ9SjO98BIWgfpyzRxD+/gF23BD
	cBaL57IzvAD/f9mrfWt+xdvrgY4LAUI5jSiEBgO9n2xCoaSoJBMdq+xLVlAdy6JtOjydcWpdP90yJ
	uA7A3WAxr1z0ehd8oiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iqP-00BBwh-2h;
	Thu, 30 Nov 2023 15:20:49 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iqN-00BBuV-1D
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:48 +0000
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6587042242
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357645;
	bh=Hegf0srFkbsTjzBuIfrKZwGyBpbOFAxXtDxYBC/BJOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=qHbpfnN1bJ1u6YBFbZYoyu86tp+DuZIk0AiK+12vZBW2tCNHHbLDQ+nB65+rpCZfq
	 zXTedK7iDlanZEdDBInrBAK4tuoVonXjtSGgNqSc5eU0ofCBOyqcXFoMFPVGy4gRhy
	 TRL/V5fqUrLZIxBFMlMDD7QPXQW0n2H8aYRndVI/Xrc9Wn5h226fjBbwVEhI4MOIxc
	 DX0Z1pNAV2ODzxWdjphxNKtu1eZ40yeFcLCQMGfb/2HnsbDFQ1fDbKn5TgCy9X0t/5
	 DQdfXafMgyDZaGYqDlPId/P74+fqzKkGtyyrHaRbSRPd6d878euW3rJFB6eUNU2P7Z
	 0OP+cITmE12Fw==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b8339b27e4so1254886b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357643; x=1701962443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hegf0srFkbsTjzBuIfrKZwGyBpbOFAxXtDxYBC/BJOY=;
        b=jdJjniz4Dw55hFCJS3zo937OGS2nLbfarh93EfdV3aaOIy2fEFaCa/AzuwVz9lSdoR
         8kSa/A8H6LeN0UkXjm8w67Cqvf/mWtoykHOw8+9fT5J9yu0PnAdYC0VUeBc61H0J8+lD
         9nA+0rWvDBTzLHA6fsOHYp08vl+Jg3tDZqteyQbJ53b/EDdOmgafZ8rWzcLIxORurqjY
         +w9uNFLfSMSRFPqU6box5GgB1APuGRyrSqIr/XqsTReNu/TIueKUGfxeNnInmNxSUxsn
         WJtIcF9BxfLWXDYA/zKp5Ypqk00fno/Oh1qMBTqKrnFaMgcVrIi0FMTQpRQ9iPSRqiP0
         BugA==
X-Gm-Message-State: AOJu0YzjswoPj5smAlnHfa8OpMxwHIlFy8hasYBKZvl1HqvqhbTy82cT
	IZY2/fFtrVpQeFZbSLg3YXDGgDEIl6Lr7cJNOnDi5gXdiAUL7mtheBKsE1iIHytj7wWRhMuP3zY
	XdmuRKCiRUPQ1Ih5ry/B56WIddnAg3sIr51Fmu2lfVEUSEsxyEWtGtA==
X-Received: by 2002:a05:6808:20a0:b0:3b2:ee79:c0fd with SMTP id s32-20020a05680820a000b003b2ee79c0fdmr31848209oiw.1.1701357643559;
        Thu, 30 Nov 2023 07:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDv33VjZX5rToz283+PZ9me+zUyLCvtTvnVucpd5Vw8rGLY3r7NPHXqlLul8V0jCsywTS1sQ==
X-Received: by 2002:a05:6808:20a0:b0:3b2:ee79:c0fd with SMTP id s32-20020a05680820a000b003b2ee79c0fdmr31848188oiw.1.1701357643362;
        Thu, 30 Nov 2023 07:20:43 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:43 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] riscv: dts: starfive: Enable SDIO wifi on JH7100 boards
Date: Thu, 30 Nov 2023 16:19:32 +0100
Message-Id: <20231130151932.729708-9-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072047_548580_CFB38A7E 
X-CRM114-Status: GOOD (  11.60  )
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

Add pinctrl and MMC controller nodes for the Broadcom wifi controller
on the BeagleV Starlight and StarFive VisionFive V1 boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index adcdbbc4f57f..42fb61c36068 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -13,6 +13,7 @@
 / {
 	aliases {
 		mmc0 = &sdio0;
+		mmc1 = &sdio1;
 		serial0 = &uart3;
 	};
 
@@ -64,6 +65,11 @@ soc {
 			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
 			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
 	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &gpio {
@@ -146,6 +152,41 @@ GPO_SDIO0_PAD_CDATA_OEN_BIT3,
 		};
 	};
 
+	sdio1_pins: sdio1-0 {
+		clk-pins {
+			pinmux = <GPIOMUX(33, GPO_SDIO1_PAD_CCLK_OUT,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+		sdio-pins {
+			pinmux = <GPIOMUX(29,
+				  GPO_SDIO1_PAD_CCMD_OUT,
+				  GPO_SDIO1_PAD_CCMD_OEN,
+				  GPI_SDIO1_PAD_CCMD_IN)>,
+				 <GPIOMUX(36,
+				  GPO_SDIO1_PAD_CDATA_OUT_BIT0,
+				  GPO_SDIO1_PAD_CDATA_OEN_BIT0,
+				  GPI_SDIO1_PAD_CDATA_IN_BIT0)>,
+				 <GPIOMUX(30,
+				  GPO_SDIO1_PAD_CDATA_OUT_BIT1,
+				  GPO_SDIO1_PAD_CDATA_OEN_BIT1,
+				  GPI_SDIO1_PAD_CDATA_IN_BIT1)>,
+				 <GPIOMUX(34,
+				  GPO_SDIO1_PAD_CDATA_OUT_BIT2,
+				  GPO_SDIO1_PAD_CDATA_OEN_BIT2,
+				  GPI_SDIO1_PAD_CDATA_IN_BIT2)>,
+				 <GPIOMUX(31,
+				  GPO_SDIO1_PAD_CDATA_OUT_BIT3,
+				  GPO_SDIO1_PAD_CDATA_OEN_BIT3,
+				  GPI_SDIO1_PAD_CDATA_IN_BIT3)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
 	uart3_pins: uart3-0 {
 		rx-pins {
 			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
@@ -225,6 +266,25 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	cap-power-off-card;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio1_pins>;
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
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
