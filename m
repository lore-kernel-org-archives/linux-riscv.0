Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDBEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2WCJ+7XLS0ZeWYYOzzjltarXSheSwcpW11qbroDeJ0=; b=NnTGjaOmsmQeKM
	0hu6Jv3gai2Qvs4VwX/m+zKK5IE7CKuTRqdp9w3v++SLqhFCP5H9pePVfVd46/DuJU8bN68iGS8RR
	Jg8WieKoGqRQ+SAbO+t6dEOzzP82fIBgQzuRTeILLqxXFlT5CUzuA8/UREbgFp8ZvBw4WF9ghSKAH
	eEYEGxiZTDLXw+fjX4f2mnhJZzBd9ENEkNwoqjywa9oLCZpOoJ87Sm4yEtGbdDKym0q+lXANSiUGA
	4EFkxd/8rvuZ/eWSkk796jvuYuND94yYECeOE8vcvFpSKBD/EQMBqWn4z1I4eATRDhmq2nKqdHxv8
	C2xwKykLHPWSRl6S/SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7v6N-00CdA1-2N; Wed, 21 Dec 2022 09:09:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7v60-00CceO-W4
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 09:09:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5E3A924E1B2;
	Wed, 21 Dec 2022 17:08:41 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Dec
 2022 17:08:41 +0800
Received: from ubuntu.localdomain (161.142.229.243) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Dec
 2022 17:08:36 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-crypto@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] riscv: dts: starfive: Add TRNG node for VisionFive 2
Date: Wed, 21 Dec 2022 17:08:19 +0800
Message-ID: <20221221090819.1259443-4-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [161.142.229.243]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_010905_233771_DA0A03CE 
X-CRM114-Status: UNSURE (   8.77  )
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

Adding StarFive TRNG controller node to VisionFive 2 SoC.

Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4ac159d79d66..dd3ad19772a5 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -455,5 +455,16 @@ uart5: serial@12020000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		rng: rng@1600c000 {
+			compatible = "starfive,jh7110-trng";
+			reg = <0x0 0x1600C000 0x0 0x4000>;
+			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
+				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
+			clock-names = "hclk", "ahb";
+			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
+			interrupts = <30>;
+			status = "okay";
+		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
