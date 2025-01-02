Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02DDE77197
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlIQaEU/IbRaZbAFmvUMKn7N7qwE2QBCYVpd7jKVJF8=; b=AH/fAEuVdC21L7
	E8RrfcSCrdMyfWbU8IjLCr/k4Y5GhxUX4gExAyAGdAgqx7rYEZQNOATv3JLGtNgYcTqI/Tda0S6do
	Nl5AdjEihvHupqgXrIavfWvlkfvKP946l/RsstpTVcielrRAhTxlBLCHuYnMHz7Re4Z31YFeozbP8
	olkBpfV4tEevm4K594NBAz0EiR1bm5tQaIXCowOzHtvWXvc1Mx3Ne/Zbom7MUjx0YRMhmWweqYpWC
	cjt+XpnT0p4soEEyEWbeGpVpS5NiEwP1j1BKOoyRxvH0CQRFvA6qKjrueJXNOnc0lvPdrXuzoEvIT
	zNNFTHlSXYjWq8A2tKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS4o-0000000BQGx-14rY;
	Thu, 02 Jan 2025 20:45:54 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS1S-0000000BPg8-12R2
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 20:42:27 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C58F8B220C7F;
	Thu,  2 Jan 2025 21:42:22 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [RFC PATCH v1 3/3] riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot loader
Date: Thu,  2 Jan 2025 12:41:23 -0800
Message-ID: <20250102204137.423081-4-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102204137.423081-1-e@freeshell.de>
References: <20250102204137.423081-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124226_425540_C8034D02 
X-CRM114-Status: UNSURE (   6.61  )
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
  - timer
  - DRAM memory controller
  - oscillator
  - syscrg clock-controller
  - (optional) dma controller
  - (optional) aoncrg clock-controller

  With this the U-Boot SPL secondary program loader may drop such
  overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 6948974400c1..4f19b88fe73f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -37,6 +37,7 @@ cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
 				#interrupt-cells = <1>;
+				bootph-pre-ram;
 			};
 		};
 
@@ -70,6 +71,7 @@ cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
 				#interrupt-cells = <1>;
+				bootph-pre-ram;
 			};
 		};
 
@@ -103,6 +105,7 @@ cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
 				#interrupt-cells = <1>;
+				bootph-pre-ram;
 			};
 		};
 
@@ -136,6 +139,7 @@ cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
 				#interrupt-cells = <1>;
+				bootph-pre-ram;
 			};
 		};
 
@@ -169,6 +173,7 @@ cpu4_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
 				#interrupt-cells = <1>;
+				bootph-pre-ram;
 			};
 		};
 
@@ -323,6 +328,7 @@ osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc";
 		#clock-cells = <0>;
+		bootph-pre-ram;
 	};
 
 	rtc_osc: rtc-oscillator {
@@ -368,6 +374,7 @@ clint: timer@2000000 {
 					      <&cpu2_intc 3>, <&cpu2_intc 7>,
 					      <&cpu3_intc 3>, <&cpu3_intc 7>,
 					      <&cpu4_intc 3>, <&cpu4_intc 7>;
+			bootph-pre-ram;
 		};
 
 		ccache: cache-controller@2010000 {
@@ -382,6 +389,7 @@ ccache: cache-controller@2010000 {
 		};
 
 		dmc: dmc@15700000 {
+			bootph-pre-ram;
 			compatible = "starfive,jh7110-dmc";
 			reg = <0x0 0x15700000 0x0 0x10000>,
 			      <0x0 0x13000000 0x0 0x10000>;
@@ -916,6 +924,7 @@ syscrg: clock-controller@13020000 {
 				      "pll0_out", "pll1_out", "pll2_out";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			bootph-pre-ram;
 		};
 
 		sys_syscon: syscon@13030000 {
@@ -1098,6 +1107,7 @@ dma: dma-controller@16050000 {
 			snps,block-size = <65536 65536 65536 65536>;
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <16>;
+			bootph-pre-ram;
 		};
 
 		aoncrg: clock-controller@17000000 {
@@ -1115,6 +1125,7 @@ aoncrg: clock-controller@17000000 {
 				      "rtc_osc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			bootph-pre-ram;
 		};
 
 		aon_syscon: syscon@17010000 {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
