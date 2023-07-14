Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9419C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mc1PQ2Xm02TndR/zN7qy0hyJDDyMofIxy8oWbExyAtw=; b=AaRX1vvPTPjcvI
	3cZXhzIJGzykf8//lMu5+g2UTzAqXWPxaqCt3MYr3t5CMjha4bRtT49nMZZVhWr/MG+8K8y9tqLyg
	M+cGtNDp6FJ77Zd4vZ/zbsDBzxh7CPt6jWZN7pEwNSPe9WVcS7ViVbphRxOF9fDXeyGeSEdU1fnm6
	eNNiaxRdC5/NfLVvGvx+06HmPGWKh525Mw4fQBxZW3dlcFENPx8KryohvGBnkjuveWLexrPn+JUxS
	x2Inf0ljC/qrG790iK8FjDl0OtnC55em4PXWao+tiSnFb2N+28zFCkD9FnA2W7s4imujxKa/W8zLg
	DWGedW+BW0ntbhjADAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKGJO-005t8U-0f;
	Fri, 14 Jul 2023 10:46:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKGJK-005snL-3D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 10:46:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4291A24E226;
	Fri, 14 Jul 2023 18:45:24 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 18:45:24 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX062.cuchost.com (172.16.6.62) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 14 Jul 2023 18:45:22 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
	<joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v1 1/2] riscv: dts: starfive: jh7110: Add ethernet device nodes
Date: Fri, 14 Jul 2023 18:45:20 +0800
Message-ID: <20230714104521.18751-2-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230714104521.18751-1-samin.guo@starfivetech.com>
References: <20230714104521.18751-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_034607_354301_0CB703E9 
X-CRM114-Status: UNSURE (   9.28  )
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

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 69 ++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 06a08c39c671..857e61a216ac 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -263,6 +263,13 @@
 		#clock-cells = <0>;
 	};
 
+	stmmac_axi_setup: stmmac-axi-config {
+		snps,lpi_en;
+		snps,wr_osr_lmt = <4>;
+		snps,rd_osr_lmt = <4>;
+		snps,blen = <256 128 64 32 0 0 0>;
+	};
+
 	tdm_ext: tdm-ext-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "tdm_ext";
@@ -522,6 +529,68 @@
 				 <&syscrg JH7110_SYSRST_WDT_CORE>;
 		};
 
+		gmac0: ethernet@16030000 {
+			compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
+			reg = <0x0 0x16030000 0x0 0x10000>;
+			clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
+				 <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
+				 <&aoncrg JH7110_AONCLK_GMAC0_TX_INV>,
+				 <&syscrg JH7110_SYSCLK_GMAC0_GTXC>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "gtx";
+			resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
+				 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
+			reset-names = "stmmaceth", "ahb";
+			interrupts = <7>, <6>, <5>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+			rx-fifo-depth = <2048>;
+			tx-fifo-depth = <2048>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <8>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,tso;
+			snps,en-tx-lpi-clockgating;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			starfive,syscon = <&aon_syscon 0xc 0x12>;
+			status = "disabled";
+		};
+
+		gmac1: ethernet@16040000 {
+			compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
+			reg = <0x0 0x16040000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_TX_INV>,
+				 <&syscrg JH7110_SYSCLK_GMAC1_GTXC>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "gtx";
+			resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
+				 <&syscrg JH7110_SYSRST_GMAC1_AHB>;
+			reset-names = "stmmaceth", "ahb";
+			interrupts = <78>, <77>, <76>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+			rx-fifo-depth = <2048>;
+			tx-fifo-depth = <2048>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <8>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,tso;
+			snps,en-tx-lpi-clockgating;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			starfive,syscon = <&sys_syscon 0x90 0x2>;
+			status = "disabled";
+		};
+
 		aoncrg: clock-controller@17000000 {
 			compatible = "starfive,jh7110-aoncrg";
 			reg = <0x0 0x17000000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
