Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3658CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 09:31:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AB160FC0
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 09:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8AB160FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MshVJQlb2JfDwTayx+/P/b/M3awNlygV+zY1eRNW3CU=; b=YT1YEMhS9gFTRV
	bi6H0Ic2YW7Zx/uuJX8QsNSyEA9TQVECVB2wdYM/dLAWMgsAmR4XX6p2iJFm/STDJuhiPhrwBQAyx
	Px1YH4BVNQgCOWG00uOpQxEBycAMdMRRqcPBnhDcK38yxNlXHvxNnrzsroCz50OEJUASzn5WgIaW+
	TfVpmG5ml5MZ2tO0eN7XXqf4eYXE3Rvc7IIWSZ7kcfisaO1Aq5J6s1MA+fz3Gu/c/kKRNRWIQQW6i
	eO5L0HFlysSimupd9wXzrC6sl4AlbNKL3f7aH7NGlufdPqPjY1Yqh/WQ8utrM8Q0/Rk9OKRkUtOj/
	3cnTKgbhBKggqXGzRGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPiJ9-0014Pl-EI; Mon, 13 Sep 2021 09:31:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPi8m-0011oV-9z
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 09:20:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CC0F61058
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631524838;
 bh=tfo4VT9tevF5EcHGadDEEin7sfPHUCanQbDTfYb3Vf8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cBxOc+qtt5DHPfsNN6ZhPycytvYHxXsn2o5RkLGEUsXrdLnmmJpT6kVmMBHxgB/I4
 1voj1iU6JNM3dD6y4DZOArD5lGfgSDFyB4y7TKGCUTSpuYWubBlTU/z1aQZ5MDcgM9
 mRuUf8IZoYDXTiBr8Sf7F76Zi9jFaUeE0+SkimSsIIvlxDRY0iBZkkOc8mPWL/7aPL
 v8hqWeKjamlmw9UgIM9mDFBJua00iunE4sROQwi3489CTcciTBmKImX9itgauGK+A2
 pxi0pmkIlBLumDKyeDV4zqhXpwe3v1K1OCZVC980O/HE42lrNkrMVj5UX4FWteq6oO
 btDIMw74sFHrA==
Received: by mail-lj1-f170.google.com with SMTP id o11so8544041ljp.8
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 02:20:38 -0700 (PDT)
X-Gm-Message-State: AOAM533zH2MOp1HpXUHR6JLMXXGAhbz5ywEjW8g14bBodnbdOJ5kSrfa
 p+ZQvoIa8+hHFd39UjoczO7cJYucnmRqdAhtk/0=
X-Google-Smtp-Source: ABdhPJwUQ2Vxc3mqOt2ji6UfpEtOyKYZA5k/71ajUtuybnmHl+zIXrXWmr+nwOV4WhG4DmX+3bhYyf6UnmBUpzr76Wk=
X-Received: by 2002:a2e:a4d1:: with SMTP id p17mr9437403ljm.82.1631524836885; 
 Mon, 13 Sep 2021 02:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
In-Reply-To: <20210913084520.kkbsupogkzv226x3@gilmour>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Sep 2021 17:20:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
Message-ID: <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
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
X-CRM114-CacheID: sfid-20210913_022040_436519_579B9D7F 
X-CRM114-Status: GOOD (  23.79  )
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

On Mon, Sep 13, 2021 at 4:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
> > From: Liu Shaohua <liush@allwinnertech.com>
> >
> > Add Allwinner kconfig option which selects SoC specific and common
> > drivers that is required for this SoC.
> >
> > Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> > interconnect issues for dma synchronization, so we set the default
> > value when SOC_SUNXI selected.
> >
> > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Drew Fustini <drew@beagleboard.org>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Wei Wu <lazyparser@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs      | 15 +++++++++++++++
> >  arch/riscv/configs/defconfig |  1 +
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 30676ebb16eb..8721c000ef23 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif
> >
> > +config SOC_SUNXI
> > +     bool "Allwinner SoCs"
> > +     depends on MMU
> > +     select DWMAC_GENERIC
> > +     select ERRATA_THEAD
> > +     select RISCV_DMA_NONCOHERENT
> > +     select RISCV_ERRATA_ALTERNATIVE
> > +     select SERIAL_8250
> > +     select SERIAL_8250_CONSOLE
> > +     select SERIAL_8250_DW
> > +     select SIFIVE_PLIC
> > +     select STMMAC_ETH
> > +     help
> > +       This enables support for Allwinner SoC platforms like the D1.
> > +
>
> I'm not sure we should select the drivers there. We could very well
> imagine a board without UART, or even more so without ethernet.
We just want people could bring D1 up easier, 8250 is the basic component.


>
> These options should be in the defconfig.
>
> Maxime



--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
