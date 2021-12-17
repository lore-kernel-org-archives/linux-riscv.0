Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66061C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqnSWKGyPFirX0Il1JIMt2ntogxYL4OOwlAKiM0sVdA=; b=o5i8sxJ0Aot1Lo
	tKT10aYp5o6YjapYRWatasrUKn5ikywfMNeoZsTnscXqolFNfAWSopfmbm6YePQpi6SMqiJm3ETHS
	xAqFlxsX/mFz93LR3NEUXWAUPGmRwXL2dAd7MyBSpnLKBHE3pqOOGLwLZqMyLqRwRmPffL5dIkiwK
	LHYTrZthJJUBZLHSagOHiy941wrXn/XLGYr580z2Ja9nC1r6/Jbhnuj3cJnsZLfhrRMDY9pd5IUSm
	vCpqg0LXLcwwxMbxkAPabtDhAzoiCHEj9sX6m/nLwB/YNYW1The9SbH06LUTir/GOTEWzhIyOIT7/
	Octbx7HtsYsob4DcsoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCgL-00AEJT-Nd; Fri, 17 Dec 2021 12:49:53 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCgG-00AEEd-Ng
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:49:50 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by albert.telenet-ops.be with bizsmtp
 id XQpm26003250X3006QpmK2; Fri, 17 Dec 2021 13:49:47 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCgD-005YxS-Ev; Fri, 17 Dec 2021 13:49:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCgC-00ASrW-LG; Fri, 17 Dec 2021 13:49:44 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 08/11] riscv: dts: sifive: Group tuples in interrupt
 properties
Date: Fri, 17 Dec 2021 13:49:29 +0100
Message-Id: <2cb6205b2d6de2a35323f86e8fbc0922ba32fb08.1639744905.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639744905.git.geert@linux-m68k.org>
References: <cover.1639744905.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_044948_935620_3B9A3F23 
X-CRM114-Status: UNSURE (   7.58  )
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
v3:
  - No changes,

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
