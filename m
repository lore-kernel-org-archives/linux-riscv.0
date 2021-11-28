Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB089C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vjxr5IAeCS+U3Eq1qMBl3X6d9aHvLh/taimgdPiWxYE=; b=1AzXg1rUFl0HnY
	X/HfcN4yBtf4fhlbh5dpu304UqFJpcfjzWnArP4wCXblfhbq/+/SngWejeoVRkZt6qKvYSAT9GMW6
	woc3Z0jnhpHwwDU1HgN6VODW14gplV4DdOBpC88bgjAJxhLEoUDRXotz0WqRimS+K0Vs3kBTKQdut
	AXoE7iYX5ich5HrIaugjxsLnIeSHxUmCnPiE/iPUqDGAo65PzaTS5WRCE8g3cxHPeJM5CpanmVUup
	XK0OVKXEMMdbT2vp0rxRbCudNqlqyBd1Bm/qOAMZWh3xBzCGsEM0sJj26jDhCYlLVLMr9mGnXEEDo
	rVPlkafBNsTJ8+ppxu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrQSj-00GbAj-2h; Sun, 28 Nov 2021 20:07:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrQSf-00GbAF-Mi; Sun, 28 Nov 2021 20:07:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id v1so62947491edx.2;
 Sun, 28 Nov 2021 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fjRrTFzKlcV68ouLNyGIWvuxj/K9mKGKp9Bg5eLzYB0=;
 b=BejSQwGWOtK9gOac3oYMYTmEbQtm7nMBCCLlfhZju6MuaiIa+KwJG0YSWHIN8iQyHo
 mJ4qUWpaniG9tmVJy35+3b8OCfBVj47GnLe08WTqqaYLzMDPqhChX0HBexfaDUbtV0Tu
 ujeR6imJC60sdx0u0Gai2kfaR528cZ9A4uuDInfQpMDzkXUPLrzmGQ3NQu0k/1kJ642T
 MuSCoCCeDpFAwPpUlOyS/y+g1gtnuwPcQ4PjkTn2rl/hO48ypcC7s51pV808quYBt/4X
 7auh8hdlABddJyw3XtkLX28fnvqENmtdVwlqjW+Nri/CClj9y0ADrFpCD3CYXlmzq8ST
 Utvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fjRrTFzKlcV68ouLNyGIWvuxj/K9mKGKp9Bg5eLzYB0=;
 b=mfo3fXCaRbGYpu7xm9K8O/QmL43yzmbK1NcjzfowlElbbDS69pdtp+QBYTVvZBfaE6
 yUrUmo2MM+F+e078HpS3H+fptjdGGYaCfgMHdbxV4VQa8B8lsUgqPuPUWUBGE5x9oMiD
 h/PSvkfwFSrvUWEAH64nJay50EsM/WLJI2QHEoP/Vz2sRgxMxrWhjx+1p1H4ACjqk1Bx
 wShWMuVuSCBjiGWcQWj+QEd5d5uQIcabu5ZlFKipysv9qpZurWJTokTdomhmCnh5AlsU
 /XzLw7nuPImF6ULir3eKrUJMiIMaS4NOAxyOwQhN0h8pvuoRAS49JEy8hVyQbVJR5DwM
 /3aA==
X-Gm-Message-State: AOAM530B5KKqOnLLIeJKjAVcMWkX3wfIhkYpF6+spB6iS64XP+uWfEMX
 R1iXZVVMz0Zb9YfpnID0/gm5iC4xaXx9Bw==
X-Google-Smtp-Source: ABdhPJy3zfX9hYwiSQ3lAsd9+vYfrkuX5dpJBriRc5e3zBw2AVEqmKUlIakYKC9VJ2uSdaPQEjuC+Q==
X-Received: by 2002:a50:d543:: with SMTP id f3mr66823588edj.56.1638130064179; 
 Sun, 28 Nov 2021 12:07:44 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c8sm7506173edu.60.2021.11.28.12.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 12:07:43 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: soc@kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
Date: Sun, 28 Nov 2021 21:06:47 +0100
Message-Id: <20211128200647.147058-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_120745_790606_A393C91E 
X-CRM114-Status: GOOD (  16.95  )
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

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/esmil/linux.git tags/for-soc

for you to fetch changes up to 398d6e139782d1ce2c9822beb8effba0c9c51cc4:

  RISC-V: Add BeagleV Starlight Beta device tree (2021-11-28 20:07:09 +0100)

----------------------------------------------------------------
Changes since v4:
- The reset driver now always uses 64bit read/write on registers even on
  32bit architectures as requested by Andy.

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

----------------------------------------------------------------
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

 .../bindings/clock/starfive,jh7100-clkgen.yaml     |   56 +
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml  |  307 +++++
 .../bindings/reset/starfive,jh7100-reset.yaml      |   38 +
 .../bindings/serial/snps-dw-apb-uart.yaml          |    5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 MAINTAINERS                                        |   22 +
 arch/riscv/Kconfig.socs                            |    8 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/starfive/Makefile              |    2 +
 .../boot/dts/starfive/jh7100-beaglev-starlight.dts |  164 +++
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  230 ++++
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/starfive/Kconfig                       |    9 +
 drivers/clk/starfive/Makefile                      |    3 +
 drivers/clk/starfive/clk-starfive-jh7100.c         |  689 ++++++++++
 drivers/pinctrl/Kconfig                            |   17 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-starfive.c                 | 1354 ++++++++++++++++++++
 drivers/reset/Kconfig                              |    7 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-starfive-jh7100.c              |  172 +++
 drivers/tty/serial/8250/8250_dw.c                  |    3 +
 include/dt-bindings/clock/starfive-jh7100.h        |  202 +++
 include/dt-bindings/pinctrl/pinctrl-starfive.h     |  275 ++++
 include/dt-bindings/reset/starfive-jh7100.h        |  126 ++
 27 files changed, 3696 insertions(+)
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
