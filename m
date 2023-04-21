Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5BFC77B78
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 03:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwwfwDX2ZJljPolJ5884UTqjIPohIne02RFiPuL+T4w=; b=3tRRDlm5mwkGnW
	ABM92mg+q5Eszx0AZEGf/e3+P+DyyGp/u7Q1HUBQh3hpCHDSLMkjtsURZ0jYe0SBnHv3J+Hiu59eq
	VQaH+YMU8wLDVsPvoho6W7fHxHQBRZWojyXElFwwmY/WVREa7dEEDRdVayBLjJ/JiQ2XHMBQ56h0s
	MutzUjjL597503IqwvpJCi01nMhqApDCLFo5l2iVz/Lb7QvFI2FMF2DrKxUEMqXLTQ5Ea+0i82zZR
	bDbzCN0orX2ZC5Qh9ubxiA5E/odDyr9LHB6gNJh38+xRvFF/cMsJ2tKk+3eAbeC3xUBSBaSvgFjLQ
	axDmhjluXt7vffPd5wmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEl-009W4T-2Z;
	Fri, 21 Apr 2023 03:15:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEg-009W22-0d
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 03:15:00 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 80DD824E0AE;
	Fri, 21 Apr 2023 11:14:35 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:35 +0800
Received: from localhost.localdomain (113.72.144.253) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:34 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
CC: Shengyu Qu <wiagn233@outlook.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH v3 3/3] riscv: dts: starfive: Add cpu scaling for JH7110 SoC
Date: Fri, 21 Apr 2023 11:14:31 +0800
Message-ID: <20230421031431.23010-4-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421031431.23010-1-mason.huo@starfivetech.com>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_201458_554997_607C0476 
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

Add the operating-points-v2 to support cpu scaling on StarFive JH7110 SoC.
It supports up to 4 cpu frequency loads.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 16 +++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index cca1c8040801..43a9dbb839d2 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -227,3 +227,19 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&U74_1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&U74_2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&U74_3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&U74_4 {
+	cpu-supply = <&vdd_cpu>;
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..7eef88d2cedb 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -53,6 +53,9 @@ U74_1: cpu@1 {
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
 			tlb-split;
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
+			clock-names = "cpu";
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -79,6 +82,9 @@ U74_2: cpu@2 {
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
 			tlb-split;
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
+			clock-names = "cpu";
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -105,6 +111,9 @@ U74_3: cpu@3 {
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
 			tlb-split;
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
+			clock-names = "cpu";
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -131,6 +140,9 @@ U74_4: cpu@4 {
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc_zba_zbb";
 			tlb-split;
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
+			clock-names = "cpu";
 
 			cpu4_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -164,6 +176,27 @@ core4 {
 		};
 	};
 
+	cpu_opp: opp-table-0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+			opp-375000000 {
+					opp-hz = /bits/ 64 <375000000>;
+					opp-microvolt = <800000>;
+			};
+			opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-microvolt = <800000>;
+			};
+			opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-microvolt = <800000>;
+			};
+			opp-1500000000 {
+					opp-hz = /bits/ 64 <1500000000>;
+					opp-microvolt = <1040000>;
+			};
+	};
+
 	gmac0_rgmii_rxin: gmac0-rgmii-rxin-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "gmac0_rgmii_rxin";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
