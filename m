Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DB5ECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DR5rb4lYkObpTscIG2DUV61+2u6G2EUyhZ1XPObh8jo=; b=0Kj++91mmq21uM
	dDGgHkylR6KaIjFT7eIhZqAJuWAaB5SW3gJiuv0JYcrdUhBZMXcTvboxpLSiOsI5KIC+amBZH0SF1
	W7Cpt4cmdKoGAJ2rkpW/hljykS2iaZlKVmEI6WXoq324oov3Vy8yKEtY5/329vVGdd0/lgOWQdmU/
	m1CLMiGwv8eK4tI3guogOGGc8f+KJvE2T/MpmhMm9E98WZSMj+5HNTc+7AoiRzsr76BnCvSnqyNvo
	gYrm6BQGtB4MwJov4d8HdzeN08JDYlyfpwNoFp+qw+5b5TgMFccm/uVvjOqq+R17GR+varGmWExsW
	qRI0dp9Hj7bGGTCYY8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCMY-000WBD-Jq; Thu, 08 Sep 2022 07:54:14 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCMV-000W5n-Nq
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 07:54:13 +0000
Received: by mail-io1-xd2d.google.com with SMTP id i77so13424095ioa.7
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=V15tNs76FIBdL6ICeOc2Y5s2dx2wMsfR5jTrTb84qfc=;
        b=Jnsk4FgaSjNLg6k3hpK0j95hsZJk1g6W6jHM2NL6vKIyfiCD5Hnv7x1SpahBPAMpBM
         x0ijJIOC/oERIs8hpwHI74/uWUQHUdlxWJ6aScEQ6lAyWMle6Mqkbi8SMhgfqsqE5Wx6
         NcDnVez5zb5sdX5M1heP5V9pGrQ8F6uL3xKMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=V15tNs76FIBdL6ICeOc2Y5s2dx2wMsfR5jTrTb84qfc=;
        b=3iuEgF8yrXCkTX0WhbPlzICOnQDVmJkk0FtWEFwy9ymwGnyapOapRRKsvBjc/A4JvP
         uLApmXtcs8DNzQz0W63CNognWSGE3TBIwX4E8CPGlQAOIwdBqkVtv7trn4keUECSfDna
         OluP9i5uckZIJiCm0WasfX1Cr9sOKq9NkVOoIlSeZAtBCryS+1B7KUXSn5uH+iP2WxLZ
         eG+4qSP7xZ97JyV9zyGkAv9kDXbhoTZ4BvKaR2DBORgbfvXpAy5ozC+Eh8He/QrW0Ldm
         nwfRAp1age2XJqjcMgEIN/N581N5L+c3VDLgdXowSgvJw0scVCKXlQ8DBgUhO7O2fGYH
         LCXQ==
X-Gm-Message-State: ACgBeo23UhYjLsm0TUnvAq3WMcrqi0wKMvGmAUdEJpixWhxMi0c3sBlV
	cbiD5BFRWZ6YUzeWekKOSh7lDEovGXEZwVd6WP6X
X-Google-Smtp-Source: AA6agR4kttmue2Ju1D3OglXn0lMSQ8qklWMP3mDvqhlAdgh1ZhTm6H6w9xWSg01HLhbQfwKNm+Ds0Kk7HupT1ioZ6xs=
X-Received: by 2002:a6b:c504:0:b0:68b:6802:2bfe with SMTP id
 v4-20020a6bc504000000b0068b68022bfemr3634552iof.22.1662623647504; Thu, 08 Sep
 2022 00:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <20220906074509.928865-3-ajones@ventanamicro.com> <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
 <20220908071157.ajjascv5ebhbwhv4@kamzik>
In-Reply-To: <20220908071157.ajjascv5ebhbwhv4@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 8 Sep 2022 00:53:56 -0700
Message-ID: <CAOnJCU+WJVLkprxSRdRqWt=PasMankOfrbOGf4-m6VW8xGR=BQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_005412_057016_8D217E09 
X-CRM114-Status: GOOD (  41.67  )
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

