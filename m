Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF85C4708E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 03:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=279iMdi0fMlBUbZ7aETboKjCv5RzLIHTJ0alI4r1+bk=; b=AdXOIISCLrw81T
	Xq+hBfejmY1D+/9ViS4qe9SeLlX07Zi/+puDA5SFshkpC5F/AF3XNk/kuJIhXhantYD5M75Jiv6Zi
	2OZKyQGJC3MwgJ+PxrXboiQQO+Zf7L0vGa5qqpqQ0eaH+xFFSIV6eMwofTV5GieSrkKSv0uYOlsQe
	ufNFrZuhJCK711NFg1JgeA5lHtH2Lgg0JC6/ruaiEziGpcY8TnRcr3npTjhmS0FkWR4vFg32fxqUe
	QSF75M1mxvVo6R3d7+f/04+/W1p8XvNjdf+nr2QIGw3D+RFMqVaP1OvmRy5ciq3P2XqIJkZ/cvjqr
	e7ts/q4GUpOjl8mnPidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyI-00HMZ5-Pu; Fri, 06 Jan 2023 03:00:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyE-00HMOz-R3
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 03:00:41 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 48AD424E1E2;
	Fri,  6 Jan 2023 11:00:09 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 11:00:09 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 6 Jan 2023 11:00:07 +0800
From: Yanhong Wang <yanhong.wang@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: [PATCH v3 6/7] riscv: dts: starfive: jh7110: Add ethernet device node
Date: Fri, 6 Jan 2023 11:00:00 +0800
Message-ID: <20230106030001.1952-7-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_190039_206077_3E371095 
X-CRM114-Status: GOOD (  10.02  )
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

Add JH7110 ethernet device node to support gmac driver for the JH7110
RISC-V SoC.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index c22e8f1d2640..c6de6e3b1a25 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -433,5 +433,98 @@
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		stmmac_axi_setup: stmmac-axi-config {
+			snps,lpi_en;
+			snps,wr_osr_lmt = <4>;
+			snps,rd_osr_lmt = <4>;
+			snps,blen = <256 128 64 32 0 0 0>;
+		};
+
+		gmac0: ethernet@16030000 {
+			compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
+			reg = <0x0 0x16030000 0x0 0x10000>;
+			clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
+				 <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
+				 <&aoncrg JH7110_AONCLK_GMAC0_TX>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_GTXC>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+						"tx", "gtxc", "gtx";
+			resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
+				 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
+			reset-names = "stmmaceth", "ahb";
+			interrupts = <7>, <6>, <5>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+			phy-mode = "rgmii-id";
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <2048>;
+			tx-fifo-depth = <2048>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,tso;
+			snps,en-tx-lpi-clockgating;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+			phy-handle = <&phy0>;
+
+			mdio0: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+
+				phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+			};
+		};
+
+		gmac1: ethernet@16040000 {
+			compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
+			reg = <0x0 0x16040000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_TX>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_GTXC>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_GTXCLK>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+					"tx", "gtxc", "gtx";
+			resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
+				 <&syscrg JH7110_SYSRST_GMAC1_AHB>;
+			reset-names = "stmmaceth", "ahb";
+			interrupts = <78>, <77>, <76>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+			phy-mode = "rgmii-id";
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <2048>;
+			tx-fifo-depth = <2048>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,tso;
+			snps,en-tx-lpi-clockgating;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+			phy-handle = <&phy1>;
+
+			mdio1: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+
+				phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
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
