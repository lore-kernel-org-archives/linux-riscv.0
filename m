Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29075C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C0361C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2C0361C4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hDi7gz3OcHLT4p2B25DKpzv5XHoGXyLW3hXBU+m+EoM=; b=DkVG6AAeFyVCGy
	xht5ipoIH3EehN2ObQuKvs7PNJuzcVpcUSTlNjRbkiw5Pl0Y+gVIGUNoH65vKy2QmMC0CN47GLHH6
	JPoZIHo1W5JDUpn1NjwAQ0J1er3rMjghFcIV1TavFiGq2wmhxMtGnEBPBHucQ60ABA8r1bpHmQU8c
	wYQiu1L75dhsjRi4IO98lVRcCcmYwIynMQXFKDEwZ4HQjQKVjkOqBQ/K4b/ABiFHRdkvoTlrby8lO
	uGMw211BSWLp6GgbpulptMJFdtpADrQ2nJ01TsYMxnUoiaRlB2pKhWe4XQ7cBqUHtnXTYrhN0h8sO
	tNXaSv8Q0ZgvGg/pRilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzxv-0023XR-Dy; Tue, 16 Nov 2021 15:01:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzxr-0023WV-Ng
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:01:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id x15so89199986edv.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvr/k2Ia8iOpFTOdcJqjut/Vp0us0/bPkj+/qjjkrzU=;
 b=B/EN/u3dH3M3mSHswgVCxWS9v2JqjfYJAgVLQXkJPvwGB0+gaBqb2ozWG/Q4su2CV0
 kU9uK4QgdNZHOZh7Z2af69cSzQRN91g0VL4XDXOyvTggBrgzHNltV1LurDdy0gmUnRQl
 +3YVLE+e8I7o3qDV0LsB3hcKWSqp6ICa2StV9IYxTuvkGuomsH4rdE+/CjKy65g/8xCh
 12n6Oqq1p307Go+JFTTuZYwLE4gQ7qxb5F4oTI7yzMmjLoxX84w+jhkH6ucGKKGHzul/
 +tQT6YjmkpvaNRSRoUZq2btVES++knu84w1rOlM/h2dYELlMafNsU8K4tAJsJz6l3Klg
 C/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uvr/k2Ia8iOpFTOdcJqjut/Vp0us0/bPkj+/qjjkrzU=;
 b=Vl7u4rFtfcd9eltzYVkqLxLKvticxgf+LqAzOkcbxdqXUFDtOz5y8F5YuHfp8wyiDU
 gy4u076NEzCMeYqjzDi4FWMZW450WWDnNmLZcrA1+X62xLhrfjVIQJ4oumDdI6EOc1cg
 1SVHTkSpOpXv3aLTvlzxFjcHlFL+bB12LVB57EUXAnEvHlFDZ1gDdWDSsuVswzlCnOmJ
 1kYWbbF2nMK/zvkCEAUUhXfeue1Fy/nbeZ42Qjq9HMOu7MZL/U6A4K2VAK3Ci9CnvZwp
 59MlUrffkWfjnVNXHGhImdzQvtr6VK4xHceVJibIsncb+L13QTEdZ370HAR7YlHCEIHX
 wMpQ==
X-Gm-Message-State: AOAM531khCKn3pr0uiRGhYlgkEIdfTiCG3A/7KloMXGLNCYuPxXpkneP
 sGeKBaWhhepRsrjeODj99ibMIt4Tlxe9Tw==
X-Google-Smtp-Source: ABdhPJy8Hnvg+7UmI9NDKhVkfuc7bCwcUfoFZLyxiYxzPwIFyYP6LjYVUbrDVt9OYHryosMWM70pNQ==
X-Received: by 2002:a17:906:a1c1:: with SMTP id
 bx1mr10443644ejb.447.1637074896082; 
 Tue, 16 Nov 2021 07:01:36 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:01:35 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
Date: Tue, 16 Nov 2021 16:01:03 +0100
Message-Id: <20211116150119.2171-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070139_806040_543A1A01 
X-CRM114-Status: GOOD (  23.27  )
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

This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
many devices that need non-coherent dma operations to work which isn't
upstream yet[1], so this just adds basic support to boot up, get a
serial console, blink an LED and reboot itself. Unlike the Allwinner D1
this chip doesn't use any extra pagetable bits, but instead the DDR RAM
appears twice in the memory map, with and without the cache.

The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
Starlight Beta boards were sent out with them as part of a now cancelled
BeagleBoard.org project. However StarFive has produced more of the
JH7100s and more boards will be available[2] to buy. I've seen pictures
of the new boards now, so hopefully before the end of the year.

This series is also available at
https://github.com/esmil/linux/commits/starlight-minimal
..but a more complete kernel including drivers for non-coherent
peripherals based on this series can be found at
https://github.com/starfive-tech/linux/tree/visionfive

