Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB6CC7EE22
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Orl5cW5AW6cJvTEOT811BLXD9VQpwk7mqQ3+9drws+c=; b=SemVLpI4qXBr9W
	ZSCYZXgEhvAls1SA6kb/XZJwJE/j/Y1x+RndB7jncn5cZRcmg8u+3WPTcU8YoGE4aTIA94vyYel23
	FKncw8W03i2LMpXVXfqerGep50VOwNsTc90CrH5pfv9a7wkSNT10cICYB2LqbZNYRJSQ6uAjB4al/
	ARcqjSXkHytVwXR4J6zBROu47Tkra51oDKLe9WET/FMbpUbUOiJxpnGh1M5ECbTanFHsCknHf+EuQ
	qvadw2k9YNAsPwkHbcqfzFf3MrXvrZ/7kTyAZyM5CaFkM7k7tn2EhW+WibcSdbk0Kih52ERA5bGZ9
	rXsX/kaK9OxhIRsO9pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxIQj-00AiJd-2I;
	Fri, 12 May 2023 02:22:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxIQc-00AiBC-31
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 02:22:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B900324E291;
	Fri, 12 May 2023 10:22:15 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 10:22:15 +0800
Received: from localhost.localdomain (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 10:22:14 +0800
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
Subject: [PATCH v4 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock inputs
Date: Fri, 12 May 2023 10:20:32 +0800
Message-ID: <20230512022036.97987-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_192243_319485_5FCE132A 
X-CRM114-Status: UNSURE (   8.42  )
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

Add PLL clock inputs from PLL clock generator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clock/starfive,jh7110-syscrg.yaml         | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
index 84373ae31644..fcb363353050 100644
--- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
@@ -27,6 +27,9 @@ properties:
           - description: External I2S RX left/right channel clock
           - description: External TDM clock
           - description: External audio master clock
+          - description: PLL0
+          - description: PLL1
+          - description: PLL2
 
       - items:
           - description: Main Oscillator (24 MHz)
@@ -38,6 +41,9 @@ properties:
           - description: External I2S RX left/right channel clock
           - description: External TDM clock
           - description: External audio master clock
+          - description: PLL0
+          - description: PLL1
+          - description: PLL2
 
   clock-names:
     oneOf:
@@ -52,6 +58,9 @@ properties:
           - const: i2srx_lrck_ext
           - const: tdm_ext
           - const: mclk_ext
+          - const: pll0_out
+          - const: pll1_out
+          - const: pll2_out
 
       - items:
           - const: osc
@@ -63,6 +72,9 @@ properties:
           - const: i2srx_lrck_ext
           - const: tdm_ext
           - const: mclk_ext
+          - const: pll0_out
+          - const: pll1_out
+          - const: pll2_out
 
   '#clock-cells':
     const: 1
@@ -93,12 +105,16 @@ examples:
                  <&gmac1_rgmii_rxin>,
                  <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
                  <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
-                 <&tdm_ext>, <&mclk_ext>;
+                 <&tdm_ext>, <&mclk_ext>,
+                 <&pllclk 0>,
+                 <&pllclk 1>,
+                 <&pllclk 2>;
         clock-names = "osc", "gmac1_rmii_refin",
                       "gmac1_rgmii_rxin",
                       "i2stx_bclk_ext", "i2stx_lrck_ext",
                       "i2srx_bclk_ext", "i2srx_lrck_ext",
-                      "tdm_ext", "mclk_ext";
+                      "tdm_ext", "mclk_ext",
+                      "pll0_out", "pll1_out", "pll2_out";
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
