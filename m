Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415EDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 12:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4GZbsIpUOmOTTPCkraw8qvXSNFFNYwDMTM+coxMClc=; b=oSaN3X5y/VyufC
	cfMeaL9ong54MtDmCSO+aG+0btNdhENuB94lGXnAJ1m0xqD6AHrcTJ4sv4Oh6nmPCdXjj9MLkbLWw
	ENijpbZ3gIynWU3YyqAsEOhiu+mVPLT73mbYh2wqVY+UKNQTuZzAaG86XJk0O0YyATis945fQwDNM
	e338POB/tCx9ttFwSSv65C4rGDOF1Y91+SWXwA288CIKYPWtyWqy7120U/H/+x2HeBgvT44KwJgPs
	enXDzZRU5uyyyHLX5eey/PrCjDDFE1alf2yB803/g7RSQlHoj5lmterpOarS/Jm9DP6dYADkgjO9I
	9AcjmaU2kon9VGEnqVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8ej-00CfRQ-8f; Tue, 27 Dec 2022 12:02:05 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8cg-00CeQQ-7u
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 12:01:13 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9C2A824DF1F;
	Tue, 27 Dec 2022 19:59:08 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Dec
 2022 19:59:08 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 27 Dec 2022 19:59:07 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@linux.starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] riscv: dts: starfive: Add mmc node
Date: Tue, 27 Dec 2022 19:58:56 +0800
Message-ID: <20221227115856.460790-4-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227115856.460790-1-william.qiu@starfivetech.com>
References: <20221227115856.460790-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_040000_159583_F0085C2B 
X-CRM114-Status: GOOD (  10.05  )
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

This adds the mmc node for the StarFive JH7110 SoC.
Set sdioo node to emmc and set sdio1 node to sd.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 38 +++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
index c8946cf3a268..d8244fd1f5a0 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
@@ -47,6 +47,31 @@ &clk_rtc {
 	clock-frequency = <32768>;
 };
 
+&mmc0 {
+	max-frequency = <100000000>;
+	card-detect-delay = <300>;
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	cap-mmc-hw-reset;
+	post-power-on-delay-ms = <200>;
+	status = "okay";
+};
+
+&mmc1 {
+	max-frequency = <100000000>;
+	card-detect-delay = <300>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	broken-cd;
+	cap-sd-highspeed;
+	post-power-on-delay-ms = <200>;
+	status = "okay";
+};
+
 &gmac0_rmii_refin {
 	clock-frequency = <50000000>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index c22e8f1d2640..08a780d2c0f4 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -331,6 +331,11 @@ aoncrg: clock-controller@17000000 {
 			#reset-cells = <1>;
 		};
 
+		syscon: syscon@13030000 {
+			compatible = "starfive,syscon", "syscon";
+			reg = <0x0 0x13030000 0x0 0x1000>;
+		};
+
 		gpio: gpio@13040000 {
 			compatible = "starfive,jh7110-sys-pinctrl";
 			reg = <0x0 0x13040000 0x0 0x10000>;
@@ -433,5 +438,38 @@ uart5: serial@12020000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		/* unremovable emmc as mmcblk0 */
+		mmc0: mmc@16010000 {
+			compatible = "starfive,jh7110-mmc";
+			reg = <0x0 0x16010000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
+				 <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
+			clock-names = "biu","ciu";
+			resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
+			reset-names = "reset";
+			interrupts = <74>;
+			fifo-depth = <32>;
+			fifo-watermark-aligned;
+			data-addr = <0>;
+			starfive,syscon = <&syscon 0x14 0x1a 0x7c000000>;
+			status = "disabled";
+		};
+
+		mmc1: mmc@16020000 {
+			compatible = "starfive,jh7110-mmc";
+			reg = <0x0 0x16020000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
+				 <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
+			clock-names = "biu","ciu";
+			resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
+			reset-names = "reset";
+			interrupts = <75>;
+			fifo-depth = <32>;
+			fifo-watermark-aligned;
+			data-addr = <0>;
+			starfive,syscon = <&syscon 0x9c 0x1 0x3e>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
