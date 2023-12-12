Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D02C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 01:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bfld1bMjR3polBWSl2lUQR6LKbxbnW9H5KIcbwdQKEQ=; b=IEymGGHL6tCRGi
	U/k/yj1s9W94g8x3hVX55/izqgU44PAIVKtKcr83T8SSskqn2fbafCYsR4b/72d0VrOL9Ff9lT2tB
	H9AamPTd3M+XX7zPi5e5lSR+VAxU3quY0+J2cEdo2O/ynpd6Bd06yKpgbG5EYunOwz+4XAfgq7PVE
	KBxR2ObFdE8kh48jNC2muQGQIq0uQD1SOfcx94ev2ASkRmv6b3tH421xYhELRLz/KF/4BwrA1JGq/
	OjsVX4TCUNunc77TJmh4Aett/ZrAq+wXnApelkQQ8BUNWprgjrpV/qt3lsnX9f9jOsCB0ZScX4ty5
	mtMxlq/gWAwM+EV0hLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrHY-00AQmy-1r;
	Tue, 12 Dec 2023 01:09:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrHT-00AQlC-0H
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 01:09:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A83FC24E25E;
	Tue, 12 Dec 2023 09:09:39 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 09:09:39 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 09:09:39 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 09:09:39 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "Hal
 Feng" <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 00/16] Basic clock and reset support for StarFive
 JH8100 RISC-V SoC
Thread-Topic: [PATCH v1 00/16] Basic clock and reset support for StarFive
 JH8100 RISC-V SoC
Thread-Index: AQHaKDpenJ7xM02baU+qIG80sqYy3rCfF1UAgAXHjcA=
Date: Tue, 12 Dec 2023 01:09:38 +0000
Message-ID: <f1e151e14e0b4bcca1c9119f5d7e7559@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <CAJM55Z_nnrFcU6N8ZELUoGLe6Dp358aXH7VGf1i+USbZOsbpnQ@mail.gmail.com>
In-Reply-To: <CAJM55Z_nnrFcU6N8ZELUoGLe6Dp358aXH7VGf1i+USbZOsbpnQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_170951_666354_8506A4A5 
X-CRM114-Status: GOOD (  24.06  )
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



