Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F049CF649E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H5HnmVWREv7Mc35nJ93WDcVyyLph/OZ68uE124Y48cM=; b=lYxAeYVOq9VN+f
	vrl3nMzwwU+kVJA3cO62HcSBwwRElWHaIoASp73hXwyLoZrYNet6TWzE5xUkZJqchnJyNEWza0Vny
	UnEr2yjBr4XCC+CvKVBe1AY9HVX70u4AujLjL31bDtuBtJHkzmcPy4jXwvnoMwdKBxHaBebVsf5wI
	Uke3gd+oDN3j0zLizk2Jy+PsVJteddRHRJK85uyOU+gI9e8LuZ5135veVvIb+jLydVZv0VyFRvIHy
	Zn7x6fUfCLBgD37eGsuOpf9Tt9kK8dsyP8lomjAiLayaaP72dYK8hdj2WMUkkgckNpecP6gy7o1me
	J678LhN75CxD+5CK8HYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHF-0000000GdpB-1nix;
	Mon, 30 Sep 2024 10:05:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD7m-0000000Gb12-2XsK
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690126; x=1759226126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VRPE7omTfQEET6XI5xmIDUZb1bHAE9poUy77A92vjdU=;
  b=fKGU4/Ge02NPVyvvv43zkQ3z91eG+0VzKyrYJHD2u8sSKh3DxdsROrBD
   GbNH93KqXJFN0M4l2Mk5ms+1eJkcEzVmqAK1hMzkoh8GXbPnnBKyrodiL
   +cW//iYRHpzOS0eCP4+PTmWsmykerYPpLXTBZd7J9AuY+thqnWt1gGY2d
   Y/d0rf9hUP6nN5qz6FJBpQwphkyPjKEdF4EFGNFRrofYi4FANwUknP6QI
   PTwGM/zuG7BYMcZqiHFb5K9+hUAGGYq7imyMfjCM9GjNHOPqDwWJIdIrB
   lhJeT36CVppTyVzeE5aVI2rZVoX8Qao+ACyKkkn9GFsLqEe/xbfX7gKDA
   w==;
X-CSE-ConnectionGUID: XiGZNwQLQnOpHGCFR5gKFQ==
X-CSE-MsgGUID: MUdYKwoaS2a0BTwY+bFK+g==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32248828"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:54:55 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:54:53 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: [linux][PATCH v2 00/20] Add support for Microchip PIC64GX Curiosity Kit
Date: Mon, 30 Sep 2024 10:54:29 +0100
Message-ID: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025526_741320_E55B7900 
X-CRM114-Status: GOOD (  14.71  )
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

Changes since v1:
- Limit sdhci to HS (High Speed, 50MHz at 3.3V) mode max
- Fix I2C dt-bindings, remove microchip,mpfs-i2c fallback
- remove duplicated pic64gx-clock.h
- Update Microchip dts Makefile
- Update PIC64GX dts and dtsi (fix model, sort node)
- Remove microchip,pic64gx-clock.h present in previous patchset
- Reword commits messages

Hi all,

This V2 patchset is incomplete and doesn't address all the
comments from the V1 patchset. More precisely the request on the following
commit have not been addressed:
[PATCH 08/17] dt-bindings: clock: mpfs-clkcfg: Add PIC64GX compatibility
This will be fix in a V3 coming in due time.

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

Pierre-Henry Moussay (20):
  dt-bindings: can: mpfs: add PIC64GX CAN compatibility
  dt-bindings: usb: add PIC64GX compatibility to mpfs-musb driver
  dt-bindings: mbox: add PIC64GX mailbox compatibility to MPFS mailbox
  dt-bindings: spi: add PIC64GX SPI/QSPI compatibility to MPFS SPI/QSPI
    bindings
  dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO compatibility
  dt-bindings: cache: sifive,ccache0: add a PIC64GX compatible
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
  dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
  dt-bindings: mmc: cdns,sdhci: ref sdhci-common.yaml
  dt-bindings: timer: sifive,clint: add PIC64GX compatibility
  dt-bindings: interrupt-controller: sifive,plic: Add PIC64GX
    compatibility
  riscv: dts: microchip: add PIC64GX Curiosity Kit dts
  riscv: dts: microchip: remove POLARFIRE mention in Makefile

 .../bindings/cache/sifive,ccache0.yaml        |   6 +
 .../bindings/clock/microchip,mpfs-ccc.yaml    |   6 +-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml |   6 +-
 .../bindings/dma/sifive,fu540-c000-pdma.yaml  |  15 +-
 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  15 +-
 .../bindings/i2c/microchip,corei2c.yaml       |   4 +-
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../mailbox/microchip,mpfs-mailbox.yaml       |   6 +-
 .../devicetree/bindings/mmc/cdns,sdhci.yaml   |   3 +-
 .../bindings/net/can/microchip,mpfs-can.yaml  |   6 +-
 .../devicetree/bindings/net/cdns,macb.yaml    |   5 +-
 .../devicetree/bindings/riscv/microchip.yaml  |   7 +-
 .../bindings/rtc/microchip,mfps-rtc.yaml      |   7 +-
 .../microchip,mpfs-sys-controller.yaml        |   6 +-
 .../bindings/spi/microchip,mpfs-spi.yaml      |   7 +-
 .../bindings/timer/sifive,clint.yaml          |   1 +
 .../bindings/usb/microchip,mpfs-musb.yaml     |   7 +-
 arch/riscv/boot/dts/microchip/Makefile        |  13 +-
 .../dts/microchip/pic64gx-curiosity-kit.dts   | 114 ++++
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 616 ++++++++++++++++++
 20 files changed, 820 insertions(+), 31 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi


base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
