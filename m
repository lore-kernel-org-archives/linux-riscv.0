Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745FBC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRjWBR8n5yOM2GhbY4VIhRRx80p3489tBlOtI7hKJE4=; b=Lu5MJJis4gzHXA
	vBvBKz1KpMhWkdn3RyZIhlhD+29DdN13fQ21QFmEzvkW+TrIC0dJ9CsPNsL9IDMBf4inM2xVmmxkW
	ccpT3Hg6UcSAZP0kaNUEUVxygHYeW9UC0E4ECBykQKNHEbbSwHyP/xYuyiS5tLN6EAqtfbeTI6od2
	sfojKTzUNhnu8b/aAtuSJKHgQayVL1fhcAvUIaMzugQMx1OkJAWJ5cVsSaKhLaku8GUgE+RYfr95v
	AnEsUzogdCWSURwPVKk9sYdgb19eIPh7B2PKwlbw9H1lAp9OyELZWT4F8WxC3nlW5Ug8XoeSLUaeM
	6jQeP9rWNMT2ngDla05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYd-00Ghi0-1l;
	Sun, 26 Nov 2023 23:28:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYY-00GhcH-1g
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:56 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E97DE40C59
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041332;
	bh=Hegf0srFkbsTjzBuIfrKZwGyBpbOFAxXtDxYBC/BJOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ibxx9gBNjU19M/qmhJfTLYXswzXXpdUubze7JgXD67vOLDRn9mjT9nhJzcz0yVAL9
	 ohCu1+MACH6hh0XkJxFHNVEH7SAsp3Q9zfUqIvjl4g1jSTrxWoWzaiYetvFxAHgLO3
	 jYJQOG80ek33gSUrcX0nRzb3wyJZmtk07912x1BZtekveUn7uEfzvOaC41a+AZsiej
	 95OBkXH68OnWg5sK4K0h78My83wBi83iL102csUiOcwl2PKf7yj6yP4O/ff1tYNRdB
	 rTWV0Kxrw+J5/UwaB/OXgU7hI+yQI24gQ6oSQhrPNnaO5h203nh/zjh2NAG7qecGmi
	 7uxLz0BY+6Izg==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cf8b6db1a3so35492315ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041331; x=1701646131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hegf0srFkbsTjzBuIfrKZwGyBpbOFAxXtDxYBC/BJOY=;
        b=vF0i64MRfYqUXPe9OSbd/KE1jjGF6KKWgnjWYa4im9Mivjyi49+S1D3xaoo2mQjuUP
         BO24z4nNNo69WA1bXdoWyHEvdl1nggt3ZNtvR6wtRANX6+cw+d8adNGWjM0DhhxeTejD
         2U2+NEj8u1QVRPMEikMDRlo50EY+rxe8Gc3hzm86py8ggXlLpclbHSWSyYBQ48u21wgj
         1cFRq2xmE9ePhYl6UGVeZha0HJdlUmGnPC1ChrsOFVBhwW5oigOSDQ3G8kvP9OGibqt/
         Xbtlo7LYPeDkzkkAIctuwW2Utiq3E4NKmcvQxssFDzn/L2PhPRcweYqEc28KuJfIrqEp
         p4rQ==
X-Gm-Message-State: AOJu0Yy43cvczBB4nNVh/cXWPpwH6vw1KjlvE2iYWdxm2RIja3ZeJexK
	I8rBqNhhWPkwR7sZnDH+c/iw3dycjHnfrviKbVj6bljCU2CJ3tETou/hwyjlKlqOB7dqAJscS/a
	E9LuDlIKXKLbNxCA8gi7GBXtcqqUf4eHvkm5AmIS4zhrtQExvzo+s1A==
X-Received: by 2002:a17:902:ea03:b0:1cf:59df:23e with SMTP id s3-20020a170902ea0300b001cf59df023emr11103468plg.12.1701041331227;
        Sun, 26 Nov 2023 15:28:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTrvuPPoNzP+py4XqmHD9XiUVxx+5MXIw05g3Cwx+D545lG42EnF9hasXsueZHE+8Z2rIDwA==
X-Received: by 2002:a17:902:ea03:b0:1cf:59df:23e with SMTP id s3-20020a170902ea0300b001cf59df023emr11103454plg.12.1701041330967;
        Sun, 26 Nov 2023 15:28:50 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:50 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] riscv: dts: starfive: Enable SDIO wifi on JH7100 boards
Date: Mon, 27 Nov 2023 00:27:46 +0100
Message-Id: <20231126232746.264302-9-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152855_186222_93EFAE9A 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
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
