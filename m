Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBDCEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so4YFgalsQ4cjBs193sqjukAzC1ouO2vW9n+Uqoy2oo=; b=TZgC/E0mI9y41F
	2X0PiocFT6oQGSXZM2kkvey6zdR7S9XDGOqOCQOBC9oBH3nKA0G53K4Agf694kbo3TyYKdDtAKymH
	DV/wwQrSMie+n4p3LAsNYc12TMCDZtxgQcXekGo7xgE0hnChy83tmZeJFjL1pizJV6TuEKIUNh31R
	uJtjN/S+KpkClQHONj0Ix7EP4Zhxr5OVL5Hc0yAzApOqF3FTftmcSYJFvh/74hRX6d+BcoHfx9uMq
	ThJmECWqefOWVMUkzS660rCYTxRTCGAyFFysOOXZNSyZvPygh6PKbjgkTQOLhK8zXokdmk/taPe1k
	iUQWfRvzq62I7kOS8XGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94K0-008Dxg-16;
	Tue, 13 Jun 2023 13:44:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94Jw-008Dum-2Z
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 13:44:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id ED47524E21E;
	Tue, 13 Jun 2023 21:43:56 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Jun
 2023 20:58:56 +0800
Received: from localhost.localdomain (113.72.145.34) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Jun
 2023 20:58:55 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, "William
 Qiu" <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v5 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock inputs
Date: Tue, 13 Jun 2023 20:58:48 +0800
Message-ID: <20230613125852.211636-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.34]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_064429_276795_68BDB1E5 
X-CRM114-Status: UNSURE (   7.73  )
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

Add optional PLL clock inputs from PLL clock generator.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-syscrg.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
index 84373ae31644..5536e5f9e20b 100644
--- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
@@ -39,6 +39,33 @@ properties:
           - description: External TDM clock
           - description: External audio master clock
 
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC1 RMII reference or GMAC1 RGMII RX
+          - description: External I2S TX bit clock
+          - description: External I2S TX left/right channel clock
+          - description: External I2S RX bit clock
+          - description: External I2S RX left/right channel clock
+          - description: External TDM clock
+          - description: External audio master clock
+          - description: PLL0
+          - description: PLL1
+          - description: PLL2
+
+      - items:
+          - description: Main Oscillator (24 MHz)
+          - description: GMAC1 RMII reference
+          - description: GMAC1 RGMII RX
+          - description: External I2S TX bit clock
+          - description: External I2S TX left/right channel clock
+          - description: External I2S RX bit clock
+          - description: External I2S RX left/right channel clock
+          - description: External TDM clock
+          - description: External audio master clock
+          - description: PLL0
+          - description: PLL1
+          - description: PLL2
+
   clock-names:
     oneOf:
       - items:
@@ -64,6 +91,35 @@ properties:
           - const: tdm_ext
           - const: mclk_ext
 
+      - items:
+          - const: osc
+          - enum:
+              - gmac1_rmii_refin
+              - gmac1_rgmii_rxin
+          - const: i2stx_bclk_ext
+          - const: i2stx_lrck_ext
+          - const: i2srx_bclk_ext
+          - const: i2srx_lrck_ext
+          - const: tdm_ext
+          - const: mclk_ext
+          - const: pll0_out
+          - const: pll1_out
+          - const: pll2_out
+
+      - items:
+          - const: osc
+          - const: gmac1_rmii_refin
+          - const: gmac1_rgmii_rxin
+          - const: i2stx_bclk_ext
+          - const: i2stx_lrck_ext
+          - const: i2srx_bclk_ext
+          - const: i2srx_lrck_ext
+          - const: tdm_ext
+          - const: mclk_ext
+          - const: pll0_out
+          - const: pll1_out
+          - const: pll2_out
+
   '#clock-cells':
     const: 1
     description:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
