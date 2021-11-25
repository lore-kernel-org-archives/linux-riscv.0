Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393D9C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kj757+j50afuoVVjg9ntGj34kj7yktWFv7VaWwsRVp8=; b=hu1eFf/nyo21CM
	50TzL7ea+diZHnLI0lm4YhgW5bB8BTAL+U70xZsjzb3lt/vHkYhhxLJiP7jzxQvRV37L0805OV07Q
	NyG5l/ghFIB7dRWzhfGV7MGlwg7JlsbgofePXU4WXUQ7VlLnZXa4gsuj2ZWnkUp1NMRYEvA56Kgbr
	bnQv7nKJhqfdy28I3TueVy1WQ7iFiIgohIlvxnhCg7Jtexe5IzEaije8H1kVmEGDCgSTXVDqhzbTi
	1aDrPr0eY+pzjVbYqMnGfHgJLdkTFb/NIqplEufK8tyK5NH9Qb7fxgnb6+G6/71Eu7ht4zSEfGerJ
	snf5Sy9q5F23wcGfLjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGjB-00824z-PQ; Thu, 25 Nov 2021 15:32:01 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGir-0081rx-5N
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:31:43 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by baptiste.telenet-ops.be with bizsmtp
 id NfXZ2600Q5CGg7701fXZr7; Thu, 25 Nov 2021 16:31:36 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000DSL-VJ; Thu, 25 Nov 2021 16:31:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000gYX-Gn; Thu, 25 Nov 2021 16:31:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/9] riscv: dts: Miscellaneous fixes
Date: Thu, 25 Nov 2021 16:31:22 +0100
Message-Id: <20211125153131.163533-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_073141_397225_6CC230F8 
X-CRM114-Status: GOOD (  15.46  )
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

	Hi all,

This patch series contains miscellaneous fixes for the DTS files for
RISC-V platforms.

Thanks!

Geert Uytterhoeven (9):
  riscv: dts: canaan: Fix SPI FLASH node names
  riscv: dts: canaan: Group tuples in interrupt properties
  riscv: dts: microchip: mpfs: Drop empty chosen node
  riscv: dts: microchip: Group tuples in interrupt properties
  riscv: dts: microchip: mpfs: Fix PLIC node
  riscv: dts: microchip: mpfs: Fix reference clock node
  riscv: dts: sifive: Group tuples in register properties
  riscv: dts: sifive: Group tuples in interrupt properties
  riscv: dts: sifive: fu540-c000: Drop bogus soc node compatible values

 arch/riscv/boot/dts/canaan/k210.dtsi          | 23 ++++----
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 52 +++++++++----------
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 35 +++++++------
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    | 14 ++---
 8 files changed, 66 insertions(+), 66 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
