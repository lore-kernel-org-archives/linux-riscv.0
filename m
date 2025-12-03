Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BA0D1266D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vq4Nsx/VHka+4fLs43k7ZMg9btpy5CsU0Ninm/eJX54=; b=nqp4veZbmbbAmj
	5dPUwVd2csPamrqJVRj3x5rdm1znB7esTG0Ng5vL0wdzzKQonkX5mydDnIh8ZOOseQKdjUXDAbJ4C
	M5VCPJUNJpNGa4aVlHWn6kVFfhl8BdwOKpAs/r2eutEFi393QMth4roh+hoytV9Dja9MfvUJ+nFaq
	CUMSsc0D5+ZOl7vFJ9+pnbDQ72tYa3xR6lIPIgXxFcpX/SF1rLJ7LX5evGUMlWOVVZay1k3b4xXqO
	lqTRIQhJuVxFWxwmjfhfpyNL5eyId/DiUbmx/Jd7kCGQsaQSb2edYx0Hozc6tx0fFuPWaAkwjqPyd
	4E/im7NNdubXFBzQHZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj9B-00000006NvC-1MPY;
	Wed, 03 Dec 2025 09:27:41 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj98-00000006Ntz-0tk4
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tc
	UFjhr66+t/RO+Alvz1oilaCXP3lhuhWWr/CDtGak4=; b=A4BHA582swzH02/eCK
	G/3cw1TyUJFO76PSe5pgGeTHMmcGDPASmR+/7MRgo5jqLv2+QvwSFeXYys4Ri8JN
	u7Vvqv/lELLjqKn3y3FI8IVjnJf6sIpM2kmlGGHzYuis+dCOfHFwTZ5YHsdzewrB
	9uCQh850Yff8yUnvIzKicoX7k=
