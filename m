Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E8FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbN3WkjNJVzGQe8PVkOr0EaWo/WBLekWoyfibNISLNo=; b=vHl5D8XfDIK7kW
	Vb3f1SBv7Q7ajKG1rP1oO2+7lEsGgsygMQ8yfMRxJHN3PNoDdTi6C4GJ83KCyUZ0eXwv78L6FwhOE
	c4uNWSDEQw6b0paya95bMyr8z/7DroK0lod4Uf2jsmQEbcgh1UZogJbAVON8jC++a1ycHYwfDhpTj
	hDLmoRHKTQnMsrb+WqpID03KzvpDR1HABFD2ON5XK8yOHJJJZiBHuHi9Iev/6+pY/hnSkZPQfVD6b
	xE/UjBLuqLPaQWMuD0BE+hhHpTv4FQoKeWRAxHwRVrlxPBF1vXnVowqv14NIC4B8u8KWkyijh4pci
	FS611lvyHdRz3+K0dQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni1CS-002c70-4Y; Fri, 22 Apr 2022 21:52:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni1CO-002c6W-Sz
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 21:52:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D123861F65
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 21:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A20C385AB
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650664338;
 bh=SiAUjoz3T+1aeVALD2Eh+giKN0JVMqZN76YryIJ4mt8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JZlHS9SnrcUwTN/8SirsExgdtVW06cE0Tb9Ajn3T+CmGlQ8/99Cjok2tbbdXMSX6I
 unOwrG3SN2csgsIcinwjjBZx3GTIxzgbb+v4Fex8cj0XJz5wi5ztxP2iKBTnGMZmEN
 xgnXpklcG6WExd4GDNi21Jjj2n/3K7UiDNa7vQwFx0AE/8QmCJPjhMncwbi6Nkz1U5
 uISD3pMZIVmI5AbcpmJJOyf5gG2FrNGDLL85lv57phdoz8pXq8i8Ap4iz20oK0h9sD
 BwRNMtdqatNr6husm399n58uFqRMjbQwgOyVxcTU4HSaKfgP+5tJzh/wg351eXGa9z
 AWGy6x7+ryIWA==
Received: by mail-pl1-f180.google.com with SMTP id b7so13645324plh.2
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 14:52:18 -0700 (PDT)
X-Gm-Message-State: AOAM531IEgDMSvKX5dEClGRYY5iaO2Rj9HbFFm4YHRrk6rrTdvoBXTX2
 e3FyFTzpF9/OxI5Ol4eTLvhqdkMvG/mw8Wifdg==
X-Google-Smtp-Source: ABdhPJxwTRWYr1mK8u4TOSQmwU1J9n4B/PUTMMO4yVY9LMlSYIg2sLv98fHfLXLaS6h423zejzhIyKAdFgTdwgHJxgQ=
X-Received: by 2002:a17:902:b694:b0:153:1d9a:11a5 with SMTP id
 c20-20020a170902b69400b001531d9a11a5mr6374024pls.151.1650664337751; Fri, 22
 Apr 2022 14:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
 <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
In-Reply-To: <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 22 Apr 2022 16:52:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpd1dBNmWcsbLQZAWj=0am_98ztonOxEgGjXBGddfiNA@mail.gmail.com>
Message-ID: <CAL_JsqJpd1dBNmWcsbLQZAWj=0am_98ztonOxEgGjXBGddfiNA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, atulkhare@rivosinc.com, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, 
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_145221_072974_78C72CC0 
X-CRM114-Status: GOOD (  47.21  )
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

