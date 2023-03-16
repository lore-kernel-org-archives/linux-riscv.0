Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCA2C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 03:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpZYl+0obSps+Xz/bMV5GpiwkpAkhd2NSVzhmZSzo1I=; b=4/dKl84fagvnl1
	HXza26HDN5GKs3nBLgPefcZw2pRGgacobmpFf/QGUcEzUpfdaMcT06J1OpAXbI+e4MnzXfC7fuxeU
	ljze/Ox5S8Rr58JcqpQ/wLeh8aFKCYKDlWRwtQsCoXHTJtVVyvB49n/2ThwmMgrKJl9EJY2xLmxSQ
	NUaHdZld309UjnAZu8z2hFiEwGdM1f1TrUxa/x3k60uhf//K+/D03MF6rhKWAk4fEulyEgvGkihx4
	mMWC9z01e3LNhNb4ufyQL/e8ND1adZmPBmsvHm5S+399TCIb+Y+Q1VafAIWRA6on1mRqrLFVt6K1Q
	ZIOYoGaxT6iyuQ59R4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdw2-00F3Gd-14;
	Thu, 16 Mar 2023 03:05:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdvz-00F3B5-20
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 03:05:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EFADD24E2B2;
	Thu, 16 Mar 2023 11:05:21 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:21 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:20 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v2 6/6] riscv: dts: starfive: jh7110: Add PLL clock node and modify syscrg node
Date: Thu, 16 Mar 2023 11:05:14 +0800
Message-ID: <20230316030514.137427-7-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_200543_803336_0A937F9E 
X-CRM114-Status: UNSURE (   9.60  )
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

Add the PLL clock node for the Starfive JH7110 SoC and
modify the SYSCRG node to add PLL clocks.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 49dd62276b0d..37ccd4600da8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -461,19 +461,29 @@ syscrg: clock-controller@13020000 {
 				 <&gmac1_rgmii_rxin>,
 				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
 				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
-				 <&tdm_ext>, <&mclk_ext>;
+				 <&tdm_ext>, <&mclk_ext>,
+				 <&pllclk JH7110_CLK_PLL0_OUT>,
+				 <&pllclk JH7110_CLK_PLL1_OUT>,
+				 <&pllclk JH7110_CLK_PLL2_OUT>;
 			clock-names = "osc", "gmac1_rmii_refin",
 				      "gmac1_rgmii_rxin",
 				      "i2stx_bclk_ext", "i2stx_lrck_ext",
 				      "i2srx_bclk_ext", "i2srx_lrck_ext",
-				      "tdm_ext", "mclk_ext";
+				      "tdm_ext", "mclk_ext",
+				      "pll0_out", "pll1_out", "pll2_out";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
 		sys_syscon: syscon@13030000 {
-			compatible = "starfive,jh7110-sys-syscon", "syscon";
+			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
 			reg = <0x0 0x13030000 0x0 0x1000>;
+
+			pllclk: pll-clock-controller {
+				compatible = "starfive,jh7110-pll";
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
 		};
 
 		sysgpio: pinctrl@13040000 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
