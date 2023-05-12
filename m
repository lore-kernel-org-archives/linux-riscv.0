Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739F1C7EE22
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 02:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfU/YtBD/XkRTTu5pP5vNjxD1iAPSKKmqq0vc005L0c=; b=rIEx/Q2TYPQuLS
	8LQ4BBNUhPT0OiCVirXW67NdGSwGbFWmxmSZOch4LhDL5rro+Jkk2ejbDXGK5ikmPN79I2bWPWB81
	ZCGiGfstana6/ZzP3H4vKQuNDcOtF8to6dY3yofDQ/VKimgYE033tKk62L5ZO5Kas4/gm/RjZFo5H
	3qhHD4rQ+DJzftkiOiXYfPumQTCk2edkPsF4egvdVcLyDvEOKe48zbvmX81i7DPvx342y1IzZ9jls
	FEYrFItXJXjAa4Qqdc81xyqQodFjeOxpAMhJTaN0RXAuzAYDHGoCAGn6iNFNoEb60QsHlWKXmIu+F
	c5TpV5L36TTunc4U2Ecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxIQh-00AiIu-0R;
	Fri, 12 May 2023 02:22:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxIQc-00AiBB-31
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 02:22:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 36DD824E290;
	Fri, 12 May 2023 10:22:19 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 10:22:19 +0800
Received: from localhost.localdomain (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 10:22:18 +0800
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
Subject: [PATCH v4 7/7] riscv: dts: starfive: jh7110: Add PLL clock node and modify syscrg node
Date: Fri, 12 May 2023 10:20:36 +0800
Message-ID: <20230512022036.97987-8-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_192243_165502_24285D0B 
X-CRM114-Status: UNSURE (   9.72  )
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
modify the SYSCRG node to add PLL clocks input.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index fa27fd4169a8..cdfd036a0e6c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -452,12 +452,16 @@ syscrg: clock-controller@13020000 {
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
@@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
 		sys_syscon: syscon@13030000 {
 			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
 			reg = <0x0 0x13030000 0x0 0x1000>;
+
+			pllclk: clock-controller {
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
