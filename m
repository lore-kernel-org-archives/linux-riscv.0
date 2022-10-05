Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D13BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87SDEf1cFDUYwFE1ShWSZdF+hI1PwIb0Ljtd42bZiXU=; b=k+H+arR7q8ftJ0
	gRZoMrVOuhmMTa1fLTYHKeZ+YncZYLkkVKWcR/bRZVagMIxScPFKBurSBb0GYF7qb8KKO3otVRLaZ
	vdqmRoxdefYGNelzSKCc6MdYb1I1JTnDxwB5t4GHyECGO896mTe0+5uFWaJAJDqUwyxYgTOSDJxzS
	ylX2KE5vIFp0XdubHHsoSqyzG3br6BPJElf6uzMwIGp9ETJNDyk+BFCIlXF+c7sDiNpheQ4N3K0iJ
	lGb/Fax+ENfieABCU1/KLRWEjBw+70y8M8yfijat88BuJUuMGqTRC5AuOgJXmWNoAkOdpRhKAcdco
	g1CllA6B+megzcgamimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og46H-00E841-El; Wed, 05 Oct 2022 13:06:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og46E-00E83R-8Q
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 13:06:12 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7A5D640E75
	for <linux-riscv@lists.infradead.org>; Wed,  5 Oct 2022 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1664975162;
	bh=9C5AQMcz5I2MJybWsUEcebrVkQicTSOLQEyAM8DV+Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oFG4KwqVm+Pf7trEv13mctl0PM+zyUvKOdmDOXixqLu+XUQ/OQFToia0LfkHAacfo
	 xcaHiX/MfmnpdS3foh+gq/DC8aQ8l7ylSkRfGXRjsEekrWOBEM7PeuTBN0oEbZuAqw
	 IGmL308ziMvIwc2xL4lT95Nmm+OftfkwAHYpmF3KplfZidkXjdXgLjGssDMk4QZZyb
	 Ct9Iqqg30xA6VrAxjge42lt8keFF5+iCnPXkFfydNE0FEozTyOsUljKa8cc2bOpzcl
	 QOcNpwot4Ast8U+0v4fkOsQLfKjfvYugYNq1ZAy55M0rp0Z7uS71Vd8Qto3DI59i5F
	 Qip8x6/rDUBTw==
Received: by mail-qv1-f69.google.com with SMTP id q20-20020ad44354000000b004afb5a0d33cso9474757qvs.12
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 06:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9C5AQMcz5I2MJybWsUEcebrVkQicTSOLQEyAM8DV+Ps=;
        b=FVipD1ACPQtyVyBj+oIX8Mq5IiHm1DISZwbwc2ghRkqWjNpmq65I++iPJWRipiLFDg
         RVW5MzjFW4zKm8Kn6P9gwI7NXO9BgVCzD4GVtSAlYCGjO7VLXskBD5g4W0j8bPsqaSvj
         g3BufvMU613iXeAp4JHXDkaVAo1w9q2ffOef31MiIcMndFXAvTzWKY9IDFP0TdsI3+R9
         YxLax0jlC4ucb/q+AJ9+1Crn9bmY9KJvuqv2HJXCea43bxLTXknZ7eVaWv6dcmtaowu/
         zOsCRn+KAd2poqAMF29udRMmadt6neA/Aqlss7+AfXxdvd4JHgagR/N7GlQbrt8kckfO
         YbQg==
X-Gm-Message-State: ACrzQf0QXay0HQJRsKB1TZRR4zh1u8gfBI4SNr8vDsAGnlU247Jx6zY3
	THV1ev4VtkVrFFq7SvmDunmJaNARlSzjqvbOgo5XajgD7j6HdwnhLr/AueYkZV+jaR0Q/q8xrVu
	dE51980/nh19zjB+GMCqbzBHMxaBvvh9ou0TEj5aKpgUx6XtDCuWA9607UIELKw==
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id ea10-20020a05620a488a00b006ce5caa37d1mr19564613qkb.37.1664975161378;
        Wed, 05 Oct 2022 06:06:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7R0EoGHRuXP9h2yu2cjyoEIZCjf+tOtdLdPnVZlTEtkr4PaPwaY8ttRbvYB9Yin/1E8g4yA95xyZbaG8HiEnU=
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id
 ea10-20020a05620a488a00b006ce5caa37d1mr19564576qkb.37.1664975161052; Wed, 05
 Oct 2022 06:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 5 Oct 2022 15:05:45 +0200
