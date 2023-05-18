Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB98FC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr7Xu/PzVmO1eBOMdEiLGX1PsKiTEINwRMLDvjt6Qqg=; b=sK14kD7bE1345F
	GEKsTvIy40z51jxX9GD2qMLY9vIm00FKtWddHO5+7q2NRB52uKxB9Rx4r46gYjYCFJNER2fEpUTVS
	nai3yKy/p9vPSfOeKgE052ylU2W+Ea6PN/KqOpH069q0TLqfCRxCN6qDnyx5alXFM03wQuaWHeS+0
	D1JByW4gn2xkbK7psAx0hzx0OlTW1GUPU1N4/2uk7klwCN0183rtKS0gRq9dQAv5RO7LR/qK+waLj
	JvPoLClU4LDrO5KaYLAs0TUKiwIv5ln//m3X2vWERJxA+4vlXZuR8vS26p97+sd8J1k6N7QFhTKgJ
	zObg37rACAvtaty2r2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzada-00CY3H-33;
	Thu, 18 May 2023 10:13:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzadX-00CXtp-1E
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 10:13:32 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5FF6180F8;
	Thu, 18 May 2023 18:12:43 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 18:12:43 +0800
Received: from localhost.localdomain (113.72.146.100) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 18:12:42 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v6 10/11] riscv: dts: starfive: jh7110: Add DVP and HDMI TX pixel external clocks
Date: Thu, 18 May 2023 18:12:33 +0800
Message-ID: <20230518101234.143748-11-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.100]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_031331_569161_E9E9353C 
X-CRM114-Status: UNSURE (   9.00  )
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

Add DVP and HDMI TX pixel external fixed clocks and the rates are
74.25MHz and 297MHz.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi   |  8 ++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi             | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 2a6d81609284..1155b97b593d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -38,6 +38,10 @@ gpio-restart {
 	};
 };
 
+&dvp_clk {
+	clock-frequency = <74250000>;
+};
+
 &gmac0_rgmii_rxin {
 	clock-frequency = <125000000>;
 };
@@ -54,6 +58,10 @@ &gmac1_rmii_refin {
 	clock-frequency = <50000000>;
 };
 
+&hdmitx0_pixelclk {
+	clock-frequency = <297000000>;
+};
+
 &i2srx_bclk_ext {
 	clock-frequency = <12288000>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 30e1f34d5cf8..336ee2b0ffb5 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -164,6 +164,12 @@ core4 {
 		};
 	};
 
+	dvp_clk: dvp-clock {
+		compatible = "fixed-clock";
+		clock-output-names = "dvp_clk";
+		#clock-cells = <0>;
+	};
+
 	gmac0_rgmii_rxin: gmac0-rgmii-rxin-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "gmac0_rgmii_rxin";
@@ -188,6 +194,12 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
 		#clock-cells = <0>;
 	};
 
+	hdmitx0_pixelclk: hdmitx0-pixel-clock {
+		compatible = "fixed-clock";
+		clock-output-names = "hdmitx0_pixelclk";
+		#clock-cells = <0>;
+	};
+
 	i2srx_bclk_ext: i2srx-bclk-ext-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "i2srx_bclk_ext";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
