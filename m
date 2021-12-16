Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B57C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpnJHfexdOvrxcXO+355lrJ1AacXMEVKpDIRJ/YqoL8=; b=qEkG9XXns/2jWA
	ZYevuAfq130JlsbR29IrVyHJxyEccmej066Uo4lpfHoB8v7rmxSnvqTMrbMaHA4W9d70DQA4WiKkl
	0uR8Gp6F7N8EZ/U6hNFtfX4cyZqyXl8nHd0MdpMtDqWrnfRrcBHkIAT4crqBKASceX6v6QBXbUfZ9
	1TQx1GllU+VDemh5YbNwwfbtS2fB3lZCnM4LB/lu0DwfeLUke90T/LcKMBArh1D1Meqy5NUZglBGp
	aHzoPiPVN2eRpspcJOdf+920ns/4uzeZk57s08FvmyO63oLo+DykR9TUvq2qZRFII7Acd08XQwnNt
	tySbPE5O05ueNDLynNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr3Y-005u6U-0z; Thu, 16 Dec 2021 13:44:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxG-005rQZ-9J
 for linux-riscv@bombadil.infradead.org; Thu, 16 Dec 2021 13:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mt9ubDAQgtCviVhB+MYA4X2c0qd1JTiqckUy75eDaoA=; b=KhHefUj4GrlBLyM2xf1XD/EoFd
 Spfd7xQhubwRhvHwNvwtdRE6KvCn4MKMT4noBr5ZPcQ96YJZ0rYlLbCFhXvHIrPLXg6+mN7E/tAjd
 G7PlaWwkgX0zzIFruDYr7IYZ6PM/Gka3aUFXIj8XBz+FY5YJr/RTPRnS0Z63oJx2mD28se24eqMgf
 25g4sdWrg18WupV6jXN6Pbi07Rx3ZWbPutGEDRWUD6xbswRlg8CyrfRsXTfTYpwW6/n+bP3YPhcBb
 HPcDUWM2trmip/cKU4xJZZzSrQziHGuNDQe0ZjpONxDx2Fkc6nnLKmp6NSFcWJXnQlAo3Moyyczc2
 y+il5BOg==;
Received: from leibniz.telenet-ops.be ([2a02:1800:110:4::f00:d])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxC-001hRb-OE
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:52 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JFCpy0BYfzMqg2h
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 14:37:46 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by baptiste.telenet-ops.be with bizsmtp
 id X1dh26001250X30011dhRg; Thu, 16 Dec 2021 14:37:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx2-005Q90-8e; Thu, 16 Dec 2021 14:37:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xuZ-4R; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 06/11] riscv: dts: microchip: mpfs: Fix clock controller
 node
Date: Thu, 16 Dec 2021 14:37:30 +0100
Message-Id: <ceb8d07363ae67a1dc1f1807d9e2709076607d24.1639660956.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_133750_906130_F43948F8 
X-CRM114-Status: UNSURE (   7.67  )
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
---
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
