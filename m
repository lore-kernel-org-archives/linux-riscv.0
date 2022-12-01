Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD95C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiApJbxsi3uNtxYYckB51KVfwmbjmBo7ytEIVF8MYcQ=; b=pPv5ObO6p4Q07L
	b0XLzghNLxxXNISb5Dugzm8K18ZLtWQbT2tjELHU7iguzPEBab5n7ndHeTQfmXVnTsk92EiqD10Ar
	gucRJCzGG4vrbT2x0jNzrw7YAe1aUaubfFJWbmdLvj2JdlN6bw+DLCylxUillKuWRnrQ5KvqEopFQ
	a+ibx8zDb96uU+uKxb+md32Sjdpx016I3mhWqGYfJVqXFMjd9PEKUvsHj06GKM81kCe2hKr0qDZ6E
	SBClu35FhqJsrUfqmWUjqlWoZultR967r9oynJB53UzQtX9LUYrezsUpSL4yes08yU8FHli3klmin
	TODCU2hOccqnQ5r+hZpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fTX-0068lC-FJ; Thu, 01 Dec 2022 09:03:23 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fTA-00687i-Os
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:03:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D68DA24E0D6;
	Thu,  1 Dec 2022 17:02:08 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:02:08 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 1 Dec 2022 17:02:07 +0800
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
Subject: [PATCH v1 6/7] riscv: dts: starfive: jh7110: Add ethernet device node
Date: Thu, 1 Dec 2022 17:02:41 +0800
Message-ID: <20221201090242.2381-7-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010301_132702_9C1D0E66 
X-CRM114-Status: UNSURE (   9.17  )
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

Add JH7110 ethernet device node to support gmac driver for the JH7110
RISC-V SoC.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index c22e8f1d2640..97ed5418d91f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -433,5 +433,85 @@
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		stmmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <4>;
+			snps,rd_osr_lmt = <4>;
+			snps,blen = <256 128 64 32 0 0 0>;
+		};
+
+		gmac0: ethernet@16030000 {
+			compatible = "starfive,dwmac", "snps,dwmac-5.20";
+			reg = <0x0 0x16030000 0x0 0x10000>;
+			clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
+				 <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
+				 <&aoncrg JH7110_AONCLK_GMAC0_TX>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_GTXC>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>;
+			clock-names = "stmmaceth",
+					"pclk",
+					"ptp_ref",
+					"tx",
+					"gtxc",
+					"gtx";
+			resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
+				 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
+			reset-names = "stmmaceth", "ahb";
+			interrupts = <7>, <6>, <5> ;
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
+			snps,lpi_en;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+		};
+
+		gmac1: ethernet@16040000 {
+			compatible = "starfive,dwmac", "snps,dwmac-5.20";
+			reg = <0x0 0x16040000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_TX>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_GTXC>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_GTXCLK>;
+			clock-names = "stmmaceth",
+					"pclk",
+					"ptp_ref",
+					"tx",
+					"gtxc",
+					"gtx";
+			resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
+				 <&syscrg JH7110_SYSRST_GMAC1_AHB>;
+			reset-names = "stmmaceth", "ahb";
+			interrupts = <78>, <77>, <76> ;
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
+			snps,lpi_en;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
