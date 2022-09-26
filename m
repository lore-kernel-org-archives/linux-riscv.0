Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03BBC6FA8E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3oE7W2nTXxdPLS6g1in9kaRW2f/50/xTgmFcPKthQY=; b=xRGZjKAqxHwVG8
	vh4Fcyc3uAkRAADy3SBGjIzuh+W02JmhS/2pvjZqF5tvPRLM4+tY041FQXi0D5WFXEFu1mktg2fDP
	fuKXHdrruwERyKxtI8bNWaILE5x+Lu5wpRcrM1fsoMLqbF7p2KZOWEoQiKC03U7wzag15fCtyrYpW
	WrFnOqzToBUioePyrQ6H6zwyJOhLmoc+SQuWp+nDT1MAcfrhy3t3VZ6TYYCKD5VXOjJmfrowg63Bw
	TcikHwKiacA9jJpODQe7T0riVapKpH/UQJYGPfw78PQzzO8c+x2k0PIYa67ZKLdlGrSwKbXOuOk5L
	K+rWMFz5I1BIdeq1/Ekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocj5O-002yMa-8A; Mon, 26 Sep 2022 08:03:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocj5J-002yIj-LD
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 08:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664179404; x=1695715404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2S0dOgYuU9ODUq0DZbUSltgmTnYi8Eh7MAZNyhmpl0w=;
  b=Xqc+PWm+g7UIw2YZAa4y7j1W58QF4+1oL5XK+kgShh9WqJveNzIU4sep
   bA/CfxK2QlaWpjD1yP5cwVCACi2zc4E+C7GQiyf8heY0eKb6xTEXpsujI
   JkDKGJqJ9TQeuiQoG8z51hNGrIrdYxdhvkvIX3l3ccRFBoHnIXlONRZmF
   WNQerMJSSBBlJpxNyP5aS0VQbUx4zRvzHcQk9n2f99G3X8Z/iaQ51LzWb
   tVr7V+qm6hYHz/DvEY6zFtS2DpYEW2h+7hC+Hfch5OhoC+3SYCDMkI1vH
   ftG7RI17aE46m/gZ/oCVvI72fSfIRklnz4zX2wDPkW4XrMFICjHOe+9O5
   w==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="182057620"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2022 01:03:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 01:03:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 26 Sep 2022 01:03:19 -0700
Date: Mon, 26 Sep 2022 09:02:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <geert@linux-mk68.org>, <heiko@sntech.de>,
	<kernel@esmil.dk>, <arnd@arndb.de>
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
Message-ID: <YzFcsV2XV1Ovy5Dq@wendy>
References: <20220923185605.1900083-1-conor@kernel.org>
 <915949be-ab11-8364-4ac2-07d964d66560@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <915949be-ab11-8364-4ac2-07d964d66560@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_010325_794251_F1C1F601 
X-CRM114-Status: GOOD (  35.35  )
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

On Mon, Sep 26, 2022 at 10:50:42AM +0900, Damien Le Moal wrote:
> On 9/24/22 03:55, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Following on from LPC, here's the start of my efforts to clean up
> > Kconfig.socs.
> > 
> > My preference would be to take the whole thing through the RISC-V tree
> > for v6.2 to make things a bit less fiddly, but I am sending this as an
> > RFC in the hopes of getting some opinions on how the series should be
> > split up & merged. I guess it would always be possible to create a few
> > immutable branches for the individual subsystems that are being modified
> > & take the series through the riscv tree unless we hit a conflict in
> > -next. Obiviously for that route, maintainer acks will be needed.
> > 
> > The only SoCs I have, at the moment ;), are the jh7100, mpfs, fu540 and
> > the k210 so I've given those a whirl to make sure I didn't break
> > something.
> > 
> > I have also yet to deal with ARCH_VIRT, but just throwing this out for
> > some opinions on how to apply/split up the set before finalising a v1.
> > 
> > I've CCed a few people that may have an opinion here, but anyone that
> > has an opinion here - please shout!
> > 
> > One other point, is it worth adding something to the patch acceptance
> > policy to say "do your kconfig xyz way" or is that not something that's
> > worth doing since it is easy to push people in the right direction
> > during review?
> > 
> > The series is currently on top of:
> > https://lore.kernel.org/all/20220908142914.359777-1-cristian.ciocaltea@collabora.com/
> 
> It is not very nice to change the config option names as that can break
> user build environments, e.g. buildroot setups that have tweaked kernel
> configs.

Yeah & I am not sure what could be done there other than define both
symbols in the defconfig externally. I am loathe to break someone's
setup, but defconfig is not in the "thou shalt not break" category is
it?

