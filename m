Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F77C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LXQtyFqJK1cUbXFgpWO7GUCZmwg/8tMda9rpUlIi/E=; b=iNDRgqtZ8zmjDt
	lzKnlKIPwGOtpY5eCN8NNqvTULX5o89VODl7Pt+78qdIs2pIZiuOp+ipBDnzu6rMiPFOzGwaOpy3a
	mjUvOC8ghXfUnpKqrXhBd31Sojofv1J3uGXDVTAnOgU0KeWeZjg3zBkQE74IFqzfSEHQ6WEjff+Or
	SaTw8D4uPae2DQ5OnGKVpDLK0z4zYlcApDbILZQslXt4VTzBTkvLrMgz+u2eXgJ59IvqlqkhAp7yJ
	2ayKnR2UeWqXZVjzDlRcwB4zMGX5YKNNsgvEWwKWNBaNVpOw6s5vw3BHVeurXeu4HFjT+dyZAyFDx
	BD9Wef8lYOFq4+UTwu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WrV-00E2hR-2r;
	Mon, 13 Nov 2023 13:20:21 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WrT-00E2gS-2q
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:20:21 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6ce31c4a653so2672522a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881619; x=1700486419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2oQtEPIutglTe0zePH4EdTxwpuD5Zb7G2ePiU4NwmQ=;
        b=TB7BT7CCrXclWe0WgpE/GSZNQYGpWZJFNGWbGRuZTtGJmDQMr8AdS6xIRLo5UnCJCs
         kaF9BUl0qUmLU94un59IZl1lKZQ/ropbpaHhwwTH4+5IChe0o1UI68vJnWPtcuc/AvrG
         c9maiTZe3eu0C98RLww2kjRcT+6v0l/2EH6WfC31xahQ+cWf2YgtNZsWp1Qd4eHuWXg4
         m2jHZ56Al0fSS9Nz1VJ8K3pWjGphx6xQScuP2VT/hy8JNAcg+z6ToN3AUBCEpvg9jxLk
         W/7k+5KbeQaIJ53V2YrXzb++ZXWrdggUfnJPOhC+JmlQQXDeD9iIge9H+yGPKpA7tXlr
         UxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881619; x=1700486419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2oQtEPIutglTe0zePH4EdTxwpuD5Zb7G2ePiU4NwmQ=;
        b=b4GD/3gl0aImeJ9Ofu79g0rMdtOYcPPe9e86y2hod2rDO3vY02rQn2opxlwySSM+gm
         y6nEaPCB2Hw0a7H0DIZ3ky0pkkaiETL4kzzTHwRInaAWtTEzDCaoyD/R8W1MF7p7s9Aq
         E2SSfV28BawGz8i4GAbp4+CgoOw6poNIfQ0QiWsPMFIS5pD+EH38zwKZJzLbAc2g0Byf
         32KgbKRAgIHjWzH0R5UDhUiK8xyuZG6G9QoEhJ2Ji8YNFrjEsGyzUr6fCXg7NG7+eyKt
         pz/atB5Qr3K+RQ7JGZAZn12k42QAibcw02OOn09Xr2dd3YWAs2k4arSQfBCIiX3b3CKm
         HOCg==
X-Gm-Message-State: AOJu0YxT3lyloemnwWadwAlqTuEBjBCtYG+jGb4Mef4q4A5gRbRk1DkD
	ZzZI5xsbxPGkGWRtzeNvF/c080jkhwkGlQ==
X-Google-Smtp-Source: AGHT+IGdyfd3Iw8wc2oNjooMchUT5EXKOY6OdN9KO1iBklie7kMMadIh4BY1epZEyrW1KogBEF8e+w==
X-Received: by 2002:a9d:7752:0:b0:6d6:4cf3:d908 with SMTP id t18-20020a9d7752000000b006d64cf3d908mr7631954otl.33.1699881619198;
        Mon, 13 Nov 2023 05:20:19 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id v7-20020a9d69c7000000b006d646763942sm799989oto.23.2023.11.13.05.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:20:18 -0800 (PST)
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
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Mon, 13 Nov 2023 21:20:11 +0800
Message-Id: <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699879741.git.unicorn_wang@outlook.com>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_052019_917652_DE1A4C14 
X-CRM114-Status: GOOD (  14.37  )
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
uart0.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi | 76 ++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi       | 10 +++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
new file mode 100644
index 000000000000..66d2723fab35
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+/ {
+	cgi: oscillator {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		clock-output-names = "cgi";
+		#clock-cells = <0>;
+	};
+
+	clkgen: clock-controller {
+		compatible = "sophgo,sg2042-clkgen";
+		#clock-cells = <1>;
+		system-ctrl = <&sys_ctrl>;
+		clocks = <&cgi>;
+		assigned-clocks = \
+			<&clkgen DIV_CLK_FPLL_RP_CPU_NORMAL_1>,
+			<&clkgen DIV_CLK_FPLL_50M_A53>,
+			<&clkgen DIV_CLK_FPLL_TOP_RP_CMN_DIV2>,
+			<&clkgen DIV_CLK_FPLL_UART_500M>,
+			<&clkgen DIV_CLK_FPLL_AHB_LPC>,
+			<&clkgen DIV_CLK_FPLL_EFUSE>,
+			<&clkgen DIV_CLK_FPLL_TX_ETH0>,
+			<&clkgen DIV_CLK_FPLL_PTP_REF_I_ETH0>,
+			<&clkgen DIV_CLK_FPLL_REF_ETH0>,
+			<&clkgen DIV_CLK_FPLL_EMMC>,
+			<&clkgen DIV_CLK_FPLL_SD>,
+			<&clkgen DIV_CLK_FPLL_TOP_AXI0>,
+			<&clkgen DIV_CLK_FPLL_TOP_AXI_HSPERI>,
+			<&clkgen DIV_CLK_FPLL_AXI_DDR_1>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER1>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER2>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER3>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER4>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER5>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER6>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER7>,
+			<&clkgen DIV_CLK_FPLL_DIV_TIMER8>,
+			<&clkgen DIV_CLK_FPLL_100K_EMMC>,
+			<&clkgen DIV_CLK_FPLL_100K_SD>,
+			<&clkgen DIV_CLK_FPLL_GPIO_DB>,
+			<&clkgen DIV_CLK_MPLL_RP_CPU_NORMAL_0>,
+			<&clkgen DIV_CLK_MPLL_AXI_DDR_0>;
+		assigned-clock-rates = \
+			<2000000000>,
+			<50000000>,
+			<1000000000>,
+			<500000000>,
+			<200000000>,
+			<25000000>,
+			<125000000>,
+			<50000000>,
+			<25000000>,
+			<100000000>,
+			<100000000>,
+			<100000000>,
+			<250000000>,
+			<1000000000>,
+			<50000000>,
+			<50000000>,
+			<50000000>,
+			<50000000>,
+			<50000000>,
+			<50000000>,
+			<50000000>,
+			<50000000>,
+			<100000>,
+			<100000>,
+			<100000>,
+			<2000000000>,
+			<1000000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 93256540d078..de79c0cdb4c1 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,8 +5,10 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo-sg2042-clk.h>
 
 #include "sg2042-cpus.dtsi"
+#include "sg2042-clock.dtsi"
 
 / {
 	compatible = "sophgo,sg2042";
@@ -311,12 +313,20 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		sys_ctrl: syscon@7030010000 {
+			compatible = "sophgo,sg2042-syscon", "syscon";
+			reg = <0x70 0x30010000 0x0 0x8000>;
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
