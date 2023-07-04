Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D699EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4UAEPnIvUX60JZPhOatUsbTBMekXoR/9+XeYADDAL8=; b=DoqEwt0tN5z54s
	jM6ldbPP2Da3tyhNty6oTqccCGQgbYFJgPq+xTwDrgORGfgWMuUduAxYFGOjc9AC2tbcK1gDEGKl9
	SInEj+0/BxPVrUR9cOI4/71OiRenGs7tOTt55jJhdzVeN8tVXGEQ00LX2bT9WNBBTic08zNaQs7un
	Dzz/+maGzlAwyJHC0m6l31Q8gM2kTp+cu5I93yvuhJ8vFtO8gfByRlM2TXtqi7EF83nmJC8v1jVSn
	lGx2peKiGHSLZPjdq/9PrnnuSudjRIqITOGLabSVCU9V1iIjd7Ibk439BcGtmpLx20VxWECCqodpZ
	2qe0I7d6qYcrgG71DuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGc0Q-00CfJO-00;
	Tue, 04 Jul 2023 09:07:30 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGc0M-00Cenp-1n
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:07:28 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 47FB9823D;
	Tue,  4 Jul 2023 17:04:57 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 17:04:57 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 4 Jul 2023 17:04:56 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v4 3/3] riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC
Date: Tue, 4 Jul 2023 17:04:53 +0800
Message-ID: <20230704090453.83980-4-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704090453.83980-1-william.qiu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_020726_990428_4D041C3D 
X-CRM114-Status: UNSURE (   9.14  )
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

Add the quad spi controller node for the StarFive JH7110 SoC.

Co-developed-by: Ziv Xu <ziv.xu@starfivetech.com>
Signed-off-by: Ziv Xu <ziv.xu@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 32 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 18 +++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 2a6d81609284..983b683e2f27 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -126,6 +126,38 @@ &i2c6 {
 	status = "okay";
 };
 
+&qspi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nor_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		cdns,read-delay = <5>;
+		spi-max-frequency = <12000000>;
+		cdns,tshsl-ns = <1>;
+		cdns,tsd2d-ns = <1>;
+		cdns,tchsh-ns = <1>;
+		cdns,tslch-ns = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			spl@0 {
+				reg = <0x0 0x20000>;
+			};
+			uboot@100000 {
+				reg = <0x100000 0x300000>;
+			};
+			data@f00000 {
+				reg = <0xf00000 0x100000>;
+			};
+		};
+	};
+};
+
 &sysgpio {
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..fe33c5616565 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -440,6 +440,24 @@ i2c6: i2c@12060000 {
 			status = "disabled";
 		};
 
+		qspi: spi@13010000 {
+			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
+			reg = <0x0 0x13010000 0x0 0x10000>,
+			      <0x0 0x21000000 0x0 0x400000>;
+			interrupts = <25>;
+			clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
+				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
+				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
+			clock-names = "ref", "ahb", "apb";
+			resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
+				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
+				 <&syscrg JH7110_SYSRST_QSPI_REF>;
+			reset-names = "qspi", "qspi-ocp", "rstc_ref";
+			cdns,fifo-depth = <256>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x0>;
+		};
+
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
