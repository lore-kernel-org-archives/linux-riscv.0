Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25934CA0FE8
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJOL/J3lnGZ7bpqZb2ZVFczCzH4UpJyNpUOrHe1RP/s=; b=2yLP27SIcrY9kG
	bO/Qviy/ThTNjarwXKBBvmzjNg/eifb2mynFgff9PY6woMqgdEglB9FFFOg8mi2b1LxbLo39Eeu4Y
	SS8+8fakYcc0wxJ8XAs+HqCG/VaEgu5GQ6BusnynAaEk+eWSqS9JrWuFBtPLv4GGJUoyNNIvrUhEQ
	D7wvT7Is8L6d3zsebx9tYQd45LmKaMxd4U61js9u1UnD7Jgh/tfX3KWqgrb/uTf8PzpLmOmxdfkMA
	DSMJbCcMujUagliAHYB9u/uefHFX7doG3HmouIumJMcq1irdKR/rRX1RJSaWDwupfWnQKB2E/ZOea
	5mp9Ne/Y4K58LUgA1dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkEl-00000004Qq9-2rYQ;
	Sat, 23 Aug 2025 09:08:35 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upk5x-00000004Po2-2FtG
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 08:59:30 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 6CCDBB4E0039;
	Sat, 23 Aug 2025 10:59:25 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
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
Subject: [PATCH v3 3/3] riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot loader
Date: Sat, 23 Aug 2025 01:58:02 -0700
Message-ID: <20250823085818.203263-4-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823085818.203263-1-e@freeshell.de>
References: <20250823085818.203263-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_015929_717958_B4B66D4E 
X-CRM114-Status: UNSURE (   6.82  )
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
  - gmac1_rgmii_rxin fixed-clock (dependency of syscrg)
  - gmac1_rmii_refin fixed-clock (dependency of syscrg)
  - oscillator
  - core local interrupt timer
  - syscrg clock-controller
  - pllclk clock-controller (dependency of syscrg)
  - DDR memory controller

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index f3876660c07f..6e56e9d20bb0 100644
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
@@ -273,12 +278,14 @@ gmac0_rmii_refin: gmac0-rmii-refin-clock {
 
 	gmac1_rgmii_rxin: gmac1-rgmii-rxin-clock {
 		compatible = "fixed-clock";
+		bootph-pre-ram;
 		clock-output-names = "gmac1_rgmii_rxin";
 		#clock-cells = <0>;
 	};
 
 	gmac1_rmii_refin: gmac1-rmii-refin-clock {
 		compatible = "fixed-clock";
+		bootph-pre-ram;
 		clock-output-names = "gmac1_rmii_refin";
 		#clock-cells = <0>;
 	};
@@ -321,6 +328,7 @@ mclk_ext: mclk-ext-clock {
 
 	osc: oscillator {
 		compatible = "fixed-clock";
+		bootph-pre-ram;
 		clock-output-names = "osc";
 		#clock-cells = <0>;
 	};
@@ -354,6 +362,7 @@ soc {
 		clint: timer@2000000 {
 			compatible = "starfive,jh7110-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0x10000>;
+			bootph-pre-ram;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
 					      <&cpu1_intc 3>, <&cpu1_intc 7>,
 					      <&cpu2_intc 3>, <&cpu2_intc 7>,
@@ -880,6 +889,7 @@ qspi: spi@13010000 {
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
+			bootph-pre-ram;
 			clocks = <&osc>, <&gmac1_rmii_refin>,
 				 <&gmac1_rgmii_rxin>,
 				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
@@ -904,6 +914,7 @@ sys_syscon: syscon@13030000 {
 
 			pllclk: clock-controller {
 				compatible = "starfive,jh7110-pll";
+				bootph-pre-ram;
 				clocks = <&osc>;
 				#clock-cells = <1>;
 			};
@@ -935,6 +946,7 @@ memory-controller@15700000 {
 			compatible = "starfive,jh7110-dmc";
 			reg = <0x0 0x15700000 0x0 0x10000>,
 			      <0x0 0x13000000 0x0 0x10000>;
+			bootph-pre-ram;
 			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
 			clock-names = "pll";
 			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
