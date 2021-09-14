Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A131C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 09:30:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBA3E61056
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 09:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBA3E61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rvkCx5a1MmzdblB3OTeTqbPVTFLmdKH6IXWZNTJSD0=; b=wDSkMaXQzHwfH3
	cF0SEPqVH8PR1RFmUUUvn1L7s5lMgRDGtYJRQJ4Apt67GeTQiAdbty198fKaGyKSCoPFjPVpjTaxz
	qpcIs3DvGm9aQgIUiw+C+vQ7xBDyErZGgE4UE1Vcl/CXQRm7qGAc84VrA9IAvJDyY4MOdUVTrRTPu
	rw/DkLrXLGJXeRC5KzKrtZd04/+BgsUinzYDwTLJYKO9wOshVQKwfS1HqdpXFMoQ9nUslUXDHq4Uc
	ZOVBtT9DzHxig9LT5Qzcffa/mU0uXkQul0ozZHrd7pWaSL0KbnzPysZabLOZ73gJ3hQy5vndnpy8E
	O11FqDfZ4w4Zfq3GEsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ4lU-0051wq-3u; Tue, 14 Sep 2021 09:30:08 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ4lM-0051uj-Tl
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 09:30:07 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8XDT-1mvCPE2xCj-014QdE for <linux-riscv@lists.infradead.org>; Tue, 14
 Sep 2021 11:29:57 +0200
Received: by mail-wr1-f54.google.com with SMTP id u15so13037233wru.6
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 02:29:57 -0700 (PDT)
X-Gm-Message-State: AOAM533ZxGij61LJm6r3EsuWXquJ5zUYBW39usff3a45ENWF7SCMMcm8
 81dTlglr1VgwLQgXg3Z68QrV6ck/bxIOIt8ceso=
X-Google-Smtp-Source: ABdhPJypqsYHFxoUa29/jtw7Qz56PJNAFh3JFeGA9boJ1TXhrmxqwyJldyb+fdD4v1ob2++RiK7UL+91VPvYQXRh/IU=
X-Received: by 2002:a5d:528b:: with SMTP id c11mr17068296wrv.369.1631611797238; 
 Tue, 14 Sep 2021 02:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
 <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 11:29:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
Message-ID: <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Guo Ren <guoren@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <maxime@cerno.tech>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, 
 Chen-Yu Tsai <wens@csie.org>
X-Provags-ID: V03:K1:LyecDRRYbu19bjvOUYodkskUnjFUU/36Mzqpw2w15p9wKdYDQSR
 mcXjrmjs2DYehLMaP8cI7FYPoNz3sS+FyKZctZSUti6zItMb8zoPHbj/2YIzwfCflax85vi
 SVs1wnh+8nps4PvwnX857MgmeUVn8REBoakW+7Omhjpudd6so97mruL5CQ0tDAaBxf3Qald
 yGXT/0yV+2pyXMH0YHrgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tiu4nELmAzs=:W0N0E8vZjoZ6ox7ihHy9hP
 lz3dcv4KNoXD6k66uTiQ5MqIALwTTfEVzgi1Ija4TBKQbtiuvVUKhqzkXPEcVDfEaG626tdUl
 6Dfj/ZsRcgKSkoPU1vKI/8UrpbgJCWnqdS5YcHh/eOdvjMbSk552zKxHDiUxUydJIvhw5jNNj
 aT8cFpMa/I8OXn88f90VIEa/DGUEQyOi5xBZ/UMrqAgOJrPchoDL0ncOUqrH1M7JldhFwu+32
 MEMb1N6IduNVtpBpBjh8u94MGyTa7GhSUnFIyxGW99rsF1wMYwky78YEO/QM+5I7UODRrMctu
 rxK3zrUzduXEMvZitrghVroPOxiBXpVCts1BJ+nY7B5LxyFUHBz02qJIrErdRKECsRmWcKhXG
 A2JVeCEmVemGWkGQn1ia9qcyENjii9W7pPK65dcOmlm9rdxnP2i7YogzAaY+nRWVX3ES5jdww
 u8kHE+XBOaps/hOrixgtE7rwR0rPzx+frBmrCIhZTrAtBGxosW/C/oAugjkGgarsZCmU3g4qR
 +fnGcMwaWMrk5UL0Tm3yyG0jQ08dF5b5sJPa2r5HHcK7lbzbD6MKVkkwWfblRe59bPOGMHPjS
 ookzg2C0ZZrb+QuhaS7hO2ouu/P1qy6efk3P+jNcWPQoITpaOKVIme09ylw5CVyAsVWSXsCu/
 KiCY2cKVAJIRaFc/w7aOhq1TDXjytCmJ8noTB6sfklz9rEZXSXbg1ct17xgP3gu1cS1Ve+mIw
 P8vR2Z/3qmsPflonTDegxp9yRwW8t+tkOVkAVbeXICmiFt9VLcwMXJ9xfGmKwSMZInLfupyUu
 YPR54+Y4wHzr1oVWdFGgXVDtGYFxBXdBIkYV9DplMXmOn5NmQZhNEQeJhxpRwytU/fy8AyWlx
 mj3JK10QNioyU/KFiB9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_023001_292209_FAA08974 