Message-ID: <CAJM55Z8zg=-meSGhFnVh4Tb4=5M3sHis1oapzXCEipyDkuyvyg@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Basic StarFive JH7110 RISC-V SoC support
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_060610_699511_4FD657FE 
X-CRM114-Status: GOOD (  25.61  )
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

On Thu, 29 Sept 2022 at 16:34, Hal Feng <hal.feng@linux.starfivetech.com> wrote:
> This series adds basic support for the StarFive JH7110 RISC-V SoC to
> boot up and get a serial console. This series includes basic clock,
> reset, pinctrl and uart drivers, which are necessary for booting.
> It's should be noted that the reset and clock driver codes of JH7110
> are partly common with those of JH7100, so the common codes are
> factored out and can be reused by drivers of JH7110 and other more
> SoCs from StarFive.
>
> The JH7110 is the upgraded version of JH7100 and also the first official
> released version of JH71XX series SoCs from StarFive Technology Ltd.
> The VisionFive 2 boards equipped with JH7110 SoCs are launched
> recently [1]. More information and support can visit RVspace wiki [2].
>
> This series is also available at
> https://github.com/hal-feng/linux/commits/visionfive2-minimal
>
> [1] https://www.cnx-software.com/2022/08/23/starfive-visionfive-2-quad-core-risc-v-sbc-linux/
> [2] https://wiki.rvspace.org/

Hi Hal,

Firstly thanks for working on this! And sorry about the late reply. On
the next version could you please cc
emil.renner.berthing@canonical.com since it seems to handle the
mailing list a bit better.

I see you've changed the clock/reset and pinctrl quite a bit, so I'll
comment on that separately.

/Emil

