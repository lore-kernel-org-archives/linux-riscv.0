Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E5C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYzKB79hAkYgFXKTN6+BzZgz2mwj/ZZuoBZwr/1k3Qw=; b=YkwPOzYKsvKqz3
	xJgaX3Xxg9VFvfV7/xtZ4MMH4RjNYrRWJPB48QHXmM2rSqjUntrBcOZRtmWC6Z+ITstFDzMEUjnjf
	oHvaRIla4wthTGte8XXrz5pPF80OvIjXsRfSHkjD+OmPzq5SrNIuU2ViWl9ZjwB+lDOKpCCWZaOL1
	22SSyZezgLp1mHxME6ee35N/yL6e7cJ29FMcO3Af6GD4+WTGnvnoz/b4q9AOF46qHBzYgfgSfcHii
	UJvt2yn0Xx1SZXSZqwkEqz7uWvkElPCOo2Lyreh0ol/dFMq3vJEDvyOWLhgGuPXNRASreIzmL1LUs
	GzeejvzAAnqtEPf7aliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odubn-003a28-Ro; Thu, 29 Sep 2022 14:33:51 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oduba-003Zpu-St
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:33:46 +0000
X-QQ-mid: bizesmtp84t1664461951tron3wmm
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:32:30 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
X-QQ-FEAT: zT6n3Y95oi2dV4Ml4TeENn6rWDhM72I0AUGipTNm6zw3cZPAnb4ndNllPSfyP
	8da56NPWHPn+O4O6aWhrbdjZkTnKiAyFK/ognXdOrZaGH7ksIDUoYVoIhKn+I7gEawmJjA1
	KiZGfpwO11HkO9cFhwvZANwlebLyV32+081rK3OIrF6YqDHnx/pnFDfCy5lQjoOWpyj92j8
	1zF7OUkq1zQjtKO3aD0uUqFsvsV+b3Z6FHp9DLVo6iFLBpIYeUXz99y022L9tWrb1z3DgOM
	GrmFofepc4nb7K3c/mEibz7Oikb5YRuqtbheAQz45lcZ+0njxKcTqSJdDyhp+fhVcoVjiGg
	bTh44dbo+fva7cz435yTBxuRfcXJNa4tOzLcR/XpWoExXcm1IrlTPyROvUonoJF+mrth3yU
	7NyOb5sEg9k=
