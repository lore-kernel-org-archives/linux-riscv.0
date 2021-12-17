Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6443C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PnAFGEJMwQT/RoEC1wSHQJNM3rPQEXr2XCDvRGDrIc=; b=lHb1jRs4QmfAGJ
	9LA0nD+M8T8Mts03L41dMLHImeb6M+rAKWkP1Bb9sipkNbCBU4ShmM3XKgptwOUq7s1U0BcJw6NrA
	4tykTFZnQaCbgsPVF8Vm/mOJX134ZVXKR1VtZHaRjx/+d8tmi5VinWqYEVgbtlzMwg7Bl/5oLuVne
	/0hRphqYd15O3pLtLOT+pauyI4+I12oC+ZDVUWAw6KzNnWsoJZg9sVxVIIM0oxesoePFJYdyAk/Hm
	JhUGsiKtO3fUzxmNzboR9JBiFzPGw9grktSdY/3UCQlvLnIjrJl2gfyIoQMF1ofeEPG6YYl9wkipf
	6vV4mrp2ZxcOfupMQArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCgI-00AEFy-5F; Fri, 17 Dec 2021 12:49:50 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCgF-00AEAt-II
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:49:48 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by albert.telenet-ops.be with bizsmtp
 id XQpl2600c250X3006QpmK1; Fri, 17 Dec 2021 13:49:47 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCgD-005YxT-C5; Fri, 17 Dec 2021 13:49:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCgC-00ASrd-MH; Fri, 17 Dec 2021 13:49:44 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 09/11] riscv: dts: sifive: Group tuples in register
 properties
Date: Fri, 17 Dec 2021 13:49:30 +0100
Message-Id: <333f37a8c2a6181d66172a06b3705a0551143c9c.1639744905.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639744905.git.geert@linux-m68k.org>
References: <cover.1639744905.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_044947_770940_B626C97B 
X-CRM114-Status: UNSURE (   8.09  )
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
v3:
  - No changes,

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
