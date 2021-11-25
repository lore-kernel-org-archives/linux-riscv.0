Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC76EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPowHM+xfwa8ICr/EvGUZ6EXMmEX6avPJy2rsnrUiBw=; b=Divo8WisoNya1B
	htYhgVUUf8Rgf67SeAuNZZ09L6kdT+r1/cnyD3MGEm7p0W/jBybs2Ho+Lz3RR4VAreSgGKD2EcLFj
	ZO2y9ANI36VJNMfykDTC5RgTf1LsxrFv91KGWLwe3C33HiwktNySekPZjsE6d3MicX6JmTAWoUEJt
	hx/qe+vtP5sU5Z/lcqNkLvSrfG0k/JqpdLdcaxBSEkHqxX0QX2T857LXSDnRmXmQZ3t+NC47OoUXj
	G1XNGml2Fayba5boF6hzjaf8uXw4eMxhv+Sp09umhk++ickYnz4RoxIPZjpv/M86AHyNFa25FKJbF
	Lf8aFNrEQ1jqD/ahsAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGj8-00822Z-Mo; Thu, 25 Nov 2021 15:31:58 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGiq-0081ry-EO
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:31:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by baptiste.telenet-ops.be with bizsmtp
 id NfXZ2600V5CGg7701fXZr8; Thu, 25 Nov 2021 16:31:36 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGij-000DSN-1u; Thu, 25 Nov 2021 16:31:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000gYj-Ig; Thu, 25 Nov 2021 16:31:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/9] riscv: dts: canaan: Group tuples in interrupt properties
Date: Thu, 25 Nov 2021 16:31:24 +0100
Message-Id: <20211125153131.163533-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153131.163533-1-geert@linux-m68k.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_073140_662567_FCF4979F 
X-CRM114-Status: UNSURE (   8.45  )
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
 arch/riscv/boot/dts/canaan/k210.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 5e8ca8142482153b..56f57118c633b91a 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -103,8 +103,8 @@ rom0: nvmem@1000 {
 		clint0: timer@2000000 {
 			compatible = "canaan,k210-clint", "sifive,clint0";
 			reg = <0x2000000 0xC000>;
-			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
-					      &cpu1_intc 3 &cpu1_intc 7>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>;
 		};
 
 		plic0: interrupt-controller@c000000 {
@@ -113,7 +113,7 @@ plic0: interrupt-controller@c000000 {
 			compatible = "canaan,k210-plic", "sifive,plic-1.0.0";
 			reg = <0xC000000 0x4000000>;
 			interrupt-controller;
-			interrupts-extended = <&cpu0_intc 11 &cpu1_intc 11>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>;
 			riscv,ndev = <65>;
 		};
 
@@ -130,10 +130,11 @@ gpio0: gpio-controller@38001000 {
 			compatible = "canaan,k210-gpiohs", "sifive,gpio0";
 			reg = <0x38001000 0x1000>;
 			interrupt-controller;
-			interrupts = <34 35 36 37 38 39 40 41
-				      42 43 44 45 46 47 48 49
-				      50 51 52 53 54 55 56 57
-				      58 59 60 61 62 63 64 65>;
+			interrupts = <34>, <35>, <36>, <37>, <38>, <39>, <40>,
+				     <41>, <42>, <43>, <44>, <45>, <46>, <47>,
+				     <48>, <49>, <50>, <51>, <52>, <53>, <54>,
+				     <55>, <56>, <57>, <58>, <59>, <60>, <61>,
+				     <62>, <63>, <64>, <65>;
 			gpio-controller;
 			ngpios = <32>;
 		};
@@ -141,7 +142,7 @@ gpio0: gpio-controller@38001000 {
 		dmac0: dma-controller@50000000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x50000000 0x1000>;
-			interrupts = <27 28 29 30 31 32>;
+			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
 			#dma-cells = <1>;
 			clocks = <&sysclk K210_CLK_DMA>, <&sysclk K210_CLK_DMA>;
 			clock-names = "core-clk", "cfgr-clk";
@@ -316,7 +317,7 @@ fpioa: pinmux@502b0000 {
 			timer0: timer@502d0000 {
 				compatible = "snps,dw-apb-timer";
 				reg = <0x502D0000 0x100>;
-				interrupts = <14 15>;
+				interrupts = <14>, <15>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
@@ -326,7 +327,7 @@ timer0: timer@502d0000 {
 			timer1: timer@502e0000 {
 				compatible = "snps,dw-apb-timer";
 				reg = <0x502E0000 0x100>;
-				interrupts = <16 17>;
+				interrupts = <16>, <17>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
@@ -336,7 +337,7 @@ timer1: timer@502e0000 {
 			timer2: timer@502f0000 {
 				compatible = "snps,dw-apb-timer";
 				reg = <0x502F0000 0x100>;
-				interrupts = <18 19>;
+				interrupts = <18>, <19>;
 				clocks = <&sysclk K210_CLK_TIMER2>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
