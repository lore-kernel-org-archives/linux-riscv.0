Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF89C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5i36aoYUpT8xdSecISOz21gX2NI8NGSUFc7sDkm4XM=; b=pELJdpQzuHRnuy
	/vfjVx08hashtv9IPz08Vd+ZYlGHTkLhSCeutIi/wK5dMU7cunlwDyFStPm8OkfF2+hFgsVypj/b0
	rEOyWJl4L35h9CtRnoOg7z0hVzISyia7PmVTAKTyM3Q3qEgn4d9/ZuN8jgQJ6MIh7VRStp5GQ3vp8
	QqS9a5c2Bvjjw/5faXk1bWmrcf7n9Z2odIsWNzd45ANLPCedvO08p+Ago/NN/Rx+/LpYGFsf9kUrf
	lN/hvCo8/vziyg6puL4sRdge8bzjnAe6AhIeMHQE1BSF0HHhf85GkVYmFjs5ozzIaKa/nt4CrXYXv
	7Gwa4FTfEP6KtP0v+JGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fTj-0068sq-Bx; Thu, 01 Dec 2022 09:03:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fT8-00687e-K1
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:03:03 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C011D24E116;
	Thu,  1 Dec 2022 17:02:09 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:02:10 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 1 Dec 2022 17:02:08 +0800
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
Subject: [PATCH v1 7/7] riscv: dts: starfive: visionfive-v2: Add phy delay_chain configuration
Date: Thu, 1 Dec 2022 17:02:42 +0800
Message-ID: <20221201090242.2381-8-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010258_857869_093407B8 
X-CRM114-Status: UNSURE (   9.24  )
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

Add phy delay_chain configuration to support motorcomm phy driver for
StarFive VisionFive 2 board.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 .../jh7110-starfive-visionfive-v2.dts         | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
index c8946cf3a268..2868ef4c74ef 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
@@ -15,6 +15,8 @@
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0=&gmac0;
+		ethernet1=&gmac1;
 	};
 
 	chosen {
@@ -114,3 +116,47 @@
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	phy-handle = <&phy0>;
+	status = "okay";
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+			rxc_dly_en = <1>;
+			tx_delay_sel_fe = <5>;
+			tx_delay_sel = <0xa>;
+			tx_inverted_10 = <0x1>;
+			tx_inverted_100 = <0x1>;
+			tx_inverted_1000 = <0x1>;
+		};
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	phy-handle = <&phy1>;
+	status = "okay";
+	mdio1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy1: ethernet-phy@1 {
+			reg = <1>;
+			tx_delay_sel_fe = <5>;
+			tx_delay_sel = <0>;
+			rxc_dly_en = <0>;
+			tx_inverted_10 = <0x1>;
+			tx_inverted_100 = <0x1>;
+			tx_inverted_1000 = <0x0>;
+		};
+	};
+};
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
