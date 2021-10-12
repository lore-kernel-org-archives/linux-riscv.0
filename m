Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F62C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF951600D4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF951600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TMD2tCsF1Ixu6YqEWzKtwokC35XYzMsZ1CY/AfTHzjs=; b=kcjE8fqr8wrKad
	LmNBB7346gtzTYtFy8sFLF65WIzg2l2gZ3nWG80gxq/13OsmC4UmvDdYLRvvM6QpuV2kSQNSQUmad
	kSQt1oHZW1k2WL9oUyCTKOEYL4Vreqt9DUxsxeaQRRlKE1lPYKgBoy3Ha2TcMFD+lJfXgacqymP+o
	hypwfVAmAr1+TuZrnC4zglbNYAqPQPJXBVziR4exe1mmAdtedb4bWk68qXTVALWtNxTvev+b9ubsC
	8wQtrpobpAGZjJZPyE21eF9Q0YXRRbQ+KQfk7yCteaxkAQHdgngp702vveTncfNeBZLOre++pkz7n
	xB9EKxqc1FRSNhmB7rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI2K-00D2NT-2u; Tue, 12 Oct 2021 13:41:44 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2G-00D2KX-Bu
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:41:43 +0000
Received: by mail-lf1-x12d.google.com with SMTP id x27so87680248lfa.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jer+D64NwFqg3lswgRPWI11ACDNtMRc57uH44gzLJtg=;
 b=euUG5Cl85wO2leafnMYDPaOFYjrD5EJsXk6bBLz4KQTDmfddtviBrNxH6ZE/W//Ogq
 bcFZJskPNi1rzKGw0+ICAivGHQS4GqD5qORdoTYcrbWJ1Meh5W1FSrzMNyqEb4JaefuE
 0O2kmSv8GcjU+xADdDhGzt4ug+d7lsJWG6F19UAIiTj2h4B5E0rwz1MWNQNdf4cBcXA6
 ZhZu2gA+DTXk4gm4XGzzwFuG+ztx5swp5eKX86ooAOnfWrNaw76kvYitVF9PBxy+a+Hh
 DWkk/WoFu129gwJ09TYqRingohCcFKqf+wrcMOvfaNavQgebwIRVJfHLNrbOxXy4SLAJ
 tISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jer+D64NwFqg3lswgRPWI11ACDNtMRc57uH44gzLJtg=;
 b=xXiNgqbzEv/xrMY3/whRD5IEkFAdQptvPG+prSRP1hZYhcMUdy7fRrkCIhaLo56vSz
 f6sq+ksG9ipbZpAwUuZbQpzoJxquufyFAVVYgZ0YHyiTNAkbKhZxwZgnlXAiuHha1YNV
 VhZVku/jbC60fSvPVJGwXLHaUE5QqFm1F4X8FOjlUh+WDDpMDxrkJ8qOrIQ//KXDCzCN
 Iab9a1PcYtvw4KAj3n9LOYKCpSyPgdz7AvaE2PKTBQt/4lX1s6CyeHdD3OLD4mhAcrlP
 lm3/3SknB2yMhqADDBop1OfEiYN0lgXU4gl+a37sQr7qs95zFEwHlDb9Bgn4TTPWCo3t
 uq5A==
X-Gm-Message-State: AOAM530X48x7pJGzOV6E8Ct7RCL166IiPuCM38D+LMexznyiiR6y5SA0
 Q0UIcrrdZW59Bvn04Z3oAAuKLm2j0tzl9A==
X-Google-Smtp-Source: ABdhPJw09X/T52DBQcqbij/xht30zGMRPqEKz9t98hER+srgMXNSFRn7x43yGUM7vmVB443vsV2dkg==
X-Received: by 2002:a05:6512:3c88:: with SMTP id
 h8mr8189918lfv.128.1634046097813; 
 Tue, 12 Oct 2021 06:41:37 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:37 -0700 (PDT)
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/16] Basic StarFive JH7100 RISC-V SoC support
Date: Tue, 12 Oct 2021 15:40:11 +0200
Message-Id: <20211012134027.684712-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064140_490940_36320100 
X-CRM114-Status: GOOD (  15.01  )
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
many devices that needs non-coherent dma operations to work which isn't
upstream yet[1], so this just adds basic support to boot up, get a
serial console, blink an LED and reboot itself. Unlike the Allwinner D1
this chip doesn't use any extra pagetable bits, but instead the DDR RAM
appears twice in the memory map, with and without the cache.

The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
Starlight Beta boards were sent out with them as part of a now cancelled
BeagleBoard.org project. However StarFive has produced more of the
JH7100s and more boards will be available[2] to buy. Hopefully before
the end of the year.

This series is also available at
https://github.com/esmil/linux/commits/starlight-minimal
..but a more complete kernel including non-coherent dma operations can
be found at
https://github.com/starfive-tech/linux/tree/starlight

/Emil

[1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
[2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/

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
  serial: 8250_dw: Add skip_clk_set_rate quirk
  RISC-V: Add initial StarFive JH7100 device tree
  RISC-V: Add BeagleV Starlight Beta device tree

Geert Uytterhoeven (4):
  dt-bindings: clock: starfive: Add JH7100 clock definitions
  dt-bindings: clock: starfive: Add JH7100 bindings
  clk: starfive: Add JH7100 clock generator driver
  dt-bindings: reset: Add StarFive JH7100 reset definitions

 .../clock/starfive,jh7100-clkgen.yaml         |   56 +
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../pinctrl/starfive,jh7100-pinctrl.yaml      |  274 ++++
 .../bindings/reset/starfive,jh7100-reset.yaml |   38 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    5 +
 .../bindings/timer/sifive,clint.yaml          |    1 +
 MAINTAINERS                                   |   22 +
 arch/riscv/Kconfig.socs                       |    8 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/starfive/Makefile         |    2 +
 .../dts/starfive/jh7100-beaglev-starlight.dts |  162 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  228 +++
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/starfive/Kconfig                  |   10 +
 drivers/clk/starfive/Makefile                 |    3 +
 drivers/clk/starfive/clk-starfive-jh7100.c    |  769 +++++++++
 drivers/pinctrl/Kconfig                       |   17 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-starfive.c            | 1439 +++++++++++++++++
 drivers/reset/Kconfig                         |    8 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-starfive-jh7100.c         |  164 ++
 drivers/tty/serial/8250/8250_dw.c             |   32 +-
 include/dt-bindings/clock/starfive-jh7100.h   |  202 +++
 .../dt-bindings/pinctrl/pinctrl-starfive.h    |  274 ++++
 include/dt-bindings/reset/starfive-jh7100.h   |  126 ++
 27 files changed, 3833 insertions(+), 13 deletions(-)
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
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
