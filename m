Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C411EC001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 06:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c08z/TvzATDIzs61MgTNra/0Aic5BGmICbEeqa06YOo=; b=XamU5I5KoT1/9A
	E8uwTqpyavFImc/4Y24hH7P+tM6Oc+kfSnyERXNEhmEwfAtzDoEJ6sW4kHQp/a/gNi+0/X7iW1m4d
	yvSZNrUSLYd4W1wob5u6PY+NocSBs2hsuI4fV+Wg22aClegnlnnPmNaJcGxXjRozu/DpH1GMlUMYC
	eFFZCrpKXfxdhf2gnC1XivZe+08E1DQVXmscX8W6aVGEVrnvtZZQj4/UezgZQRSZdyz7El079pJv5
	hqaghkTBfaU8O7Z9yoS0yOEgURLBS1+K4lHwyJ2J+spni1RAuKhb0Vgc9Ij9PPB4gK01hX/VG1bh8
	S7FWIs7ILfXRqWpiQTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFxu-001npR-0Y;
	Tue, 08 Aug 2023 06:13:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFxr-001nmE-0r
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 06:13:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3F9E524E287;
	Tue,  8 Aug 2023 14:12:03 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 14:12:03 +0800
Received: from ubuntu.localdomain (202.188.176.82) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 14:11:58 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] riscv: dts: starfive - Add crypto and DMA node for JH7110
Date: Tue, 8 Aug 2023 14:11:49 +0800
Message-ID: <20230808061150.81491-2-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
References: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_231307_481926_580E3053 
X-CRM114-Status: UNSURE (   8.92  )
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

Add hardware crypto module and dedicated dma controller node to StarFive
JH7110 SoC.

Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index a608433200e8..47cd12ccc988 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -821,6 +821,34 @@ watchdog@13070000 {
 				 <&syscrg JH7110_SYSRST_WDT_CORE>;
 		};
 
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
 		gmac0: ethernet@16030000 {
 			compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
 			reg = <0x0 0x16030000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
