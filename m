Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F721CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AYAlR+xUPgJFXFZRhSdiR7hZaYUd03JAtv8BRWjGWU=; b=M8BV+OKuZ4HsB3
	1VOfkGnmCuLB4u01jy66Tuj6BSvffERQhA1IIfn0sc+v97drEgH7hyfwv42UgILCh6pY27r996pC0
	IsJYHTQHHml/Nw8WX69uJ6WzjBWg8shBmDE/K+w0vAiiS2k9VqLTjzEf+YUEIuiiA++prO4DMIxhy
	OBm4HnFzAc6GWs1/iCFBbz37iTUrLmx2qK6FLZDkAjBzD50p9Uzfel16aqY0jzUpI8DqRLZdzMp/C
	3Vy/QCKJE/FNqO68eEDMVylKFa6S1qGSQfv5v+CTOnTs7eb/Lrwv32BWeqdzNBBkVCTiNB9kF4DQl
	LJYNMc4obIn88qvtDghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdWA-00000003RVS-2obr;
	Fri, 19 Sep 2025 15:59:26 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdW7-00000003RS6-3GSu
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:59:24 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-887764c2868so179411639f.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758297563; x=1758902363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo7s49MWiPP0XpbU9jJjL7SpuVNC45j91Je82FzACGw=;
        b=EqczBuuuZToJIcArrCcII9kIPllocPzrXqJ8hJPmnlD/yLKsqzB4NLTdabhrK27Fpq
         rwGsr4YRrQmmFCLKdTUvR70HombggLmujBRfYNoSKcva43kae1pUKDVzvie+/2OD89KD
         BU+Bn7rxA2ap8+py/nKvoAiZiNVl6fuIZTyBi81Hj5cwv2ICaArHNfJwUQekFFNBdEwj
         EKMbUqy8EqZCqCxuAtuT5+u2X2pa95CB8VScFmcbg6f4+uhEkYFqsmRqDtXtVDmtx/4N
         LFK0oGJf8mHISOSzpywBH8ZwvjFbVXZCqFE81vEVWxv2meSfKoAqEiNW7zXZncsTAi21
         7k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297563; x=1758902363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo7s49MWiPP0XpbU9jJjL7SpuVNC45j91Je82FzACGw=;
        b=bgyQyAEscP03UEnryPPq/GLsIesNKXcux03ZV950Cc1T8Shy24+LzynJ3r2ARGiS8O
         w2Ap1J9NXZ9AjK1KB8zy2NUwR2/HzA9T+tCJyW4Lqt36nG00fQvb8zOg3keLQNu4PZqP
         9mw4FJ+C1Y7nnln3FMSef0osoab1+43OaHixoI9Fq71hhF5AQ7MDMm4Z2NtQ+79cYxb0
         93LYfALX0sEVhGIepYxhR0NsNYYfxTUswohUOTsOgH5mIfBssrfMSJ1lgPZboZlH0eqU
         DhkX1RHT3RtXYDA5Zd6kgkRCVS6NukCLWgFlJESi59dvAI7DnbKBgjwTp8kKbZIdy/ig
         3sIA==
X-Forwarded-Encrypted: i=1; AJvYcCVRSwzyGkFtHFHEJBBcTMBl8X0ClODs+fRdVrWMMFBfUeE0cOBtgCpsEvRiH5wgdEVBJGQzreEJrb+Zjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGC0eHkwW+QwqYPCc9McHwsb351gcnce7BCCPnqq5MtRC/9keQ
	YePPpT4VmYx4VEC7sjepq9i6jvuQ50kWPAF+1RoW+2/5WCHjKtzQzcGh3SHPqFJYk0A=
X-Gm-Gg: ASbGncuLcT2C1y+zAy17NEfOPtC7ZP3fmkGip4cECEnBVEebyQ287M6fYOM0Nm9gSMU
	EqBge2OBmAyrB/6FF8Z8leLNMtVZjgVtrKkYwi8ZTYMLbywJz5QUC4rG6fisuWyZf483Rl8f2z9
	FpH3HfJbm5Yk3sS061RI+odxtjI85K4KwmlgSeGSbU036U0NDvjupkzjAhod5zjOjurdXVtsu8t
	RH2G02fruxVCLnB5pezZcmNW6AnxiYjbcMo8MRMueksk8HOjCJcWKTDbPQkrbWotOrn5o5jOGbW
	S+honO6keewRk40AUZx1SmIx++5kelHaXdFNA9WzbK9eM7jEB8MftGlVvm7CAPx9+fCAe6sghQ1
	PnFq8x6D1ng0XYjFpDd84VEqaiW7Erum2wiT146oBWl7rUlS/lzJds7cPt9oMZKoVDg==
X-Google-Smtp-Source: AGHT+IGv8Gt7EaPcdotr9gY5Yd6METFFETdEj+xRnRLa13tdcKb2eRmmBl1GTwt/NGaaW1sg3ZmbBQ==
X-Received: by 2002:a05:6e02:258a:b0:423:fdc4:4e35 with SMTP id e9e14a558f8ab-4248197e1b4mr55249165ab.24.1758297562539;
        Fri, 19 Sep 2025 08:59:22 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa460bsm2250898173.52.2025.09.19.08.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Fri, 19 Sep 2025 10:59:13 -0500
Message-ID: <20250919155914.935608-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250919155914.935608-1-elder@riscstar.com>
References: <20250919155914.935608-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085923_826019_F86A003D 
X-CRM114-Status: GOOD (  11.99  )
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

Define a node for the fourth SoC SPI controller (number 3) on
the SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - DT aliases are used rather than spacemit,k1-ssp-id for bus number
    - The order of two pin control properties was changed as requested
    - Clock names and DMA names are now on one line in the "k1.dtsi"
    - The interrupts property is used rather than interrupts-extended

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..d9d865fbe320e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -92,6 +93,12 @@ &pdma {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index aff19c86d5ff3..205c201a3005c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -76,4 +76,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-no-pull-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6cdcd80a7c83b..f8c37d16968e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -856,6 +856,22 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>,
+				       <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
