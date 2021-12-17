Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC903C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVHj4cjzzyCgsj8dwpAk2exIBfh6ZD/JdplpbDXfUk4=; b=wUnTgtlQF84qyz
	XvkaPS+mNVfJAJx9piLZbBD9zU88HkaxVi6M7GbxalMON2gem9HFNlBvG/5PjWZrv2N1X1ZSm1H3K
	tm754lfHEfrE70jlyKhJb/ci/ZEyDUfdp4fQ2bzPctDIdBc8JUERa22DZg9jUxalxJOX/2LR69MwH
	2y38ZhAJGFOpF3zIjjT/x7IVmXy+NvnROzUNm9iaQAZrG73ypuUIre0zT39LsY9/Yvxkhxpol/wuu
	jAovxc87IUzlb/yu2fUAXbsSoXiHXjSmXHYtTEeCorktiFPJelFfDTiOmaJ7XhHWjVCToOXBKr3Rn
	80mm8ktHDrOO2sNyJchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9ah-009Aad-MS; Fri, 17 Dec 2021 09:31:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9ac-009AZB-WC
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733506; x=1671269506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AiH35vfVR97qjjvR+EuTMqv5QNgWOX0ByCYMdoaTevk=;
 b=WfVph1qHrXSkv/zn0Lhy3l7YfA/pZ5c5voih1jWzRqicQENGRrFt/0l/
 qUmWu4RCJ/zfoIFCSehR0OFpp/82NGinp56PQpVVqulJ+1/+bOhYuoAWo
 lmGNUTT2A+gzg0+r2qsXbsJqPH6OleD2qdrWwqTSV4blK39xBOOYhOGMx
 WXdlPqmtR+zzJoDIxbjUu+tCmVbSWNjQOTnMuaC6B/KVrbPcfTerI/aTh
 E8P4kw+LEoYYdvd0XGFY3VIMySukUPMWhr37Em8RYxKyJuqwTALbyUvMQ
 M5vCgA3saVYZXxHHcOtcLbXy3vtgaLp04CFSsmRaEUFKdBd2lvAmfZQTr w==;
IronPort-SDR: tqBhz6WjJ9sd7LE5+/I2awnGMCnbhAx3CKjmBsi3iQo9I5sLdEwA3aY+5jrs8XJE83ngcLlnwO
 QXmpTqdyeKGX4hHiBWbMf6GEtBmtoPu3Ck5VNFXzduDzJT0wRHPn83+qV+3K/yZ02SEpKHgHsc
 8eUpPSkMn/winNoKoaG/+kZOu/mlEWWaNgJ51yhZlFvba+TW4TK3T3nHNPxOu6JkM6XtDlLQ07
 OTBvNGtqSO84zcIoRetla6lbjebJEzxzfZhOhJRw9jjfUE9UdUw7QykCf45asktnjnOL/Ty5QD
 UGHy7sOdQkJMbQ1CK/jn5Ci5
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="79895886"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:31:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:31:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:31:38 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 00/17] Update the Icicle Kit device tree
Date: Fri, 17 Dec 2021 09:33:08 +0000
Message-ID: <20211217093325.30612-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013147_156236_48167A99 
X-CRM114-Status: GOOD (  11.17  )
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

This series updates the Microchip Icicle Kit device tree by adding a
host of peripherals, and some updates to the memory map. In addition,
the device tree has been split into a third part, which contains "soft"
peripherals that are in the fpga fabric.

Several of the entries are for peripherals that have not get had their
drivers upstreamed, so in those cases the dt bindings are included where
appropriate in order to avoid as many "DT compatible string <x> appears
un-documented" errors as possible.

Depends on mpfs clock driver series [1] to provide:
dt-bindings/clock/microchip,mpfs-clock.h
and on the other changes to the icicle/mpfs device tree (mmc) that are
already in linux/riscv/for-next.

Also depends on Geert's format changes to interrupt grouping etc [2].

Additionally, the interrupt-extended warnings on the plic/clint are 
cleared by [3] & [4], which lore appears to have been very confused about.

[1] https://lore.kernel.org/linux-clk/20211216140022.16146-1-conor.dooley@microchip.com/T/
[2] https://lore.kernel.org/linux-riscv/cover.1639660956.git.geert@linux-m68k.org/T/
[3] https://patchwork.kernel.org/project/linux-riscv/cover/cover.1639662093.git.geert@linux-m68k.org/
[4] https://patchwork.kernel.org/project/linux-riscv/cover/cover.1639661878.git.geert@linux-m68k.org/

Conor Dooley (16):
  dt-bindings: soc/microchip: update syscontroller compatibles
  dt-bindings: soc/microchip: make systemcontroller a mfd
  mailbox: change mailbox-mpfs compatible string
  dt-bindings: i2c: add bindings for microchip mpfs i2c
  dt-bindings: rng: add bindings for microchip mpfs rng
  dt-bindings: rtc: add bindings for microchip mpfs rtc
  dt-bindings: soc/microchip: add bindings for mpfs system services
  dt-bindings: gpio: add bindings for microchip mpfs gpio
  dt-bindings: spi: add bindings for microchip mpfs spi
  dt-bindings: usb: add bindings for microchip mpfs musb
  dt-bindings: pwm: add microchip corePWM binding
  riscv: dts: microchip: use hart and clk defines for icicle kit
  riscv: dts: microchip: add fpga fabric section to icicle kit
  riscv: dts: microchip: refactor icicle kit device tree
  riscv: dts: microchip: update peripherals in icicle kit device tree
  MAINTAINERS: update riscv/microchip entry

Ivan Griffin (1):
  dt-bindings: interrupt-controller: create a header for RISC-V
    interrupts

 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  80 +++++
 .../bindings/i2c/microchip,mpfs-i2c.yaml      |  54 ++++
 ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
 .../bindings/pwm/microchip,corepwm.yaml       |  61 ++++
 .../bindings/rng/microchip,mpfs-rng.yaml      |  29 ++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  63 ++++
 .../microchip,mpfs-generic-service.yaml       |  33 ++
 .../microchip,mpfs-sys-controller.yaml        |  62 ++++
 ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
 .../bindings/spi/microchip,mpfs-spi.yaml      |  61 ++++
 .../bindings/usb/microchip,mpfs-musb.yaml     |  61 ++++
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  13 +
 .../microchip/microchip-mpfs-icicle-kit.dts   | 111 +++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 295 ++++++++++++++----
 drivers/mailbox/mailbox-mpfs.c                |   2 +-
 .../interrupt-controller/riscv-hart.h         |  19 ++
 17 files changed, 872 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
 create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h

-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
