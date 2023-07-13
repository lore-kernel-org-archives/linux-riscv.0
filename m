Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135FCC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCYNL22hab+8lQRD46/Jz1RNY9+mb2eWBv0d1+D8IAo=; b=G8AXSKeYm+k5Gh
	9CV6GddnJIkQijEGMoTLKCfvYv+i1qfUX69xwHr6JeiYDgbJcqE3wHSbhroPugsVEh2OO9mL4ruJb
	fTlyc6zYdhB/X0/55NgIwVmHUw77B2ZuPjBLPuU+CMqKjof/eS3sEaIGlUsFI19ZzEndpsgZVHkPs
	g2jHjVrn7skh/TF5qU7HTMtNyllqBJgkoCdE35DDBqL41sy0bcdSoJ6j64XIo5SaV6n8d/RmUUan8
	zi+0F4zOfx0vTUoBXvYuHKBiVIaVNT3hD9hIQ8Ai4mntH/ypUtXzPrkTvLTY3o7JmS72+GCv9Z43X
	oKLVXa/BqVltbUWHFyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJufe-0036ej-1E;
	Thu, 13 Jul 2023 11:39:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJufW-0036XT-2d
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:39:39 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E09C924E217;
	Thu, 13 Jul 2023 19:39:10 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 19:39:10 +0800
Received: from localhost.localdomain (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 19:39:10 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <emil.renner.berthing@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v8 9/9] riscv: dts: starfive: jh7110: Add STGCRG/ISPCRG/VOUTCRG nodes
Date: Thu, 13 Jul 2023 19:39:02 +0800
Message-ID: <20230713113902.56519-10-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
References: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_043935_304291_C85D5F4A 
X-CRM114-Status: GOOD (  10.14  )
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

Add STGCRG/ISPCRG/VOUTCRG new node to support JH7110
System-Top-Group, Image-Signal-Process and Video-Output
clock and reset drivers for the JH7110 RISC-V SoC.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index e9c1e4ad71a2..0005fa163a78 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
+#include <dt-bindings/power/starfive,jh7110-pmu.h>
 #include <dt-bindings/reset/starfive,jh7110-crg.h>
 
 / {
@@ -398,6 +399,25 @@ i2c2: i2c@10050000 {
 			status = "disabled";
 		};
 
+		stgcrg: clock-controller@10230000 {
+			compatible = "starfive,jh7110-stgcrg";
+			reg = <0x0 0x10230000 0x0 0x10000>;
+			clocks = <&osc>,
+				 <&syscrg JH7110_SYSCLK_HIFI4_CORE>,
+				 <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
+				 <&syscrg JH7110_SYSCLK_USB_125M>,
+				 <&syscrg JH7110_SYSCLK_CPU_BUS>,
+				 <&syscrg JH7110_SYSCLK_HIFI4_AXI>,
+				 <&syscrg JH7110_SYSCLK_NOCSTG_BUS>,
+				 <&syscrg JH7110_SYSCLK_APB_BUS>;
+			clock-names = "osc", "hifi4_core",
+				      "stg_axiahb", "usb_125m",
+				      "cpu_bus", "hifi4_axi",
+				      "nocstg_bus", "apb_bus";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart3: serial@12000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x12000000 0x0 0x10000>;
@@ -558,5 +578,40 @@ pwrc: power-controller@17030000 {
 			interrupts = <111>;
 			#power-domain-cells = <1>;
 		};
+
+		ispcrg: clock-controller@19810000 {
+			compatible = "starfive,jh7110-ispcrg";
+			reg = <0x0 0x19810000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
+				 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>,
+				 <&syscrg JH7110_SYSCLK_NOC_BUS_ISP_AXI>,
+				 <&dvp_clk>;
+			clock-names = "isp_top_core", "isp_top_axi",
+				      "noc_bus_isp_axi", "dvp_clk";
+			resets = <&syscrg JH7110_SYSRST_ISP_TOP>,
+				 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>,
+				 <&syscrg JH7110_SYSRST_NOC_BUS_ISP_AXI>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			power-domains = <&pwrc JH7110_PD_ISP>;
+		};
+
+		voutcrg: clock-controller@295c0000 {
+			compatible = "starfive,jh7110-voutcrg";
+			reg = <0x0 0x295c0000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+				 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+				 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+				 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+				 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+				 <&hdmitx0_pixelclk>;
+			clock-names = "vout_src", "vout_top_ahb",
+				      "vout_top_axi", "vout_top_hdmitx0_mclk",
+				      "i2stx0_bclk", "hdmitx0_pixelclk";
+			resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			power-domains = <&pwrc JH7110_PD_VOUT>;
+		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
