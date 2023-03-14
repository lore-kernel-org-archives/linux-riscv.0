Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C281C7618A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXle7qaVTrr2WXt2rpbK5FmbMV2XV5Ifz+ER5h4sxEQ=; b=vfl5cweYaFFSGU
	jgsVLNL1dpD2CtHk5i495DFqVylLEQKNhegppd73tIb37U1EkvxDnZzqkR8FasRxB6FtERkYjTd3K
	GerqbJj1W9I0cRUig36QU89aR8D2M/VJUFlj0O+J0NAXYufufdExEaqtXu9BAtk47UQbOLmgAlNNi
	FgPAZGWWuuMCiWTXalgbqprngTnuxmLf42CqRO/mjlNTM8LEFzCGMGtyyPTmsXna0Ed19I97uxM4J
	dIHogfv/imyHETTV90BSfqaBb7NSZi+UdRFaZNCXQRItQXYvcmHFcL3CO4198ahbcbIf58GI0B8YL
	VK0tvqhNOhkAYgzp6UFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41h-00AAYI-2n;
	Tue, 14 Mar 2023 12:45:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41b-00AAKE-1U
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 12:45:09 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1DE5324E3CA;
	Tue, 14 Mar 2023 20:44:14 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:14 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:12 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v3 10/11] riscv: dts: starfive: jh7110: Add DVP and HDMI TX pixel external clocks
Date: Tue, 14 Mar 2023 20:44:03 +0800
Message-ID: <20230314124404.117592-11-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_054508_379695_8D038BA5 
X-CRM114-Status: UNSURE (   9.07  )
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
index 417f7f51c219..d2757f4afab3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -173,6 +173,12 @@ core4 {
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
@@ -197,6 +203,12 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
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
