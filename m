Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F846C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Jhh2nsBaB63oTWDqgKNfVD+OmBIxOds2EzE4LA9250=; b=NSlprqHv4I3To6
	AvfNmMOMlXSTT05DGJijYt9IeRhIYn8PU5FXr/fTBIAwV4YyG86TGxGi7h/6K3VoJ6JtVoQdPJtGU
	zDjeG33o1uNP35/1wwrO6XyJkgzrq5dRACxDqyciiBxLKCzE6hUhlABXNzfDhB8ytcX6aiOfJbnO5
	n3NAANDMCjoLgHB+4BIPhYLJc5n3xfRmwY0klnODuyqkBZVIYjjQ1ysmM3AW09NuqImRck2WfkU6F
	Zpus62w6JYH3bGw31kT8V8MMyaiFcXDotFxTzLS0F8rnfhni5929sn4d8+wuVZmzS793qg0iGK64R
	qMrIYtxp4tfWgy6WNXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr4u-005up9-QC; Thu, 16 Dec 2021 13:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxH-005rRP-Gj
 for linux-riscv@bombadil.infradead.org; Thu, 16 Dec 2021 13:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=NS+JJx5lCA4qZa7ftLxF/PGMO99Zcv7yyHk/sJRwElM=; b=O9tSmbTcPui5yiJTrSMDY+sjZZ
 pYUY0Y5GipsqeH7ldVa/NiS8Hx5BHSo0NWigYTf2chXNnE6eQ/pI1xILT8mmzEY+35ms6bbHHZlyA
 aAkIIH/6mliwGNsZQJEJYYBKg4Go++pFkuWSF9HrIjIRhxeJXVW4H9QQs5/nfDrlbM0YoOM62ylnR
 U0xfkNUPIO8Ub9xIk6xDzSZ3+qUFcBDoGEJT7hl4+tFO5K/h4lb/+sA8QvkxVe7yMPQLqCw04ARSp
 Oq+X7pD2qbT2MvhQ//ggGTfHvjtDVNiZ1JW7oUX4mGd8TtO3Dw9NMpXDpn3YWvmoZrBpQbVLTCZaY
 hFbIEFSA==;
Received: from leibniz.telenet-ops.be ([195.130.137.77])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxD-001hRa-OQ
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:54 +0000
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JFCpy0YTTzMqg3F
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 14:37:46 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by xavier.telenet-ops.be with bizsmtp
 id X1dh26001250X30011dhTF; Thu, 16 Dec 2021 14:37:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx2-005Q91-5S; Thu, 16 Dec 2021 14:37:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xuh-5F; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 07/11] riscv: dts: microchip: mpfs: Group tuples in
 interrupt properties
Date: Thu, 16 Dec 2021 14:37:31 +0100
Message-Id: <5920780dc81102ff11a5521d9476249141fca36b.1639660956.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_133752_225961_B0F520A4 
X-CRM114-Status: UNSURE (   8.16  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
  - Add Reviewed-by.
---
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index d9c1dee3fb25beb8..869aaf0d5c066c9d 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -158,18 +158,18 @@ cache-controller@2010000 {
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
@@ -178,11 +178,11 @@ plic: interrupt-controller@c000000 {
 			#address-cells = <0>;
 			#interrupt-cells = <1>;
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
 			riscv,ndev = <186>;
 		};
 
@@ -190,7 +190,8 @@ dma@3000000 {
 			compatible = "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
-			interrupts = <23 24 25 26 27 28 29 30>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>;
 			#dma-cells = <1>;
 		};
 
@@ -254,7 +255,7 @@ mmc: mmc@20008000 {
 			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
-			interrupts = <88 89>;
+			interrupts = <88>, <89>;
 			clocks = <&clkcfg 6>;
 			max-frequency = <200000000>;
 			status = "disabled";
@@ -264,7 +265,7 @@ emac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
 			interrupt-parent = <&plic>;
-			interrupts = <64 65 66 67>;
+			interrupts = <64>, <65>, <66>, <67>;
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg 4>, <&clkcfg 2>;
 			clock-names = "pclk", "hclk";
@@ -277,7 +278,7 @@ emac1: ethernet@20112000 {
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
