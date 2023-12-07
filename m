Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262C2C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAMCzWb9k1FI6UyrkU6UrabBD1e2nLsE/Fy5f0QFGjk=; b=dQKRCeBlVUEzOi
	aT+gTUMngbMUZ4OKOCwArMSVSjnPD7B7Mehvhhy/0sWL9o+x9kEZ7T3QUYm50kVsutwa7/XcWOrMa
	w10weg02VS6u+0KHWCYyWq7wFSqJazmFDG4BfWGzWDCnfGbtY3/3U1iA/La2hu6XG1/aXQ94cV1Se
	T4b0CN+M4xcWFDuQ38JtjeeEjEFTQ+Qk/J7+j5rBR2qJBqzZ3SrFo3DFA2W2xW5Xh/sdKs1fzlZ/k
	XAalmcbzA7FVjvzIOI4/ov1uYM9S6FJGYcIDvxmpovKbKRrmpil1UoS2LhfZQ58MHaQtM5TDaNZo7
	eRNgcJ4qT/Vthoci0ZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBADv-00CHlN-12;
	Thu, 07 Dec 2023 08:59:11 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBADq-00CHjx-0e
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 08:59:09 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d84d9e55c7so437603a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 00:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701939544; x=1702544344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMotijnh/qiarlNtyEfMGI6pNts/0ixAszGWpmQazv8=;
        b=QZnBuPXVOU70B7IyWLbtLIQ4PhHowKTD20IgZad1d0lZDuh5Nd6UkuI1GwFtIiG/S5
         WAVAGPSuZnMDVYZE/z11d6jnNcrsRgbJlrDuY5bBHaNrwXkfgE4lLCX5aA1Gr18is0Rh
         aHaIfTEMj7sQqUtBm7MYd+pbEukgPpffk/p6gXQatFMHeUnTDZKXN6FK5EDRBnZnpb90
         JFdXyu6IaKYwaJhHVp5NuGWPVcCbw5S6i1PcAtoiIT3eosM92tcYKcyZOpmH0HiS0Too
         nGhahNp9oh1plYssCY5KPzsxqI3mqsqqP9DGBV2z/Z5gw0mxrqREnsSSv/goVmBS8vYv
         Opiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701939544; x=1702544344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMotijnh/qiarlNtyEfMGI6pNts/0ixAszGWpmQazv8=;
        b=nVfbhCeD6ykvFWdiq992vrfvNg8geRWdiJ7hL9H+NSiRNsow9uRW+Ho9N9n3CGvnU9
         4/d4SK2xkYpGE10mjISuJgnsA2D5wFcuoreSL+l3VPqdC9pmsKRMktREaH+Wi2Buoooo
         elC07hCybNpI42Ng4r6oFOKuU8zgKE/TLDX/KnvnFcQeve0Mvg4R9giIRT01oGWi0cQz
         QmFtrlefTtMUARLN2sZ9Xmv57QDlTPONOwOL11CIrf3v7scVA6vd1f/IYKpzMwQ6sWJy
         JYCM+HsnLHJD7Z1gOiGmirKoxNx35sVL/j8h4x8ukKsbmwmIWC4uEuvswdat3Zh9T35+
         bzRg==
X-Gm-Message-State: AOJu0Yza168NeUBOHh5F8XnUgzBrqrGFN1dGj6YqNDyGB2LrNGG4t2XD
	c7/JNEpfxtKvlluPz3izCDY=
X-Google-Smtp-Source: AGHT+IEXTbQq8dYkPSJIMFuDzSIa2jJdfeAvsDSzpCTKkjrNj1lYR7HKeNF3KhBamgosP45aezeo2g==
X-Received: by 2002:a05:6871:2b1b:b0:1fb:75a:7797 with SMTP id dr27-20020a0568712b1b00b001fb075a7797mr2467585oac.72.1701939544160;
        Thu, 07 Dec 2023 00:59:04 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m25-20020a9d7ad9000000b006d84f49497fsm153756otn.23.2023.12.07.00.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:59:03 -0800 (PST)
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
Subject: [PATCH v5 4/4] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Thu,  7 Dec 2023 16:58:54 +0800
Message-Id: <8e58ac40c02e13ed09c5bb896f1cb5aaa01d82c6.1701938395.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701938395.git.unicorn_wang@outlook.com>
References: <cover.1701938395.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_005906_235442_83068D8D 
X-CRM114-Status: GOOD (  10.26  )
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
index 93256540d078..f08c41dda216 100644
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
+			sophgo,system-ctrl = <&sys_ctrl>;
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
