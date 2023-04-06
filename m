Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D16C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RB2Yc0F2QtgB08tHxJDSpdk8F7uErdniGi5zjLR6LFY=; b=t41h0+E6NdRlbe
	CC2qdb5SjXr7Ne7N2LslqmjJGAIrbsTGrPFfaPCGv3V5wyAgRLH+BH70+L2LEmkqK+I1rlDnIGhKK
	DygYEOmaVdmefAj2U6p2paq/LwqbTRrs0thzpExFYupspFmu0xe2KdY0Cy2nVdog2wPfYbGN4vS7x
	WUtnsU2vjzqMC43uiQ3Yx1mVB/Imq9asNNDJxx3AkQwAr8SjSvaKqnpfq2I4ulicrUBvAX64F4W/V
	5afRX+zmvguWcPBne/pn7UULxxqmi63QOCcbRLCRigAmEptfKsc86uSTBNs/0dvWuLeZwuT+MJfIu
	u0oaQhKiRfg5OAgMtF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkNXI-0078B5-2n;
	Thu, 06 Apr 2023 11:12:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkNXG-00785h-0a
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 11:12:12 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C889D24E32E;
	Thu,  6 Apr 2023 19:11:47 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 19:11:47 +0800
Received: from ubuntu.localdomain (183.27.97.179) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 19:11:46 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Minda Chen
	<minda.chen@starfivetech.com>
Subject: [PATCH v1 3/3] riscv: dts: starfive: add PCIe dts configuration for JH7110
Date: Thu, 6 Apr 2023 19:11:42 +0800
Message-ID: <20230406111142.74410-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230406111142.74410-1-minda.chen@starfivetech.com>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_041210_551657_8AC4DDC3 
X-CRM114-Status: UNSURE (   9.09  )
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

The PCIe is a PCIe2, single lane PCIe compliant controller.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 58 ++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 88 +++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index cf0a66faf5d3..4552919e69b0 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -191,6 +191,50 @@
 		};
 	};
 
+	pcie0_wake_default: pcie0_wake_default {
+		wake-pins {
+			pinmux = <GPIOMUX(32, GPOUT_HIGH, GPOEN_ENABLE, GPI_NONE)>;
+			bias-disable;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	pcie0_clkreq_default: pcie0_clkreq_default {
+		clkreq-pins {
+			bias-disable;
+			pinmux = <GPIOMUX(27, GPOUT_HIGH, GPOEN_ENABLE, GPI_NONE)>;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	pcie1_wake_default: pcie1_wake_default {
+		wake-pins {
+			bias-disable;
+			pinmux = <GPIOMUX(21, GPOUT_HIGH, GPOEN_ENABLE, GPI_NONE)>;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	pcie1_clkreq_default: pcie1_clkreq_default {
+		clkreq-pins {
+			bias-disable;
+			pinmux = <GPIOMUX(29, GPOUT_HIGH, GPOEN_ENABLE, GPI_NONE)>;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
@@ -228,3 +272,17 @@
 	dr_mode = "peripheral";
 	status = "okay";
 };
+
+&pcie0 {
+	pinctrl-names = "default";
+	reset-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy0>;
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-names = "default";
+	reset-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy1>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 2f67196ffac0..c309ec550ba7 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -642,5 +642,93 @@
 			#reset-cells = <1>;
 			power-domains = <&pwrc JH7110_PD_VOUT>;
 		};
+
+		pcie0: pcie@2B000000 {
+			compatible = "starfive,jh7110-pcie";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			reg = <0x0 0x2B000000 0x0 0x1000000
+			       0x9 0x40000000 0x0 0x10000000>;
+			reg-names = "reg", "config";
+			device_type = "pci";
+			starfive,stg-syscon = <&stg_syscon 0xc0 0xc4 0x130 0x1b8>;
+			bus-range = <0x0 0xff>;
+			ranges = <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0 0x08000000>,
+				 <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0 0x40000000>;
+			interrupts = <56>;
+			interrupt-parent = <&plic>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc0 0x1>,
+					<0x0 0x0 0x0 0x2 &pcie_intc0 0x2>,
+					<0x0 0x0 0x0 0x3 &pcie_intc0 0x3>,
+					<0x0 0x0 0x0 0x4 &pcie_intc0 0x4>;
+			msi-parent = <&pcie0>;
+			msi-controller;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
+				 <&stgcrg JH7110_STGCLK_PCIE0_TL>,
+				 <&stgcrg JH7110_STGCLK_PCIE0_AXI_MST0>,
+				 <&stgcrg JH7110_STGCLK_PCIE0_APB>;
+			clock-names = "noc", "tl", "axi_mst0", "apb";
+			resets = <&stgcrg JH7110_STGRST_PCIE0_AXI_MST0>,
+				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV0>,
+				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV>,
+				 <&stgcrg JH7110_STGRST_PCIE0_BRG>,
+				 <&stgcrg JH7110_STGRST_PCIE0_CORE>,
+				 <&stgcrg JH7110_STGRST_PCIE0_APB>;
+			reset-names = "mst0", "slv0", "slv", "brg",
+				      "core", "apb";
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie1: pcie@2C000000 {
+			compatible = "starfive,jh7110-pcie";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			reg = <0x0 0x2C000000 0x0 0x1000000
+			       0x9 0xc0000000 0x0 0x10000000>;
+			reg-names = "reg", "config";
+			device_type = "pci";
+			starfive,stg-syscon = <&stg_syscon 0x270 0x274 0x2e0 0x368>;
+			bus-range = <0x0 0xff>;
+			ranges = <0x82000000  0x0 0x38000000  0x0 0x38000000 0x0 0x08000000>,
+				 <0xc3000000  0x9 0x80000000  0x9 0x80000000 0x0 0x40000000>;
+			interrupts = <57>;
+			interrupt-parent = <&plic>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc1 0x1>,
+					<0x0 0x0 0x0 0x2 &pcie_intc1 0x2>,
+					<0x0 0x0 0x0 0x3 &pcie_intc1 0x3>,
+					<0x0 0x0 0x0 0x4 &pcie_intc1 0x4>;
+			msi-parent = <&pcie1>;
+			msi-controller;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
+				 <&stgcrg JH7110_STGCLK_PCIE1_TL>,
+				 <&stgcrg JH7110_STGCLK_PCIE1_AXI_MST0>,
+				 <&stgcrg JH7110_STGCLK_PCIE1_APB>;
+			clock-names = "noc", "tl", "axi_mst0", "apb";
+			resets = <&stgcrg JH7110_STGRST_PCIE1_AXI_MST0>,
+				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV0>,
+				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV>,
+				 <&stgcrg JH7110_STGRST_PCIE1_BRG>,
+				 <&stgcrg JH7110_STGRST_PCIE1_CORE>,
+				 <&stgcrg JH7110_STGRST_PCIE1_APB>;
+			reset-names = "mst0", "slv0", "slv", "brg",
+				      "core", "apb";
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
 	};
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
