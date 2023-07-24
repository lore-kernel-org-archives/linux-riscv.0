Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12398C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlUNwOizLaC9iwCCixsCWlj7nBxFkiTsygjbDT7gmAE=; b=2OqNjkeeIXCkkQ
	bX/wOpPNkBESqrdxSyRvu6ZlzvlHlbVcVikFKGkh/Sr8iB2RFf3p0tGNPtBMn2Y3rJj0JWK8ytyb8
	UxceTAHZgUPsNjGTNMh0Hi71vmk54FsEJjw3jMJMJs/gAV0wdj4AcfeoEjmkpFzPkNj68ay9K+ycp
	mmxq/utZyvNM9MsjRJaPRdPUKJauTjbIR/ND+UztKtmzMA6SBvsvRDFPmXZzX7xH5f9pOAMNwmOnw
	U9JmuxK5P8WtiNlCuIZSYSEQTkXlJdKWtrvcusGGmoryOt3h7zr6jGglCyPKFRNB/Oj/uecMlRKZB
	0oIqIVwqo8qVUglgk5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsXq-003c5I-23;
	Mon, 24 Jul 2023 10:12:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsXn-003buN-0q
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:12:01 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9E71D7FD6;
	Mon, 24 Jul 2023 18:10:57 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 18:10:57 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 24 Jul 2023 18:10:56 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v3 2/2] riscv: dts: starfive: Add spi node and pins configuration
Date: Mon, 24 Jul 2023 18:10:54 +0800
Message-ID: <20230724101054.25268-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724101054.25268-1-william.qiu@starfivetech.com>
References: <20230724101054.25268-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_031159_659891_B3655603 
X-CRM114-Status: UNSURE (   9.24  )
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

Add StarFive JH7110 SPI controller node and pins configuration on
VisionFive 2 board.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../jh7110-starfive-visionfive-2.dtsi         |  50 +++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 105 ++++++++++++++++++
 2 files changed, 155 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index fa0061eb33a7..9e6ccf460877 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -143,6 +143,18 @@ &i2c6 {
 	status = "okay";
 };
 
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	status = "okay";
+
+	spi_dev0: spi@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
 &sysgpio {
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
@@ -200,6 +212,44 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
 
+	spi0_pins: spi0-0 {
+		mosi-pins {
+			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		miso-pins {
+			pinmux = <GPIOMUX(53, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_SPI0_RXD)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+
+		sck-pins {
+			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_CLK,
+					      GPOEN_ENABLE,
+					      GPI_SYS_SPI0_CLK)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		ss-pins {
+			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_FSS,
+					      GPOEN_ENABLE,
+					      GPI_SYS_SPI0_FSS)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index ec2e70011a73..c2142a4e6a59 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -386,6 +386,51 @@ i2c2: i2c@10050000 {
 			status = "disabled";
 		};
 
+		spi0: spi@10060000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x10060000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI0_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI0_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI0_APB>;
+			interrupts = <38>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@10070000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x10070000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI1_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI1_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI1_APB>;
+			interrupts = <39>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@10080000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x10080000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI2_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI2_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI2_APB>;
+			interrupts = <40>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart3: serial@12000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x12000000 0x0 0x10000>;
@@ -473,6 +518,66 @@ i2c6: i2c@12060000 {
 			status = "disabled";
 		};
 
+		spi3: spi@12070000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x12070000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI3_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI3_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI3_APB>;
+			interrupts = <52>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi4: spi@12080000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI4_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI4_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI4_APB>;
+			interrupts = <53>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi5: spi@12090000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x12090000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI5_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI5_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI5_APB>;
+			interrupts = <54>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi6: spi@120a0000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0x120A0000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SPI6_APB>,
+				 <&syscrg JH7110_SYSCLK_SPI6_APB>;
+			clock-names = "sspclk", "apb_pclk";
+			resets = <&syscrg JH7110_SYSRST_SPI6_APB>;
+			interrupts = <55>;
+			arm,primecell-periphid = <0x00041022>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
