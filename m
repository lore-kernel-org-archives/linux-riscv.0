Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE91C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cBndkHmuoGvnL/YVkFdnKdK/nAndHpA4Mf5xFVtNoyg=; b=MfuOI94L+uFuFD
	fnmnBoQSAcfyjn6aL0+YYyhvo/opEgXc7t/r4zQapYPfVTVxcbqzWdtGoGsWEyIXFye0JW+0iUCRo
	acI3CtWm9xMrGfC7IwHNxEwGvj55rSAVAeWM0BvFJ1YLKxu4jkbrHnEBzIeL9zqkK4jORmbM+vgOI
	2hpdsSvJSoWo0SbLdyTfehcI4qzgMGEz3JYECFmzxsNR4wUuqdYDMfmgd5E+n5jijKRLlz9OgUgUZ
	3hy6olNk+x4XRqE7b1hhKA3Ow5QOd9PxJQ4E6atOH7+w2GBXD7FU+lulosmZkolkMfKMvcHG8p0E9
	tfm1bHqlcra0qJHiYY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYR-000000015ep-0TJb;
	Thu, 25 Jul 2024 13:30:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOT-00000000sGF-3vwO
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909786; x=1753445786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FU6F5SLxu97gMB8Kh0OuLE71OP0Z2m3FSmUO3uQo0BA=;
  b=LdLZSCFemM94ROqy0AOBmAWHSI9M+cufZlRbDAqaKZiwreXq1Wx3T0T3
   bAZTH/24bPDvgIf/EOYvuIPY4se3zuPsFbUuXFoBjyGrnO9Deux/pqSox
   DwY8lJXiwl/b4NtAnkXHr3ODO50NE0FO9g966WKZRktUUcF+93ajMez+s
   Whxhv89rTrIiWgeb8ziE+9HJnvqGDpuM8q5DJVRlLBSxNcSaXp2oflObc
   zmq3KxVJl44ZJubK6Xp+n5nrWBdMMuGtUtV7dTD36jGUUVTUWBhCnniNT
   fofuvhe4eTC92MYz6pGuvnXCOsnH1st4D+vx6eE+IZoIG9mauiq+TPIIQ
   w==;
X-CSE-ConnectionGUID: 8P89o1u9RvODQlJQJtKtAA==
X-CSE-MsgGUID: mCf3rvmQSgCO1fvSv7Vi8w==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="29678845"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:13 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:12 -0700
From: <pierre-henry.moussay@microchip.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland
	<samuel.holland@sifive.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH 00/17] Add support for Microchip PIC64GX Curiosity Kit
Date: Thu, 25 Jul 2024 13:15:52 +0100
Message-ID: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_051626_058620_59651771 
X-CRM114-Status: GOOD (  12.18  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Hi all,

This patch series aims to add support for Microchip PIC64GX Curiosity
Kit to the Linux kernel

Microchip PIC64GX Curiosity Kit is a compact development board based
on PIC64GX (PIC64GX1000-V/FCS)
The kit includes:
 - 1 Gb DDR4 SDRAM
 - microSD slot (used for boot)
 - 3x UART (among which 1 is used by the FSB UART 0)
 - 1x Gb Ethernet
 - various connectors, including mikroBUS connector, 
   Raspberry PI MIPI RX Connector
 - 1x JTAG

Note: A eFP5 (FTDI based) ensures multiplexing of JTAG and 3 UART to USB

Thank you for your time and consideration.

Sincerely,
Pierre-Henry Moussay

Pierre-Henry Moussay (17):
  dt-bindings: can: mpfs: add PIC64GX CAN compatibility
  dt-bindings: usb: add PIC64GX compatibility to mpfs-musb driver
  dt-bindings: mbox: add PIC64GX mailbox compatibility to MPFS mailbox
  dt-bindings: spi: add PIC64GX SPI/QSPI compatibility to MPFS SPI/QSPI
    bindings
  dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO compatibility
  dt-bindings: riscv: sifive-l2: add a PIC64GX compatible
  dt-bindings: clock: mpfs-ccc: Add PIC64GX compatibility
  dt-bindings: clock: mpfs-clkcfg: Add PIC64GX compatibility
  dt-bindings: dma: sifive pdma: Add PIC64GX to compatibles
  dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with
    driver
  dt-bindings: mmc: cdns: document Microchip PIC64GX MMC/SDHCI
    controller
  dt-bindings: net: cdns,macb: Add PIC64GX compatibility
  dt-bindings: rtc: mfps-rtc: Add PIC64GX compatibility
  dt-bindings: soc: microchip: mpfs-sys-controller: Add PIC64GX
    compatibility
  dt-bindings: clk: microchip: Add Microchip PIC64GX host binding
  dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
  riscv: dts: microchip: add PIC64GX Curiosity Kit dts

 .../bindings/cache/sifive,ccache0.yaml        |   6 +
 .../bindings/clock/microchip,mpfs-ccc.yaml    |   6 +-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml |   6 +-
 .../bindings/dma/sifive,fu540-c000-pdma.yaml  |  15 +-
 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  16 +-
 .../bindings/i2c/microchip,corei2c.yaml       |   4 +
 .../mailbox/microchip,mpfs-mailbox.yaml       |   6 +-
 .../devicetree/bindings/mmc/cdns,sdhci.yaml   |   1 +
 .../bindings/net/can/microchip,mpfs-can.yaml  |   6 +-
 .../devicetree/bindings/net/cdns,macb.yaml    |   5 +-
 .../devicetree/bindings/riscv/microchip.yaml  |   7 +-
 .../bindings/rtc/microchip,mfps-rtc.yaml      |   7 +-
 .../microchip,mpfs-sys-controller.yaml        |   6 +-
 .../bindings/spi/microchip,mpfs-spi.yaml      |   7 +-
 .../bindings/usb/microchip,mpfs-musb.yaml     |   7 +-
 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/pic64gx-curiosity-kit.dts   | 114 ++++
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 616 ++++++++++++++++++
 .../clock/microchip,pic64gx-clock.h           |  76 +++
 19 files changed, 889 insertions(+), 23 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi
 create mode 100644 include/dt-bindings/clock/microchip,pic64gx-clock.h


base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
