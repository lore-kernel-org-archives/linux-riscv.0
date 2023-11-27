Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3532C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 01:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VRydO/LqwUL066efAusPmwErn+b00Etn+xzxm1IUYE=; b=Ttz3+HvEe35Oo0
	6Ry/N0PiKAtlGZzn+CIj1KtUWY+g1UKydFgHT3GxBVtCievFk1i9UNlu9GktKsxyzV6FduVIXUKcb
	KWtkCJcoso4fgFaUCTd4U9nyx7zmiwZYn0UJ/h8tLOAooCmrz6D9IFY61V/YT2NPaPdWIWDKjFwRs
	DZ6R2CDNKDC66Xiwa8BT8ss/WeLI4ABIMk2cCVWNQYkXZVpyrgsBznn+B7fvqblQ1RVNUenq6Mek3
	VDj311q+q4uZvZFGiyGTBSQ0ssBb23mtgvNkpZaYSNdtVTpirRIXxVxnIU+yaGJ7Uo1XvaxDQuZbh
	O0gYBrIi7vlmppSb/Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QEm-0007Aw-17;
	Mon, 27 Nov 2023 01:16:36 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QEi-00078M-32
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 01:16:34 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d64c1155a8so2533826a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 17:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701047792; x=1701652592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/U0t4lVPnM2IDbC1l080UWyb7I1vEq1c7QyaFDSq/c=;
        b=m4MkmKIWCB5SsFWSB0U7OPYzbBNmOPSEiLnUxAIbPDvSVzH1gAN5ECOR2XEa2xa/3a
         Ewy13uSd+y+cGYCV/i2Mz6W6Qu5mFJEgPyh5dhlIVn2yv6qh3CRaeVAMll/2L8vbN5IJ
         18rsDmonlRe6zYQosewlFjK5iG5PKe/d01megUJb5x+6f7ki957Cwh4Ihu2uEfaL73CW
         PFG5mEfr8FFkKJWL8ssz880aLuRSb5RrZg+vdkcihMbRiM4BWLHrpLuvEgmaWCaI6vpd
         LL8NpQ982mERMwd1f6pAwTj4FuTfZjdt9eKy4AKR4wpeYd5k5VSkrq+guo4D8lSa8NH4
         alZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701047792; x=1701652592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/U0t4lVPnM2IDbC1l080UWyb7I1vEq1c7QyaFDSq/c=;
        b=GaBoQqMv877urZoALoHZQy3liRWiR03BE6sB238BDqo13+Iizdg5fLSbD7c66lPYWb
         7UJWD4M1XQuLV7q1nM8Opq7RdwYQls3gv0ttEbeSu6mBcsy0DJq5Wa4WhevcWldjRAce
         b14kO4MIjC5qHVzw1gfR5Za9vKXM5ddZSspHu7L5fbuTgolLU5L6HikEJraGQqxn4TyV
         A6h93QxjmERq45DY1jAPcAIdk+JjZYeYpWlRenH+WBEqyF7HQ5cXxOR93FEgFCbbNtRF
         zPp9lT/+Q+OAxMCm7O387/010OP71mwYjuzyvKRtnZAEf/INnRXclKHDhCvpLgnH0B9R
         XKwA==
X-Gm-Message-State: AOJu0YwDCE8+064pYw1R4j9OUaykCEi1awZoPU81WAlpPMbsqNeb288X
	3Vlfgva24729F8B3aJR/Ctk=
X-Google-Smtp-Source: AGHT+IGbHdzoQeZ85sBN0SyEOpFNpyntrl82FC+nP1mZS4niHW8rfdJZzuYGim9/uM15OjkestW1Bg==
X-Received: by 2002:a05:6830:6b42:b0:6bb:1c30:6f3c with SMTP id dc2-20020a0568306b4200b006bb1c306f3cmr13168007otb.0.1701047791774;
        Sun, 26 Nov 2023 17:16:31 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm1241663otk.21.2023.11.26.17.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 17:16:31 -0800 (PST)
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
Subject: [PATCH v2 4/4] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Mon, 27 Nov 2023 09:16:22 +0800
Message-Id: <70ad5faa3a4a012df328fa21e69eaffd377e99ca.1701044106.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701044106.git.unicorn_wang@outlook.com>
References: <cover.1701044106.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_171632_980692_21DEEE40 
X-CRM114-Status: GOOD (  10.28  )
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
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 77 +++++++++++++++++++
 2 files changed, 81 insertions(+)

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
index 93256540d078..c5849a0e74d0 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo-sg2042-clk.h>
 
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
@@ -311,12 +318,82 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		sys_ctrl: syscon@7030010000 {
+			compatible = "sophgo,sg2042-syscon", "syscon";
+			reg = <0x70 0x30010000 0x0 0x8000>;
+
+			clkgen: clock-controller {
+				compatible = "sophgo,sg2042-clkgen";
+				#clock-cells = <1>;
+				clocks = <&cgi>;
+				assigned-clocks = \
+					<&clkgen DIV_CLK_FPLL_RP_CPU_NORMAL_1>,
+					<&clkgen DIV_CLK_FPLL_50M_A53>,
+					<&clkgen DIV_CLK_FPLL_TOP_RP_CMN_DIV2>,
+					<&clkgen DIV_CLK_FPLL_UART_500M>,
+					<&clkgen DIV_CLK_FPLL_AHB_LPC>,
+					<&clkgen DIV_CLK_FPLL_EFUSE>,
+					<&clkgen DIV_CLK_FPLL_TX_ETH0>,
+					<&clkgen DIV_CLK_FPLL_PTP_REF_I_ETH0>,
+					<&clkgen DIV_CLK_FPLL_REF_ETH0>,
+					<&clkgen DIV_CLK_FPLL_EMMC>,
+					<&clkgen DIV_CLK_FPLL_SD>,
+					<&clkgen DIV_CLK_FPLL_TOP_AXI0>,
+					<&clkgen DIV_CLK_FPLL_TOP_AXI_HSPERI>,
+					<&clkgen DIV_CLK_FPLL_AXI_DDR_1>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER1>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER2>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER3>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER4>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER5>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER6>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER7>,
+					<&clkgen DIV_CLK_FPLL_DIV_TIMER8>,
+					<&clkgen DIV_CLK_FPLL_100K_EMMC>,
+					<&clkgen DIV_CLK_FPLL_100K_SD>,
+					<&clkgen DIV_CLK_FPLL_GPIO_DB>,
+					<&clkgen DIV_CLK_MPLL_RP_CPU_NORMAL_0>,
+					<&clkgen DIV_CLK_MPLL_AXI_DDR_0>;
+				assigned-clock-rates = \
+					<2000000000>,
+					<50000000>,
+					<1000000000>,
+					<500000000>,
+					<200000000>,
+					<25000000>,
+					<125000000>,
+					<50000000>,
+					<25000000>,
+					<100000000>,
+					<100000000>,
+					<100000000>,
+					<250000000>,
+					<1000000000>,
+					<50000000>,
+					<50000000>,
+					<50000000>,
+					<50000000>,
+					<50000000>,
+					<50000000>,
+					<50000000>,
+					<50000000>,
+					<100000>,
+					<100000>,
+					<100000>,
+					<2000000000>,
+					<1000000000>;
+			};
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
