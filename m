Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A977C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f59w/VWz+OxTxACnxTTdk8h7vx+ceXkQ2HctN7nnpLI=; b=rEwAkxIhQnPQk3
	88uQN+7/BNp0zPwcFgSBAPsFs5yRbAeEt0OZUQgWjrUSYlR8sPcGFa9mzQF6B64uaFsBvPW7llk+7
	mMUpeJd42LQ38wsd0ImflxmhsoViG52gStTAVhDj4rOy1TOxhmY0OJhqnJ3Fdv0ERuLxQFVGvYDHX
	44WjBUJ3s31+3kP8+sPYfL+s7cqoi+VpThK0cy0W98XMaiK2rzYPEm5L0o1/JI3I36Q6n4B7eqZuK
	zWk34dCKjN7gJ3zJ3Au/VeKNUAe1aNZ/nXaN6PLItWm9Zk+EmDUsgmg91Ki3FdK1daHE4zCJBCcjT
	fXH4a7ROXhHCIxjM+hRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbps-00FVH9-8p; Mon, 14 Feb 2022 13:56:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbpo-00FVGS-UY
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 13:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644846968; x=1676382968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2adZHzbNbrqAYiiCJa+cCCwwilXc4/CtmowXbjAh+IU=;
 b=Ezhzx12RwVtwkc85YaOcWEeu7+G9sdmeDRXTxW3t8W2WSmjS/dejJT/t
 HzRUDynYTq5+9lzqmv4sxPvTH1RYd0XsbTyXPdyBlMHLjSMsdIpzogwPl
 LX7fOcg5IPjRmd8EyEBXXhhrnFj0n5fJwSGqgGfBG+s2x57huJS1jYAv5
 tu0XDKE7WoCMuByGus0Z4RQOvHKklppeyKb7VwKy3ZWnbxJ+Openfj2xQ
 vzFsyO/zJgBMAvLn6KSod/jfhsjLEw4ZeSGIsI6QFsFabFQH36denVGqJ
 ZRHcalWfxG+7pzQrFSSMf2lEx880SucTGPG83dN0lXKEkIDkTy3xdqIKM Q==;
IronPort-SDR: 4TxOMrANn67xj1ALI0ajgUT2e4VduH1rcREVUcrtTcLCrC4S1myXJ+J/PA322ApiM1bIsPgoM/
 VRkONhRHqzw4KrJjbi6I5HHSzj+E/fN4SxlXxtQ/QHVyN0eoHFR9gTKli3212vBAwCdO3DX/XC
 XcufeG7L7gKvk9xEtHTIoX2zE6YdWQFm2+pJAi0o0UmGC1jwpXbN07lTJsxsTm7rNTufGFakU1
 JzmPsaT4/A27DZCpbTHU3D9SNKUjBeJgT0xeNTJg/toi8MzQBRAS2nrPwgLc1xlwLlF00dGtP8
 J8SX+m39W+Uo2QqeI7nI0drN
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="85633717"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2022 06:56:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 06:56:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 14 Feb 2022 06:55:58 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: [PATCH v7 00/11] Update the Icicle Kit device tree
Date: Mon, 14 Feb 2022 13:58:30 +0000
Message-ID: <20220214135840.168236-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055609_098742_EEB66815 
X-CRM114-Status: GOOD (  16.74  )
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
appropriate in order to avoid the many "DT compatible string <x> appears
un-documented" errors.

Depends on mpfs clock driver binding (on clk/next) to provide 
dt-bindings/clock/microchip,mpfs-clock.h for the device tree
and on the other changes to the icicle/mpfs device tree from geert
that are already in linux/riscv/for-next.

Additionally, the interrupt-extended warnings on the plic/clint are 
cleared by [1] & [2].

[1] https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/
[2] https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/

Changes from v6:
- Dropped i2c patch, as its in i2c-next
- Added ack on gpio, reviewed-by on rtc
- Dropped child nodes from sysctrl binding entirely, added a link to
  the online documenation for the services the system controller can
  provide
- Dropped the #pwm-cells and replaced with a ref, a la Krzysztof's
  series

Changes from v5:
- reworded the descriptions in the pwm binding to (hopefully) add
  clarity
- added -mask to the custom properties and made them 32 bit
- renamed the i2c binding to corei2c, since it is not mpfs specific
- removed the child nodes of the system controller in example/dts &
  will create them in the driver.
  @Rob, I assume keeping them documented is the correct thing to do?
- removed the dependancy on the clock binding from the examples
- reformatted rtc interrupts as per Rob's suggestion

Changes from v4:
- dont include icicle_kit_defconfig, accidentally added in v3
- drop prescaler from mpfs-rtc & calculate the value instead
- use corei2c as a fallback device for mpfs-i2c
- drop spi dt-binding (on spi-next)
  commit 2da187304e556ac59cf2dacb323cc78ded988169
- drop usb dt-binding (on usb-next)

Changes from v3:
- drop "mailbox: change mailbox-mpfs compatible string", already upstream:
  commit f10b1fc0161cd99e ("mailbox: change mailbox-mpfs compatible string")
- fix copy paste error in microchip,mpfs-mailbox dt-binding
- remove whitespace in syscontroller dt entry

Changes from v2:
- dropped plic int header & corresponding defines in dts{,i}
- use $ref to drmode in mpfs-musb binding
- split changes to dts{,i} again: functional changes to existing
  elements now are in a new patch
- drop num-cs property in mpfs-spi binding
- dont make the system controller a simple-mfd
- move the separate bindings for rng/generic system services into the 
  system controller binding
- added an instance corei2c as i2c2 in the fabric dtsi
- add version numbering to corepwm and corei2c compat string (-rtl-vN)

Conor Dooley (11):
  dt-bindings: soc/microchip: update syscontroller compatibles
  dt-bindings: soc/microchip: add info about services to mpfs sysctrl
  dt-bindings: rtc: add bindings for microchip mpfs rtc
  dt-bindings: gpio: add bindings for microchip mpfs gpio
  dt-bindings: pwm: add microchip corepwm binding
  riscv: dts: microchip: use clk defines for icicle kit
  riscv: dts: microchip: add fpga fabric section to icicle kit
  riscv: dts: microchip: refactor icicle kit device tree
  riscv: dts: microchip: update peripherals in icicle kit device tree
  riscv: dts: microchip: add new peripherals to icicle kit device tree
  MAINTAINERS: update riscv/microchip entry

 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  79 ++++++
 ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
 .../bindings/pwm/microchip,corepwm.yaml       |  81 ++++++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  58 ++++
 .../microchip,mpfs-sys-controller.yaml        |  40 +++
 ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  25 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 115 ++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 254 ++++++++++++++----
 10 files changed, 591 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
