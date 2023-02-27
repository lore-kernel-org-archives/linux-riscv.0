Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E19C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byGoMWBK8NUtRAvvfWhzsdksq2MS4lPF0aWsACinRfE=; b=QXjQYRML3gTSuM
	/RGgYSwIJTHSJYiPg0ML59hvRylpG8ZcjfAU5rg8YEQ4fnal3MzD63EsAm2I24wV1pCqBTKhIQ7L3
	bqDMset1yXzexXAo/LqCEwFcDvmyjcec++vD6akcDi2ZJkXz6g8Yytw/RpRbOyrek+ghqS7ciEdl6
	wgQ8ftEcw2F8tlXtaF5IbeTRPF1WIKcSkKXsPVg9QQoNsexjNac6TApdKXlWUxeFOOpUxb2sC+PA3
	7ioa2AzT+qJZWhHrnEwAsT9hPWo2qdOfXr8Ts6LUnPj38oIAFGjOXchRt59iHvoBhKYp0OZHjHjVC
	Bkq6KxH+OInu6gtDptqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdHx-009hPG-DW; Mon, 27 Feb 2023 13:11:33 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdHn-009hHP-1e
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:11:27 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1A64B24E424;
	Mon, 27 Feb 2023 21:10:56 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:10:55 +0800
Received: from localhost.localdomain (113.72.145.171) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:10:55 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 3/3] riscv: dts: starfive: add dma controller node
Date: Mon, 27 Feb 2023 21:10:42 +0800
Message-ID: <20230227131042.16125-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230227131042.16125-1-walker.chen@starfivetech.com>
References: <20230227131042.16125-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_051123_406965_ED61468C 
X-CRM114-Status: UNSURE (   9.13  )
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

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 697ab59191a1..191b6add72c8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -510,6 +510,24 @@
 			#gpio-cells = <2>;
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
