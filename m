Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C18AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=La22W48senEp6EZWdbk8IrXQ+MmSu9Wt+3pWPs54Ogs=; b=GJw8po+gaHFlyJ
	YO5W+C9Je2H+CVdMxZbMtTYjageb1RSTJepwbR0sooF3dna3Mr/KxgVfqq38MXk9z2/N3uf35J4Hr
	t5WjwVuN1y3oR5DbY+nLS4P1gWBk/CYvdPW2TWq2Pli3Kd6dEFd7u6wqtuVgcHA6H5HJ7GWbkCEGN
	FbWO+nUPXH08iJmxlv4HkWx8LFuB8WXmnUTJOAwnzhtKnOby1/LwMzqNftF7i/ilt/Nf25K2l/OKf
	yyjmbMOcMOiCwZuAD+zdJtbTYkqPXq2jfWpcAMhymkXGVWfeAsWgUfTMxGXr3O+Ap5Af6BaGchHgr
	vL/Ot8UKi42mstNz955w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4mq-009TQT-UC; Fri, 04 Mar 2022 10:03:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4me-009THv-Fj
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 10:03:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id z15so7216152pfe.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 02:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJ7+kaESGdNAzAImLBta6phpylHoIMJb1C9yUH40IE0=;
 b=XRvdFl7el/25PA7mmFcR0nR9j3sLUqN75EPFgUDfUYA4aIAEHPsbE+uakszi+zi3FK
 UFa23RawxMsgEyvSS7qMPT+T4yEDukMlYqwgEhF+U8ic2PbC7MOaKz6//nzSZGV9ww5B
 VIGGwpGOmx1ECCUAn+KfOck1FjqZ9HAAtYji4WQgcbfMjnlwVQ2jOUJSdJ6x5Lv/s4vl
 W84eu+JybUxJg+h0nAYcNLgUrUhsVI9lOrjc7Ae8I4RHWyEXxa29owvqHgRodRfxyGx7
 KpitxF3S0WNsajmQMenx3c+9EhjXZypOKlGyOYqmadFIm0Rj9gjHOmuUEvHC/suPr6C1
 Fwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UJ7+kaESGdNAzAImLBta6phpylHoIMJb1C9yUH40IE0=;
 b=Kjt2gtV+qGMQSciJbuXaZcGsmjaDTYARg2zvAaDV/a/QABCFKUy2jcc1g0yridr/BB
 6vemZAQx2wYl0lGw41TXr4eJ/lDrju+84EnzLfQ0GucxSeWpNx4rdkvZB4gPycAB3G6N
 vWl1HaE3PnCm20MFxaIBQAtI/DkUnO/eXhN+Rd4qMo36+xCktZf/JvpgC2TX0X4x3Te6
 lopcardvLQzzObQ7ckXMCctIP/Wjz89gbszd7I3n+B+jlJ6alu2VeEzI6iU7saJaZHsY
 hqz1HvlTSD0ZyzO+4Vq6fuhN5r8v3hBoZ9PC2wm+FjJHfuYoKY3ZcV9xxMNcuj3mCUHX
 vBqA==
X-Gm-Message-State: AOAM530U6E2XSgLsO2WGWWL55PZgUZ9ScUjCcB2MGT0cmKCAv6jHy4R2
 AAzxVzpPOMu/sNiy8kSrVjK4sA==
X-Google-Smtp-Source: ABdhPJx0WWFoRPseHrDzlawbRLombRu5TBWXnZU8CJ5ltfuldD5/terJjgVkeo1JnwVVL7q6K2w8hg==
X-Received: by 2002:a05:6a00:1c46:b0:4e1:82cb:e39c with SMTP id
 s6-20020a056a001c4600b004e182cbe39cmr43032010pfw.18.1646388215245; 
 Fri, 04 Mar 2022 02:03:35 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a056a00174800b004f26d3f5b03sm5461605pfc.39.2022.03.04.02.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:03:34 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 3/5] riscv: dts: Change the macro name of prci in each
 device node
Date: Fri,  4 Mar 2022 18:03:19 +0800
Message-Id: <db92d209fa700f7da8bc8028083476fcc138d80e.1646388139.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020336_585471_24E3FE62 
X-CRM114-Status: UNSURE (   9.59  )
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

We currently change the macro name for fu540 and fu740 by adding the
prefix respectively, these marcos are referenced by some device nodes,
they should be modified as well.

Signed-off-by: Zong Li <zong.li@sifive.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 22 +++++++++---------
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 26 +++++++++++-----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 3eef52b1a59b..aad45d7f498f 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -164,7 +164,7 @@ uart0: serial@10010000 {
 			reg = <0x0 0x10010000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <4>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
 		dma: dma@3000000 {
@@ -180,7 +180,7 @@ uart1: serial@10011000 {
 			reg = <0x0 0x10011000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <5>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
 		i2c0: i2c@10030000 {
@@ -188,7 +188,7 @@ i2c0: i2c@10030000 {
 			reg = <0x0 0x10030000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <50>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			reg-shift = <2>;
 			reg-io-width = <1>;
 			#address-cells = <1>;
@@ -201,7 +201,7 @@ qspi0: spi@10040000 {
 			      <0x0 0x20000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <51>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -212,7 +212,7 @@ qspi1: spi@10041000 {
 			      <0x0 0x30000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <52>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -222,7 +222,7 @@ qspi2: spi@10050000 {
 			reg = <0x0 0x10050000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <6>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -235,8 +235,8 @@ eth0: ethernet@10090000 {
 			      <0x0 0x100a0000 0x0 0x1000>;
 			local-mac-address = [00 00 00 00 00 00];
 			clock-names = "pclk", "hclk";
-			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
-				 <&prci PRCI_CLK_GEMGXLPLL>;
+			clocks = <&prci FU540_PRCI_CLK_GEMGXLPLL>,
+				 <&prci FU540_PRCI_CLK_GEMGXLPLL>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -246,7 +246,7 @@ pwm0: pwm@10020000 {
 			reg = <0x0 0x10020000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <42>, <43>, <44>, <45>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
@@ -255,7 +255,7 @@ pwm1: pwm@10021000 {
 			reg = <0x0 0x10021000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <46>, <47>, <48>, <49>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
@@ -281,7 +281,7 @@ gpio: gpio@10060000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&prci PRCI_CLK_TLCLK>;
+			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 8464b0e3c887..7b77c13496d8 100644
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
