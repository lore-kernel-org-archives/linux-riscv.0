Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10506C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znU3wZ216RxQUkBpHjLXchbTX9kzRVzkZBLG7WwQQ8k=; b=Fs15QT4GljZ75f
	69xbmwH9l8gMs8ZtNNAryQkxBujzz2rK/e8MdsVoxHxXeaY2HohexCVuDLk5LUT8rNrB70UQOX/ml
	jWKHSVA+YoQ6FBbmsirMBZsbkfSlp5UjCeKOzKjt7Jo8kdLWDlT1jxbc9hzPFUciQ8RXVka5OZsOv
	q3YXEpQkk4EaQns8ve66X79MihNP1ordsNjofQbtyO4o1PYCifPzbRT7z2ZCwlIvD4wO7/209JlhN
	LZVvxnIHWKOmSdQg4NeyguSic5/2VWJjEMK0zPtO/g3lovrNcfqXUWIiZfnKXZqFFGrOOHOi/Hd6Z
	Qs1TOM3duu0i7EcVUzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGit-0081vq-RD; Thu, 25 Nov 2021 15:31:43 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGio-0081rq-4X
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:31:39 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by xavier.telenet-ops.be with bizsmtp
 id NfXa260065CGg7701fXaAD; Thu, 25 Nov 2021 16:31:35 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGij-000DSP-I0; Thu, 25 Nov 2021 16:31:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000gYw-K5; Thu, 25 Nov 2021 16:31:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/9] riscv: dts: microchip: Group tuples in interrupt
 properties
Date: Thu, 25 Nov 2021 16:31:26 +0100
Message-Id: <20211125153131.163533-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153131.163533-1-geert@linux-m68k.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_073138_362572_06E69F47 
X-CRM114-Status: UNSURE (   8.19  )
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
---
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 794da883acb19256..d91226bfa586cda7 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -153,18 +153,18 @@ cache-controller@2010000 {
 			cache-size = <2097152>;
 			cache-unified;
 			interrupt-parent = <&plic>;
-			interrupts = <1 2 3>;
+			interrupts = <1>, <2>, <3>;
 			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 
 		clint@2000000 {
 			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
-			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
-						&cpu1_intc 3 &cpu1_intc 7
-						&cpu2_intc 3 &cpu2_intc 7
-						&cpu3_intc 3 &cpu3_intc 7
-						&cpu4_intc 3 &cpu4_intc 7>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>;
 		};
 
 		plic: interrupt-controller@c000000 {
@@ -173,18 +173,19 @@ plic: interrupt-controller@c000000 {
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <186>;
 			interrupt-controller;
-			interrupts-extended = <&cpu0_intc 11
-					&cpu1_intc 11 &cpu1_intc 9
-					&cpu2_intc 11 &cpu2_intc 9
-					&cpu3_intc 11 &cpu3_intc 9
-					&cpu4_intc 11 &cpu4_intc 9>;
+			interrupts-extended = <&cpu0_intc 11>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>,
+					      <&cpu4_intc 11>, <&cpu4_intc 9>;
 		};
 
 		dma@3000000 {
 			compatible = "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
-			interrupts = <23 24 25 26 27 28 29 30>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>;
 			#dma-cells = <1>;
 		};
 
@@ -264,7 +265,7 @@ mmc: mmc@20008000 {
 			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
-			interrupts = <88 89>;
+			interrupts = <88>, <89>;
 			clocks = <&clkcfg 6>;
 			max-frequency = <200000000>;
 			status = "disabled";
@@ -274,7 +275,7 @@ emac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
 			interrupt-parent = <&plic>;
-			interrupts = <64 65 66 67>;
+			interrupts = <64>, <65>, <66>, <67>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg 4>, <&clkcfg 2>;
 			clock-names = "pclk", "hclk";
@@ -287,7 +288,7 @@ emac1: ethernet@20112000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			interrupt-parent = <&plic>;
-			interrupts = <70 71 72 73>;
+			interrupts = <70>, <71>, <72>, <73>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg 5>, <&clkcfg 2>;
 			status = "disabled";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