Received: from duge-virtual-machine (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wB3hL9WAjBp0iOFDg--.607S2;
	Wed, 03 Dec 2025 17:26:48 +0800 (CST)
From: q691800735@163.com
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	jybruceupup <q691800735@163.com>
Subject: [PATCH] riscv: dts: canaan: Add K230 clock provider DTSI
Date: Wed,  3 Dec 2025 17:26:43 +0800
Message-ID: <20251203092643.219600-1-q691800735@163.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: _____wB3hL9WAjBp0iOFDg--.607S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfKF48uFyfAFy7CryUtr48Crg_yoWxKF15to
	Z0yFy3Ww18Ar9rKa9Fyw15KasxGFy3KrW3JFWYqa13Kr43XrW8GryUKa9xJF9Ykw48A3yD
	J3sa9w15Kr13Grnxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRNmiEUUUUU
X-Originating-IP: [220.196.194.129]
X-CM-SenderInfo: jtwzimyqqxjki6rwjhhfrp/xtbBcwEZMGkv-c9t7wAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_012738_751994_CC7E334A 
X-CRM114-Status: GOOD (  12.38  )
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

From: jybruceupup <q691800735@163.com>

Add clock provider DTSI for Kendryte K230 SoC, required for subsystem
clock management and boot.

Signed-off-by: jybruceupup <q691800735@163.com>
---
 .../boot/dts/canaan/k230_clock_provider.dtsi  | 2724 +++++++++++++++++
 1 file changed, 2724 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi

diff --git a/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi b/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi
new file mode 100644
index 000000000..9d193ca22
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi
@@ -0,0 +1,2724 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2023, Canaan Bright Sight Co., Ltd
+ * Copyright (c) 2025 jybruceupup <q691800735@163.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+&sysctl_boot {
+/* osc24m clock */
+	osc24m: osc24m {
+		#clock-cells		= <0>;	/* only one clock output */
+		compatible		= "fixed-clock";/* It's clock source, no parent */
+		clock-frequency		= <24000000>;	/* clock freqence is 24MHz */
+		clock-accuracy		= <0>;	/* software assume clock no jitter/wander.*/
+		status				= "okay";
+		read-only			= <0>;
+	};
+
+	/* pll clock */
+	pll0: pll0 {
+		#clock-cells		= <0>;			/* only one output */
+		compatible		= "canaan,k230-pll";
+		/* pll0/1/2/3 match same clk driver, comptible is k230-pll(not k230-pll0,1,2,3)*/
+		clocks			 = <&osc24m>;		/* clk parent is osc24m */
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* PLL0_CFG0 */
+		clk-divide-reg-offset			 = <0x0>;/* pll divider register offset */
+		clk-divide-out-reg-value-shift		  = <24>;	/* start bit is 24 */
+		clk-divide-out-reg-value-mask		   = <0xF>;
+			/* bitmask, 0xf means b'1111(4bits), bit24(start bit) to bit27 */
+		clk-divide-ref-reg-value-shift		  = <16>;
+		clk-divide-ref-reg-value-mask		   = <0x3F>;
+		clk-divide-fb-reg-value-shift		   = <0>;
+		clk-divide-fb-reg-value-mask			= <0x1FFF>;
+
+		/* PLL0_CFG1: bypass */
+		clk-divide-bypass-reg-offset			= <0x4>;
+		clk-divide-bypass-reg-enable-bit		= <19>;
+
+		/* PLL0_CTL: gate */
+		clk-gate-reg-offset					 = <0x8>;
+		clk-gate-reg-enable-bit				 = <2>;
+		clk-gate-reg-write-enable-bit		   = <18>;
+
+		/* PLL0_STAT: pll0 lock status */
+		clk-lock-reg-offset					 = <0xC>;
+		clk-lock-reg-status_bit				 = <0>;
+	};
+
+	pll0_div2: pll0_div2 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll0>;
+		clock-div			   = <2>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll0_div3: pll0_div3 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll0>;
+		clock-div			   = <3>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll0_div4: pll0_div4 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll0>;
+		clock-div			   = <4>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll1: pll1 {
+		#clock-cells				= <0>;		/* only one output */
+		compatible				  = "canaan,k230-pll";
+	/* pll0/1/2/3 match same clk driver, so comptible is k230-pll(not k230-pll0,1,2,3)*/
+		clocks					  = <&osc24m>;	/* clk parent is osc24m */
+		status					  = "okay";
+		read-only				   = <0>;
+
+		/* PLL1_CFG0 */
+		clk-divide-reg-offset			= <0x10>;
+		clk-divide-out-reg-value-shift		  = <24>;
+		clk-divide-out-reg-value-mask		   = <0xF>;
+		clk-divide-ref-reg-value-shift		  = <16>;
+		clk-divide-ref-reg-value-mask		   = <0x3F>;
+		clk-divide-fb-reg-value-shift		   = <0>;
+		clk-divide-fb-reg-value-mask			= <0x1FFF>;
+
+		/* PLL1_CFG1: bypass */
+		clk-divide-bypass-reg-offset			= <0x14>;
+		clk-divide-bypass-reg-enable-bit		= <19>;
+
+		/* PLL1_CTL: gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-enable-bit				 = <2>;
+		clk-gate-reg-write-enable-bit		   = <18>;
+
+		/* PLL1_STAT: pll1 lock status */
+		clk-lock-reg-offset					 = <0x1C>;
+		clk-lock-reg-status_bit				 = <0>;
+	};
+
+	pll1_div2: pll1_div2 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll1>;
+		clock-div			   = <2>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll1_div3: pll1_div3 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll1>;
+		clock-div			   = <3>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll1_div4: pll1_div4 {
+		#clock-cells				= <0>;
+		compatible				  = "fixed-factor-clock";
+		clocks					  = <&pll1>;
+		clock-div				   = <4>;
+		clock-mult				  = <1>;
+		status					  = "okay";
+		read-only				   = <0>;
+	};
+
+	pll2: pll2 {
+		#clock-cells		= <0>;				/* only one output */
+		compatible		  = "canaan,k230-pll";
+	/* pll0/1/2/3 match same clk driver, so comptible is k230-pll(not k230-pll0,1,2,3)*/
+		clocks			  = <&osc24m>;		/* clk parent is osc24m */
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* PLL2_CFG0 */
+		clk-divide-reg-offset				   = <0x20>;
+		clk-divide-out-reg-value-shift		  = <24>;
+		clk-divide-out-reg-value-mask		   = <0xF>;
+		clk-divide-ref-reg-value-shift		  = <16>;
+		clk-divide-ref-reg-value-mask		   = <0x3F>;
+		clk-divide-fb-reg-value-shift		   = <0>;
+		clk-divide-fb-reg-value-mask			= <0x1FFF>;
+
+		/* PLL2_CFG1: bypass */
+		clk-divide-bypass-reg-offset			= <0x24>;
+		clk-divide-bypass-reg-enable-bit		= <19>;
+
+		/* PLL2_CTL: gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-enable-bit				 = <2>;
+		clk-gate-reg-write-enable-bit		   = <18>;
+
+		/* PLL_STAT: pll2 lock status */
+		clk-lock-reg-offset					 = <0x2C>;
+		clk-lock-reg-status_bit				 = <0>;
+	};
+
+	pll2_div2: pll2_div2 {
+		#clock-cells				= <0>;
+		compatible				  = "fixed-factor-clock";
+		clocks					  = <&pll2>;
+		clock-div				   = <2>;
+		clock-mult				  = <1>;
+		status					  = "okay";
+		read-only				   = <0>;
+	};
+
+	pll2_div3: pll2_div3 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll2>;
+		clock-div			   = <3>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll2_div4: pll2_div4 {
+		#clock-cells				= <0>;
+		compatible				  = "fixed-factor-clock";
+		clocks					  = <&pll2>;
+		clock-div				   = <4>;
+		clock-mult				  = <1>;
+		status					  = "okay";
+		read-only				   = <0>;
+	};
+
+	pll3: pll3 {
+		#clock-cells				= <0>;		/* only one output */
+		compatible					  = "canaan,k230-pll";
+	/* pll0/1/2/3 match same clk driver, so comptible is k230-pll(not k230-pll0,1,2,3)*/
+		clocks				  = <&osc24m>;		/* clk parent is osc24m */
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* PLL3_CFG0 */
+		clk-divide-reg-offset				   = <0x30>;
+		clk-divide-out-reg-value-shift		  = <24>;
+		clk-divide-out-reg-value-mask		   = <0xF>;
+		clk-divide-ref-reg-value-shift		  = <16>;
+		clk-divide-ref-reg-value-mask		   = <0x3F>;
+		clk-divide-fb-reg-value-shift		   = <0>;
+		clk-divide-fb-reg-value-mask			= <0x1FFF>;
+
+		/* PLL3_CFG1: bypass */
+		clk-divide-bypass-reg-offset			= <0x34>;
+		clk-divide-bypass-reg-enable-bit		= <19>;
+
+		/* PLL3_CTL: gate */
+		clk-gate-reg-offset					 = <0x38>;
+		clk-gate-reg-enable-bit				 = <2>;
+		clk-gate-reg-write-enable-bit		   = <18>;
+
+		/* PLL3_STAT: pll3 lock status */
+		clk-lock-reg-offset					 = <0x3C>;
+		clk-lock-reg-status_bit				 = <0>;
+	};
+
+	pll3_div2: pll3_div2 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll3>;
+		clock-div			   = <2>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll3_div3: pll3_div3 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll3>;
+		clock-div			   = <3>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+
+	pll3_div4: pll3_div4 {
+		#clock-cells			= <0>;
+		compatible			  = "fixed-factor-clock";
+		clocks				  = <&pll3>;
+		clock-div			   = <4>;
+		clock-mult			  = <1>;
+		status				  = "okay";
+		read-only			   = <0>;
+	};
+};
+
+&sysctl_clock {
+	cpu0_src: cpu0_src {
+		#clock-cells	= <0>;				/* only one output */
+		compatible	  = "canaan,k230-clk-composite";
+		clocks		  = <&pll0_div2>;			/* only one parent */
+		status		  = "okay";
+		read-only	   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <16>;
+		clk-rate-conf-div-min				   = <16>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <0>;
+		clk-rate-reg-offset					 = <0x0>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <1>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x0>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+		/* if set to 0(clk-gate-reg-bit-enable set 1 to enable clcok),
+		 *if set to 1(clk-gate-reg-bit-enable set 0 to enable clcok)
+		 */
+	};
+
+	cpu0_plic: cpu0_plic {
+		#clock-cells		= <0>;		/* only one output */
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&cpu0_src>;	/* only one parent */
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+
+		clk-rate-reg-offset					 = <0x0>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <10>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x0>;
+		clk-gate-reg-bit-enable				 = <9>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	cpu0_aclk: cpu0_aclk {
+		#clock-cells		= <0>;			/* only one output */
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&cpu0_src>;	/* only one parent */
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+
+		clk-rate-reg-offset					 = <0x0>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+
+	cpu0_noc_ddrcp4: cpu0_noc_ddrcp4 {
+		#clock-cells			= <0>;	/* only one output */
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&cpu0_src>;/* only one parent */
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x60>;
+		clk-gate-reg-bit-enable				 = <7>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	cpu0_pclk: cpu0_pclk {
+		#clock-cells		= <0>;		/* only one output */
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&pll0_div4>;		 /* only one parent */
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+
+		clk-rate-reg-offset					 = <0x0>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <15>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x0>;
+		clk-gate-reg-bit-enable				 = <13>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	pmu_pclk: pmu_pclk {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&osc24m>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x10>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	hs_hclk_high_src: hs_hclk_high_src {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&pll0_div4>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x1C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	hs_hclk_high: hs_hclk_high {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&hs_hclk_high_src>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <1>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	hs_hclk_src: hs_hclk_src {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&hs_hclk_high_src>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+
+		clk-rate-reg-offset					 = <0x1C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd0_hclk_gate: sd0_hclk_gate {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&hs_hclk_src>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <2>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd1_hclk_gate: sd1_hclk_gate {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&hs_hclk_src>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <3>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	usb0_hclk_gate: usb0_hclk_gate {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&hs_hclk_src>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <4>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	usb1_hclk_gate: usb1_hclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&hs_hclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	ssi1_hclk_gate: ssi1_hclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&hs_hclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <7>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	ssi2_hclk_gate: ssi2_hclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&hs_hclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <8>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ssi0_aclk: ssi0_aclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+
+		clk-rate-reg-offset					 = <0x20>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <9>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <27>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ssi1_clk: ssi1_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x20>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <25>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ssi2_clk: ssi2_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x20>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <26>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	qspi_aclk_src: qspi_aclk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x20>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <12>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <28>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	ssi1_aclk_gate: ssi1_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&qspi_aclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <29>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	ssi2_aclk_gate: ssi2_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&qspi_aclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <30>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ssi0_clk: ssi0_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parent */
+		clocks			 = <&pll0_div2>, <&pll2_div4>;	  /* mux parent */
+		clk-parent-reg-offset		  = <0x20>;
+		clk-parent-reg-value-shift	 = <18>;
+		clk-parent-reg-value-mask	  = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <24>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	sd_aclk: sd_aclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll2_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x1C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <9>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd0_aclk_gate: sd0_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_aclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <13>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd1_aclk_gate: sd1_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_aclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <17>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd0_bclk_gate: sd0_bclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_aclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <14>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd1_bclk_gate: sd1_bclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_aclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <18>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	sd_cclk_src: sd_cclk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min	 = <2>;	/* maxinum = 1/2, 1/2, 1/3 --- 1/8 */
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x1C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <12>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <11>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd0_cclk_gate: sd0_cclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_cclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <15>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd1_cclk_gate: sd1_cclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_cclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <19>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	pll0_div16: pll0_div16 {
+		#clock-cells							= <0>;
+		compatible	 = "fixed-factor-clock";
+		clocks								  = <&pll0>;
+		clock-div							   = <16>;
+		clock-mult							  = <1>;
+		status								  = "okay";
+		read-only							   = <0>;
+	};
+	usb_ref_50m: usb_ref_50m {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x20>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <15>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	usb0_ref_clk: usb0_ref_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parent */
+		clocks				= <&osc24m>, <&usb_ref_50m>;	/* mux parent */
+		clk-parent-reg-offset				   = <0x18>;
+		clk-parent-reg-value-shift			  = <23>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <21>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	usb1_ref_clk: usb1_ref_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parent */
+		clocks				= <&osc24m>, <&usb_ref_50m>;	 /* mux parent */
+		clk-parent-reg-offset				   = <0x18>;
+		clk-parent-reg-value-shift			  = <23>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <22>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	sd_tmclk_src: sd_tmclk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&osc24m>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <24>;
+		clk-rate-conf-div-max				   = <32>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x1C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <15>;
+		clk-rate-reg-div-value-mask			 = <0x1F>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <12>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd0_tmclk_gate: sd0_tmclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_tmclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <16>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sd1_tmclk_gate: sd1_tmclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sd_tmclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x18>;
+		clk-gate-reg-bit-enable				 = <20>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ls_pclk_src: ls_pclk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x30>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	uart0_pclk_gate: uart0_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <1>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	uart1_pclk_gate: uart1_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <2>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	uart2_pclk_gate: uart2_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <3>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	uart3_pclk_gate: uart3_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <4>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	uart4_pclk_gate: uart4_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	i2c0_pclk_gate: i2c0_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <6>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	i2c1_pclk_gate: i2c1_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <7>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	i2c2_pclk_gate: i2c2_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <8>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	i2c3_pclk_gate: i2c3_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <9>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	i2c4_pclk_gate: i2c4_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <10>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	gpio_pclk_gate: gpio_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <11>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	pwm_pclk_gate: pwm_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <12>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink0_pclk_gate: jamlink0_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <4>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink1_pclk_gate: jamlink1_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink2_pclk_gate: jamlink2_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <6>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink3_pclk_gate: jamlink3_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <7>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	audio_pclk_gate: audio_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <13>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	adc_pclk_gate: adc_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <15>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	codec_pclk_gate: codec_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&ls_pclk_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <14>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	uart0_clk: uart0_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <16>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	uart1_clk: uart1_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <17>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	uart2_clk: uart2_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <18>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	uart3_clk: uart3_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <9>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <19>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	uart4_clk: uart4_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <12>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <20>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	jamlinkCO_div: jamlinkCO_div {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <2>;
+		clk-rate-conf-div-max				   = <512>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x30>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <23>;
+		clk-rate-reg-div-value-mask			 = <0xFF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	jamlink0CO_gate: jamlink0CO_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			= <&jamlinkCO_div>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink1CO_gate: jamlink1CO_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&jamlinkCO_div>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <1>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink2CO_gate: jamlink2CO_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			 = <&jamlinkCO_div>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <2>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	jamlink3CO_gate: jamlink3CO_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			= <&jamlinkCO_div>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x28>;
+		clk-gate-reg-bit-enable				 = <3>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	i2c0_clk: i2c0_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <15>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <21>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	i2c1_clk: i2c1_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <18>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <22>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	i2c2_clk: i2c2_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <21>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <23>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	i2c3_clk: i2c3_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <24>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <24>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	i2c4_clk: i2c4_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x2C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <27>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <25>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	codec_adc_mclk: codec_adc_mclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <0x10>;
+		clk-rate-conf-mul-max				   = <0x1B9>;
+		clk-rate-conf-div-min				   = <0xC35>;
+		clk-rate-conf-div-max				   = <0x3D09>;
+		clk-rate-calc-method					= <2>;
+		clk-rate-reg-offset					 = <0x38>;
+		clk-rate-reg-mul-value-shift			= <14>;
+		clk-rate-reg-mul-value-mask			 = <0x1FFF>;
+			/* multiple field mask.  It's valid when clk-rate-calc-method = 2*/
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x3FFF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <29>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	codec_dac_mclk: codec_dac_mclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <0x10>;
+		clk-rate-conf-mul-max				   = <0x1B9>;
+		clk-rate-conf-div-min				   = <0xC35>;
+		clk-rate-conf-div-max				   = <0x3D09>;
+		clk-rate-calc-method					= <2>;
+		clk-rate-reg-offset					 = <0x3C>;
+		clk-rate-reg-mul-value-shift			= <14>;
+		clk-rate-reg-mul-value-mask			 = <0x1FFF>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x3FFF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <30>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	audio_dev_clk: audio_dev_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <0x4>;
+		clk-rate-conf-mul-max				   = <0x1B9>;
+		clk-rate-conf-div-min				   = <0xC35>;
+		clk-rate-conf-div-max				   = <0xF424>;
+		clk-rate-calc-method					= <2>;
+		clk-rate-reg-offset					 = <0x34>;
+		clk-rate-reg-mul-value-shift			= <16>;
+		clk-rate-reg-mul-value-mask			 = <0x7FFF>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0xFFFF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <28>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	pdm_clk: pdm_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-div-min				   = <0xC35>;
+		clk-rate-conf-div-max				   = <0x1E848>;
+		clk-rate-reg-offset					 = <0x40>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x1FFFF>;
+		clk-rate-calc-method					= <2>;
+
+		/* rate1 */
+		clk-rate-conf-mul-min_1				   = <0x2>;
+		clk-rate-conf-mul-max_1				   = <0x1B9>;
+		clk-rate-reg-offset_1					 = <0x44>;
+		clk-rate-reg-mul-value-shift_1			= <0>;
+		clk-rate-reg-mul-value-mask_1			 = <0xFFFF>;
+		clk-rate-reg-write-enable-bit_1		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <31>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	adc_clk: adc_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <1024>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x30>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0x3FF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <26>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	gpio_dbclk: gpio_dbclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&osc24m>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <1024>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x30>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <13>;
+		clk-rate-reg-div-value-mask			 = <0x3FF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x24>;
+		clk-gate-reg-bit-enable				 = <27>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	sysctl_pclk: sysctl_pclk {
+		#clock-cells							= <0>;
+		compatible							  = "fixed-clock";
+		clock-frequency						 = <100000000>;
+		clock-accuracy						  = <0>;
+		status								  = "okay";
+		read-only							   = <0>;
+	};
+	wdt0_pclk_gate: wdt0_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sysctl_pclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <1>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	wdt1_pclk_gate: wdt1_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sysctl_pclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <2>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	timer_pclk_gate: timer_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sysctl_pclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <3>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	iomux_pclk_gate: iomux_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sysctl_pclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <20>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	mailbox_pclk_gate: mailbox_pclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&sysctl_pclk>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <4>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	hdi_clk: hdi_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x58>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <28>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <21>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	stc_clk: stc_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll1_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <32>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x58>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <15>;
+		clk-rate-reg-div-value-mask			 = <0x1F>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <19>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ts_clk: ts_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&osc24m>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <256>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x58>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <20>;
+		clk-rate-reg-div-value-mask			 = <0xFF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+
+	wdt0: wdt0 {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&osc24m>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <64>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x58>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0x3F>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	wdt1: wdt1 {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&osc24m>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <64>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x58>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <9>;
+		clk-rate-reg-div-value-mask			 = <0x3F>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <6>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	timerx_pulse_in: timerx_pulse_in {
+		#clock-cells							= <0>;
+		compatible							  = "fixed-clock";
+		clock-frequency						 = <50000000>;
+		clock-accuracy						  = <0>;
+		status								  = "okay";
+		read-only							   = <0>;
+	};
+	timer0_clk_src: timer0_clk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x54>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	timer0_clk: timer0_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks			= <&timer0_clk_src>, <&timerx_pulse_in>;
+		clk-parent-reg-offset				   = <0x50>;
+		clk-parent-reg-value-shift			  = <7>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <13>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	timer1_clk_src: timer1_clk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x54>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	timer1_clk: timer1_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks				= <&timer1_clk_src>, <&timerx_pulse_in>;
+		clk-parent-reg-offset				   = <0x50>;
+		clk-parent-reg-value-shift			  = <8>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <14>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	timer2_clk_src: timer2_clk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x54>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	timer2_clk: timer2_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks				= <&timer2_clk_src>, <&timerx_pulse_in>;
+		clk-parent-reg-offset				   = <0x50>;
+		clk-parent-reg-value-shift			  = <9>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <15>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	timer3_clk_src: timer3_clk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x54>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <9>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	timer3_clk: timer3_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks				 = <&timer3_clk_src>, <&timerx_pulse_in>;
+		clk-parent-reg-offset				   = <0x50>;
+		clk-parent-reg-value-shift			  = <10>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <16>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	timer4_clk_src: timer4_clk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x54>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <12>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	timer4_clk: timer4_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks					= <&timer4_clk_src>, <&timerx_pulse_in>;
+		clk-parent-reg-offset				   = <0x50>;
+		clk-parent-reg-value-shift			  = <11>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <17>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	timer5_clk_src: timer5_clk_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div16>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x54>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <15>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+	timer5_clk: timer5_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks					= <&timer5_clk_src>, <&timerx_pulse_in>;
+		clk-parent-reg-offset				   = <0x50>;
+		clk-parent-reg-value-shift			  = <12>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x50>;
+		clk-gate-reg-bit-enable				 = <18>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	shrm_src: shrm_src {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks				= <&pll0_div2>, <&pll3_div2>;
+		clk-parent-reg-offset				   = <0x5C>;
+		clk-parent-reg-value-shift			  = <14>;
+		clk-parent-reg-value-mask			   = <0x1>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <10>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	shrm_div2: shrm_div2 {
+		#clock-cells							= <0>;
+		compatible	 = "fixed-factor-clock";
+		clocks								  = <&shrm_src>;
+		clock-div							   = <2>;
+		clock-mult							  = <1>;
+		status								  = "okay";
+		read-only							   = <0>;
+	};
+	shrm_axis_clk_gate: shrm_axis_clk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&shrm_div2>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <11>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	decompress_aclk_gate: decompress_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&shrm_src>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <7>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	shrm_pclk: shrm_pclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x5C>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <18>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	shrm_axim_clk_gate: shrm_axim_clk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <12>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	gsdma_aclk_gate: gsdma_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks						= <&shrm_axim_clk_gate>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	nonai2d_aclk_gate: nonai2d_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks							= <&shrm_axim_clk_gate>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <9>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	pdma_aclk_gate: pdma_aclk_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks							= <&shrm_axim_clk_gate>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x5C>;
+		clk-gate-reg-bit-enable				 = <3>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ddrc_core_clk: ddrc_core_clk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* parents */
+		clocks					= <&pll0_div2>, <&pll0_div3>, <&pll2_div4>;
+		clk-parent-reg-offset				   = <0x60>;
+		clk-parent-reg-value-shift			  = <0>;
+		clk-parent-reg-value-mask			   = <0x3>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x60>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <10>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x60>;
+		clk-gate-reg-bit-enable				 = <2>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ddrc_bypass_gate: ddrc_bypass_gate {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll2_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x60>;
+		clk-gate-reg-bit-enable				 = <8>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	ddrc_pclk: ddrc_pclk {
+		#clock-cells							= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks								  = <&pll0_div4>;
+		status								  = "okay";
+		read-only							   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x60>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <14>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x60>;
+		clk-gate-reg-bit-enable				 = <9>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	disp_hclk: disp_hclk {
+		#clock-cells	= <0>;
+		compatible	  = "canaan,k230-clk-composite";
+		clocks		  = <&pll0_div4>;
+		status		  = "okay";
+		read-only	   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x78>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <0>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	disp_aclk_gate: disp_aclk_gate {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&pll0_div4>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <1>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	disp_clkext: disp_clkext {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&pll0_div3>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x78>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <16>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	disp_gpu: disp_gpu {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&pll0_div3>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x78>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <20>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <6>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	dpipclk: dpipclk {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&pll1_div4>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <256>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset					 = <0x78>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <3>;
+		clk-rate-reg-div-value-mask			 = <0xFF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <2>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	disp_cfgclk: disp_cfgclk {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&pll1_div4>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <32>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset		 = <0x78>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <11>;
+		clk-rate-reg-div-value-mask			 = <0x1F>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <4>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	disp_refclk_gate: disp_refclk_gate {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&osc24m>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x74>;
+		clk-gate-reg-bit-enable				 = <3>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	vpu_src: vpu_src {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&pll0_div2>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <16>;
+		clk-rate-conf-div-min				   = <16>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <0>;
+		clk-rate-reg-offset		 = <0xC>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <1>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0xC>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	vpu_aclk_src: vpu_aclk_src {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&vpu_src>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset	 = <0xC>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+	};
+
+	vpu_aclk: vpu_aclk {
+		#clock-cells		= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			= <&vpu_aclk_src>;
+		status			= "okay";
+		read-only		= <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0xc>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	vpu_ddrcp2: vpu_ddrcp2 {
+		#clock-cells		= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			= <&vpu_aclk_src>;
+		status			= "okay";
+		read-only		= <0>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x60>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	vpu_cfg: vpu_cfg {
+		#clock-cells			= <0>;
+		compatible			= "canaan,k230-clk-composite";
+		clocks				= <&pll0_div4>;
+		status				= "okay";
+		read-only			= <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset		= <0xC>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift		= <11>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0xC>;
+		clk-gate-reg-bit-enable				 = <10>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	sec_pclk: sec_pclk {
+		#clock-cells		= <0>;
+		compatible		= "canaan,k230-clk-composite";
+		clocks			= <&pll0_div4>;
+		status			= "okay";
+		read-only		= <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset	        = <0x80>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <1>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x80>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+	sec_fixclk: sec_fixclk {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&pll1_div4>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <32>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset		= <0x80>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <6>;
+		clk-rate-reg-div-value-mask			 = <0x1F>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x80>;
+		clk-gate-reg-bit-enable				 = <5>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	sec_aclk_gate: sec_aclk_gate {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&pll1_div4>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset		 = <0x80>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <11>;
+		clk-rate-reg-div-value-mask			 = <0x3>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x80>;
+		clk-gate-reg-bit-enable				 = <4>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	usb_clk480: usb_clk480 {
+		#clock-cells		= <0>;
+		compatible		  = "canaan,k230-clk-composite";
+		clocks			  = <&pll1>;
+		status			  = "okay";
+		read-only		   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset		 = <0x100>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <1>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x100>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	usb_clk100: usb_clk100 {
+		#clock-cells			= <0>;
+		compatible			  = "canaan,k230-clk-composite";
+		clocks				  = <&pll0_div4>;
+		status				  = "okay";
+		read-only			   = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <8>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset		 = <0x100>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <4>;
+		clk-rate-reg-div-value-mask			 = <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x100>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	dphy_test_clk: dphy_test_clk {
+		#clock-cells	        = <0>;
+		compatible	        = "canaan,k230-clk-composite";
+		clocks		        = <&pll0>;
+		status		        = "okay";
+		read-only	        = <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min				   = <1>;
+		clk-rate-conf-mul-max				   = <1>;
+		clk-rate-conf-div-min				   = <1>;
+		clk-rate-conf-div-max				   = <16>;
+		clk-rate-calc-method					= <1>;
+		clk-rate-reg-offset	 = <0x104>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift			= <1>;
+		clk-rate-reg-div-value-mask			 = <0xF>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x104>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+
+	spi2axi_aclk: spi2axi_aclk {
+		#clock-cells			= <0>;
+		compatible			= "canaan,k230-clk-composite";
+		clocks				= <&pll0_div4>;
+		status				= "okay";
+		read-only			= <0>;
+
+		/* rate */
+		clk-rate-conf-mul-min	        = <1>;
+		clk-rate-conf-mul-max	        = <1>;
+		clk-rate-conf-div-min	        = <1>;
+		clk-rate-conf-div-max	        = <8>;
+		clk-rate-calc-method	        = <1>;
+		clk-rate-reg-offset	 = <0x108>;
+		clk-rate-reg-mul-value-shift			= <0>;
+		clk-rate-reg-mul-value-mask			 = <0>;
+		clk-rate-reg-div-value-shift	= <1>;
+		clk-rate-reg-div-value-mask	= <0x7>;
+		clk-rate-reg-write-enable-bit		   = <31>;
+
+		/* gate */
+		clk-gate-reg-offset					 = <0x108>;
+		clk-gate-reg-bit-enable				 = <0>;
+		clk-gate-reg-bit-reverse				= <0>;
+	};
+};
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