X-CRM114-Status: GOOD (  28.84  )
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

On Tue, Sep 14, 2021 at 4:36 AM Guo Ren <guoren@kernel.org> wrote:
> On Tue, Sep 14, 2021 at 2:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 9/13/21 2:20 AM, Guo Ren wrote:
> > > On Mon, Sep 13, 2021 at 4:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
> > >>> From: Liu Shaohua <liush@allwinnertech.com>
> > >>>
> > >>> Add Allwinner kconfig option which selects SoC specific and common
> > >>> drivers that is required for this SoC.
> > >>>
> > >>> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> > >>> interconnect issues for dma synchronization, so we set the default
> > >>> value when SOC_SUNXI selected.
> > >>>
> > >>>
> > >>> +config SOC_SUNXI
> > >>> +     bool "Allwinner SoCs"
> > >>> +     depends on MMU
> > >>> +     select DWMAC_GENERIC
> > >>> +     select ERRATA_THEAD
> > >>> +     select RISCV_DMA_NONCOHERENT
> > >>> +     select RISCV_ERRATA_ALTERNATIVE
> > >>> +     select SERIAL_8250
> > >>> +     select SERIAL_8250_CONSOLE
> > >>> +     select SERIAL_8250_DW
> > >>> +     select SIFIVE_PLIC
> > >>> +     select STMMAC_ETH
> > >>> +     help
> > >>> +       This enables support for Allwinner SoC platforms like the D1.
> > >>> +
> > >>
> > >> I'm not sure we should select the drivers there. We could very well
> > >> imagine a board without UART, or even more so without ethernet.
> > > We just want people could bring D1 up easier, 8250 is the basic component.
> > >
> > >
> > >>
> > >> These options should be in the defconfig.
> >
> > Agreed, using a defconfig is the right way to do this.
> Put 8250 related configs into arch/riscv/configs/defconfig?

I think that would be best, as well as the STMMAC_ETH and
DWMAC_GENERIC options.

If all RISC-V chips are required to have a 8250 compatible uart,
selecting it from CONFIG_RISCV would work as well, but for
consistency I'd give users the option to leave it out, just like
any other driver that is not required to have a useful system.

>  @Palmer Dabbelt @Arnd Bergmann, How do you think about that?
> (defconfig or Kconfig.soc)
> My purpose is when people make the Image from riscv/defconfig, then
> the Image could run on all platforms include D1.

I would try to keep the Kconfig.soc as short as possible. As a general
rule, only use 'select' to enable symbols that are otherwise not user
visible, such as the specific errata if you want to hide them. For individual
SoCs, I prefer not having separate Kconfig options, but instead have
those per driver. We have some SoC families that have part specific
options elsewhere, e.g. drivers/soc/renesas/Kconfig, but I'd only add
those if you can't avoid it. Having it in drivers/soc/ may be better for
sunxi than spreading them over arch/{arm,arm64,riscv}.

Some subsystem maintainers want drivers to be selected by the SoC
option, this is why you need the 'select SIFIVE_PLIC', but usually
the drivers are selectable with a 'depends on ARCH_SUNXI ||
COMPILE_TEST' and enabled in the defconfig.

If you want to get fancy, you can use something like:

config RESET_SUNXI
        bool "Allwinner SoCs Reset Driver" if COMPILE_TEST && !ARCH_SUNXI
        default ARCH_SUNXI

This will make an option that
 - always enabled when the platform is built-in
 - user selectable when compile-testing for any other platform
 - always disabled otherwise

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
