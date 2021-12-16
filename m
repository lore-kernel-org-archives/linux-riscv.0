Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E48C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V0m/FZLds56EsVDtUeir0VuyJn7KL123Z4ZCLScyVBg=; b=gN6lcWMvFR9BGL
	RkUQ0CH+7P3j+Yhca+OOD2GQElFUC+aTBWlhj2SaWlpIR0lz8ZaISsmBiizh2Gn7PvUiMAQJM6g7u
	GgCiXWx1NW0r2TExdUVPmhiLs/cHVUoLy6SfCZiHE2BB44Ct18Y4AcTjN7MZVSzFTKa0lQ9w6JeOo
	SMe0mAVTSj++7thc1za2RLb3QHUOAQYVnVl1OR5TJcGbH1pKeEAhPTAjc3i5ywjKPlal3thwEwumn
	N7RIhertrFl1gx0rG+gcS3Gy/pR6Jzg/AExUS/NRQlmsAOf6Q/iHMqICWVGJOOTDtAt6/ammemI/n
	QdtecZCgdiW7wq6y6Rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr3g-005uAD-Uq; Thu, 16 Dec 2021 13:44:33 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxB-005rJp-NY
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:53 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by michel.telenet-ops.be with bizsmtp
 id X1dg2600N250X30061dgUa; Thu, 16 Dec 2021 14:37:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx2-005Q8u-1R; Thu, 16 Dec 2021 14:37:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx0-009xtv-U9; Thu, 16 Dec 2021 14:37:38 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 00/11] riscv: dts: Miscellaneous fixes
Date: Thu, 16 Dec 2021 14:37:24 +0100
Message-Id: <cover.1639660956.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_053750_005209_5079C317 
X-CRM114-Status: GOOD (  15.52  )
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

	Hi Paul, Palmer, Albert,

This patch series contains miscellaneous fixes for the DTS files for
RISC-V platforms.

Changes compared to v1[1]:
  - Add Reviewed-by, Tested-by,
  - Move mpfs refclk clock-frequency to board DTS,
  - New patches "[PATCH v2 06/11] riscv: dts: microchip: mpfs: Fix clock
    controller node" and "[PATCH v2 11/11] riscv: dts: sifive:
    fu540-c000: Fix PLIC node".

Thanks for applying!

[1] https://lore.kernel.org/r/20211125153131.163533-1-geert@linux-m68k.org

Geert Uytterhoeven (11):
  riscv: dts: canaan: Fix SPI FLASH node names
  riscv: dts: canaan: Group tuples in interrupt properties
  riscv: dts: microchip: mpfs: Drop empty chosen node
  riscv: dts: microchip: mpfs: Fix PLIC node
  riscv: dts: microchip: mpfs: Fix reference clock node
  riscv: dts: microchip: mpfs: Fix clock controller node
  riscv: dts: microchip: mpfs: Group tuples in interrupt properties
  riscv: dts: sifive: Group tuples in interrupt properties
  riscv: dts: sifive: Group tuples in register properties
  riscv: dts: sifive: fu540-c000: Drop bogus soc node compatible values
  riscv: dts: sifive: fu540-c000: Fix PLIC node

 arch/riscv/boot/dts/canaan/k210.dtsi          | 23 +++----
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 .../microchip/microchip-mpfs-icicle-kit.dts   |  4 ++
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 60 ++++++++-----------
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 40 +++++++------
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    | 14 ++---
 9 files changed, 72 insertions(+), 77 deletions(-)

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
