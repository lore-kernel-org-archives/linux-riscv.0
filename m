Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C6C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XT1GYF4IViSPzpKECEx0Tw1/0+To8pbchcNqh8Dn2LU=; b=A7MA7TJ2GJ2Du2
	ErYTRrM3yVivQyNxDbTQE/qpTFJu9SK8EHNNxhNM3aFMBSccAEnT0rWT+Ji04QK8+t7iJhlOOe6gB
	FpzzGqoAVp0LoakT4cz/A+DMWkJ92s4UTVdKlYn/PtYtEhwvBDS5PNwMAdHc4iQG0cVuDJYYgc52C
	H0ITsNVm/YtEmlsvY3u+NE5KQFq1iNKOt9Wx37kDKCmYq3IbRIRvnv+wqsdM9kOyXWLs9fTCzceQC
	CPhOJvE0y24OY6RcZnI+j+Zd7E6uGUEBgW/CuGCc3lWQXZYEtktbhHqlMgw5eoiQ7teYO8wnUE8qf
	sOYJv1ElDv5c7ghmZ7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bn0-00AON2-2W;
	Mon, 29 May 2023 12:15:54 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bmx-00AOHe-0I;
	Mon, 29 May 2023 12:15:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B40EE24E207;
	Mon, 29 May 2023 20:15:08 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 20:15:08 +0800
Received: from ubuntu.localdomain (113.72.147.198) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 29 May
 2023 20:15:07 +0800
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
Subject: [PATCH v5 3/3] riscv: dts: starfive: Add dphy rx node
Date: Mon, 29 May 2023 05:15:03 -0700
Message-ID: <20230529121503.3544-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_051551_439575_DAAF3BD7 
X-CRM114-Status: UNSURE (   9.33  )
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
index 2207be7e1b01..e4241e32dd09 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -579,6 +579,19 @@ ispcrg: clock-controller@19810000 {
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
+			power-domains = <&aon_syscon JH7110_PD_DPHY_RX>;
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
