Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65EFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 05:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA0A60F70
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 05:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DA0A60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ob4zOHRUZnN/fbiXosFgQX6ramrziEA98JV/YkziBJo=; b=Cf1sG3OWvs/K2k
	Ksf+F3WCRtTU2YZlIyklazxeJ8IiTGL19UrEy8XXVUQc0PF7Mlb1ZA4tFrGmW+x+jN+ceKXKLVcvz
	oeWHIKSg/+8twZsSYQ8EdExGqwA27eLT0zgm3G/ETg8awVb9AMa+W/VZGIHF+LWBCGLbIxL2o5m7N
	YpMkfGo/wxrJDuzYBLcCfTYnL+vcr2gEZIudtq1X3VW+TCnQg58KYoJQQTieh4Is/jr5c7TsxNP7B
	PZSj/o0zx2QV5FHyUne3bSxhfPC9md0w4vPrg7ADrbWQqkURQZupfsEPby8QzwWnfVDdjjYoCFCQb
	ARSsysdTl2GVpZEKboSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ0ok-004ChJ-ED; Tue, 14 Sep 2021 05:17:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ0oh-004Cfs-4H
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 05:17:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i23so18103015wrb.2
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 22:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oOM9/HSr10rms/kTZtRBXXYbkulobkA+KsRsDSab8hI=;
 b=NZuqZkPP5EOAbtuipffIoRtYtf54WNs8r1D2Xx2W41gn1DAyzOP6/UkFtAxcRakq41
 4+aYDoE1yZS7WHAXGhEMC0gNTwyNQhzRUF448U1kY4KLqcJinjwhuRl30+ODFXH9D0EB
 x6sQTY2r+pF7c7dfkVK74Xi7/C8lQchVYQkxW9EVEUmzc53tzrpl4TXuSTEkX2dqICun
 QLRXb0tTCV/ZncV9o4gG7tZlyRVRwlIDIiltmVLWm25HzX10CpGOc1VCyh+bECG6ZuYB
 5XjutcfXE0JBe1jFmOx+6vBB+21Iu9NHZZP10u/06TijTMOicEoxTPjYU6a9qqfqPTCa
 lBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOM9/HSr10rms/kTZtRBXXYbkulobkA+KsRsDSab8hI=;
 b=Jb26/Q1ltGhz9AeWVFaIUkNmkJ2Nz7HgYSMuKNQCo1TXZGKlxXSWbINPwSQXL7k0i5
 wwDuvaDFlN1WNONRVFbnXEEhDAuvk4viFOGztydSgejeiiph9TaBgrPrmq0t9Z5VJd9t
 yXlzPI3P8TMrYwfjJuxPCQdlhZq9WTeL+LH7H844136f64kk9osMyK5B4gT2OXkfwW1w
 XRKjbyekPKrInPpdVolAvYMH6SO1jSdKs188axu+Qdp9Lc23oTzANaWdVa2X+O+gRu4R
 bZ6nQTUREPDwn+gXeCIJ1ytvDMS0of/xpuwBdezrPRYK+b63FIfzmoQUT9VYN3G6k8tJ
 87eg==
X-Gm-Message-State: AOAM532knmDwp2JCA3cGfSxhcr0Ut4/w2uye8Evd7oC1G0cuVCzswqNS
 i1pvPMnSFDTBarHAo+bmIAxAxmGar3HL+F4vNuiFSQ==
X-Google-Smtp-Source: ABdhPJzawKvepU75qV+pfqmm+V/cgxGLAd3DIA/4Y2/3OJGzCcolG+JinnFs4EbCUGFridK2GGkBDc83By+52beV5iY=
X-Received: by 2002:adf:e387:: with SMTP id e7mr16835445wrm.199.1631596628583; 
 Mon, 13 Sep 2021 22:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
 <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
 <357851d1-5311-6ee3-6998-b20f0d238100@infradead.org>
In-Reply-To: <357851d1-5311-6ee3-6998-b20f0d238100@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Sep 2021 10:46:57 +0530
Message-ID: <CAAhSdy0EMdaB4nPGbi5yynUQ-c-JmSO+mn46JLSb6x--DpA-kg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <maxime@cerno.tech>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_221711_266071_581D20C7 
X-CRM114-Status: GOOD (  35.01  )
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

