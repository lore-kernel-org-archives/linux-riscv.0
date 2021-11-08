Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A496FC43217
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6168E6115A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6168E6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7j1M2waO3HJ5IwpDVpZz63+t283Q9+Pvpm+ej0p27TU=; b=IkYzuzS7ZxWB6+
	2EhTzsKsWcmRg7ECTt2kRU3JwASqvxiTHUc1R8QINi4RA4KEGCOoyNjzV6au4UWogd2Ms3JAj2cSj
	dMjdfXZ0NHWfrIkiqcv31tB3i+Rk7K5Y2KXb2DX1BKXA63LOOPYRjCb9g4fy11l7dvwbJ8ETum/c6
	ELK1qPqopDmiv3H4G3yiOaNPKedxdYN09HqZXzMPUSE7EBIoeR9/mNarSuKSjbm8Ynb83zg7yh/HH
	EQ0n762AofqbF6QQ6TxT4SBvNJY7ST+hk6VijPtyBtoEf05i0BjhC+EHzqGs2uu9ai905qwrN1wVI
	NNuG4mg1zBBfpJTcLItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6E8-00Gm5K-M0; Mon, 08 Nov 2021 15:06:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6E5-00Gm4X-NR
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636383985; x=1667919985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8SrEU9XI/OEo5uTJNfmiDpAr5AwL1FBJ0ig/W9RdeJY=;
 b=jvBylVaWryTEzA5/Su4vr75ZCqMADTZDojzx8vX8BjFUXQUgU1kW2Eji
 Bb3D4KHSR/QvKomKNAZMx0iOG8KufIFNAb0MuIBxEgutrFEDn88l/U/pX
 TNobvP1BXnHwS5lrErCbsAY8TOuv+RNxU3ly+fGWcGtjN9uqTtwXRANa1
 kQL0YkHok0BOjx3duy5jdLeZfZ65wNF3h3sORfAF7+93Eqm5w4wY6K3Uj
 EYOmiuL8XaLl0rT7wLVA9jgqTHHDoX9Q9LZ3joI8g8GvRVzOrbTSduYru
 P3z2OAUbH3f4o7h6xsHbFsVuS0KSaCWdhKFGLeoHR4BGpAfW+0rkcNHyM w==;
IronPort-SDR: rKaUUnhxQEuffL258X7HEch2+KTgcTsz45WpCwjQFqdvi8jf1EDK/efkqY6IZ8ZUpCzJsKfE4K
 fgxIdeqoyQBgLCKd+c5YqltwAtfrElduaVhZivZVIyZNykcinto/2oJdjfbZVi8qpomr8qiY+5
 xvIo0j6fITV7ox+ZkTGm3VHcDlg3p/F8tKywsi/ROTKcRlaZHem9FmP1RYErwPj0c0fq/yJExn
 Ge+EtfgudJp/+8PUoXcjGOeNR++YFCHA8AGfjsFN/WY8+sr7YVPwvi8LXrQVx/OEJV9KmkbI0f
 1vRBKjAwQ16j2JOLIbTgLjaZ
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="135847455"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:06:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:06:15 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 00/13]Update the icicle kit device tree
Date: Mon, 8 Nov 2021 15:05:41 +0000
Message-ID: <20211108150554.4457-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070625_873644_E94F9E24 
X-CRM114-Status: GOOD (  10.21  )
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

From: Conor Dooley <conor.dooley@microchip.com>

This series updates the microchip icicle kit device tree by adding a host
of peripherals, and some updates to the memory map. In addition, the device
tree has been split into a third part, which contains "soft" peripherals 
that are in the fpga fabric.

Several of the entries are for peripherals that have not get had their drivers
upstreamed, so in those cases the dt bindings are included where appropriate
in order to avoid as many "DT compatible string <x> appears un-documented" 
errors as possible.

Depends on mpfs clock driver series [1] to provide:
dt-bindings/clock/microchip,mpfs-clock.h
and on the other changes to the icicle/mpfs device tree
that are already in linux/riscv/for-next.

[1] https://lore.kernel.org/linux-clk/20210818141102.36655-2-daire.mcnamara@microchip.com/

Conor Dooley (11):
  dt-bindings: soc/microchip: update sys ctrlr compat string
  dt-bindings: riscv: update microchip polarfire binds
  dt-bindings: i2c: add bindings for microchip mpfs i2c
  dt-bindings: rng: add bindings for microchip mpfs rng
  dt-bindings: rtc: add bindings for microchip mpfs rtc
  dt-bindings: soc/microchip: add bindings for mpfs system services
  dt-bindings: gpio: add bindings for microchip mpfs gpio
  dt-bindings: spi: add bindings for microchip mpfs spi
  dt-bindings: usb: add bindings for microchip mpfs musb
  riscv: icicle-kit: update microchip icicle kit device tree
  MAINTAINERS: update riscv/microchip entry

Ivan Griffin (2):
  dt-bindings: interrupt-controller: add defines for riscv-hart
  dt-bindings: interrupt-controller: add defines for mpfs-plic

 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++
 .../bindings/i2c/microchip,mpfs-i2c.yaml      |  74 ++++
 .../microchip,polarfire-soc-mailbox.yaml      |   4 +-
 .../devicetree/bindings/riscv/microchip.yaml  |   1 +
 .../bindings/rng/microchip,mpfs-rng.yaml      |  31 ++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  61 ++++
 .../microchip,mpfs-generic-service.yaml       |  31 ++
 ...icrochip,polarfire-soc-sys-controller.yaml |   4 +-
 .../bindings/spi/microchip,mpfs-spi.yaml      |  72 ++++
 .../bindings/usb/microchip,mpfs-usb-host.yaml |  70 ++++
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  21 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 159 +++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 333 ++++++++++++++----
 drivers/mailbox/mailbox-mpfs.c                |   1 +
 .../microchip,mpfs-plic.h                     | 199 +++++++++++
 .../interrupt-controller/riscv-hart.h         |  19 +
 17 files changed, 1103 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
 create mode 100644 include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h
 create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h

-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
