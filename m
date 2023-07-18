Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5055FC001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OjNiTsUS5zRkYxbBJBjCSop2iJuC/S8/MgPgoU+rxE=; b=xn5jtOmuJQtw2t
	TsLtrhdvgDTtLhT3ho31XTGnH2Ld6lSIzV1gMq5b2xyibb/YN5zs4lVFfWQQL33j6CTLfNJooQD+s
	XHZAgvWVh8R5aI20aiEpsIXRdECBp8BfdmECs+dYlx2dx//9iv0S5C0vAcOXiFJ340NJ1bHxtGLUJ
	QDb4K+0B+l9j+hM8ugjo9NV6DBtxqLyJ4kAKc/+pJnHkGaldXgpEaoMqg6LidIZW2HbHhSMexIXgx
	QWS4xcrGgJaP2fWjpH8vgeFhIbIfmaqwccNrdXOTrazw+gkgRxdKCKK2+Y4pBln8obvIeSWefI1Cs
	kGLrm++AB+C2B+4hWRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzjv-005JLX-1d;
	Wed, 19 Jul 2023 05:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzju-005JKK-2E
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FlKBLLm8jG2SUlMjEf1TM1CJEnygowsqoeyDn7MnjQc=; b=hJTrnPkhN7KIaSahJgOjyPS7+u
	lNjBLpCv22saMzSXO7A94qii30Cp36Q4KLDnaU0X4yKgRecHDpIiQnCC11GCO4vfh6AtT5AFef/Gb
	leWcxR+WVrQCF8h1ny/+UmNhLvEb1GYZjMmRTNORNTiSipzhueAMzE54wZ4Q6qz2t6BdQzmmuwZbZ
	v+QzkI/sO4AH5gSjfnVEsRbPkWVO+fO468hEqvtGh8QIfgAbxAUlrWhG6gj1CUZmigFtmQ/YmejYs
	aiizYpBl7yVbNIx0hP2w8hTQPlwRPOWb2vgIkwmoMJt9xSE0CiNzx21QEPPxhLS6F96WBXAukoEPS
	0ueDIDeA==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLbk9-009zZc-0N
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 03:51:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F30E824DDBE;
	Tue, 18 Jul 2023 11:49:39 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:39 +0800
Received: from ubuntu.localdomain (113.72.147.86) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:39 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] riscv: dts: starfive: jh7110: Add temperature sensor node and thermal-zones
Date: Tue, 18 Jul 2023 11:49:36 +0800
Message-ID: <20230718034937.92999-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230718034937.92999-1-hal.feng@starfivetech.com>
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_045125_182305_BE4B7B60 
X-CRM114-Status: GOOD (  10.11  )
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

Add temperature sensor and thermal-zones support for
the StarFive JH7110 SoC. CPUFreq cooling is supported
in thermal-zones.

Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index ec2e70011a73..2315acd560a3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -7,6 +7,7 @@
 /dts-v1/;
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
 #include <dt-bindings/reset/starfive,jh7110-crg.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "starfive,jh7110";
@@ -56,6 +57,7 @@ U74_1: cpu@1 {
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -85,6 +87,7 @@ U74_2: cpu@2 {
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -114,6 +117,7 @@ U74_3: cpu@3 {
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -143,6 +147,7 @@ U74_4: cpu@4 {
 			operating-points-v2 = <&cpu_opp>;
 			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 
 			cpu4_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -197,6 +202,42 @@ opp-1500000000 {
 			};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <15000>;
+
+			thermal-sensors = <&sfctemp>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device =
+						<&U74_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&U74_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&U74_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&U74_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu_alert0: cpu_alert0 {
+					/* milliCelsius */
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit {
+					/* milliCelsius */
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	gmac0_rgmii_rxin: gmac0-rgmii-rxin-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "gmac0_rgmii_rxin";
@@ -473,6 +514,18 @@ i2c6: i2c@12060000 {
 			status = "disabled";
 		};
 
+		sfctemp: temperature-sensor@120e0000 {
+			compatible = "starfive,jh7110-temp";
+			reg = <0x0 0x120e0000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_TEMP_CORE>,
+				 <&syscrg JH7110_SYSCLK_TEMP_APB>;
+			clock-names = "sense", "bus";
+			resets = <&syscrg JH7110_SYSRST_TEMP_CORE>,
+				 <&syscrg JH7110_SYSRST_TEMP_APB>;
+			reset-names = "sense", "bus";
+			#thermal-sensor-cells = <0>;
+		};
+
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
