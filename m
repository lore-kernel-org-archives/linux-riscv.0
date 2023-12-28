Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18138C46CD3
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 06:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlzEX92/e57YFD9F5OHTZ0SzdVuR179jO6djRUAGmQw=; b=HYVPu5peJvF81K
	LbATzYGjSfMhvvAN/7/MknEM5DmL6NJ+T4orJZrXRgQ8CZf+6iU+jSqgNXwcVabOyU+xg1c4Std8B
	ahebMCdfJYBnrvMtzWyye/HLleedudKTB/PpbKZLcAPHCekT/VJA1G9wjBFA31sU+HzvF+myur9Qh
	Luj8IZfW70zQ2cOHrLcn+3X5ls0P/ufoXKmW/dwJtaNE/WeTeIWWfMbAirhSH1odblqgg21u/quz5
	cak1wqXo11unMPrBIptinTvy8Q1SW1h73Fe3JLHF1rtQxC7cJfJXZZJ72o9aZbicDmIDpxXwey5Vl
	eipdrcA/d+94XzcuQuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkHa-00GI1e-2T;
	Thu, 28 Dec 2023 06:54:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkHW-00GHvB-1o
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 06:54:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9F3147F8A;
	Thu, 28 Dec 2023 14:53:46 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 14:53:46 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 14:53:41 +0800
From: Alex Soo <yuklin.soo@starfivetech.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
	<adrian.hunter@intel.com>, Yangtao Li <frank.li@vivo.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alex Soo <yuklin.soo@starfivetech.com>
Subject: [PATCH 3/3] riscv: dts: starfive: jh8100: Add SD/eMMC device tree nodes
Date: Thu, 28 Dec 2023 14:53:22 +0800
Message-ID: <20231228065322.1176351-4-yuklin.soo@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231228065322.1176351-1-yuklin.soo@starfivetech.com>
References: <20231228065322.1176351-1-yuklin.soo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_225414_884951_B1D8C7A8 
X-CRM114-Status: UNSURE (   8.91  )
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

Add SD/eMMC device tree nodes.

Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh8100.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
index 9c8ca73fffe0..545109ca6c49 100644
--- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
@@ -484,6 +484,15 @@ syscrg_sw: syscrg_sw@12720000 {
 			#reset-cells = <1>;
 		};
 
+		sd1: mmc@12740000 {
+			compatible = "starfive,jh8100-sd6hc", "cdns,sd6hc";
+			reg = <0x0 0x12740000 0x0 0x10000>;
+			interrupts = <91>;
+			bus-width = <4>;
+			cap-sd-highspeed;
+			status = "disabled";
+		};
+
 		pinctrl_gmac: pinctrl@12770000 {
 			compatible = "starfive,jh8100-sys-pinctrl-gmac",
 				     "syscon", "simple-mfd";
@@ -509,6 +518,31 @@ uart6: serial@127e0000  {
 			status = "disabled";
 		};
 
+		emmc: mmc@1f110000 {
+			compatible = "starfive,jh8100-sd6hc", "cdns,sd6hc";
+			reg = <0x0 0x1f110000 0x0 0x10000>;
+			interrupts = <174>;
+			clock-names = "main", "sdmclk";
+			clocks = <&aoncrg AONCRG_CLK_EMMC_ICG_EN>,
+				 <&aoncrg AONCRG_CLK_EMMC_SDMCLK>;
+			resets = <&aoncrg AONCRG_RSTN_EMMC>;
+			bus-width = <8>;
+			status = "disabled";
+		};
+
+		sd0: mmc@1f120000 {
+			compatible = "starfive,jh8100-sd6hc", "cdns,sd6hc";
+			reg = <0x0 0x1f120000 0x0 0x10000>;
+			interrupts = <175>;
+			clock-names = "main", "sdmclk";
+			clocks = <&aoncrg AONCRG_CLK_SDIO0_ICG_EN>,
+				 <&aoncrg AONCRG_CLK_SDIO0_SDMCLK>;
+			resets = <&aoncrg AONCRG_RSTN_SDIO0>;
+			bus-width = <4>;
+			cap-sd-highspeed;
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@1f300000 {
 			compatible = "starfive,jh8100-aon-pinctrl",
 				     "syscon", "simple-mfd";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
