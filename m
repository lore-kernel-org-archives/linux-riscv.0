Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7544C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBk9h61l5afkneVVE1Z6xyylz7A09WiwxlA8VFWlu1s=; b=gaVcdyPw7Ifax/
	9Nru/XPMs8zOPrVN1dDunB4My3st1Lmq8nAaZ439re7Qaa5idbRLcL0k0mlrJf2lsWGCtUdiA0vQ9
	y6idg+jNTEcVuTeUfqxwIbmCA+Xtc4TbtXdxvgpa1GTOnzB04OZf8JloiLTKOZYszniDynVOVnZqk
	sukJ3r6vLhkrl7ZrBOfRkxDb9pz0gAJhCJjuSxTmIOcfNqdwVavfoHmnwza9iyFbX1J1urj84DNE+
	X1CSsNIn2vyTAY5R74TPgY3B9b2FuKkdm8YoCg3ytR7KQt2KHHx/IAms7I+AbpuKqp2hb61+oYS5d
	NOZ8d4mNyz/F5swfJ4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGiy-0081xL-IE; Thu, 25 Nov 2021 15:31:48 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGip-0081ru-FL
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:31:41 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by xavier.telenet-ops.be with bizsmtp
 id NfXZ2600K5CGg7701fXZAA; Thu, 25 Nov 2021 16:31:35 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGij-000DSR-Ai; Thu, 25 Nov 2021 16:31:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000gZA-LX; Thu, 25 Nov 2021 16:31:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Date: Thu, 25 Nov 2021 16:31:28 +0100
Message-Id: <20211125153131.163533-7-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153131.163533-1-geert@linux-m68k.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_073139_718288_409DB1FD 
X-CRM114-Status: GOOD (  10.10  )
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

"make dtbs_check" reports:

    arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[600000000]], 'clock-output-names': ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type': 'object'}
	From schema: dtschema/schemas/simple-bus.yaml

Fix this by moving the node out of the "soc" subnode.
While at it, rename it to "msspllclk", and drop the now superfluous
"clock-output-names" property.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c71d2d682fc0a0e7..893864cf2447a9d4 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -139,6 +139,12 @@ cpu4_intc: interrupt-controller {
 		};
 	};
 
+	refclk: msspllclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <600000000>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -190,13 +196,6 @@ dma@3000000 {
 			#dma-cells = <1>;
 		};
 
-		refclk: refclk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <600000000>;
-			clock-output-names = "msspllclk";
-		};
-
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
