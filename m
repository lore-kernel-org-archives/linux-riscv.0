Return-Path: <SRS0=2LT1=HI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5724C433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 10:28:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66C6364E68
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 10:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66C6364E68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iO8aXg+xCHSnACEKcy7lurZY6w7WtuRSDCKmzJgQ81o=; b=FWmz3nBtHbHG7lqumyobUSRR2
	6vDs4gNhhZjGrAmYuk4LmJYjyRwqCSFGVNsnW0k0wJGvM7tghO2eYcRSN6SDSAdAeJSryTsoBTI2n
	lWFbP/rZVcdmATwrOSSEULXLtd9qNzQ4894PWAhgDeMCtUkuYiVR81EnyMp6SVPdgRn6qGBnFwzWD
	pvZr4S60IHlRA7yWsEFVnvubv/fj4+XiNhBoeIAZfu083ZdNdFoLoS+i0+gtjoX+fuLDzzpdH+Okc
	zIT2KmEKmU6edNklM3AehYtGG98EEQwSeAFjhfjUyn6YFX3qKknoUq4GyQjo0U5zfkLrSdz4YVK7P
	RkMX9nl7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8Kor-0001B9-Q5; Sat, 06 Feb 2021 10:28:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Kom-0001An-2Z
 for linux-riscv@lists.infradead.org; Sat, 06 Feb 2021 10:28:00 +0000
Received: by mail-il1-x129.google.com with SMTP id p15so8206837ilq.8
 for <linux-riscv@lists.infradead.org>; Sat, 06 Feb 2021 02:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVNmJAoeq9wlQbsr8Q3rhhYVpPsGp6lqUj0p5GBijlc=;
 b=s+5gSUt+0UpRLwHFTDFQq1G9os7t1BvxRSvC/Mjk03zHgmil5eNmMTP28O17wREEON
 0ODxo7e/KAUFyY9McZc+XA5TebyiCL7+gtn3emZoEEJ1XrufjEY8BJ469hfrDIDd5vsE
 nOgkW7Sn0XHeo6VC7dffMDdOlrJwZmkxosh1SKp17dVEyzrVkaJOusO8owK0bJjle7uq
 cZk8hnf9dD2UCJUvpWL9IM6F/AVuiDqejGiTyAXZ0SAiCu2jZKuqpUjobw+II2TlOzou
 aun649mY2g9A9FFtLuE6/f8ZI3tfmTFQmNZlFoy1hQSepm09lKRqMC1bFt1YSEquwC1U
 nhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVNmJAoeq9wlQbsr8Q3rhhYVpPsGp6lqUj0p5GBijlc=;
 b=GpMwathJoAqsJA2FYA5yQdYZbT/IcfMSWFD4m08NksFJLnvVFkVh1b8iSaZDykcqW0
 9oPEWF5h8MGcTTsiFO8cxadkODRucPTANm2V8kpwKK3BWphNqY1j2Duf0stz9LR/K6CR
 ak+yLxfhwHZ8Ks3McNaGRh6qQeaM6gGMQxZoNdzB3FV3AGzu3vdmpEAe8ggZkUah/PUU
 OHc1NPanGEJH+ks8ba/3icnToJ1L0YI8n6ACnsAia0dpLyjVCQEnHPt5j44Cvhbhs1I3
 ZW9KwmZ8zZr1rWLirC2dPNmco/NHB9Aj9e5ymvRMbK0RXjOK6XIfwYZZVzeTz7jkw9vX
 4GAw==
X-Gm-Message-State: AOAM530svcqmpuzrqP/sA8t3m/xI9pd/2/CpqPP67gaopdhYUIiJWjRk
 AtWU2JRCrH1OeLI6Qe5G+l+/6Vz2cQ1rsHdJas8=
X-Google-Smtp-Source: ABdhPJy+i1itBLCmYeachXx42HuBJD1HPhrm9+h9SkQvlzzIako81v26SyTpg40C6wIESyXd1kRYkvovuEJ6VYDVEQM=
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr7333713ili.260.1612607272469; 
 Sat, 06 Feb 2021 02:27:52 -0800 (PST)
MIME-Version: 1.0
References: <87a6skw31l.fsf@igel.home>
 <mhng-5072e618-a4fa-4982-a3ba-e395cde8a145@palmerdabbelt-glaptop>
