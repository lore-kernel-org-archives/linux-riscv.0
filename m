Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB8EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3udlL9Kd6MRV6IgCguNWkO77LG1ZC4M0zjUWa77Qo7c=; b=V4/kl25d93TEoR
	Ht7iDpSqnd9aC7nSfosihdX9izwD4wqsyb6DbxO9p7WLer94gh9FoXzDEW7ChywKvE3wGwEA8UvrG
	RSeTv1K7aoCMYlqDA/yEVwRiKDYcPmvFw624pGK8Cl9xZffSFED9kkeG7ZW2pmFEzIDf+tAJB8U2t
	cXdz70bi7EnVajzagTiEwQQPSMsv6P9rPaA0BPwtXIkIU522tsSaTnRxrH7NmBEIWEyq9JP/uj9AM
	YYk2OMWUqwUR/lj3NclyTuw+acyvPOV++RLlPDwxUidj5MbUOOipm/y0au4p1fQ2o/VvT6f3jYDeV
	iOxbrw88Ff+79pY1/mYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCgj-00AEb6-2t; Fri, 17 Dec 2021 12:50:17 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCgI-00AEEt-BF
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:49:54 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by laurent.telenet-ops.be with bizsmtp
 id XQpm2600K250X3001QpmGQ; Fri, 17 Dec 2021 13:49:47 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCgD-005YxQ-Kj; Fri, 17 Dec 2021 13:49:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCgC-00ASrI-JL; Fri, 17 Dec 2021 13:49:44 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 06/11] riscv: dts: microchip: mpfs: Fix clock controller
 node
Date: Fri, 17 Dec 2021 13:49:27 +0100
Message-Id: <d0445821145ddfb5026b677e16e50b08992be3b5.1639744905.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639744905.git.geert@linux-m68k.org>
References: <cover.1639744905.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_044950_725269_4885CCCB 
X-CRM114-Status: UNSURE (   7.36  )
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

Fix the device node for the clock controller:
  - Remove bogus "reg-names" property,
  - Remove unneeded "clock-output-names" property.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
  - Add Reviewed-by, Tested-by,

v2:
  - New.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b372bc6459bf163a..d9c1dee3fb25beb8 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -197,17 +197,8 @@ dma@3000000 {
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>;
-			reg-names = "mss_sysreg";
 			clocks = <&refclk>;
 			#clock-cells = <1>;
-			clock-output-names = "cpu", "axi", "ahb", "envm",	/* 0-3   */
-				 "mac0", "mac1", "mmc", "timer",		/* 4-7   */
-				"mmuart0", "mmuart1", "mmuart2", "mmuart3",	/* 8-11  */
-				"mmuart4", "spi0", "spi1", "i2c0",		/* 12-15 */
-				"i2c1", "can0", "can1", "usb",			/* 16-19 */
-				"rsvd", "rtc", "qspi", "gpio0",			/* 20-23 */
-				"gpio1", "gpio2", "ddrc", "fic0",		/* 24-27 */
-				"fic1", "fic2", "fic3", "athena", "cfm";	/* 28-32 */
 		};
 
 		serial0: serial@20000000 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
