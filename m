Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A36CC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gthoTjgFrOjuCxyXqm2Ek6RhtmMeY+qQydd3Zezdx3I=; b=b62R2NqTafsC4o
	T65escJLL/K1CieR1IVfIuwIFFGi+7CV1Eq3l3JXZwP1t0iGVvnMlcEyhTY6KGp2ZMd2sFfzz5IsJ
	gRwkGsQCfKvO5GVMLm1PVYJuseEQ6/P7VMS2mvID+gYJcWrusHU/pWrBk2WGgnFbZ9Kl7ue9aM7AZ
	w2gjQQtMDmqxLYHZh/PH1NhJNUSnRrnDHyCEHiFZN8SjdRVxT+s+9ZRqxT/HwD7GEngQKeWm84SMJ
	zkhWoTXQ1TbMYpsRb8Q8x/d/t6arRyx2cA+NLgms/TFDYZAWdkmQJ7e+L55SpwMDUAklkGqHaenxA
	vLLq4BuKEjwfYeU/p21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObQK-009rQM-0P;
	Wed, 26 Jul 2023 10:07:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObQG-009rLz-12
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 10:07:13 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6215A810C;
	Wed, 26 Jul 2023 18:06:14 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Jul
 2023 18:06:14 +0800
Received: from ubuntu.localdomain (183.27.99.135) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Jul
 2023 18:06:13 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [dt-for-next v1 2/2] riscv: dts: starfive: Add USB dts node for JH7110
Date: Wed, 26 Jul 2023 03:06:09 -0700
Message-ID: <20230726100609.72550-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726100609.72550-1-minda.chen@starfivetech.com>
References: <20230726100609.72550-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_030712_777357_664A7068 
X-CRM114-Status: UNSURE (   9.46  )
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

Add USB wrapper layer and Cadence USB3 controller dts
configuration for StarFive JH7110 SoC and VisionFive2
Board.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         |  5 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 32 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 5feff4673503..36c402b4a726 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -273,6 +273,11 @@ &uart0 {
 	status = "okay";
 };
 
+&usb0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
 &U74_1 {
 	cpu-supply = <&vdd_cpu>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index dbc1243a0e75..c58489468cad 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -446,6 +446,38 @@ i2c2: i2c@10050000 {
 			status = "disabled";
 		};
 
+		usb0: usb@10100000 {
+			compatible = "starfive,jh7110-usb";
+			ranges = <0x0 0x0 0x10100000 0x100000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			starfive,stg-syscon = <&stg_syscon 0x4>;
+			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
+				 <&stgcrg JH7110_STGCLK_USB0_STB>,
+				 <&stgcrg JH7110_STGCLK_USB0_APB>,
+				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
+				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
+			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
+			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
+				 <&stgcrg JH7110_STGRST_USB0_APB>,
+				 <&stgcrg JH7110_STGRST_USB0_AXI>,
+				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
+			reset-names = "pwrup", "apb", "axi", "utmi_apb";
+			status = "disabled";
+
+			usb_cdns3: usb@0 {
+				compatible = "cdns,usb3";
+				reg = <0x0 0x10000>,
+				      <0x10000 0x10000>,
+				      <0x20000 0x10000>;
+				reg-names = "otg", "xhci", "dev";
+				interrupts = <100>, <108>, <110>;
+				interrupt-names = "host", "peripheral", "otg";
+				phys = <&usbphy0>;
+				phy-names = "cdns3,usb2-phy";
+			};
+		};
+
 		usbphy0: phy@10200000 {
 			compatible = "starfive,jh7110-usb-phy";
 			reg = <0x0 0x10200000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