> Emil Renner Berthing (17):
>   dt-bindings: riscv: Add StarFive JH7110 bindings
>   dt-bindings: timer: Add StarFive JH7110 clint
>   dt-bindings: interrupt-controller: Add StarFive JH7110 plic
>   dt-bindings: sifive-l2-cache: Support StarFive JH71x0 SoCs
>   soc: sifive: l2 cache: Convert to platform driver
>   soc: sifive: l2 cache: Add StarFive JH71x0 support
>   reset: starfive: jh7100: Use 32bit I/O on 32bit registers
>   dt-bindings: reset: Add StarFive JH7110 reset definitions
>   clk: starfive: Factor out common clock driver code
>   dt-bindings: clock: Add StarFive JH7110 system clock definitions
>   dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
>   clk: starfive: Add StarFive JH7110 system clock driver
>   dt-bindings: clock: Add StarFive JH7110 always-on definitions
>   dt-bindings: clock: Add starfive,jh7110-clkgen-aon bindings
>   clk: starfive: Add StarFive JH7110 always-on clock driver
>   RISC-V: Add initial StarFive JH7110 device tree
>   RISC-V: Add StarFive JH7110 VisionFive2 board device tree
>
> Hal Feng (8):
>   reset: starfive: jh7100: Use regmap APIs to operate registers
>   reset: starfive: jh7100: Move necessary properties to device tree
>   reset: starfive: Rename 'reset-starfive-jh7100.c' to
>     'reset-starfive.c'
>   dt-bindings: reset: Add starfive,jh7110-reset bindings
>   reset: starfive: Add StarFive JH7110 SoC support
>   clk: starfive: Use regmap APIs to operate registers
>   RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
>   RISC-V: Add StarFive JH7100 and JH7110 SoC Kconfig options
>
> Jianlong Huang (5):
>   pinctrl: Create subdirectory for StarFive drivers
>   pinctrl: starfive: Rename "pinctrl-starfive" to
>     "pinctrl-starfive-jh7100"
>   dt-bindings: pinctrl: Add StarFive JH7110 pinctrl definitions
>   dt-bindings: pinctrl: Add StarFive JH7110 pinctrl bindings
>   pinctrl: starfive: Add StarFive JH7110 driver
>
>  .../clock/starfive,jh7110-clkgen-aon.yaml     |  62 ++
>  .../clock/starfive,jh7110-clkgen-sys.yaml     |  69 ++
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../pinctrl/starfive,jh7100-pinctrl.yaml      |   2 +-
>  .../pinctrl/starfive,jh7110-pinctrl.yaml      | 202 ++++
>  .../bindings/reset/starfive,jh7100-reset.yaml |  20 +
>  .../bindings/reset/starfive,jh7110-reset.yaml |  54 +
>  .../bindings/riscv/sifive-l2-cache.yaml       |   4 +
>  .../devicetree/bindings/riscv/starfive.yaml   |   3 +
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  MAINTAINERS                                   |  27 +-
>  arch/riscv/Kconfig.socs                       |  28 +-
>  arch/riscv/boot/dts/starfive/Makefile         |   3 +-
>  .../dts/starfive/jh7100-beaglev-starlight.dts |   2 +-
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |   3 +
>  .../jh7110-starfive-visionfive-v2.dts         |  91 ++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 449 +++++++++
>  arch/riscv/configs/defconfig                  |   1 +
>  drivers/clk/starfive/Kconfig                  |  29 +-
>  drivers/clk/starfive/Makefile                 |   6 +-
>  .../clk/starfive/clk-starfive-jh7100-audio.c  | 138 +--
>  drivers/clk/starfive/clk-starfive-jh7100.c    | 836 +++++-----------
>  drivers/clk/starfive/clk-starfive-jh7100.h    | 112 ---
>  .../clk/starfive/clk-starfive-jh7110-aon.c    | 161 +++
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 648 ++++++++++++
>  drivers/clk/starfive/clk-starfive.c           | 349 +++++++
>  drivers/clk/starfive/clk-starfive.h           | 112 +++
>  drivers/pinctrl/Kconfig                       |  18 +-
>  drivers/pinctrl/Makefile                      |   2 +-
>  drivers/pinctrl/starfive/Kconfig              |  37 +
>  drivers/pinctrl/starfive/Makefile             |   8 +
>  drivers/pinctrl/starfive/pinctrl-jh7110-aon.c | 718 ++++++++++++++
>  drivers/pinctrl/starfive/pinctrl-jh7110-sys.c | 925 +++++++++++++++++
>  .../pinctrl-starfive-jh7100.c}                |  10 +-
>  drivers/pinctrl/starfive/pinctrl-starfive.c   | 539 ++++++++++
>  drivers/pinctrl/starfive/pinctrl-starfive.h   | 131 +++
>  drivers/reset/Kconfig                         |   7 +-
>  drivers/reset/Makefile                        |   2 +-
>  drivers/reset/reset-starfive-jh7100.c         | 173 ----
>  drivers/reset/reset-starfive.c                | 218 ++++
>  drivers/soc/Makefile                          |   2 +-
>  drivers/soc/sifive/Kconfig                    |   2 +-
>  drivers/soc/sifive/sifive_l2_cache.c          |  86 +-
>  .../dt-bindings/clock/starfive-jh7110-aon.h   |  26 +
>  .../dt-bindings/clock/starfive-jh7110-sys.h   | 215 ++++
>  ...l-starfive.h => pinctrl-starfive-jh7100.h} |   6 +-
>  .../pinctrl/pinctrl-starfive-jh7110.h         | 931 ++++++++++++++++++
>  include/dt-bindings/reset/starfive-jh7110.h   | 154 +++
>  48 files changed, 6604 insertions(+), 1019 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
>  delete mode 100644 drivers/clk/starfive/clk-starfive-jh7100.h
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-sys.c
>  create mode 100644 drivers/clk/starfive/clk-starfive.c
>  create mode 100644 drivers/clk/starfive/clk-starfive.h
>  create mode 100644 drivers/pinctrl/starfive/Kconfig
>  create mode 100644 drivers/pinctrl/starfive/Makefile
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-sys.c
>  rename drivers/pinctrl/{pinctrl-starfive.c => starfive/pinctrl-starfive-jh7100.c} (99%)
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive.h
>  delete mode 100644 drivers/reset/reset-starfive-jh7100.c
>  create mode 100644 drivers/reset/reset-starfive.c
>  create mode 100644 include/dt-bindings/clock/starfive-jh7110-aon.h
>  create mode 100644 include/dt-bindings/clock/starfive-jh7110-sys.h
>  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>  create mode 100644 include/dt-bindings/reset/starfive-jh7110.h
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
