Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FBBCE837A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 06:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmkVT3UUsYHrfMntJeOO1eFLgxdMSSth3+X4fSGkkW0=; b=vPPwaYDM3yzRVO
	S3Gw/wfa0vPDJKOQYA48shO72i0Q++9bwok8zRfo6HcroJtEQPSW5yI5EK1VK/0ItgenFewpFspLB
	fQwhR+vW9BzQLu4XFimRDxuSgcfo7d6b1jOKfcjTAFQWEN16qwmEaZpWEaZnQaJOdLQo0Tc09an1r
	TENhIsR5Pn8J2p4tg3joYgHjVDfywx3DThH6MQDuFAP+oDKI0oxO5dls772PIz5tCAHwjK1tp1hta
	0eALXxkSryCdYCkO3myfh6jNuJ6aCtu0/MG8101zkGTv+mRgId1a9Ec4srDgFj0BVe05xE9fVA04Z
	hvonbmWoNgZtCo5p/CjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWNN-00000001kdh-16IR;
	Tue, 01 Oct 2024 06:28:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWIW-00000001jfw-4AQl
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 06:23:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71788bfe60eso3820095b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 23:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727763828; x=1728368628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi6MbgpcjxNz7J/90Ks0nG6XyZLb82+oL3Q1xk6qz6g=;
        b=M5MWoSpo2/r6HdpqNDAgF3V+nH5SW6Z6mLYGNyb1pSuK8a/ZeBxOGBcdCfG/Qplvlk
         Eo1qwPUEs8N51ZsBHRPOg1bZH+OMxlGs1jLxTaF3JugIm5O8lpuaMW4Lo/Jrxk14Z06Q
         ruwLWflzFYypcH2vy/3RIBasqUvJByF8G6ne0Rb51qsFdXKzVr7SdKY5i3mhHMHm3G7P
         u9ZfoU50+b4sw2cfz7VUakCjJdlzlGmPlzitRWRB0uyT4ZMDiMqAPTFLyrzdwO2BKK3t
         Tu310HloXnxPEdkXzdrUYMw5mxDV+Ebq9XKZOY+uEGEoSbcL6rVY5h0kxOHQyajVgZfm
         cXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727763828; x=1728368628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mi6MbgpcjxNz7J/90Ks0nG6XyZLb82+oL3Q1xk6qz6g=;
        b=ix0H8UhFMJgv4wWp+iyHDYyAbubAfHBaLGesw8QqMstnaIwcI0sEi7yZU8axf7V3eI
         //mFiZFCWDF7vpNlHVmq0dnHiSwHaIr6UlLWrkecrJsiPgSx9LkdI3OKHwJIY+wKRK6t
         f+ULq3qnI9Cb86qtx4+MB8DJxeCz5bo5xnm6m4iszG0sSl9CN3HQxNepQovhNIp3OPuH
         aaGp9X+xJ12e2KAy4KwAQjcPnHxAMDqFgB6eRTwRF7J4X0Uh5TVTWo3BIlyBQT1XQFkL
         +9cs+EZOpwKBfZAptm+HfpLnNQrbDnRcZ5za5eU+uIyvDODUtCNOnD5AUE8ZFN3GFPyQ
         URDg==
X-Forwarded-Encrypted: i=1; AJvYcCV0E6cY6MryiNUOTOo35+LArVx/myY8vY+i72Z16JCcbCdyca7x6y3Fl6tyDzCbb2bRfLzgVf50llaIEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHnFoFUyOXBsFZ/3j5AeTq51ApmdEPAumVJoxVljAAqiO3koLv
	dyTOGYihhOlhHzS+OeMKvayVVwGltn63c62Vqpqc9BJkmnwu3N4FP8AF1HynQq0=
X-Google-Smtp-Source: AGHT+IGUx3z5LjfCraty0tlm7iMGGUqNUaAgXg0te1OSr2WrvANUSw4usUewXwKe8D8dD5u1SSPMnA==
X-Received: by 2002:a05:6a00:9a3:b0:714:2014:d783 with SMTP id d2e1a72fcca58-71b25f275aamr21738286b3a.2.1727763827571;
        Mon, 30 Sep 2024 23:23:47 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264ba68dsm7267804b3a.57.2024.09.30.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:23:47 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 23:23:26 -0700
