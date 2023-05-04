Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8251C7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ofbn++YGK9cxDKD8z/JXmhhe5Y2HTavOIsHMxjD0oA0=; b=250IKLS0tI3wVN
	fEK/kvq20Gxo4jQUil6R8ntk8ccfQcd7YYKFtUTLfVYG6hf7omnApAZqeM9HHbgNMLmtQ/mtQUMON
	DTRurQ0tBCqqe3Dl8OXJ3zEeASH9952r5AKhZvBMR3Fupz2JkErqsx1qGllAHDMSe7vysjz5A/TEm
	Z6ue0wiZh6ccRSLywgWlvTQk2B79apbmigxS5bYAh1iLX6KhdyH32+jelrK6f6eP9z085XFoidDlX
	4hXccObhy1SaqWOtRl3mkPJ/tWc/DOmm2JYnf70rYlgFeXhm7OECGfZqsLjor8Gt92lIAFCx69kpP
	p7E3DsXCbNTOyVlPhz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTU2-006uHP-0c;
	Thu, 04 May 2023 07:34:34 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTTz-006uG7-0z
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 07:34:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E06FA24E24C;
	Thu,  4 May 2023 15:34:24 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 15:34:24 +0800
Received: from ubuntu.localdomain (161.142.156.10) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 15:34:18 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v7 3/4] riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
Date: Thu, 4 May 2023 15:33:59 +0800
Message-ID: <20230504073400.1170979-4-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
References: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [161.142.156.10]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_003431_494697_C8B26974 
X-CRM114-Status: UNSURE (   8.56  )
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

Add StarFive cryptographic module and dedicated DMA controller node to
VisionFive 2 SoCs.

Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 9acb5fb1716d..7a0ba2748582 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -570,5 +570,33 @@ voutcrg: clock-controller@295c0000 {
 			#reset-cells = <1>;
 			power-domains = <&pwrc JH7110_PD_VOUT>;
 		};
+
+		sdma: dma@16008000 {
+			compatible = "arm,pl080", "arm,primecell";
+			arm,primecell-periphid = <0x00041080>;
+			reg = <0x0 0x16008000 0x0 0x4000>;
+			interrupts = <29>;
+			clocks = <&stgcrg JH7110_STGCLK_SEC_AHB>,
+				 <&stgcrg JH7110_STGCLK_SEC_MISC_AHB>;
+			clock-names = "hclk", "apb_pclk";
+			resets = <&stgcrg JH7110_STGRST_SEC_AHB>;
+			lli-bus-interface-ahb1;
+			mem-bus-interface-ahb1;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			#dma-cells = <2>;
+		};
+
+		crypto: crypto@16000000 {
+			compatible = "starfive,jh7110-crypto";
+			reg = <0x0 0x16000000 0x0 0x4000>;
+			clocks = <&stgcrg JH7110_STGCLK_SEC_AHB>,
+				 <&stgcrg JH7110_STGCLK_SEC_MISC_AHB>;
+			clock-names = "hclk", "ahb";
+			interrupts = <28>;
+			resets = <&stgcrg JH7110_STGRST_SEC_AHB>;
+			dmas = <&sdma 1 2>, <&sdma 0 2>;
+			dma-names = "tx", "rx";
+		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