> -----Original Message-----
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Sent: Saturday, December 9, 2023 12:53 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v1 00/16] Basic clock and reset support for StarFive JH8100 RISC-V SoC
> 
> Sia Jee Heng wrote:
> > This patch series enabled basic clock & reset support for StarFive
> > JH8100 SoC.
> >
> > This patch series depends on the Initial device tree support for
> > StarFive JH8100 SoC patch series which can be found at below link:
> > https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfivetech.com/
> >
> > StarFive JH8100 shares a similar clock and reset design with JH7110.
> > To facilitate the reuse of the file and its functionalities, files
> > containing the 'jh71x0' naming convention are renamed to use the
> > 'common' wording. Internal functions that contain the 'jh71x0'
> > naming convention are renamed to use 'starfive.' This is accomplished
> > through patches 1, 2, 3, and 4.
> 
> I'm a little sceptical all this renaming is worth it, but if think it's likely
> that future starfive SoCs can use the same clock drivers I'm ok with it. Just
> know that you'll look a bit silly if your "JH9100" can't use these drivers and
> you'll already need different starfive and starfive-gen2 drivers.
Thank you for your understanding.
> 
> /Emil
> >
> >
> > Patch 5 adds documentation to describe System (SYSCRG) Clock & Reset
> > binding.
> > Patch 6 adds SYSCRG clock driver.
> >
> > patch 7 adds documentation to describe System-North-West (SYSCRG-NW)
> > Clock & Reset binding.
> > Patch 8 adds SYSCRG-NW clock driver.
> >
> > patch 9 adds documentation to describe System-North-East (SYSCRG-NE)
> > Clock & Reset binding.
> > Patch 10 adds SYSCRG-NE clock driver.
> >
> > patch 11 adds documentation to describe System-South-West (SYSCRG-SW)
> > Clock & Reset binding.
> > Patch 12 adds SYSCRG-SW clock driver.
> >
> > patch 13 adds documentation to describe Always-On (AON)
> > Clock & Reset binding.
> > Patch 14 adds AON clock driver.
> >
> > Patch 15 adds support for the auxiliary reset driver.
> >
> > Patch 16 adds clocks and reset nodes to the JH8100 device tree.
> >
> > Sia Jee Heng (16):
> >   reset: starfive: Rename file name "jh71x0" to "common"
> >   reset: starfive: Convert the word "jh71x0" to "starfive"
> >   clk: starfive: Rename file name "jh71x0" to "common"
> >   clk: starfive: Convert the word "jh71x0" to "starfive"
> >   dt-bindings: clock: Add StarFive JH8100 System clock and reset
> >     generator
> >   clk: starfive: Add JH8100 System clock generator driver
> >   dt-bindings: clock: Add StarFive JH8100 System-North-West clock and
> >     reset generator
> >   clk: starfive: Add JH8100 System-North-West clock generator driver
> >   dt-bindings: clock: Add StarFive JH8100 System-North-East clock and
> >     reset generator
> >   clk: starfive: Add JH8100 System-North-East clock generator driver
> >   dt-bindings: clock: Add StarFive JH8100 System-South-West clock and
> >     reset generator
> >   clk: starfive: Add JH8100 System-South-West clock generator driver
> >   dt-bindings: clock: Add StarFive JH8100 Always-On clock and reset
> >     generator
> >   clk: starfive: Add JH8100 Always-On clock generator driver
> >   reset: starfive: Add StarFive JH8100 reset driver
> >   riscv: dts: starfive: jh8100: Add clocks and resets nodes
> >
> >  .../clock/starfive,jh8100-aoncrg.yaml         |  77 +++
> >  .../clock/starfive,jh8100-syscrg-ne.yaml      | 158 +++++
> >  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++
> >  .../clock/starfive,jh8100-syscrg-sw.yaml      |  66 ++
> >  .../clock/starfive,jh8100-syscrg.yaml         |  66 ++
> >  MAINTAINERS                                   |  15 +
> >  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi  | 180 ++++++
> >  arch/riscv/boot/dts/starfive/jh8100.dtsi      | 115 ++++
> >  drivers/clk/starfive/Kconfig                  |  49 +-
> >  drivers/clk/starfive/Makefile                 |   3 +-
> >  drivers/clk/starfive/clk-starfive-common.c    | 327 ++++++++++
> >  drivers/clk/starfive/clk-starfive-common.h    | 130 ++++
> >  .../clk/starfive/clk-starfive-jh7100-audio.c  | 127 ++--
> >  drivers/clk/starfive/clk-starfive-jh7100.c    | 503 ++++++++--------
> >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  62 +-
> >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  72 +--
> >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  94 +--
> >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 523 ++++++++--------
> >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  74 +--
> >  drivers/clk/starfive/clk-starfive-jh7110.h    |   4 +-
> >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 327 ----------
> >  drivers/clk/starfive/clk-starfive-jh71x0.h    | 123 ----
> >  drivers/clk/starfive/jh8100/Makefile          |   7 +
> >  drivers/clk/starfive/jh8100/clk-aon.c         | 275 +++++++++
> >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> >  drivers/clk/starfive/jh8100/clk-sys-ne.c      | 566 ++++++++++++++++++
> >  drivers/clk/starfive/jh8100/clk-sys-nw.c      | 268 +++++++++
> >  drivers/clk/starfive/jh8100/clk-sys-sw.c      | 136 +++++
> >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++
> >  drivers/reset/starfive/Kconfig                |  14 +-
> >  drivers/reset/starfive/Makefile               |   4 +-
> >  ...rfive-jh71x0.c => reset-starfive-common.c} |  68 +--
> >  .../reset/starfive/reset-starfive-common.h    |  14 +
> >  .../reset/starfive/reset-starfive-jh7100.c    |   4 +-
> >  .../reset/starfive/reset-starfive-jh7110.c    |   8 +-
> >  .../reset/starfive/reset-starfive-jh71x0.h    |  14 -
> >  .../reset/starfive/reset-starfive-jh8100.c    | 102 ++++
> >  .../dt-bindings/clock/starfive,jh8100-crg.h   | 430 +++++++++++++
> >  .../dt-bindings/reset/starfive,jh8100-crg.h   | 127 ++++
> >  ...rfive-jh71x0.h => reset-starfive-common.h} |  10 +-
> >  40 files changed, 4485 insertions(+), 1242 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-aoncrg.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-ne.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-sw.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg.yaml
> >  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> >  create mode 100644 drivers/clk/starfive/clk-starfive-common.c
> >  create mode 100644 drivers/clk/starfive/clk-starfive-common.h
> >  delete mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c
> >  delete mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.h
> >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> >  create mode 100644 drivers/clk/starfive/jh8100/clk-aon.c
> >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-ne.c
> >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-nw.c
> >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys-sw.c
> >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
> >  rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (55%)
> >  create mode 100644 drivers/reset/starfive/reset-starfive-common.h
> >  delete mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.h
> >  create mode 100644 drivers/reset/starfive/reset-starfive-jh8100.c
> >  create mode 100644 include/dt-bindings/clock/starfive,jh8100-crg.h
> >  create mode 100644 include/dt-bindings/reset/starfive,jh8100-crg.h
> >  rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (50%)
> >
> > --
> > 2.34.1
> >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