On Fri, Apr 22, 2022 at 2:59 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> On 22/04/2022 20:39, Palmer Dabbelt wrote:
> > On Wed, 13 Apr 2022 00:58:27 PDT (-0700), conor.dooley@microchip.com wrote:
> >> Hey all,
> >> After the clock driver for the PolarFire SoC was accepted I started work
> >> on the onboard RTC & found out that the reference clock for the rtc was
> >> actually missing from the clock driver.
> >>
> >> While restructuring the clock driver to add support for the rtc
> >> reference, I also noticed that there were some problems with how the FIC
> >> clocks were being used. The FIC clocks are the cpu side inputs to the
> >> AXI fabric interconnections & are not the clocks for any peripherals.
> >>
> >> This first three patches in this series fixes the problems with the FICs:
> >> - the fic clocks incorrectly had the AHB clock as their parents
> >> - the last fic, named differently to the others, had not been set as
> >>   a critical clock
> >> - some peripherals on the fabric side were incorrectly using the cpu
> >>   side fic clocks, resulting in incorrect rates.
> >>
> >> The second part of the series fixes the missing rtc reference clock.
> >> There are three main changes:
> >> - Changing the reference clock in the dt to the external 125 MHz
> >>   oscillator rather than using the output of an internal pll. This has
> >>   the added benefit of not requiring changes to the device tree if this
> >>   part of the bitstream changes.
> >> - Adding a new clock into the driver that sits above the existing
> >>   configurable clocks & has the external reference as a parent. The new
> >>   clock provides the parent for the AHB/AXI clocks which formerly came
> >>   from the device tree.
> >> - Adding the rtc reference clock to the dt bindings, device tree and
> >>   clock driver at the configurable clock level, alongside AXI and AHB.
> >>
> >> I kept series separate from [0] since that's tied to the CONFIG_PM stuff
> >> & fixes a specific problem.
> >>
> >> Changes since v1:
> >> After speaking with Krzysztof, I have merged the rtc reference changes
> >> [1] with these fixes for 5.18. This was done since the relevant drivers
> >> and bindings only arrived in v5.18 & there'll now be no issue with
> >> breaking the ABI.
> >> Backwards compatiblity with the device tree from before 5.18 will be
> >> broken by these changes, but the board did not boot then anyway... If
> >> that is not okay, please lmk.
> >>
> >> The patch renaming sys_base was dropped since that's not a fix.
> >>
> >> Version 1 would not apply without [0] & that should be fixed too.
> >>
> >> Thanks,
> >> Conor.
> >>
> >> Changes since v2:
> >> - Wrapped text in dt-binding changes at 80 cols
> >> - Ordered the clock defines numerically in the binding header
> >> - Fixed the Fixes tag on the last patch and added the second tag
> >>
> >> [0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
> >> [1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com
> >>
> >> Conor Dooley (9):
> >>   clk: microchip: mpfs: fix parents for FIC clocks
> >>   clk: microchip: mpfs: mark CLK_ATHENA as critical
> >>   riscv: dts: microchip: fix usage of fic clocks on mpfs
> >>   dt-bindings: clk: mpfs document msspll dri registers
> >>   dt-bindings: clk: mpfs: add defines for two new clocks
> >>   dt-bindings: rtc: add refclk to mpfs-rtc
> >>   clk: microchip: mpfs: re-parent the configurable clocks
> >>   clk: microchip: mpfs: add RTCREF clock control
> >>   riscv: dts: microchip: reparent mpfs clocks
> >>
> >>  .../bindings/clock/microchip,mpfs.yaml        |  13 +-
> >>  .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
> >>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
> >>  .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
> >>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
> >>  drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
> >>  .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
> >>  7 files changed, 211 insertions(+), 41 deletions(-)
> >
> > Thanks.  These generally look good to me, but I don't see acks from everyone.  I'm perfectly fine treating these as fixes and taking them through the RISC-V tree, but looks like it's mostly clk stuff so
> >
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
> I figure they're in his queue :)
>
> >
> > in case someone else wants to take it.  I've put these over at palmer/riscv-pfsoc-clk but haven't merged that anywhere, I'll hold off until at least next week to give everyone time to chime in.
> >
> > On a somewhat related note, I'm getting some DT schema failures
> >    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> >            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
> >    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@1000000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> >            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
> >    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
> >            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/simple-bus.yaml
> >    Looks like none of them are new from this patch set, though.  Atul's been chasing down various DT schema failures so they might be fixed already.
>
> Ye, I do know about those. I meant to try deleting the clocks
> property but didn't get a chance, just been busy. It's not
> related to this series nor does it matter if it makes it prior
> to 5.18 so I was going to submit it on its own.
> The other is in my list-of-things-to-ask-Rob/Krzk-when-I-know-
> for-sure-what-my-question-actually-is...

microchip,mpfs-sys-controller doesn't have MMIO registers, so it's not
on a MMIO bus (aka simple-bus). Move it to an appropriate location
(top level if not part of something else).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
