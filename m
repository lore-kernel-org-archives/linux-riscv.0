Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2663DC7618B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9wkOAIdEFHQQ+LbCepkqx2bfCoo4P8HBd5oHa9tw0M=; b=1cWmDT3pNXguYq
	0nxTkp/9RQ/2xb1KRsHFjMxjiPZ6ewPrDv6EkeyzZJ5EUHmWrsESOxzbVhgCLQsVDG/vJ5W/vzlHb
	tj+iLDjZmLQWG+RqKMPUix5U6bPXtnsVN3J5FlMnWcw0/sPNNF6Pi4FVMyj24513DOR1bh9Qq2Lq8
	GQUXx70VwZTZLqsT3Yy8BfwJ/fojymBujDUcutgiw8j3bs5MwABXixui2cWicR1urqZ19sCH9ypsY
	XZGtH8u2f/PneOMtw7zpbh3iQ+PyLEXDOwR6ra7ITUjUri+eoD9EHwib/OVYxw2lWOjwYn8OU7EeE
	/H53gb98hZbwFP4cNA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO0I-00D0mM-3B;
	Wed, 15 Mar 2023 10:05:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO0G-00D0iF-19;
	Wed, 15 Mar 2023 10:05:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 014B024E361;
	Wed, 15 Mar 2023 18:04:28 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 18:04:27 +0800
Received: from ubuntu.localdomain (113.72.145.194) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 18:04:26 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 3/3] riscv: dts: starfive: Add dphy rx node
Date: Wed, 15 Mar 2023 03:04:21 -0700
Message-ID: <20230315100421.133428-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
References: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_030504_668052_CA5311B5 
X-CRM114-Status: UNSURE (   9.38  )
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

Add dphy rx node for the StarFive JH7110 SoC. It is used to transfer CSI
camera data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 196dc14c14d4..e8bc092dabcd 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -577,6 +577,19 @@ ispcrg: clock-controller@19810000 {
 			power-domains = <&pwrc JH7110_PD_ISP>;
 		};
 
+		csi_phy: phy@19820000 {
+			compatible = "starfive,jh7110-dphy-rx";
+			reg = <0x0 0x19820000 0x0 0x10000>;
+			clocks = <&ispcrg JH7110_ISPCLK_M31DPHY_CFG_IN>,
+				 <&ispcrg JH7110_ISPCLK_M31DPHY_REF_IN>,
+				 <&ispcrg JH7110_ISPCLK_M31DPHY_TX_ESC_LAN0>;
+			clock-names = "cfg", "ref", "tx";
+			resets = <&ispcrg JH7110_ISPRST_M31DPHY_HW>,
+				 <&ispcrg JH7110_ISPRST_M31DPHY_B09_AON>;
+			starfive,aon-syscon = <&aon_syscon 0x00>;
+			#phy-cells = <0>;
+		};
+
 		voutcrg: clock-controller@295c0000 {
 			compatible = "starfive,jh7110-voutcrg";
 			reg = <0x0 0x295c0000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
