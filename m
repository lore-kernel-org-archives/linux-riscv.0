Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF134C10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 00:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/wvETsL3gOBcI4AMPibm5PWHsJd3BAODUIn6RjBpiY=; b=miyFtYeI8rBjd7
	a5CD0r4IV9QNXWLU1Am1jqH2OFTZpcmbo5Z/a91oIT2gcGtMmRDrUz/8BtB603Re22LH0c/awMGYn
	tTWPzHmacHcz/oda5vsxetBKBH3SDPt1dM/lOgJG6JjnMpNp0m4ZuqAcdUFe5GXRNBsN7Uqdyep/7
	o5bCzwByHF2DdHxyOVGTk5cBRHPvLSnJDyxLkeX6xEXoBWEjDSXHxkRDq4Gm7icxRMP8wXUjiViEb
	FU/DG7ZGl3kKHRSBGeRd0iKCJ557FKmlFG70NC0UNb3q71JRYmiwms1oKpzFjOkzBatpKvgccMRg5
	3FDYmzYUANCGS3GBUuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAJEZ-005rvZ-2T;
	Tue, 05 Dec 2023 00:24:19 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAJEW-005ru6-2W
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 00:24:18 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b8b6acc3e7so1349091b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 16:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701735852; x=1702340652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7obvGCBMmltBjy5XbnnE2I2O+AT6oEkcBU325Ni1XM=;
        b=Ul5RaYjX8BA65pyDy464CFAypT001kouElek9NjlstksBXvMGdBbuoZRFUSXs/fnYq
         z4uHdONH+ddJZd75ONeAZ/DPDoUp1071XZUpq3ZNVZwkPrn0Lt94vngWOoC7gmdDOSvA
         VWVqEVDTX1kAGKBjzyMoKpGN+rK3GebtAy5wKqDiDAEWJChs9mfWlg2AEEmmYbEbXz2v
         rMj2T26T3faFJAp6kX4aJWvY4ck0EU2Wbu4jVObRnGhTA8LWq415OJ0rqV7Y+B0FIHOJ
         6N2zQ28MYrpKLpoDZdSqGmtGbojUGE0xaIEOKjQNi5EPy/cOaSydxS976W0SNUycQ6aV
         Lywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701735852; x=1702340652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7obvGCBMmltBjy5XbnnE2I2O+AT6oEkcBU325Ni1XM=;
        b=VxiDod5vUJiogcx5OWKZSZAdUNAJMvy9cJTBb4Ejj8rP2pnmrZGTPJC2U07uaEMSA4
         m6tFNC3mAkBDDL1vhP16boL4hW69W8bPG/fB8qH1OdKSWQXnpQ0NvgGM+Gt86NBmO4bQ
         x4cUlkGOwfK1l56Vm//G0mFagP2j4JE/he4kJoqPvr5DMp2rvXq9TaBjc76wfhihzQC8
         M39AlUmVIORzuUwP14+3JGwyw1e+wTyJKyjTw5jhZZeM31a2BkUZPqlD4v88h7lbmrAA
         bwq5rjAMg0wR4paypCEQECHqeIVObNB9igOKPt75RxXhxYulYPSU7Gg1oQUA3to8JGoC
         q31w==
X-Gm-Message-State: AOJu0YzOil/MhCl84b1KY+gvHPB699vCIuEDcBg4bX3lMHALVrPvPYyY
	iIwJ3gUe9ZLJ57/mFFkJlXo=
X-Google-Smtp-Source: AGHT+IGD706YDruc38UmeXeVfUdYx0iJfeoLc76Wz6RAueGGVRmm2G+cyR69igaLKhQnCz8+a2foUg==
X-Received: by 2002:a05:6870:9692:b0:1fb:75a:77b3 with SMTP id o18-20020a056870969200b001fb075a77b3mr5070235oaq.100.1701735852665;
        Mon, 04 Dec 2023 16:24:12 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id gh17-20020a0568703b1100b001fb36f71f3csm1172481oab.31.2023.12.04.16.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 16:24:12 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 4/4] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Tue,  5 Dec 2023 08:24:05 +0800
