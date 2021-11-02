Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F31C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3DBB604DC
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3DBB604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2KSbS9uHvqfK51XGkld0wbkCpwoIfiqVphMn5ZQz33k=; b=t7CXuSFhxUjo+e
	Cn9ww9IbVSwg8nV0F/GeKUUeKPWdjm1rnG3axI+hTnjZVRmkvLPs8xAexNs6Lme+RnCxIAqcMVdzB
	ko0sEj1rag5ieQqRV9TkyAEAzbjfxDt/SCLQw+gR7PwPMfS4sEgw+wayjcDjOn6Beyck8dArew/no
	hMmJ2CrDpTYGgoLlOt4Rxw2HRyS5YBgo1ErU80LPUUEl5z7fvlw6kGJA64gF5pRWDYBK3FywMd/26
	UH14v/v5DLdPXOiIWeSExQbK134qHG5SXFowoJ1Bs7QmpqfAiOyd/bwGN0KD3Om0RChziKygeX08U
	06IAff13LvKDhv0f4RRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwO7-002FOn-Vs; Tue, 02 Nov 2021 16:11:52 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwO3-002FNq-RJ
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:11:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id j21so55055821edt.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v0dyd2FIdlUq8RRqBjZMWs08o1USs7p634cV1UMQNds=;
 b=V0zSxZbPqibR3xeMWk6Edsqc1JI0zsqc2q1glis20Xp41jertwCX1KlKmU/xyANVtn
 /yDvil9MH3N40vAaoEJybJX/q4WW/Rl9+0yyWeIivlH5urA+AiBrcG5ZKgxeCWCk4Rz5
 in7C1PrapW0bRIpN/Yvlqu3iX1jdJwJVbbXetT5Ut4xEKt1eTvzCUbRRzOor7GSXO927
 JJOISgX07VCAcIkk+o/C9/OYTu3HA2NyslEwnNiqn0QMmg0BPYtcqqSmeLxBm30rb4me
 zxF7kbbox9vwziDsHsUneSGkrcN5f31XMsK7uYqvEXE0HdIaSZOIu5byeUyijgiWPD9j
 AoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v0dyd2FIdlUq8RRqBjZMWs08o1USs7p634cV1UMQNds=;
 b=RxHY5grwEgR9YcBa6eRMaJsA7n56c+H4x7QW+PuIxaLqT3bCNteefH5NLQ20iwOKfu
 oVQK7Fm+IZVgBV9X48oSMJ6cj0Py4QkE2R3yjbBAc9D+D26T72oMcXWjaDz3C7sVO5K1
 pNkK5CF5aNykBMNm+ISr/wWiavB20h4kYlJWRNgXCWv+/9qHDGBs/ijUVWFIFlzgqn0r
 JuOAh4jCbHUyU8TY7XSJ9gShsbahtC7o6qHrGmwFxjuTY/e9QFjkN70RuxQqtFg+cHn/
 4XEnCo/UNG7Rrb51z1wRTEKwUFIX2NAKs0c8qmaVLu9O5WGCOMToBHFz8LqYDdGG/WBT
 ppOQ==
X-Gm-Message-State: AOAM533d+17ga5c015r5jlAKmSu+wZyc1OYa277s0baFPg+v/3hfRem9
 5Pfx5X2X2dJ5xbGtOMILR1Uo0nrAV23hoQ==
X-Google-Smtp-Source: ABdhPJyjR5VFlydqoMnsfuPh/t84hJCuinCoFvy7v9/tKGpLVPwGoux52u9DECU1ifQkTEaaH42b1A==
X-Received: by 2002:a17:906:a0d7:: with SMTP id
 bh23mr44514021ejb.82.1635869506052; 
 Tue, 02 Nov 2021 09:11:46 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:11:45 -0700 (PDT)
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
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/16] Basic StarFive JH7100 RISC-V SoC support
Date: Tue,  2 Nov 2021 17:11:09 +0100
Message-Id: <20211102161125.1144023-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091147_931724_9ADA0A0B 
X-CRM114-Status: GOOD (  23.03  )
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
 drivers/pinctrl/pinctrl-starfive.c            | 1353 +++++++++++++++++
 drivers/reset/Kconfig                         |    7 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-starfive-jh7100.c         |  178 +++
 drivers/tty/serial/8250/8250_dw.c             |    3 +
 include/dt-bindings/clock/starfive-jh7100.h   |  202 +++
 .../dt-bindings/pinctrl/pinctrl-starfive.h    |  275 ++++
 include/dt-bindings/reset/starfive-jh7100.h   |  126 ++
 27 files changed, 3701 insertions(+)
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
