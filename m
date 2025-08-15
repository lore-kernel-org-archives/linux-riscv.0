Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7830BCA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qKuH4uJq6sn2Ug7zSrXCOUXbmf57u2NkfXOWymkTJ4=; b=mKPXCu+gTTSW6N
	0CSeidlkIoyfPDGH2YuktvaUA8akcOXMv2GM4C+S2L3MRYC6QI7NvybG9Ly9dGh3kbziaBkY77Z/Y
	Zj0x98G68dTGRP1xbKtABhJr4RQrkI4eeOtaKCH/sCaIgTZGxeeU1Xou7jh8Cgz/Jle+7v7dVUOHq
	0uEaiGuYmY08YmIsrWhbvrbC85H50cQq3Ot9kCsQ9qGxCBmmDBOY1PCTIERsg0rgoXGE+ArEJnJDA
	/ul8794L7rqW0HbMBhUYUKrZcUW7qiq3trwSy9ZZ0sNwYF403VgfjqnRd/ApU0gpJrqoMRX9MThpR
	asxGlfkAFHJSpwZy++ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ump59-00000001llt-2ldP;
	Fri, 15 Aug 2025 07:42:35 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ump2z-00000001lW5-1JsV
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 07:40:22 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 18F0BB4E0001;
	Fri, 15 Aug 2025 09:40:16 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot loader
Date: Fri, 15 Aug 2025 00:37:23 -0700
Message-ID: <20250815073739.79241-4-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250815073739.79241-1-e@freeshell.de>
References: <20250815073739.79241-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_004021_497763_4CE8F4D1 
X-CRM114-Status: UNSURE (   6.85  )
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

Add bootph-pre-ram hinting to jh7110.dtsi:
  - CPU interrupt controller(s)
  - core local interrupt timer
  - DDR memory controller
  - oscillator
  - syscrg clock-controller

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 14df3d062a45..884a3526cb0f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -35,6 +35,7 @@ S7_0: cpu@0 {
 
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -68,6 +69,7 @@ U74_1: cpu@1 {
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -101,6 +103,7 @@ U74_2: cpu@2 {
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -134,6 +137,7 @@ U74_3: cpu@3 {
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -167,6 +171,7 @@ U74_4: cpu@4 {
 
 			cpu4_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
+				bootph-pre-ram;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
@@ -321,6 +326,7 @@ mclk_ext: mclk-ext-clock {
 
 	osc: oscillator {
 		compatible = "fixed-clock";
+		bootph-pre-ram;
 		clock-output-names = "osc";
 		#clock-cells = <0>;
 	};
@@ -354,6 +360,7 @@ soc {
 		clint: timer@2000000 {
 			compatible = "starfive,jh7110-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0x10000>;
+			bootph-pre-ram;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
 					      <&cpu1_intc 3>, <&cpu1_intc 7>,
 					      <&cpu2_intc 3>, <&cpu2_intc 7>,
@@ -376,6 +383,7 @@ memory-controller@15700000 {
 			compatible = "starfive,jh7110-dmc";
 			reg = <0x0 0x15700000 0x0 0x10000>,
 			      <0x0 0x13000000 0x0 0x10000>;
+			bootph-pre-ram;
 			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
 			clock-names = "pll1_out";
 			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
@@ -892,6 +900,7 @@ qspi: spi@13010000 {
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
+			bootph-pre-ram;
 			clocks = <&osc>, <&gmac1_rmii_refin>,
 				 <&gmac1_rgmii_rxin>,
 				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