Subject: [PATCH v3 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
MIME-Version: 1.0
Message-Id: <20240930-th1520-dwmac-v3-3-ae3e03c225ab@tenstorrent.com>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
In-Reply-To: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Drew Fustini <dfustini@tenstorrent.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_232349_259504_C9516994 
X-CRM114-Status: GOOD (  11.46  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add gmac, mdio, and phy nodes to enable the gigabit Ethernet ports on
the BeagleV Ahead and Sipeed Lichee Pi 4a boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node,
       add phy reset delay properties for beaglev ahead]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 +++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 129 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++++++
 3 files changed, 270 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 5a5888f4eda6..ddcee6298939 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "beagle,beaglev-ahead", "thead,th1520";
 
 	aliases {
+		ethernet0 = &gmac0;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -108,6 +109,25 @@ &sdio0 {
 	status = "okay";
 };
 
+&gmac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_pins>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&mdio0 {
+	phy0: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <50000>;
+	};
+};
+
 &padctrl_aosys {
 	led_pins: led-0 {
 		led-pins {
@@ -127,6 +147,77 @@ led-pins {
 };
 
 &padctrl0_apsys {
+	gmac0_pins: gmac0-0 {
+		tx-pins {
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GMAC0_RX_CLK",
+			       "GMAC0_RXDV",
+			       "GMAC0_RXD0",
+			       "GMAC0_RXD1",
+			       "GMAC0_RXD2",
+			       "GMAC0_RXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdc-pins {
+			pins = "GMAC0_MDC";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdio-pins {
+			pins = "GMAC0_MDIO";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+
+		phy-reset-pins {
+			pins = "GMAC0_COL"; /* GPIO3_21 */
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		phy-interrupt-pins {
+			pins = "GMAC0_CRS"; /* GPIO3_22 */
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index ca84bc2039ef..6e3260eb53f4 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -11,6 +11,11 @@ / {
 	model = "Sipeed Lichee Module 4A";
 	compatible = "sipeed,lichee-module-4a", "thead,th1520";
 
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x00000000 0x2 0x00000000>;
@@ -25,6 +30,16 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&dmac0 {
+	status = "okay";
+};
+
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &aonsys_clk {
 	clock-frequency = <73728000>;
 };
@@ -55,6 +70,22 @@ &sdio0 {
 	status = "okay";
 };
 
+&gmac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_pins>, <&mdio0_pins>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_pins>;
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
 &gpio0 {
 	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
 			  "", "", "", "", "", "", "", "", "", "",
@@ -87,3 +118,101 @@ &gpio3 {
 			  "GPIO09",
 			  "GPIO10";
 };
+
+&mdio0 {
+	phy0: ethernet-phy@1 {
+		reg = <1>;
+	};
+
+	phy1: ethernet-phy@2 {
+		reg = <2>;
+	};
+};
+
+&padctrl0_apsys {
+	gmac0_pins: gmac0-0 {
+		tx-pins {
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GMAC0_RX_CLK",
+			       "GMAC0_RXDV",
+			       "GMAC0_RXD0",
+			       "GMAC0_RXD1",
+			       "GMAC0_RXD2",
+			       "GMAC0_RXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	gmac1_pins: gmac1-0 {
+		tx-pins {
+			pins = "GPIO2_18", /* GMAC1_TX_CLK */
+			       "GPIO2_20", /* GMAC1_TXEN */
+			       "GPIO2_21", /* GMAC1_TXD0 */
+			       "GPIO2_22", /* GMAC1_TXD1 */
+			       "GPIO2_23", /* GMAC1_TXD2 */
+			       "GPIO2_24"; /* GMAC1_TXD3 */
+			function = "gmac1";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GPIO2_19", /* GMAC1_RX_CLK */
+			       "GPIO2_25", /* GMAC1_RXDV */
+			       "GPIO2_30", /* GMAC1_RXD0 */
+			       "GPIO2_31", /* GMAC1_RXD1 */
+			       "GPIO3_0",  /* GMAC1_RXD2 */
+			       "GPIO3_1";  /* GMAC1_RXD3 */
+			function = "gmac1";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	mdio0_pins: mdio0-0 {
+		mdc-pins {
+			pins = "GMAC0_MDC";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdio-pins {
+			pins = "GMAC0_MDIO";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index b958f249930e..1228c7dd80c6 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -222,6 +222,12 @@ aonsys_clk: aonsys-clk {
 		#clock-cells = <0>;
 	};
 
+	stmmac_axi_config: stmmac-axi-config {
+		snps,wr_osr_lmt = <15>;
+		snps,rd_osr_lmt = <15>;
+		snps,blen = <0 0 64 32 0 0 0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -273,6 +279,50 @@ uart0: serial@ffe7014000 {
 			status = "disabled";
 		};
 
+		gmac1: ethernet@ffe7060000 {
+			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
+			reg-names = "dwmac", "apb";
+			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>;
+			clock-names = "stmmaceth", "pclk";
+			snps,pbl = <32>;
+			snps,fixed-burst;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,axi-config = <&stmmac_axi_config>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac0: ethernet@ffe7070000 {
+			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
+			reg-names = "dwmac", "apb";
+			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>;
+			clock-names = "stmmaceth", "pclk";
+			snps,pbl = <32>;
+			snps,fixed-burst;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,axi-config = <&stmmac_axi_config>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
