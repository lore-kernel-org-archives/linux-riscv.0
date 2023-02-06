Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC258C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZL4sa0L8OTZDblrguMb0jj4xFxk1b21HSp+OhKUe88A=; b=KNLHWj/C+yeKqz
	C86EXxfGIt5owdyg/N6SLh+GpMDinv5CEjedlqfD719CUusgLq3agjopUFo0rnrAAK9AsrgGy0k4o
	sUvy1uamy4rs2NPaI0/rw/qupvJxy8dJ94VUAIZge/Go0tWsM/SkNsbEYT1bEo2kxpB42d+9gfaYl
	SZw7SFeMXGZQow2mPkg2ZE1pTIom2WJp9mpJnKPZcYPstiVUWOZhIPSL88sJTlW3YbYpFlB9JzDrK
	sd9C0DWLi5soZEkZp9lbkHdbOTXU6RV5207VfVxk6cWKI59TQkAxG16ZANcv3BCHpaGB3VM/ucsHe
	XuzB8hYnUkhVmC+T5qVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzpu-008K5N-2f; Mon, 06 Feb 2023 11:39:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzpn-008K15-Dz
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 11:39:00 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1E9A424E1C6;
	Mon,  6 Feb 2023 19:38:25 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 19:38:25 +0800
Received: from localhost.localdomain (183.27.96.33) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 19:38:24 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
	"Walker Chen" <walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] riscv: dts: starfive: add dma controller node
Date: Mon, 6 Feb 2023 19:38:11 +0800
Message-ID: <20230206113811.23133-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230206113811.23133-1-walker.chen@starfivetech.com>
References: <20230206113811.23133-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_033857_166323_7CA4264A 
X-CRM114-Status: UNSURE (   9.02  )
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

Adding the dma controller node for the Starfive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index cfbaff4ea64b..1628c0f33fab 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -412,6 +412,26 @@
 			#gpio-cells = <2>;
 		};
 
+		dma: dma-controller@16050000 {
+			compatible = "starfive,axi-dma";
+			reg = <0x0 0x16050000 0x0 0x10000>;
+			clocks = <&stgcrg JH7110_STGCLK_DMA1P_AXI>,
+				 <&stgcrg JH7110_STGCLK_DMA1P_AHB>;
+			clock-names = "core-clk", "cfgr-clk";
+			resets = <&stgcrg JH7110_STGRST_DMA1P_AXI>,
+				 <&stgcrg JH7110_STGRST_DMA1P_AHB>;
+			reset-names = "axi-rst", "ahb-rst";
+			interrupts = <73>;
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			snps,dma-masters = <1>;
+			snps,data-width = <3>;
+			snps,num-hs-if = <56>;
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