On Thu, Sep 8, 2022 at 12:11 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Sep 07, 2022 at 03:47:09PM -0700, Atish Patra wrote:
> > On Tue, Sep 6, 2022 at 12:45 AM Andrew Jones <ajones@ventanamicro.com>
> > wrote:
> >
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > >
> > > This fixes two issues: I truncated the warning's hart ID when porting to
> > > the 64-bit hart ID code, and the original code's warning handling could
> > > fire on an uninitialized hart ID.
> > >
> > > The biggest change here is that riscv_cbom_block_size is no longer
> > > initialized, as IMO the default isn't sane: there's nothing in the ISA
> > > that mandates any specific cache block size, so falling back to one will
> > > just silently produce the wrong answer on some systems.  This also
> > > changes the probing order so the cache block size is known before
> > > enabling Zicbom support.
> > >
> > > Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the
> > > t-head variant")
> > > Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using
> > > zicbom extension")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > [Rebased on Anup's move patch and applied Conor Dooley's and Heiko
> > >  Stuebner's changes.]
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/errata/thead/errata.c |  1 +
> > >  arch/riscv/kernel/setup.c        |  2 +-
> > >  arch/riscv/mm/cacheflush.c       | 21 +++++++++++----------
> > >  arch/riscv/mm/dma-noncoherent.c  |  2 ++
> > >  4 files changed, 15 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/arch/riscv/errata/thead/errata.c
> > > b/arch/riscv/errata/thead/errata.c
> > > index 202c83f677b2..96648c176f37 100644
> > > --- a/arch/riscv/errata/thead/errata.c
> > > +++ b/arch/riscv/errata/thead/errata.c
> > > @@ -37,6 +37,7 @@ static bool errata_probe_cmo(unsigned int stage,
> > >         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > >                 return false;
> > >
> > > +       riscv_cbom_block_size = L1_CACHE_BYTES;
> > >         riscv_noncoherent_supported();
> > >         return true;
> > >  #else
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index 95ef6e2bf45c..2dfc463b86bb 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
> > >         setup_smp();
> > >  #endif
> > >
> > > -       riscv_fill_hwcap();
> > >         riscv_init_cbom_blocksize();
> > > +       riscv_fill_hwcap();
> > >         apply_boot_alternatives();
> > >  }
> > >
> > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > index 336c5deea870..e5b087be1577 100644
> > > --- a/arch/riscv/mm/cacheflush.c
> > > +++ b/arch/riscv/mm/cacheflush.c
> > > @@ -89,39 +89,40 @@ void flush_icache_pte(pte_t pte)
> > >  }
> > >  #endif /* CONFIG_MMU */
> > >
> > > -unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> > > +unsigned int riscv_cbom_block_size;
> > >
> > >  #ifdef CONFIG_RISCV_ISA_ZICBOM
> > >  void riscv_init_cbom_blocksize(void)
> > >  {
> > >         struct device_node *node;
> > > +       unsigned long cbom_hartid;
> > > +       u32 val, probed_block_size;
> > >         int ret;
> > > -       u32 val;
> > >
> > > +       probed_block_size = 0;
> > >         for_each_of_cpu_node(node) {
> > >                 unsigned long hartid;
> > > -               int cbom_hartid;
> > >
> > >                 ret = riscv_of_processor_hartid(node, &hartid);
> > >                 if (ret)
> > >                         continue;
> > >
> > > -               if (hartid < 0)
> > > -                       continue;
> > > -
> > >                 /* set block-size for cbom extension if available */
> > >                 ret = of_property_read_u32(node, "riscv,cbom-block-size",
> > > &val);
> > >                 if (ret)
> > >                         continue;
> > >
> > > -               if (!riscv_cbom_block_size) {
> > > -                       riscv_cbom_block_size = val;
> > > +               if (!probed_block_size) {
> > > +                       probed_block_size = val;
> > >                         cbom_hartid = hartid;
> > >                 } else {
> > > -                       if (riscv_cbom_block_size != val)
> > > -                               pr_warn("cbom-block-size mismatched
> > > between harts %d and %lu\n",
> > > +                       if (probed_block_size != val)
> > > +                               pr_warn("cbom-block-size mismatched
> > > between harts %lu and %lu\n",
> > >                                         cbom_hartid, hartid);
> > >
> >
> > Maybe add more info saying the first one will be selected in that case as
> > it is just a warning.
>
> If we detect a mismatch then should we disable the CMO extension? The
> current spec says "size of a cache block shall be uniform throughout the
> system", even though that may be relaxed in later extensions. I also now

I did not mean that. We don't support hetergenous capabilities anyways.
For the mismatched ISA strings, we pick the common across all the harts.
I think we are okay with the patch as it is. I was just suggesting a
more verbose warning message
to the user indicating the chosen block size was the discovered first
one so that user at least knows
which block size is in use.

> recall you suggested that when DT parsing ends up with a zero block size
> we should disable the CMO extension. riscv_init_cbom_blocksize() still
> doesn't handle zeros in the DT correctly, even with this patch, though.
> For example, if the first harts parsed are zero, but the latter harts
> all match, we won't even get the mismatch warning.
>

Yes. That was a completely different context. I am not yet sure what
should be the expected behavior
for zero block size. I did not find anything specific about it in the
Zicbom spec.

If it is expected to be disabled, we should do it. It can definitely
in a follow up patch.

> But, for now, my preference would be to merge this patch, as it's an
> improvement on its own. I can try to write another patch which handles
> zeros and mismatches by disabling the feature. What do you think?
>
> Thanks,
> drew
>
> >
> >
> > >                 }
> > >         }
> > > +
> > > +       if (probed_block_size)
> > > +               riscv_cbom_block_size = probed_block_size;
> > >  }
> > >  #endif
> > > diff --git a/arch/riscv/mm/dma-noncoherent.c
> > > b/arch/riscv/mm/dma-noncoherent.c
> > > index 3f502a1a68b1..d919efab6eba 100644
> > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > @@ -74,5 +74,7 @@ void arch_setup_dma_ops(struct device *dev, u64
> > > dma_base, u64 size,
> > >
> > >  void riscv_noncoherent_supported(void)
> > >  {
> > > +       WARN(!riscv_cbom_block_size,
> > > +            "Non-coherent DMA support enabled without a block size\n");
> > >         noncoherent_supported = true;
> > >  }
> > > --
> > > 2.37.2
> > >
> > >
> > Otherwise, LGTM.
> >
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> >
> > --
> > Regards,
> > Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
