Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRM+aFyz4Xw5YvLZd0sb0vtVo5FiR/AJ/1jOHsH3Hu0=; b=JhS4kLpH4kooyf
	7fQdWUxloR0fJCfynYkqlG4cpDJ+A2zL5k2SjsE6+c7XTZCgjnnX8YoV4bk10qhO4TF4KyUrL/VUw
	r3/070u4Ez6aQX9lvujyb0lZ+zir9mSeqTp3LHN404/bg5b5j/TomRYPD9EWSkep4hLC65a+WGOMb
	whnNH5I9DmoIiMyOF+hsFaZ68ZTtbinc/cOBWeHYR69ANichpGCNXW6ylNBm3BJ2QjcpiJVRKDIx0
	KGVAuFheXrdZOkDKwvsqGz22KuTLk+WpiZgynns43FJs3+HySkZowDA0C8K/GeJK3eY7SEPZzEd9U
	BLkLTU3NNWp5w369NjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr3t-005uFs-5W; Thu, 16 Dec 2021 13:44:45 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxB-005rJl-Nb
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:53 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by laurent.telenet-ops.be with bizsmtp
 id X1dg2600F250X30011dgyB; Thu, 16 Dec 2021 14:37:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-005Q92-Tt; Thu, 16 Dec 2021 14:37:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xup-65; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 08/11] riscv: dts: sifive: Group tuples in interrupt
 properties
Date: Thu, 16 Dec 2021 14:37:32 +0100
Message-Id: <aff2d0fc13d3e54f5ff604c08e948deb3abaf30b.1639660956.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_053750_119970_0D24842D 
X-CRM114-Status: UNSURE (   7.95  )
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

To improve human readability and enable automatic validation, the tuples
in the various properties containing interrupt specifiers should be
grouped.

Fix this by grouping the tuples of "interrupts" and
"interrupts-extended" properties using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
v2:
  - Add Reviewed-by.
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 21 +++++++++++----------
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 14 +++++++-------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 0655b5c4201d9f71..0caca0ccf6711ded 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -145,12 +145,12 @@ plic0: interrupt-controller@c000000 {
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <53>;
 			interrupt-controller;
-			interrupts-extended = <
-				&cpu0_intc 0xffffffff
-				&cpu1_intc 0xffffffff &cpu1_intc 9
-				&cpu2_intc 0xffffffff &cpu2_intc 9
-				&cpu3_intc 0xffffffff &cpu3_intc 9
-				&cpu4_intc 0xffffffff &cpu4_intc 9>;
+			interrupts-extended =
+				<&cpu0_intc 0xffffffff>,
+				<&cpu1_intc 0xffffffff>, <&cpu1_intc 9>,
+				<&cpu2_intc 0xffffffff>, <&cpu2_intc 9>,
+				<&cpu3_intc 0xffffffff>, <&cpu3_intc 9>,
+				<&cpu4_intc 0xffffffff>, <&cpu4_intc 9>;
 		};
 		prci: clock-controller@10000000 {
 			compatible = "sifive,fu540-c000-prci";
@@ -170,7 +170,8 @@ dma: dma@3000000 {
 			compatible = "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
-			interrupts = <23 24 25 26 27 28 29 30>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>;
 			#dma-cells = <1>;
 		};
 		uart1: serial@10011000 {
@@ -243,7 +244,7 @@ pwm0: pwm@10020000 {
 			compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
 			reg = <0x0 0x10020000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
-			interrupts = <42 43 44 45>;
+			interrupts = <42>, <43>, <44>, <45>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
@@ -252,7 +253,7 @@ pwm1: pwm@10021000 {
 			compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
 			reg = <0x0 0x10021000 0x0 0x1000>;
 			interrupt-parent = <&plic0>;
-			interrupts = <46 47 48 49>;
+			interrupts = <46>, <47>, <48>, <49>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			#pwm-cells = <3>;
 			status = "disabled";
@@ -265,7 +266,7 @@ l2cache: cache-controller@2010000 {
 			cache-size = <2097152>;
 			cache-unified;
 			interrupt-parent = <&plic0>;
-			interrupts = <1 2 3>;
+			interrupts = <1>, <2>, <3>;
 			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 		gpio: gpio@10060000 {
diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index abbb960f90a00ac2..8464b0e3c88791e1 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -147,12 +147,12 @@ plic0: interrupt-controller@c000000 {
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <69>;
 			interrupt-controller;
-			interrupts-extended = <
-				&cpu0_intc 0xffffffff
-				&cpu1_intc 0xffffffff &cpu1_intc 9
-				&cpu2_intc 0xffffffff &cpu2_intc 9
-				&cpu3_intc 0xffffffff &cpu3_intc 9
-				&cpu4_intc 0xffffffff &cpu4_intc 9>;
+			interrupts-extended =
+				<&cpu0_intc 0xffffffff>,
+				<&cpu1_intc 0xffffffff>, <&cpu1_intc 9>,
+				<&cpu2_intc 0xffffffff>, <&cpu2_intc 9>,
+				<&cpu3_intc 0xffffffff>, <&cpu3_intc 9>,
+				<&cpu4_intc 0xffffffff>, <&cpu4_intc 9>;
 		};
 		prci: clock-controller@10000000 {
 			compatible = "sifive,fu740-c000-prci";
@@ -273,7 +273,7 @@ ccache: cache-controller@2010000 {
 			cache-size = <2097152>;
 			cache-unified;
 			interrupt-parent = <&plic0>;
-			interrupts = <19 21 22 20>;
+			interrupts = <19>, <21>, <22>, <20>;
 			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 		gpio: gpio@10060000 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
