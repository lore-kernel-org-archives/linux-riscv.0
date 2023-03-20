Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AA7C6FD1F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE3EKeLIST7mK1NaM1T81QalaOrwJXlFKaTTI7Be4wo=; b=kP/AWf5tNwKc6D
	J45x3/JWNjyHZekt0cGuPRPoTi3RIsNP152je8JZUixHsOr1Dsl47MjphkhiDIcUJ3n2HNXm1bUpD
	XmAYsDcmjm1ecgr9/5UsPIcsZYR+3CO92yfsagNTRaOE5WhOV6vmD3kHTlVAuKG1/wrSKxWfcy68D
	PTiC7E838QJILYE4TFLd09hexR2zX2TgQvZUAHPFGLrtkjbdpP9ZuaBxmpRo0EH4pGnLaRQm2QZ4b
	rVT7he65TLLA3sWkv6IW6RdOJXlXHlBG7gK7Y02k4ktCFuRAqsxxLymSOG7gaDwF2ArbZCckZYQd3
	mW7FhucbSZBb9qSu+FPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3mA-007nur-13;
	Mon, 20 Mar 2023 00:53:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3lw-007nnN-0R;
	Mon, 20 Mar 2023 00:53:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD76C1063;
	Sun, 19 Mar 2023 17:53:52 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3433F885;
	Sun, 19 Mar 2023 17:53:05 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/4] ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
Date: Mon, 20 Mar 2023 00:52:47 +0000
Message-Id: <20230320005249.13403-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230320005249.13403-1-andre.przywara@arm.com>
References: <20230320005249.13403-1-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_175312_222882_924B20BC 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Allwinner T113-s SoC is apparently using the same (or at least a very
similar) die as the D1/D1s, but replaces the single RISC-V core with
two Arm Cortex-A7 cores.
Since the D1 core .dtsi already describes all common peripherals, we
just need a DT describing the ARM specific peripherals: the CPU cores,
the Generic Timer, the GIC and the PMU.
We include the core .dtsi directly from the riscv DT directory.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/sun8i-t113s.dtsi | 59 ++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi

diff --git a/arch/arm/boot/dts/sun8i-t113s.dtsi b/arch/arm/boot/dts/sun8i-t113s.dtsi
new file mode 100644
index 0000000000000..804aa197a24f8
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-t113s.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// Copyright (C) 2022 Arm Ltd.
+
+#define SOC_PERIPHERAL_IRQ(nr) GIC_SPI nr
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/allwinner/sunxi-d1s-t113.dtsi>
+#include <riscv/allwinner/sunxi-d1-t113.dtsi>
+
+/ {
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+		};
+	};
+
+	gic: interrupt-controller@1c81000 {
+		compatible = "arm,gic-400";
+		reg = <0x03021000 0x1000>,
+		      <0x03022000 0x2000>,
+		      <0x03024000 0x2000>,
+		      <0x03026000 0x2000>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-controller;
+		#interrupt-cells = <3>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+};
-- 
2.35.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
