Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC8DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYlZH1CK1G1VfhfXumQVGdWPJXxPU5MtNGr6XUiGvoI=; b=AKVzJJa9k7HNnr
	CdJLoul0n1FER/5o106Jwv/O2ItlUAHJZTPsMRSQlYav2p2JdCO1097fm3F48b2Jp9I0lbR97MihG
	I90mabdBvwASp3lhU+URLPulnV+93eT6Lg8NpSFz1ZR93qS5Y4LniIDlMvbzRGrBoF6zJX6Jtotgg
	mgEz9LgZ5pme4o7liSEDgvgQ8u5YemDtfR6JmPronNqeW0MvllvD04NP0Hhjunqob6fda+7bpPbp5
	uqUrS9ogD05ZmQW1+wYr5TTyDr1SMqLEktIT3yGmd+l/EqSTxHHDuqmD8xhzZXTYlmL30zA9Ijqxw
	EjyfaS4u+MyL17OK8gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr4a-005ueg-Ea; Thu, 16 Dec 2021 13:45:28 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxB-005rJk-Pt
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:53 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by laurent.telenet-ops.be with bizsmtp
 id X1dg2600D250X30011dgyA; Thu, 16 Dec 2021 14:37:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-005Q93-Sg; Thu, 16 Dec 2021 14:37:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xuv-6t; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 09/11] riscv: dts: sifive: Group tuples in register
 properties
Date: Thu, 16 Dec 2021 14:37:33 +0100
Message-Id: <405f7ebe588e269ffd428b818c0ff1f472a00ea8.1639660956.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_053750_145616_6B162315 
X-CRM114-Status: UNSURE (   8.46  )
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
in "reg" properties containing register blocks should be grouped using
angle brackets.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
v2:
  - Add Reviewed-by.
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 0caca0ccf6711ded..e2efcf08210926f8 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -196,8 +196,8 @@ i2c0: i2c@10030000 {
 		};
 		qspi0: spi@10040000 {
 			compatible = "sifive,fu540-c000-spi", "sifive,spi0";
-			reg = <0x0 0x10040000 0x0 0x1000
-			       0x0 0x20000000 0x0 0x10000000>;
+			reg = <0x0 0x10040000 0x0 0x1000>,
+			      <0x0 0x20000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <51>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
@@ -207,8 +207,8 @@ qspi0: spi@10040000 {
 		};
 		qspi1: spi@10041000 {
 			compatible = "sifive,fu540-c000-spi", "sifive,spi0";
-			reg = <0x0 0x10041000 0x0 0x1000
-			       0x0 0x30000000 0x0 0x10000000>;
+			reg = <0x0 0x10041000 0x0 0x1000>,
+			      <0x0 0x30000000 0x0 0x10000000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <52>;
 			clocks = <&prci PRCI_CLK_TLCLK>;
@@ -230,8 +230,8 @@ eth0: ethernet@10090000 {
 			compatible = "sifive,fu540-c000-gem";
 			interrupt-parent = <&plic0>;
 			interrupts = <53>;
-			reg = <0x0 0x10090000 0x0 0x2000
-			       0x0 0x100a0000 0x0 0x1000>;
+			reg = <0x0 0x10090000 0x0 0x2000>,
+			      <0x0 0x100a0000 0x0 0x1000>;
 			local-mac-address = [00 00 00 00 00 00];
 			clock-names = "pclk", "hclk";
 			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
