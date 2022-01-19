Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC50C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4oFOOtJoWln3AOVZZRddfaU+3WrwtoZvQQPUL7V6vA=; b=Pk+2h8YK7ChfpP
	wzjjFamiSMNDp0dycoeCIe9BH2IGPE/h9O28hNXcuIWGb6XzWp+nor7xfTvy7cMuVLwyClKW0PJpr
	3kTlYpa9ZesQXYrV83+0WmeJxFGyd5smJ6tqlbEz2iNdDsiBnYTkq9EkML+QqSdpPc5hW2eaWzKie
	obcfO9Y7zMZ9KXVXAsAwpn0QXoTNqXIzlEwYmj8lc/agZfXIbsZXEM7NnRs7lG9FU9znpfD7cjPcp
	taLhzbzIIRAmx7zuU1L600ybBbmEsd9QVElwTS04sYKEZ1EU2i7cuO/nr5RRE62CZ8W+7MDx5EXtk
	ZzA6WDu4LwMr/RVIngiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7Gy-004ZVk-Id; Wed, 19 Jan 2022 09:28:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7Gv-004ZTt-2A
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 09:28:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so5471582pjj.4
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 01:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGzy72cBy8q3QoMMfk9rf9092X/LV52O79b7490IvWw=;
 b=AtgQrTUczMIMQUipglTkI8AWI4DjbJ+/GqM17+qNCjHzf5n8/sRUIidTCHiGxomHPv
 kiA3WNasGS4900BTOoKxjibCq0OwJjHWasP/je4PmmTXFK5EUTnM+TnmxF83XTVMDHWy
 0EaWMSwcknf98h73btEO8l6JaUKKloxKyzk+4jRr4AVzkTZPE4pczzuQmlCSZup3VdYv
 xRqBC4WJ2EyIKvHCaXvF4ijzaB4YtRrqT1YbToaLQqgjcN5N9WChI/wVvDPB8VHuxHXE
 OYJgK5fRG8jAZLBBfKGA68jQ4t87ErB283e8z/qbPvAKAwz6KW2smggAhuA51mwdw3P2
 zNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGzy72cBy8q3QoMMfk9rf9092X/LV52O79b7490IvWw=;
 b=MB3Ax5asSWcL7v34ug86n/Ry5pqcxA3F8SQtfBNa/8gHSsa4P2qQcJDHn+w34YbTUm
 8wkQEsB5I5teEVm6BEjfLRVFrNojGeVTvmh1Hif9g5hQZH3MSTWITwEbnSvI0XU9vDxt
 bEiegS1Q+Y3YVQ9yp0rbL3dGbUUYyP2KzBxulVFTwrh/fxc4pNnnBZjVxg88atmKK0ZG
 y8ZuKjMiP+1ALX+mTJXGAh7AaGi0HTYp02NhHpy8KbW30yew+XDY2rH9D5y0fdKcZuuy
 2X8i2B+QfnEX3mHXURpFMyi7Bs0s/0KZifwsEamtWM/fAhV+rOBLxNjT2kzjUZxd4z4x
 SflA==
X-Gm-Message-State: AOAM533tsZDrZZ3U7gbfIyMmFs6nfS6SxZwWE/+pm6pav+pLWdWEA14R
 PR+7g8XHq0EARE/6E8webjrcEdu19ZPHAJXm
X-Google-Smtp-Source: ABdhPJyUVt/+ZYkAZD4B7sNuS8ouU+0YAij+3if5+BgdA09MuCCq7wa2y8149KYI05FoODsf2J9zoQ==
X-Received: by 2002:a17:902:d2ce:b0:14a:9f24:879d with SMTP id
 n14-20020a170902d2ce00b0014a9f24879dmr20008437plc.10.1642584531838; 
 Wed, 19 Jan 2022 01:28:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id y8sm1415894pfl.207.2022.01.19.01.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 01:28:51 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/4] riscv: dts: Change the macro name of prci in each device
 node
Date: Wed, 19 Jan 2022 17:28:39 +0800
Message-Id: <2a58807f83f24ee1a2707ed71244c7f52d2228e2.1642582832.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642582832.git.zong.li@sifive.com>
References: <cover.1642582832.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_012853_150313_33180313 
X-CRM114-Status: GOOD (  10.13  )
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

