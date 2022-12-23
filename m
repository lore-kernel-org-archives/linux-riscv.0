Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91661C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAgvXLB2qM6IBJkyCzGmL4FHtYVPYDGMNrcYzXBymfk=; b=CteWK09Ydor2CM
	ckyPHdZH7Q+1pv8bB+R9HCLnjt6nkcGbWSCzDeOpTg/Z2ubGvzidOImgAUmrJXUfIfmZTiEWv8T0v
	ULFmWhgdDz6Rxdfa22QlSkT/mbN8oCi0fiq3Nn7omeJTpTij0PnHBv2PYW2DcYjz1Ugp8k5At6LMQ
	2tyhmUMj3Qc72CU/xw8E3goD5JH3H9pLqoUpW+ey2bnCi5U4PErvBPKiuqPdSnz7Rv/7gBBLkC24q
	Yj8N9TNoWIooL3112gzDWjKkn+LDWxbPhWC28K86HtVFsL9xk8RNK5Ipk4jwwAYycIsMF0HuPY+6V
	q29k8+yvNb8QwXT5svwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8c40-004adU-HQ; Fri, 23 Dec 2022 07:01:52 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8c3v-004aRy-47
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 07:01:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0BF7324DFDC;
	Fri, 23 Dec 2022 15:01:21 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 15:01:20 +0800
Received: from [192.168.125.65] (183.27.97.120) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 15:01:20 +0800
Message-ID: <fec1b051-d5ca-c279-50f0-3ad1fd3f813c@starfivetech.com>
Date: Fri, 23 Dec 2022 15:02:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 03/11] reset: Create subdirectory for StarFive drivers
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-4-hal.feng@starfivetech.com> <Y6Iz7pzG3Zmecm3S@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y6Iz7pzG3Zmecm3S@spud>
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_230147_666910_A2DF1F1D 
X-CRM114-Status: GOOD (  22.51  )
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

On Tue, 20 Dec 2022 22:15:10 +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 08:50:46AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > This moves the StarFive JH7100 reset driver to a new subdirectory in
> > preparation for adding more StarFive reset drivers.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  MAINTAINERS                                          | 2 +-
> >  drivers/reset/Kconfig                                | 8 +-------
> >  drivers/reset/Makefile                               | 2 +-
> >  drivers/reset/starfive/Kconfig                       | 8 ++++++++
> >  drivers/reset/starfive/Makefile                      | 2 ++
> >  drivers/reset/{ => starfive}/reset-starfive-jh7100.c | 0
> >  6 files changed, 13 insertions(+), 9 deletions(-)
> >  create mode 100644 drivers/reset/starfive/Kconfig
> >  create mode 100644 drivers/reset/starfive/Makefile
> >  rename drivers/reset/{ => starfive}/reset-starfive-jh7100.c (100%)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fd90403c33bd..117024b52d06 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19651,7 +19651,7 @@ STARFIVE JH7100 RESET CONTROLLER DRIVER
> >  M:	Emil Renner Berthing <kernel@esmil.dk>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> > -F:	drivers/reset/reset-starfive-jh7100.c
> > +F:	drivers/reset/starfive/reset-starfive-jh7100.c
> >  F:	include/dt-bindings/reset/starfive-jh7100.h
> >  
> >  STATIC BRANCH/CALL
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index de176c2fbad9..1e8e1c4954cd 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -232,13 +232,6 @@ config RESET_SOCFPGA
> >  	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
> >  	  driver gets initialized early during platform init calls.
> >  
> > -config RESET_STARFIVE_JH7100
> > -	bool "StarFive JH7100 Reset Driver"
> > -	depends on SOC_STARFIVE || COMPILE_TEST
> > -	default SOC_STARFIVE
> > -	help
> > -	  This enables the reset controller driver for the StarFive JH7100 SoC.
> > -
> >  config RESET_SUNPLUS
> >  	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
> >  	default ARCH_SUNPLUS
> > @@ -320,6 +313,7 @@ config RESET_ZYNQ
> >  	help
> >  	  This enables the reset controller driver for Xilinx Zynq SoCs.
> >  
> > +source "drivers/reset/starfive/Kconfig"
> >  source "drivers/reset/sti/Kconfig"
> >  source "drivers/reset/hisilicon/Kconfig"
> >  source "drivers/reset/tegra/Kconfig"
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 3e7e5fd633a8..fee17a0e3a16 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-y += core.o
> >  obj-y += hisilicon/
> > +obj-$(CONFIG_SOC_STARFIVE) += starfive/
> >  obj-$(CONFIG_ARCH_STI) += sti/
> >  obj-$(CONFIG_ARCH_TEGRA) += tegra/
> >  obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
> > @@ -30,7 +31,6 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
> >  obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
> >  obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
> >  obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
> > -obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
> >  obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
> >  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
> >  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
> > diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> > new file mode 100644
> > index 000000000000..cddebdba7177
> > --- /dev/null
> > +++ b/drivers/reset/starfive/Kconfig
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config RESET_STARFIVE_JH7100
> > +	bool "StarFive JH7100 Reset Driver"
> > +	depends on SOC_STARFIVE || COMPILE_TEST
> > +	default SOC_STARFIVE
> 
> You could in theory drop the default that I added & replace it with a y,
> since the subdir is gated by the symbol. I don't really care though tbh.

If you don't mind, I would like to keep it because the starfive clk subdir
did the same before.

Best regards,
Hal

> The movement seems fine to me..
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