On Tue, Sep 14, 2021 at 8:36 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/13/21 7:34 PM, Guo Ren wrote:
> > On Tue, Sep 14, 2021 at 2:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> On 9/13/21 2:20 AM, Guo Ren wrote:
> >>> On Mon, Sep 13, 2021 at 4:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
> >>>>> From: Liu Shaohua <liush@allwinnertech.com>
> >>>>>
> >>>>> Add Allwinner kconfig option which selects SoC specific and common
> >>>>> drivers that is required for this SoC.
> >>>>>
> >>>>> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> >>>>> interconnect issues for dma synchronization, so we set the default
> >>>>> value when SOC_SUNXI selected.
> >>>>>
> >>>>> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> >>>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>>>> Signed-off-by: Wei Fu <wefu@redhat.com>
> >>>>> Cc: Anup Patel <anup.patel@wdc.com>
> >>>>> Cc: Atish Patra <atish.patra@wdc.com>
> >>>>> Cc: Christoph Hellwig <hch@lst.de>
> >>>>> Cc: Chen-Yu Tsai <wens@csie.org>
> >>>>> Cc: Drew Fustini <drew@beagleboard.org>
> >>>>> Cc: Maxime Ripard <maxime@cerno.tech>
> >>>>> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> >>>>> Cc: Wei Wu <lazyparser@gmail.com>
> >>>>> ---
> >>>>>    arch/riscv/Kconfig.socs      | 15 +++++++++++++++
> >>>>>    arch/riscv/configs/defconfig |  1 +
> >>>>>    2 files changed, 16 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> >>>>> index 30676ebb16eb..8721c000ef23 100644
> >>>>> --- a/arch/riscv/Kconfig.socs
> >>>>> +++ b/arch/riscv/Kconfig.socs
> >>>>> @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >>>>>
> >>>>>    endif
> >>>>>
> >>>>> +config SOC_SUNXI
> >>>>> +     bool "Allwinner SoCs"
> >>>>> +     depends on MMU
> >>>>> +     select DWMAC_GENERIC
> >>>>> +     select ERRATA_THEAD
> >>>>> +     select RISCV_DMA_NONCOHERENT
> >>>>> +     select RISCV_ERRATA_ALTERNATIVE
> >>>>> +     select SERIAL_8250
> >>>>> +     select SERIAL_8250_CONSOLE
> >>>>> +     select SERIAL_8250_DW
> >>>>> +     select SIFIVE_PLIC
> >>>>> +     select STMMAC_ETH
> >>>>> +     help
> >>>>> +       This enables support for Allwinner SoC platforms like the D1.
> >>>>> +
> >>>>
> >>>> I'm not sure we should select the drivers there. We could very well
> >>>> imagine a board without UART, or even more so without ethernet.
> >>> We just want people could bring D1 up easier, 8250 is the basic component.
> >>>
> >>>
> >>>>
> >>>> These options should be in the defconfig.
> >>
> >> Agreed, using a defconfig is the right way to do this.
> > Put 8250 related configs into arch/riscv/configs/defconfig?
> >
> >   @Palmer Dabbelt @Arnd Bergmann, How do you think about that?
> > (defconfig or Kconfig.soc)
> > My purpose is when people make the Image from riscv/defconfig, then
> > the Image could run on all platforms include D1.
>
> Hi,
>
> I certainly did not understand your purpose with the patch being
> able to build a kernel that would run on multiple platforms.
> Still, I would not expect to see one platform cause unnecessary
> drivers to be built for platforms that don't need them.
>
> Kconfig.socs in arch/riscv/ is a bit of an unusual Kconfig file
> IMO -- I suppose what you want to do fits into its style.
>
> AFAIK the suggestion to use a defconfig (at least my suggestion)
> was expecting to have a defconfig for each platform, but that
> would not give you a boot image that could run on all platforms.

AFAIK, having a separate defconfig for each platform is not going
to fly with distros (AFAIK). We can't expect dirstros to release
separate RISC-V kernel image for each platform. In fact, ARM64
kernel has just one defconfig whereas ARM32 kernel has
consolidated and minimized number of defconfigs.

The long term goal for Linux RISC-V is to support single kernel
image booting on multiple-platforms. Of course, users can always
strip down the kernel using their custom defconfigs.

Regards,
Anup

>
> Anyway, it's Palmer's choice.
>
> thanks.
> --
> ~Randy
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