Message-Id: <8ca06f77efaee132c2145a4a09fa18f4ee17ce88.1701734442.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701734442.git.unicorn_wang@outlook.com>
References: <cover.1701734442.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_162416_828248_EA821D8A 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add clock generator node to device tree for SG2042, and enable clock for
uart.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  4 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 79 +++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 49b4b9c2c101..0b3b3b2b0c64 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -14,6 +14,10 @@ chosen {
 	};
 };
 
+&cgi {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 93256540d078..ecc7758073af 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
 
 #include "sg2042-cpus.dtsi"
 
@@ -18,6 +19,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	cgi: oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "cgi";
+		#clock-cells = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -311,12 +318,84 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		sys_ctrl: system-controller@7030010000 {
+			compatible = "sophgo,sg2042-sysctrl";
+			reg = <0x70 0x30010000 0x0 0x1000>;
+		};
+
+		clkgen: clock-controller@7030012000 {
+			compatible = "sophgo,sg2042-clkgen";
+			reg = <0x70 0x30012000 0x0 0x1000>;
+			system-ctrl = <&sys_ctrl>;
+			#clock-cells = <1>;
+			clocks = <&cgi>;
+			assigned-clocks = \
+				<&clkgen DIV_CLK_FPLL_RP_CPU_NORMAL_1>,
+				<&clkgen DIV_CLK_FPLL_50M_A53>,
+				<&clkgen DIV_CLK_FPLL_TOP_RP_CMN_DIV2>,
+				<&clkgen DIV_CLK_FPLL_UART_500M>,
+				<&clkgen DIV_CLK_FPLL_AHB_LPC>,
+				<&clkgen DIV_CLK_FPLL_EFUSE>,
+				<&clkgen DIV_CLK_FPLL_TX_ETH0>,
+				<&clkgen DIV_CLK_FPLL_PTP_REF_I_ETH0>,
+				<&clkgen DIV_CLK_FPLL_REF_ETH0>,
+				<&clkgen DIV_CLK_FPLL_EMMC>,
+				<&clkgen DIV_CLK_FPLL_SD>,
+				<&clkgen DIV_CLK_FPLL_TOP_AXI0>,
+				<&clkgen DIV_CLK_FPLL_TOP_AXI_HSPERI>,
+				<&clkgen DIV_CLK_FPLL_AXI_DDR_1>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER1>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER2>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER3>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER4>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER5>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER6>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER7>,
+				<&clkgen DIV_CLK_FPLL_DIV_TIMER8>,
+				<&clkgen DIV_CLK_FPLL_100K_EMMC>,
+				<&clkgen DIV_CLK_FPLL_100K_SD>,
+				<&clkgen DIV_CLK_FPLL_GPIO_DB>,
+				<&clkgen DIV_CLK_MPLL_RP_CPU_NORMAL_0>,
+				<&clkgen DIV_CLK_MPLL_AXI_DDR_0>;
+			assigned-clock-rates = \
+				<2000000000>,
+				<50000000>,
+				<1000000000>,
+				<500000000>,
+				<200000000>,
+				<25000000>,
+				<125000000>,
+				<50000000>,
+				<25000000>,
+				<100000000>,
+				<100000000>,
+				<100000000>,
+				<250000000>,
+				<1000000000>,
+				<50000000>,
+				<50000000>,
+				<50000000>,
+				<50000000>,
+				<50000000>,
+				<50000000>,
+				<50000000>,
+				<50000000>,
+				<100000>,
+				<100000>,
+				<100000>,
+				<2000000000>,
+				<1000000000>;
+		};
+
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
 			interrupt-parent = <&intc>;
 			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <500000000>;
+			clocks = <&clkgen GATE_CLK_UART_500M>,
+				 <&clkgen GATE_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
