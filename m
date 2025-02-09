Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB36C02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnY2WbFqfV0YMAmoVJZ1rNKNxI1N7yIc/ZRHQgq0BgE=; b=wMiseZVV0+tQnG
	mskgRwYMPbek7dpOf6tUC6a/yxc/pbOnuZoVxMeFY6GyNr5IUsOGDI82qdlyq98bO1pJ1S6SN/Nol
	UJeokQPUd8mWOFZtwS0QqqzemOXyKiD5MkRlQMgk0VzLKUW0YFKOAGzS/QUkxR5a7T4uxLqtUtOOg
	HethacqaysZG0EfoaeEUikFEDiH/G+9+pVWk246+RyfIp6ew3nSD5ZQtu634bl5Y23lbCeCuruc+d
	hsoSz35gahAbIO3DckCjbQ4/ko/kvettZH7kIU5xdklX/t6qUC9K9IZIA9OWLIh1rpjmmOZBfiOya
	UjkzWWvk9omElW7zERig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6cs-0000000EstP-3Fwg;
	Sun, 09 Feb 2025 12:41:30 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Rt-0000000Er0M-1o0c
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 12:30:11 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c053a2118fso93505885a.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104208; x=1739709008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP1A8Q2/YJDkOLyvGGNH2HjOHurUFBz6/G+d3BpXgt4=;
        b=EsLjQyyt3bu+BRykbYSoaSt33hPsN5HzwXfXgBvoXNm0/CklnSFfi6UonyWDwt5jlS
         +VEKFR75nfQgMGRFy3qnaoLd+ISS5T39nOWzN+cgBUvHarcACXwAMmQIyc2JjEVKweIb
         92kzy9jo3YUX6gXQUcfOX2t/nojYVZ0wi3xLkFMX8iutOwchqvVuYD3cbuN9CpwwHeNC
         hNiyk27JfzyqFCrWXMHkxO7JfySJw6xA68PFUZc3S4gGxm5VS7QGgCwo6JAAiqOVKsBv
         FZxtxJMkMfp2RaTFHNEs1aaM3ueQX5QPHFq/hL/6vQXF3Wbz6QMmvdbCigTBOz+YqPu8
         Ngeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104208; x=1739709008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aP1A8Q2/YJDkOLyvGGNH2HjOHurUFBz6/G+d3BpXgt4=;
        b=SfRrTmLdB/kJn3yQq2ougD/UmxTpOSNQGzix5f8WZklmAf7ILI+AgqmmSWlVoaqT43
         sSAu19BtEMQFZFKYKnE7rC3DthY4Pymiw9fgEBywnw3n/0HNleM0BVIu0to4gdntOKas
         gcOOmcWLGzTE4hDejT+/Xdy2OuHq4Saj7A7Tg4STpyCO24rxYtLQKHV99dWpbJduXsyR
         D5dd6ngL3vyxvNf1HEuajx3cV4u2KrqJ7k2xuitswrbuJlEK8ZOIl7LxO4dT8/6Izgek
         cItmY4tzS1DeTk3/Tr3cKPkLZjSOZwpMWSiCUy2n/RHSPC6kFevwKytegV0aOlpWKkLF
         BacA==
X-Forwarded-Encrypted: i=1; AJvYcCUBME9HXH1seFM860cSacq1VwVEeoPuOJLigRfmF6AjXZ/qgT0VWjKppR4jpYOEKoOBNn6nGRaEDeFIXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU37DRuXYsIj8I/1/1yZwfDxwHS2vp/+8CSRQ2GkC9NBqicMnW
	LuzgoRWOePQ97z7LVrNR9Zn2AENVH5ptXFimUF8aSLXhgTge2eHg
X-Gm-Gg: ASbGncvP1m0J8YK6JS6H2RlHGYG5wILP6b5TSteSN/9Nl95QCAxGGo8oNhNb3xZiRP3
	xmWRuXcBDsiKlNFTjFoSfp5eiGiEIoz9p+zLwlhSj9BBZFHpa2OmltNsXqHfuPrue8d2YZRPZ7i
	GhAcOOPcqy9kcxL50eVhQTDD1WPiZy78tYwBYOl0mObpArgWTpp1Uy510aw0Wh2tkWvfir8RlS5
	H9R1o/XFGvavYmIv8PLW2vvXvIarx6Xiq/a39Ek2zHEqpcJAQ3GMgg/jK1oKmsirYM=
X-Google-Smtp-Source: AGHT+IFu1jYq9+NbSFutpGnGyGE/BrJDPjC+jrFv/p8XEYF0RMJ1EQ79hjJ8gTYNpFdDSrlVeRta1g==
X-Received: by 2002:a05:620a:bcc:b0:7b6:f024:3ca with SMTP id af79cd13be357-7c047c9b512mr1423267085a.58.1739104208110;
        Sun, 09 Feb 2025 04:30:08 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c05a703d71sm65376385a.46.2025.02.09.04.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:30:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Sun,  9 Feb 2025 20:29:35 +0800
Message-ID: <20250209122936.2338821-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_043009_482286_0746B00B 
X-CRM114-Status: UNSURE (   7.79  )
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

Add already known reset configuration for existed device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 9aa28ade73a4..4fadcb8e4359 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -170,6 +170,7 @@ i2c0: i2c@4000000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
 			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
 			status = "disabled";
 		};
 
@@ -181,6 +182,7 @@ i2c1: i2c@4010000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
 			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
 			status = "disabled";
 		};
 
@@ -192,6 +194,7 @@ i2c2: i2c@4020000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
 			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
 			status = "disabled";
 		};
 
@@ -203,6 +206,7 @@ i2c3: i2c@4030000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
 			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
 			status = "disabled";
 		};
 
@@ -214,6 +218,7 @@ i2c4: i2c@4040000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
 			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C4>;
 			status = "disabled";
 		};
 
@@ -225,6 +230,7 @@ uart0: serial@4140000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART0>;
 			status = "disabled";
 		};
 
@@ -236,6 +242,7 @@ uart1: serial@4150000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART1>;
 			status = "disabled";
 		};
 
@@ -247,6 +254,7 @@ uart2: serial@4160000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART2>;
 			status = "disabled";
 		};
 
@@ -258,6 +266,7 @@ uart3: serial@4170000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART3>;
 			status = "disabled";
 		};
 
@@ -269,6 +278,7 @@ spi0: spi@4180000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI0>;
 			status = "disabled";
 		};
 
@@ -280,6 +290,7 @@ spi1: spi@4190000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI1>;
 			status = "disabled";
 		};
 
@@ -291,6 +302,7 @@ spi2: spi@41a0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI2>;
 			status = "disabled";
 		};
 
@@ -302,6 +314,7 @@ spi3: spi@41b0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI3>;
 			status = "disabled";
 		};
 
@@ -313,6 +326,7 @@ uart4: serial@41c0000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART4>;
 			status = "disabled";
 		};
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
