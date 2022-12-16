Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035FEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdUB3tSju9D5lt1h2waKzziSJYIUH0SwIZejfgI3tQY=; b=PBk7X5fNDXpqaW
	cBXn3EFqpckSqBU3C7/CZct0aGipPrBu1Xbpx3exYrFKF3UX0h1ZSX1oKpbcUYscoxTcraFoypf5i
	Sh6jSbrGLz3XiQh+Rb3V0bpoIpeY8WNXZezulht+hO4h9z2KX+8YVyhcIJsGo8gi7Zk5eF3Srl5J2
	Pw+8fyO5Pu4lK4gOOqozfOqqnvADSoEnWbv8WWXLYmv5PFSrNUVpPS6J8GYPZvJacCzF/ZDOY5YIZ
	tNyr2oNkQtU4Ma83desITey7H2EtGBV8RENvyQQgFUpqt2czmgp30d0FAEvUWiJ7568pg01U4SUAF
	eBR38rxYIHUp7x0FcAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64ng-00DJUw-EB; Fri, 16 Dec 2022 07:06:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64nZ-00DJDd-So
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 07:06:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3687D24E275;
	Fri, 16 Dec 2022 15:05:46 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 16 Dec
 2022 15:05:46 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 16 Dec 2022 15:05:44 +0800
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
Subject: [PATCH v2 9/9] riscv: dts: starfive: visionfive-v2: Add phy clock delay train configuration
Date: Fri, 16 Dec 2022 15:06:32 +0800
Message-ID: <20221216070632.11444-10-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_230626_127355_FB7857C7 
X-CRM114-Status: UNSURE (   8.30  )
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

In view of the particularity of StarFive JH7110 SoC, the PHY clock delay
train configuration parameters must be adjusted for StarFive VisionFive
v2 board.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 .../jh7110-starfive-visionfive-v2.dts         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
index c8946cf3a268..81329d67ef0f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
@@ -15,6 +15,8 @@
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -114,3 +116,29 @@
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&phy0 {
+	rxc_dly_en = <1>;
+	tx_delay_sel_fe = <5>;
+	tx_delay_sel = <0xa>;
+	tx_inverted_10 = <0x1>;
+	tx_inverted_100 = <0x1>;
+	tx_inverted_1000 = <0x1>;
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&phy1 {
+	rxc_dly_en = <0>;
+	tx_delay_sel_fe = <5>;
+	tx_delay_sel = <0>;
+	tx_inverted_10 = <0x1>;
+	tx_inverted_100 = <0x1>;
+	tx_inverted_1000 = <0x0>;
+};
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