In-Reply-To: <mhng-5072e618-a4fa-4982-a3ba-e395cde8a145@palmerdabbelt-glaptop>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sat, 6 Feb 2021 12:27:16 +0200
Message-ID: <CAEn-LTpcO_mX-w_nbLKtf-0AszYPpQ=ren7Tk90OuLSZBiBhRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix macb phy probe failure if phy-reset is not
 handled
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_052756_129746_D49080D3 
X-CRM114-Status: GOOD (  31.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 kernel@esmil.dk, Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, Andreas Schwab <schwab@linux-m68k.org>,
 sagar.kadam@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 5, 2021 at 5:42 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 04 Feb 2021 02:16:54 PST (-0800), schwab@linux-m68k.org wrote:
> > On Jan 13 2021, Palmer Dabbelt wrote:
> >
> >> On Tue, 10 Nov 2020 07:22:09 PST (-0800), sagar.kadam@sifive.com wrote:
> >>> HiFive Unleashed is having VSC8541-01 ethernet phy device and requires a
> >>> specific reset sequence of 0-1-0-1 in order to use it in unmanaged mode.
> >>> This series addresses a corner case where phy reset is not handled by boot
> >>> stages prior to linux.
> >>> Somewhat similar unreliable phy probe failure was reported and discussed
> >>> here [1].
> >>> The macb driver fails to detect the ethernet phy device if the bootloader
> >>> doesn't provide a proper reset sequence to the phy device or the phy itself
> >>> is in some invalid state. Currently, the FSBL or u-boot-spl is resetting
> >>> the phy device, and so there is no issue observed in the linux network
> >>> setup.
> >>>
> >>> The series is based on linux-5.10-rc5.
> >>> Patch 1: Add the OUI to the phy dt node to fix issue of missing mdio device
> >>> Patch 2 and 3:
> >>>     Resetting phy needs GPIO support so add to dt and defconfig.
> >>>
> >>> [1] https://lkml.org/lkml/2018/11/29/154
> >>>
> >>> To reproduce the issue:
> >>> Using FSBL:
> >>> 1. Comment out VSC8541 reset sequence in fsbl/main.c
> >>>    from within the freedom-u540-c000-bootloader.
> >>> 2. Build and flash fsbl.bin to micro sdcard.
> >>>
> >>> Using u-boot:
> >>> 1. Comment out VSC8541 reset sequence in board/sifive/fu540/spl.c
> >>>    from mainline u-boot source code.
> >>> 2. Build and flash u-boot binaries to micro sdcard.
> >>>
> >>> Boot the board and bootlog will show network setup failure messages as:
> >>>
> >>> [  1.069474] libphy: MACB_mii_bus: probed
> >>> [  1.073092] mdio_bus 10090000.ethernet-ffffffff: MDIO device at address 0
> >>>            is missing
> >>> .....
> >>> [  1.979252] macb 10090000.ethernet eth0: Could not attach PHY (-19)
> >>>
> >>> 3. Now apply the series build, and boot kernel.
> >>> 4. MACB and VSC8541 driver get successfully probed and the network is set
> >>>    without any failure.
> >>>
> >>>
> >>> So irrespective of whether the prior stages handle the phy reset sequence,
> >>> the probing is successful in both the cases of cold boot and warm boot.
> >>>
> >>> Change History:
> >>> ===============================
> >>> V2:
> >>> -Rebased v1 on linux kernel v5.10-rc3.
> >>>
> >>> V1:
> >>> -Ignore 4th patch as suggested and so removed it from the series.
> >>> -Verified this series on 5.7-rc5.
> >>>
> >>> V0: Base RFC patch. Verified on 5.7-rc2
> >>>
> >>> Sagar Shrikant Kadam (3):
> >>>   dts: phy: fix missing mdio device and probe failure of vsc8541-01
> >>>     device
> >>>   dts: phy: add GPIO number and active state used for phy reset
> >>>   riscv: defconfig: enable gpio support for HiFive Unleashed
> >>>
> >>>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 ++
> >>>  arch/riscv/configs/defconfig                        | 2 ++
> >>>  2 files changed, 4 insertions(+)
> >>
> >> David pointed out I missed these, they're on fixes.  Thanks!
> >
> > This is now on 5.10.12, and breaks ethernet on the Hifive Unleashed:
> >
> > [   12.777976] macb 10090000.ethernet: Registered clk switch 'sifive-gemgxl-mgmt'
> > [   12.784559] macb 10090000.ethernet: GEM doesn't support hardware ptp.
> > [   12.791629] libphy: MACB_mii_bus: probed
> > [   12.919728] MACsec IEEE 802.1AE
> > [   12.984676] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 16 (70:b3:d5:92:f1:07)
> > [   14.030319] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: phy_poll_reset failed: -110
> > [   14.038986] macb 10090000.ethernet eth0: Could not attach PHY (-110)
>
> Sorry about that.  Looks like we forgot to add the special reset sequence to
> the VSC8541, which the driver doesn't yet support (there's a thread about it,
> but I guess I forgot to clean up the patch).  IIUC this should manifest on
> master as well, so my guess is that nobody is testing the HiFive Unleashed any
> more (probably a bad sign).

BayLibre has Unleashed connected to KernelCI. I did notice:

[..]
08:24:37.572482  <3>[    2.022855] Microsemi VSC8541 SyncE
10090000.ethernet-ffffffff:00: phy_poll_reset failed: -110
08:24:37.574273  <3>[    2.031882] macb 10090000.ethernet eth0: Could
not attach PHY (-110)
08:24:37.575304  <3>[    2.037772] IP-Config: Failed to open eth0
08:24:37.576087  <3>[    2.042087] IP-Config: No network devices available
08:24:37.576863  <6>[    2.053662] Freeing unused kernel memory: 2144K
08:24:37.577412  <6>[    2.057794] Run /init as init process
[..]

in KCIDB.

I don't use KernelCI extensively, but today at FOSDEM I was told that
KernelCI also incl. "including maintainer ones".

I guess the idea would be to check and ensure that all relevant trees
are tested in KernelCI.


>
> I'll send out a revert.  I looked at the GPIO driver and can't tell if it's
> twiddling GPIO lines when probed, in which case just enabling the GPIO would
> break the ethernet.  Hopefully we're OK with the GPIO driver enabled.
>
> Thanks for testing this.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
