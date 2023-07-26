Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E2C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5Y9SYpKY5Ush5HhPEb9h6VrC0XH0J7lRXZe+JrxWbs=; b=oZ9FDi3oh1bTvg
	arFuaZOAyZjqoAZSiRNt9c5foTuTOl2WPNXYQv/aqATwDd0aM8CnoO+UFluiBIPJOa0oeVUsT2xmo
	p+tduJy+5hxltJIgLeYfl4aKUdSQtgBhfhFOmJuPy8VunPVScQ8MTjNTn0BjdGNPbwOcRfT30j6/a
	E8DR9JhHIcSs3PDI9fRt7okpl3jHq+aSVQ315gMffxNZZWZVArFjgjpGhY9agsMqz/5jlMHn89g5W
	0JNB/H0c+QE3mVW0ofB3hSt08p0O4+YHrAUqNA2/JxSFFVFY8OvitIAYfW1Z07Yo+0835r+6WwhIh
	QejdZB4MWPPbWmWCDpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObQF-009rPj-1b;
	Wed, 26 Jul 2023 10:07:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObQB-009rLy-2N
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 10:07:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D40A880F3;
	Wed, 26 Jul 2023 18:06:13 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Jul
 2023 18:06:13 +0800
Received: from ubuntu.localdomain (183.27.99.135) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Jul
 2023 18:06:12 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [dt-for-next v1 1/2] riscv: dts: starfive: Add USB and PCIe PHY nodes for JH7110
Date: Wed, 26 Jul 2023 03:06:08 -0700
Message-ID: <20230726100609.72550-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726100609.72550-1-minda.chen@starfivetech.com>
References: <20230726100609.72550-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_030708_189854_1F3C6686 
X-CRM114-Status: UNSURE (   8.97  )
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

Add USB and PCIe PHY dts nodes for the StarFive JH7110 SoC.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 90aabeac7b51..dbc1243a0e75 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -446,6 +446,27 @@ i2c2: i2c@10050000 {
 			status = "disabled";
 		};
 
+		usbphy0: phy@10200000 {
+			compatible = "starfive,jh7110-usb-phy";
+			reg = <0x0 0x10200000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
+				 <&stgcrg JH7110_STGCLK_USB0_APP_125>;
+			clock-names = "125m", "app_125m";
+			#phy-cells = <0>;
+		};
+
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
 		stgcrg: clock-controller@10230000 {
 			compatible = "starfive,jh7110-stgcrg";
 			reg = <0x0 0x10230000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
