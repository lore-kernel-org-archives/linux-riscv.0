Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6C1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HtNnMdqt+1Qj+MWbG3lWQqcnAQk7UUafVhsppgCeUN0=; b=syZsuAaBSnSzz+
	dgCr1hhQSXH8i8+v6GqV1Ijp2XDuiPUnL+vJf/GuSFPO2EtHi4xXCnGxhnEJupxi3G/ZhZhsrc3yA
	Bsq5orCGVF4TtYzORFYJpBlEo7h/CLoI4xG/eihFhXT7t1OTh9hsqU7jLFnMJpwM4Yy+u7xUdeYfl
	e+laPUaC+Xc4WPRi9j6YOIII2LS/XokmN0BUVeG+MpYTSsfIlRIL+s/sAqRpAv9ql41VeySacgfdi
	Af7t8x/1i9gMp1FWt4ISsAHhLVQSAAclt9yIzomjO6XgFcrsZ5YhfbVHZpgHa+vhMtiPYy9I0Elrp
	JaoGY1Hf3bezKq8rxiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6wK-00B6bH-2I; Mon, 07 Feb 2022 16:32:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6nz-00B3pm-V0
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251036; x=1675787036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ad3vvcjmo72FEXpL/WUH4Bm8CDxa6BTmpj9AaGDiqa0=;
 b=USlNAPUaKDOgbOiPNCo70N54cPm7yQv+M8lxrRX95oCtw8tX82ktjGYq
 nqYoYo3xb1QJNqb9/6IowSv5UURjWpSbfi+/s+JFRfnjWK7vOKhdk7Mii
 mCXJ2V4IlFn6aCPPhoscU7QhnfSsi7IGGYOzHprMiitPm+gQN10jr+ck3
 SEf21o6vqHF9wiSTzl4oIZUAgfSZJNKTzc5tgoUPatuefC2fHStk4e8AH
 lcFy/rpYyaII9Lf31D77TpI8gAwCzPwuUbbvPLXrvp9jnaBSodSavrWgZ
 9glal+kB3bOf79UMuGu8zHg0e4DCXZqINbXcWqW+5qbgv6hTKfTZglwDp Q==;
IronPort-SDR: DLrFGEXvXjnqXj5ikuFvRRPbczwUI/BBckPswC9ZTFj2GxNwih7v1QF7aqa3RLY5RSvRhs7u/s
 WLEY2PihOpmyPslvWW5+Z1dnlVz5w38I8WQ7AKxQGkm3gG9XKYTzbPsaCQ607t6+QbOmk4MEpR
 N76iwFYhc5Z1U4gUeboc/ODDfnqhUyy6JYPBY2cDuec4/9dZNC0Z5UCAT+mkWcVl3izsaapdyb
 v6obvMg9sAujHMR8WDc3x4Im4on/gFq93kRjeZOjQ9PCjf6OrdLBOhPRRJBJbK93Gb4qG3/3B9
 2Crg6uEJ2MJ2AvfHLFwtFsCg
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="152200109"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:23:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:23:50 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:23:46 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>, 
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v6 00/12] Update the Icicle Kit device tree
Date: Mon, 7 Feb 2022 16:26:26 +0000
Message-ID: <20220207162637.1658677-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082356_098692_8C729BA5 
X-CRM114-Status: GOOD (  16.10  )
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

Conor Dooley (12):
  dt-bindings: soc/microchip: update syscontroller compatibles
  dt-bindings: soc/microchip: add services as sub devs of sys ctrlr
  dt-bindings: i2c: add bindings for microchip mpfs i2c
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
 .../bindings/i2c/microchip,corei2c.yaml       |  56 ++++
 ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
 .../bindings/pwm/microchip,corepwm.yaml       |  79 ++++++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  58 ++++
 .../microchip,mpfs-sys-controller.yaml        |  66 +++++
 ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  25 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 115 ++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 254 ++++++++++++++----
 11 files changed, 671 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
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