We currently change the macro name for fu540 and fu740 by adding the
prefix respectively, these marcos are referenced by some device nodes,
they should be modified as well.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 22 +++++++++---------
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 26 +++++++++++-----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 0655b5c4201d..2bb88e06e3e2 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -163,7 +163,7 @@ uart0: serial@10010000 {
 			reg = <0x0 0x10010000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <4>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
 		dma: dma@3000000 {
@@ -178,7 +178,7 @@ uart1: serial@10011000 {
 			reg = <0x0 0x10011000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <5>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
 		i2c0: i2c@10030000 {
@@ -186,7 +186,7 @@ i2c0: i2c@10030000 {
 			reg = <0x0 0x10030000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <50>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			reg-shift = <2>;
 			reg-io-width = <1>;
 			#address-cells = <1>;
@@ -199,7 +199,7 @@ qspi0: spi@10040000 {
 			       0x0 0x20000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <51>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -210,7 +210,7 @@ qspi1: spi@10041000 {
 			       0x0 0x30000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <52>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -220,7 +220,7 @@ qspi2: spi@10050000 {
 			reg = <0x0 0x10050000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <6>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -233,8 +233,8 @@ eth0: ethernet@10090000 {
 			       0x0 0x100a0000 0x0 0x1000>;
 			local-mac-address = [00 00 00 00 00 00];
 			clock-names = "pclk", "hclk";
-			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
-				 <&prci PRCI_CLK_GEMGXLPLL>;
+			clocks = <&prci FU540_PRCI_CLK_GEMGXLPLL>,
+				 <&prci FU540_PRCI_CLK_GEMGXLPLL>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -244,7 +244,7 @@ pwm0: pwm@10020000 {
 			reg = <0x0 0x10020000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <42 43 44 45>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
@@ -253,7 +253,7 @@ pwm1: pwm@10021000 {
 			reg = <0x0 0x10021000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <46 47 48 49>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
@@ -279,7 +279,7 @@ gpio: gpio@10060000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index abbb960f90a0..38fa29db8a90 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -166,7 +166,7 @@ uart0: serial@10010000 {
 			reg = <0x0 0x10010000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <39>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
 		uart1: serial@10011000 {
@@ -174,7 +174,7 @@ uart1: serial@10011000 {
 			reg = <0x0 0x10011000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <40>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
 		i2c0: i2c@10030000 {
@@ -182,7 +182,7 @@ i2c0: i2c@10030000 {
 			reg = <0x0 0x10030000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <52>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			reg-shift = <2>;
 			reg-io-width = <1>;
 			#address-cells = <1>;
@@ -194,7 +194,7 @@ i2c1: i2c@10031000 {
 			reg = <0x0 0x10031000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <53>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			reg-shift = <2>;
 			reg-io-width = <1>;
 			#address-cells = <1>;
@@ -207,7 +207,7 @@ qspi0: spi@10040000 {
 			      <0x0 0x20000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <41>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -218,7 +218,7 @@ qspi1: spi@10041000 {
 			      <0x0 0x30000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <42>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -228,7 +228,7 @@ spi0: spi@10050000 {
 			reg = <0x0 0x10050000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <43>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -241,8 +241,8 @@ eth0: ethernet@10090000 {
 			      <0x0 0x100a0000 0x0 0x1000>;
 			local-mac-address = [00 00 00 00 00 00];
 			clock-names = "pclk", "hclk";
-			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
-				 <&prci PRCI_CLK_GEMGXLPLL>;
+			clocks = <&prci FU740_PRCI_CLK_GEMGXLPLL>,
+				 <&prci FU740_PRCI_CLK_GEMGXLPLL>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -252,7 +252,7 @@ pwm0: pwm@10020000 {
 			reg = <0x0 0x10020000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <44>, <45>, <46>, <47>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
@@ -261,7 +261,7 @@ pwm1: pwm@10021000 {
 			reg = <0x0 0x10021000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <48>, <49>, <50>, <51>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
@@ -287,7 +287,7 @@ gpio: gpio@10060000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&prci PRCI_CLK_PCLK>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
 		pcie@e00000000 {
@@ -316,7 +316,7 @@ pcie@e00000000 {
 					<0x0 0x0 0x0 0x3 &plic0 59>,
 					<0x0 0x0 0x0 0x4 &plic0 60>;
 			clock-names = "pcie_aux";
-			clocks = <&prci PRCI_CLK_PCIE_AUX>;
+			clocks = <&prci FU740_PRCI_CLK_PCIE_AUX>;
 			pwren-gpios = <&gpio 5 0>;
 			reset-gpios = <&gpio 8 0>;
 			resets = <&prci 4>;
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