[1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
[2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/

/Emil

Changes since v3:
- The reset driver now uses 64bit read/write on the registers so we can
  use the regular bitmap macros. Requested by Andy.
- The pinctrl driver no longer resets the GPIO irq handler to
  handle_bad_irq on errors, uses reverse xmas tree order where possible
  and other nits by Andy.

Changes since v2:
- Ahmad and Geert agreed to switch the license of the clock and reset dt
  headers to GPL-2.0 OR MIT, so that both headers and device tree files
  can all use the same license.
  Bindings are still GPL-2.0-only OR BSD-2-Clause as recommended.
- Clock and reset drivers now set .suppress_bind_attrs = true and use
  builtin_platform_driver_probe to make sure the probe function is only
  called at init time so we can use __init and __initconst.
- The clock driver now uses devm_clk_hw_register and .parent_data when
  registering clocks. This way we can use the dt clock indexes rather
  than strings for parent lists and decrease the amount of static data
  needed considerably.
- Various dt binding cleanups from Rob
- Reworked description in the pinctrl dt binding.
- Pinctrl driver now depends on CONFIG_OF again since it uses
  pinconf_generic_parse_dt_config which is otherwise not defined.
- Pinctrl no longer devm_kfree's data that won't be referenced
  if dt pinconf parsing fails before registering groups and function,
  and other nits by Andy.
- The dw8250 quirk no longer needs a skip_clk_set_rate bit, but sets
  port->set_termios to the function called after clk_set_rate.

Changes since v1:
- Let SOC_STARFIVE select RESET_CONTROLLER but drop SERIAL_8250_DW
- Add missing Signed-of-by to clock dt-binding header
- Use builtin_platform_driver macro for the clock driver, add explicit
  comment to the determine_rate callback and other small nits from Andy
- Use reset-controller for node names in documentation and device tree
- Use readl_poll_timeout in reset driver to avoid hanging forever if a
  driver leaves the associated clock gated and sort Kconfig and Makefile
  entries properly.
- In the pinctrl driver align register names with documentation, remove
  invalid __init tag from probe function, use of_property_* functions to
  parse device tree, hoist pinmux unpacking into helper function to
  better document what's going on, bail on invalid signal group in
  device tree and fix many other nits from Andy.
- Refactor and rebase 8250_dw quirk on tty-next

Emil Renner Berthing (12):
  RISC-V: Add StarFive SoC Kconfig option
  dt-bindings: timer: Add StarFive JH7100 clint
  dt-bindings: interrupt-controller: Add StarFive JH7100 plic
  dt-bindings: reset: Add Starfive JH7100 reset bindings
  reset: starfive-jh7100: Add StarFive JH7100 reset driver
  dt-bindings: pinctrl: Add StarFive pinctrl definitions
  dt-bindings: pinctrl: Add StarFive JH7100 bindings
  pinctrl: starfive: Add pinctrl driver for StarFive SoCs
  dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
  serial: 8250_dw: Add StarFive JH7100 quirk
  RISC-V: Add initial StarFive JH7100 device tree
  RISC-V: Add BeagleV Starlight Beta device tree

Geert Uytterhoeven (4):
  dt-bindings: clock: starfive: Add JH7100 clock definitions
  dt-bindings: clock: starfive: Add JH7100 bindings
  clk: starfive: Add JH7100 clock generator driver
  dt-bindings: reset: Add StarFive JH7100 reset definitions

 .../clock/starfive,jh7100-clkgen.yaml         |   56 +
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../pinctrl/starfive,jh7100-pinctrl.yaml      |  307 ++++
 .../bindings/reset/starfive,jh7100-reset.yaml |   38 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    5 +
 .../bindings/timer/sifive,clint.yaml          |    1 +
 MAINTAINERS                                   |   22 +
 arch/riscv/Kconfig.socs                       |    8 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/starfive/Makefile         |    2 +
 .../dts/starfive/jh7100-beaglev-starlight.dts |  164 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  230 +++
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/starfive/Kconfig                  |    9 +
 drivers/clk/starfive/Makefile                 |    3 +
 drivers/clk/starfive/clk-starfive-jh7100.c    |  689 +++++++++
 drivers/pinctrl/Kconfig                       |   17 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-starfive.c            | 1354 +++++++++++++++++
 drivers/reset/Kconfig                         |    7 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-starfive-jh7100.c         |  176 +++
 drivers/tty/serial/8250/8250_dw.c             |    3 +
 include/dt-bindings/clock/starfive-jh7100.h   |  202 +++
 .../dt-bindings/pinctrl/pinctrl-starfive.h    |  275 ++++
 include/dt-bindings/reset/starfive-jh7100.h   |  126 ++
 27 files changed, 3700 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/Makefile
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100.dtsi
 create mode 100644 drivers/clk/starfive/Kconfig
 create mode 100644 drivers/clk/starfive/Makefile
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7100.c
 create mode 100644 drivers/pinctrl/pinctrl-starfive.c
 create mode 100644 drivers/reset/reset-starfive-jh7100.c
 create mode 100644 include/dt-bindings/clock/starfive-jh7100.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive.h
 create mode 100644 include/dt-bindings/reset/starfive-jh7100.h

-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