X-QQ-GoodBg: 0
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/30] Basic StarFive JH7110 RISC-V SoC support
Date: Thu, 29 Sep 2022 22:31:55 +0800
Message-Id: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073339_439419_1CD8156B 
X-CRM114-Status: GOOD (  14.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds basic support for the StarFive JH7110 RISC-V SoC to
boot up and get a serial console. This series includes basic clock, 
reset, pinctrl and uart drivers, which are necessary for booting.
It's should be noted that the reset and clock driver codes of JH7110
are partly common with those of JH7100, so the common codes are
factored out and can be reused by drivers of JH7110 and other more
SoCs from StarFive.

The JH7110 is the upgraded version of JH7100 and also the first official
released version of JH71XX series SoCs from StarFive Technology Ltd. 
The VisionFive 2 boards equipped with JH7110 SoCs are launched
recently [1]. More information and support can visit RVspace wiki [2].

This series is also available at 
https://github.com/hal-feng/linux/commits/visionfive2-minimal

[1] https://www.cnx-software.com/2022/08/23/starfive-visionfive-2-quad-core-risc-v-sbc-linux/
[2] https://wiki.rvspace.org/

Emil Renner Berthing (17):
  dt-bindings: riscv: Add StarFive JH7110 bindings
  dt-bindings: timer: Add StarFive JH7110 clint
  dt-bindings: interrupt-controller: Add StarFive JH7110 plic
  dt-bindings: sifive-l2-cache: Support StarFive JH71x0 SoCs
  soc: sifive: l2 cache: Convert to platform driver
  soc: sifive: l2 cache: Add StarFive JH71x0 support
  reset: starfive: jh7100: Use 32bit I/O on 32bit registers
  dt-bindings: reset: Add StarFive JH7110 reset definitions
  clk: starfive: Factor out common clock driver code
  dt-bindings: clock: Add StarFive JH7110 system clock definitions
  dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
  clk: starfive: Add StarFive JH7110 system clock driver
  dt-bindings: clock: Add StarFive JH7110 always-on definitions
  dt-bindings: clock: Add starfive,jh7110-clkgen-aon bindings
  clk: starfive: Add StarFive JH7110 always-on clock driver
  RISC-V: Add initial StarFive JH7110 device tree
  RISC-V: Add StarFive JH7110 VisionFive2 board device tree

Hal Feng (8):
  reset: starfive: jh7100: Use regmap APIs to operate registers
  reset: starfive: jh7100: Move necessary properties to device tree
  reset: starfive: Rename 'reset-starfive-jh7100.c' to
    'reset-starfive.c'
  dt-bindings: reset: Add starfive,jh7110-reset bindings
  reset: starfive: Add StarFive JH7110 SoC support
  clk: starfive: Use regmap APIs to operate registers
  RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
  RISC-V: Add StarFive JH7100 and JH7110 SoC Kconfig options

Jianlong Huang (5):
  pinctrl: Create subdirectory for StarFive drivers
  pinctrl: starfive: Rename "pinctrl-starfive" to
    "pinctrl-starfive-jh7100"
  dt-bindings: pinctrl: Add StarFive JH7110 pinctrl definitions
  dt-bindings: pinctrl: Add StarFive JH7110 pinctrl bindings
  pinctrl: starfive: Add StarFive JH7110 driver

 .../clock/starfive,jh7110-clkgen-aon.yaml     |  62 ++
 .../clock/starfive,jh7110-clkgen-sys.yaml     |  69 ++
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../pinctrl/starfive,jh7100-pinctrl.yaml      |   2 +-
 .../pinctrl/starfive,jh7110-pinctrl.yaml      | 202 ++++
 .../bindings/reset/starfive,jh7100-reset.yaml |  20 +
 .../bindings/reset/starfive,jh7110-reset.yaml |  54 +
 .../bindings/riscv/sifive-l2-cache.yaml       |   4 +
 .../devicetree/bindings/riscv/starfive.yaml   |   3 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 MAINTAINERS                                   |  27 +-
 arch/riscv/Kconfig.socs                       |  28 +-
 arch/riscv/boot/dts/starfive/Makefile         |   3 +-
 .../dts/starfive/jh7100-beaglev-starlight.dts |   2 +-
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   3 +
 .../jh7110-starfive-visionfive-v2.dts         |  91 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 449 +++++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/clk/starfive/Kconfig                  |  29 +-
 drivers/clk/starfive/Makefile                 |   6 +-
 .../clk/starfive/clk-starfive-jh7100-audio.c  | 138 +--
 drivers/clk/starfive/clk-starfive-jh7100.c    | 836 +++++-----------
 drivers/clk/starfive/clk-starfive-jh7100.h    | 112 ---
 .../clk/starfive/clk-starfive-jh7110-aon.c    | 161 +++
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 648 ++++++++++++
 drivers/clk/starfive/clk-starfive.c           | 349 +++++++
 drivers/clk/starfive/clk-starfive.h           | 112 +++
 drivers/pinctrl/Kconfig                       |  18 +-
 drivers/pinctrl/Makefile                      |   2 +-
 drivers/pinctrl/starfive/Kconfig              |  37 +
 drivers/pinctrl/starfive/Makefile             |   8 +
 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c | 718 ++++++++++++++
 drivers/pinctrl/starfive/pinctrl-jh7110-sys.c | 925 +++++++++++++++++
 .../pinctrl-starfive-jh7100.c}                |  10 +-
 drivers/pinctrl/starfive/pinctrl-starfive.c   | 539 ++++++++++
 drivers/pinctrl/starfive/pinctrl-starfive.h   | 131 +++
 drivers/reset/Kconfig                         |   7 +-
 drivers/reset/Makefile                        |   2 +-
 drivers/reset/reset-starfive-jh7100.c         | 173 ----
 drivers/reset/reset-starfive.c                | 218 ++++
 drivers/soc/Makefile                          |   2 +-
 drivers/soc/sifive/Kconfig                    |   2 +-
 drivers/soc/sifive/sifive_l2_cache.c          |  86 +-
 .../dt-bindings/clock/starfive-jh7110-aon.h   |  26 +
 .../dt-bindings/clock/starfive-jh7110-sys.h   | 215 ++++
 ...l-starfive.h => pinctrl-starfive-jh7100.h} |   6 +-
 .../pinctrl/pinctrl-starfive-jh7110.h         | 931 ++++++++++++++++++
 include/dt-bindings/reset/starfive-jh7110.h   | 154 +++
 48 files changed, 6604 insertions(+), 1019 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
 delete mode 100644 drivers/clk/starfive/clk-starfive-jh7100.h
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-sys.c
 create mode 100644 drivers/clk/starfive/clk-starfive.c
 create mode 100644 drivers/clk/starfive/clk-starfive.h
 create mode 100644 drivers/pinctrl/starfive/Kconfig
 create mode 100644 drivers/pinctrl/starfive/Makefile
 create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-sys.c
 rename drivers/pinctrl/{pinctrl-starfive.c => starfive/pinctrl-starfive-jh7100.c} (99%)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive.h
 delete mode 100644 drivers/reset/reset-starfive-jh7100.c
 create mode 100644 drivers/reset/reset-starfive.c
 create mode 100644 include/dt-bindings/clock/starfive-jh7110-aon.h
 create mode 100644 include/dt-bindings/clock/starfive-jh7110-sys.h
 rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
 create mode 100644 include/dt-bindings/reset/starfive-jh7110.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