> What's wrong with the SOC_XXX names? Changing these to ARCH_XXX is
> weird since the ARCH prefix is generally used for ISA differentiation
> rather than boards/SoCs.

The ARM{,64} vendors coming to RISC-V already have an ARCH_FOO symbol
defined. For the sake of consistency (and to avoid having two symbols
for one SoC since they already have ARCH_FOO scattered around the
kernel) I renamed the "incumbent" symbols to match. FWIW ARCH_FOO for
uarchs is more common than SOC_FOO..

My heart is not dead-set on the rename, only my OCD!

Thanks,
Conor.

> > 
> > Conor Dooley (27):
> >   clk: microchip: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
> >   i2c: microchip-corei2c: replace SOC_MICROCHIP_POLARFIRE with
> >     ARCH_MICROCHIP
> >   mailbox: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
> >   usb: musb: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
> >   rtc: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
> >   riscv: stop selecting the PolarFire SoC clock driver
> >   riscv: replace SOC_STARFIVE with ARCH_STARFIVE
> >   clk: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
> >   pinctrl: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
> >   reset: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
> >   riscv: replace SOC_SIFIVE with ARCH_SIFIVE
> >   soc: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
> >   clk: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
> >   clk: sifive: select by default if ARCH_SIFIVE
> >   serial: sifive: select by default if ARCH_SIFIVE
> >   PCI: dwc: fu740: convert SOC_SIFIVE to ARCH_SIFIVE
> >   riscv: stop selecting SiFive clock and serial drivers directly
> >   riscv: convert SOC_VIRT to ARCH_VIRT
> >   kunit: tool: rename SOC_VIRT to ARCH_VIRT in riscv's QEMU config
> >   wireguard: selftests: swap SOC_VIRT for ARCH_VIRT on riscv
> >   riscv: convert SOC_CANAAN to ARCH_CANAAN
> >   clk: k210: convert SOC_CANAAN to ARCH_CANAAN
> >   pinctrl: k210: convert SOC_CANAAN to ARCH_CANAAN
> >   soc: k210: convert SOC_CANAAN to ARCH_CANAAN
> >   reset: k210: convert SOC_CANAAN to ARCH_CANAAN
> >   serial: sifive: select by default if ARCH_CANAAN
> >   riscv: stop directly selecting drivers for ARCH_CANAAN
> > 
> >  arch/riscv/Kconfig.socs                       | 30 +++++++------------
> >  arch/riscv/Makefile                           |  2 +-
> >  arch/riscv/boot/dts/Makefile                  |  2 +-
> >  arch/riscv/boot/dts/canaan/Makefile           | 14 ++++-----
> >  arch/riscv/boot/dts/sifive/Makefile           |  2 +-
> >  arch/riscv/boot/dts/starfive/Makefile         |  2 +-
> >  arch/riscv/configs/defconfig                  |  6 ++--
> >  arch/riscv/configs/nommu_k210_defconfig       |  2 +-
> >  .../riscv/configs/nommu_k210_sdcard_defconfig |  2 +-
> >  arch/riscv/configs/nommu_virt_defconfig       |  2 +-
> >  arch/riscv/configs/rv32_defconfig             |  4 +--
> >  drivers/clk/Kconfig                           |  4 +--
> >  drivers/clk/Makefile                          |  2 +-
> >  drivers/clk/microchip/Kconfig                 |  3 +-
> >  drivers/clk/sifive/Kconfig                    |  4 ++-
> >  drivers/clk/starfive/Kconfig                  |  6 ++--
> >  drivers/i2c/busses/Kconfig                    |  2 +-
> >  drivers/mailbox/Kconfig                       |  2 +-
> >  drivers/pci/controller/dwc/Kconfig            |  2 +-
> >  drivers/pinctrl/Kconfig                       |  8 ++---
> >  drivers/reset/Kconfig                         |  8 ++---
> >  drivers/rtc/Kconfig                           |  2 +-
> >  drivers/soc/Makefile                          |  4 +--
> >  drivers/soc/canaan/Kconfig                    |  4 +--
> >  drivers/soc/sifive/Kconfig                    |  2 +-
> >  drivers/tty/serial/Kconfig                    |  2 ++
> >  drivers/usb/musb/Kconfig                      |  2 +-
> >  tools/testing/kunit/qemu_configs/riscv.py     |  2 +-
> >  .../wireguard/qemu/arch/riscv32.config        |  2 +-
> >  .../wireguard/qemu/arch/riscv64.config        |  2 +-
> >  30 files changed, 64 insertions(+), 67 deletions(-)
> > 
> 
> -- 
> Damien Le Moal
> Western Digital Research
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
