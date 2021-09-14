Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48915C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 02:43:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1333E606A5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 02:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1333E606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXZ/qGQPJ9wvn3PgR8AN7EQ/LH2EcnD2e5pS/H69flY=; b=qZhmYQPoZhqc94
	phQ40SzRjillP7iBXHmrNWmdqYcpQN6EmBqpbN1U3WDUcCIMeCvkHD3aZdOoi3vCga/+5I0Q+WfqF
	KqF3VUvst2DbgygcAhK5dpN29mHmYZ738tx1SRC/Ge+XVZx51xmjNhdeUWWIv5g0xSqLUDPBq2oe5
	W870TRw+y3TBsZi8dALLJYsWZ3xHRrRsHEEoLE2gKXKP+ESZ6kEFpUKMxm4DdJKUa+8700EkHcES1
	I6tEksKC5j50eyZWiSLUTUr9BtHk1UP0WkG4O4xh4LUileFjwgoDZmo/VMDnst74DiUEkz0EXPM6D
	H814EidhsW+vXVacX4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPyPC-003yEu-Cz; Tue, 14 Sep 2021 02:42:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPyHp-003v7H-GG
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 02:35:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1A5B61157
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 02:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631586904;
 bh=bz7Rxj4OImLOV2F9ZMnEZ6ial2UhktF/5F1YEEEmV44=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dVOoOD3fjFIeQljEiWffzK3e87epnINC96VyHIv56IevUZHt/riioVLoD19h6aEnC
 THvkD5VyX/VM/xzicH1O9bdy0NJXgCE6ZTb3ifEALrEO5Sxe+n0vW1pJDTAFEfwX+D
 zKQVoEKAQ3bNeHRRKCAxtFS9K46vLFNW+GPAIh+Y9MC0lUap9Ljdi5fpqDa3wsIghN
 +S6km0b+ebZ9sXZ8sAAMGr3d53tC8zJfUcjnT6oEAdXpptcIY+pQM1cK6+T4AinXMV
 1q3P+CfalDzJ8G1xrT6mfYwgCUzlgf6FAo8JbxHcIQFvJ9/0bbc/BbiLQ1ECn0C7ct
 s+DcYGZ06y+fA==
Received: by mail-lj1-f182.google.com with SMTP id p15so20900132ljn.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 19:35:04 -0700 (PDT)
X-Gm-Message-State: AOAM530bMq4HY82YM67xqTpqWXq3sYh58op6xethu/q92jwL1h3i1nlx
 iP8w5SS1AjA+Qf/yQxDy85dJEMABS/cIgU7TXHE=
X-Google-Smtp-Source: ABdhPJxkZIIk5caw259v6Vh2lE0hi3eHP19JEjfp0Q1aBDBi5doS3d2wUWRWNx2sALY0CUr7hNPWej0rfeYlb9xhAfI=
X-Received: by 2002:a05:651c:1548:: with SMTP id
 y8mr13274351ljp.507.1631586903131; 
 Mon, 13 Sep 2021 19:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
In-Reply-To: <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 14 Sep 2021 10:34:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
Message-ID: <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <maxime@cerno.tech>, Anup Patel <anup.patel@wdc.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_193505_685242_D741FD8F 
X-CRM114-Status: GOOD (  24.98  )
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

On Tue, Sep 14, 2021 at 2:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/13/21 2:20 AM, Guo Ren wrote:
> > On Mon, Sep 13, 2021 at 4:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >>
> >> Hi,
> >>
> >> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
> >>> From: Liu Shaohua <liush@allwinnertech.com>
> >>>
> >>> Add Allwinner kconfig option which selects SoC specific and common
> >>> drivers that is required for this SoC.
> >>>
> >>> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> >>> interconnect issues for dma synchronization, so we set the default
> >>> value when SOC_SUNXI selected.
> >>>
> >>> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> >>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>> Signed-off-by: Wei Fu <wefu@redhat.com>
> >>> Cc: Anup Patel <anup.patel@wdc.com>
> >>> Cc: Atish Patra <atish.patra@wdc.com>
> >>> Cc: Christoph Hellwig <hch@lst.de>
> >>> Cc: Chen-Yu Tsai <wens@csie.org>
> >>> Cc: Drew Fustini <drew@beagleboard.org>
> >>> Cc: Maxime Ripard <maxime@cerno.tech>
> >>> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> >>> Cc: Wei Wu <lazyparser@gmail.com>
> >>> ---
> >>>   arch/riscv/Kconfig.socs      | 15 +++++++++++++++
> >>>   arch/riscv/configs/defconfig |  1 +
> >>>   2 files changed, 16 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> >>> index 30676ebb16eb..8721c000ef23 100644
> >>> --- a/arch/riscv/Kconfig.socs
> >>> +++ b/arch/riscv/Kconfig.socs
> >>> @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >>>
> >>>   endif
> >>>
> >>> +config SOC_SUNXI
> >>> +     bool "Allwinner SoCs"
> >>> +     depends on MMU
> >>> +     select DWMAC_GENERIC
> >>> +     select ERRATA_THEAD
> >>> +     select RISCV_DMA_NONCOHERENT
> >>> +     select RISCV_ERRATA_ALTERNATIVE
> >>> +     select SERIAL_8250
> >>> +     select SERIAL_8250_CONSOLE
> >>> +     select SERIAL_8250_DW
> >>> +     select SIFIVE_PLIC
> >>> +     select STMMAC_ETH
> >>> +     help
> >>> +       This enables support for Allwinner SoC platforms like the D1.
> >>> +
> >>
> >> I'm not sure we should select the drivers there. We could very well
> >> imagine a board without UART, or even more so without ethernet.
> > We just want people could bring D1 up easier, 8250 is the basic component.
> >
> >
> >>
> >> These options should be in the defconfig.
>
> Agreed, using a defconfig is the right way to do this.
Put 8250 related configs into arch/riscv/configs/defconfig?

 @Palmer Dabbelt @Arnd Bergmann, How do you think about that?
(defconfig or Kconfig.soc)
My purpose is when people make the Image from riscv/defconfig, then
the Image could run on all platforms include D1.

>
> --
> ~Randy
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
