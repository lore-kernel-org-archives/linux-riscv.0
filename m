Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1810FC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0T2BzSZ2pwz8S91btrxyyVzSk9cYDPTtlPFUc6bElZg=; b=0SPPWb/MxDO4s/
	eJWsUoVs1BucTdCtaLQj3x5/wqGgx98sB2g3EpOsyiyX+5dVRMMpCvlDKWlcoOhQRIWbUBjUQC5ft
	x8AokvZtrGvm/H4ysKPSyHcXSMZWxJxj5kBdj46d8CIPUFPeF+Jt1hbYM1RnrARuYyqb3zbMWmxOR
	i3S9vlCWwDuD3K0erqvvFsBlfxLPZOzZ3F7Mki4Mll8g/e1cWketU6UHbeTpZ+QtEQNuUOYVi8bVF
	9Q8XW3gsExNpgj/i/wFmHQYtk64Qk0mhf1dGBiIiH++iJfUNouSn7s8dfgSZCTmdV0ut5OZ4P4mRa
	PLiQhBhzzZQR47GL/y5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpR3-0031mo-0c;
	Mon, 24 Jul 2023 06:52:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpR0-0031ho-0E
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 06:52:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4CBB324E2E7;
	Mon, 24 Jul 2023 14:52:01 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 14:52:01 +0800
Received: from SD-Server.starfivetech.com (183.27.99.135) by
 EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 24 Jul 2023 14:52:00 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hal Feng <hal.feng@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Walker Chen <walker.chen@starfivetech.com>
Subject: [PATCH v1 1/2] riscv: dts: starfive: jh7110: add dma controller node
Date: Mon, 24 Jul 2023 14:51:57 +0800
Message-ID: <20230724065158.925-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230724065158.925-1-walker.chen@starfivetech.com>
References: <20230724065158.925-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_235246_280043_A53FB525 
X-CRM114-Status: UNSURE (   8.62  )
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

Add the dma controller node for the Starfive JH7110 SoC.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 90aabeac7b51..411a1bd4ddc9 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -685,6 +685,24 @@
 			status = "disabled";
 		};
 
+		dma: dma-controller@16050000 {
+			compatible = "starfive,jh7110-axi-dma";
+			reg = <0x0 0x16050000 0x0 0x10000>;
+			clocks = <&stgcrg JH7110_STGCLK_DMA1P_AXI>,
+				 <&stgcrg JH7110_STGCLK_DMA1P_AHB>;
+			clock-names = "core-clk", "cfgr-clk";
+			resets = <&stgcrg JH7110_STGRST_DMA1P_AXI>,
+				 <&stgcrg JH7110_STGRST_DMA1P_AHB>;
+			interrupts = <73>;
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			snps,dma-masters = <1>;
+			snps,data-width = <3>;
+			snps,block-size = <65536 65536 65536 65536>;
+			snps,priority = <0 1 2 3>;
+			snps,axi-max-burst-len = <16>;
+		};
+
 		aoncrg: clock-controller@17000000 {
 			compatible = "starfive,jh7110-aoncrg";
 			reg = <0x0 0x17000000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
