Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53FAEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//xV0eNLULIrgyg6z0GHKJCoZoQV0nR7dWIoPtA6SF8=; b=vwzYwtAMa/mGE8
	wLcr3G+be0SSEZX6IbslyynacOgApIjsae63x093mgYxNaI0kQ/2lMGvpMJJVstWh9QZ2XZlX6Z3W
	F57AyGTVeKi2BeX2QuanXWKw05npUllD5cb9u4LlhjAf6f3fMSVHyCXHlBhpQ7b3pSBjXQbKI/CEA
	mXlcW7AonXalaK8iiea+8ihOUEkauEzyjKDemEOPe65EBzo3IZI6szbRBYcdgqJ3IS1m82BYlP2f+
	9bukEaPdvNk115WM+/j+bvLfpypbofMd5Nz80KiVT8xYd7jaw/eVax6yEPeWECqnD2+NxS/Hb42gm
	Trw58CaPjZSG1xDXtSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmRk-000GWZ-1J;
	Thu, 29 Jun 2023 07:52:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmRg-000G0U-1j;
	Thu, 29 Jun 2023 07:52:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5C91C24E2D7;
	Thu, 29 Jun 2023 15:51:21 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 29 Jun
 2023 15:51:21 +0800
Received: from ubuntu.localdomain (183.27.97.206) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 29 Jun
 2023 15:51:20 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Roger Quadros <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Minda Chen <minda.chen@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH v8 5/5] riscv: dts: starfive: Add PCIe PHY dts configuration for JH7110
Date: Thu, 29 Jun 2023 15:51:15 +0800
Message-ID: <20230629075115.11934-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230629075115.11934-1-minda.chen@starfivetech.com>
References: <20230629075115.11934-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_005205_152973_623EF0E0 
X-CRM114-Status: UNSURE (   8.75  )
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

Add PCIe PHY dts configuration for StarFive JH7110 SoC.
PCIe0 PHY can be use as USB 3.0 PHY.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..7e5c3ae83aa1 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -353,6 +353,18 @@
 			status = "disabled";
 		};
 
+		pciephy0: phy@10210000 {
+			compatible = "starfive,jh7110-pcie-phy";
+			reg = <0x0 0x10210000 0x0 0x10000>;
+			#phy-cells = <0>;
+		};
+
+		pciephy1: phy@10220000 {
+			compatible = "starfive,jh7110-pcie-phy";
+			reg = <0x0 0x10220000 0x0 0x10000>;
+			#phy-cells = <0>;
+		};
+
 		uart3: serial@12000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x12000000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
