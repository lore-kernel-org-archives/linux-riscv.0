Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBCEECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtwikDeIGsxX8+X5WIRtU0b2d5XKLVSti01MRRK8u8Y=; b=Mu/KoJH5oiawiL
	6yL9y3ygrgoW3ud4O48LmywbqINgmZIbqtaYNWme4+OpDogW9SipPn2FHAm5C8p4Qi0mCwKpuGsDI
	tjSF0zyNrWglYq311zZdac9WPGwmBgiV6HoHqN3KsKpZ+7pxkoH6WkPW8RSbS/jgMNaSXG3dMKeUj
	kYqIT0KGXTXURCEuB74gLIM6f9oh/7eg/jMASYNjWoVoaffYYC6dXodw52gIUSxurRTBngYVqMWpr
	tBt2r6PEP0WLnKWa6wwALGYVI1wWX1j8QF+rb6DilrOuXSk2IsMqgt4Sw/8Q5nOuywXuEwLqZqmr1
	PVQZv2PsdCL3C2iye/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWEQ4-002F5m-6h; Thu, 08 Sep 2022 10:06:00 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWEQ1-002F4A-FF
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 10:05:59 +0000
Received: by mail-ej1-x62b.google.com with SMTP id nc14so36847157ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=0vJoQvccckvEPdW3PlHWOJnLX0LiOPN9sH4dHNDk8aA=;
        b=Vdepcr1rabAELDJQHDmEHw+V+9RtXtqjceymjZrKzDGtJQv4F6C3RFlNqd7gDkyC/A
         JTPB3YMngQ5jBQKyTkmDu+ELdTJTOOh48ynRoxMGVKhGbnKiLsdwE9aTw3Nggm6oTtw+
         LvT23udLwrsC0pgHyHQmICA8e3/bA7VukpHpp+rnN+lkUm7ccQYcr0EhkrA/+L0zbEuT
         NLH6a/4nR+WKavYWmo72Dy4OUezi8FM9I8PnPrOBROM+wfIzK/wXZWfMlE30kIYMbaBb
         Ncw5jT5iepGwHhPpy9vM9uN67t6Ki9OgpHVQtvzY9F6zM/wYksUKoyj4KR0sd9+JzGmz
         Rjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0vJoQvccckvEPdW3PlHWOJnLX0LiOPN9sH4dHNDk8aA=;
        b=ItOMZq2B9X1omm3u3LQPlbLV3vyOgvbnaA6kKJSYOdCte+wu+0GcsOIjy0gjfwUrwO
         haw6gJ+020QmX8j/RRCsbMTnePVPIDJADytA5DXXU6jd5q921f7Mdj0MhXAdKYNkGgIA
         5V5S5ZVEjnyUNCMok1FIB58IkF7w3adAjl6rHsWgDqAQLxRmqxyIE3qLEqV/RsG/AmH+
         EKdjjzTMH6anuN0H/iwvhjr+blRHK96NH5TldBT+eeA47pQKen3rZZSkPIjWtDKYwpxv
         ieTPv7OUHbF8g6gqoEXTEu67YYbPm3aV04/WvTb5CkbHzc+7puIAPDqG3sJL3FvBF4zd
         dEqA==
X-Gm-Message-State: ACgBeo2kNShsE9DfvpwVdC684ARwLLoPY03wY7Fve6QAEIdjdJOoB97g
	wEtjFz8pKlC+rl7q/2T7JsR3OQ==
X-Google-Smtp-Source: AA6agR7xdVe+jbMFDj9qSdZWMk2fWlmYpjiVFJdOF8VKzN1STg/TminpxG/sdFJZlgH8B4n50BFRJA==
X-Received: by 2002:a17:907:16a9:b0:742:7a6:b17e with SMTP id hc41-20020a17090716a900b0074207a6b17emr5562917ejc.108.1662631555017;
        Thu, 08 Sep 2022 03:05:55 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id q3-20020a056402040300b004466f5375a5sm12219925edv.53.2022.09.08.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 03:05:54 -0700 (PDT)
Date: Thu, 8 Sep 2022 12:05:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Message-ID: <20220908100553.jr2xxmzzbdlwvm3y@kamzik>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
 <20220908071157.ajjascv5ebhbwhv4@kamzik>
 <5505900.JsnAkG3lO3@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5505900.JsnAkG3lO3@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_030557_538134_EADC20EA 
X-CRM114-Status: GOOD (  47.39  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 08, 2022 at 10:10:42AM +0200, Heiko St=FCbner wrote:
> Am Donnerstag, 8. September 2022, 09:11:57 CEST schrieb Andrew Jones:
> > On Wed, Sep 07, 2022 at 03:47:09PM -0700, Atish Patra wrote:
> > > On Tue, Sep 6, 2022 at 12:45 AM Andrew Jones <ajones@ventanamicro.com>
> > > wrote:
> > > =

> > > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > >
> > > > This fixes two issues: I truncated the warning's hart ID when porti=
ng to
> > > > the 64-bit hart ID code, and the original code's warning handling c=
ould
> > > > fire on an uninitialized hart ID.
> > > >
> > > > The biggest change here is that riscv_cbom_block_size is no longer
> > > > initialized, as IMO the default isn't sane: there's nothing in the =
ISA
> > > > that mandates any specific cache block size, so falling back to one=
 will
> > > > just silently produce the wrong answer on some systems.  This also
> > > > changes the probing order so the cache block size is known before
> > > > enabling Zicbom support.
> > > >
> > > > Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instruction=
s + the
> > > > t-head variant")
> > > > Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices u=
sing
> > > > zicbom extension")
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > [Rebased on Anup's move patch and applied Conor Dooley's and Heiko
> > > >  Stuebner's changes.]
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/errata/thead/errata.c |  1 +
> > > >  arch/riscv/kernel/setup.c        |  2 +-
> > > >  arch/riscv/mm/cacheflush.c       | 21 +++++++++++----------
> > > >  arch/riscv/mm/dma-noncoherent.c  |  2 ++
> > > >  4 files changed, 15 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/errata/thead/errata.c
> > > > b/arch/riscv/errata/thead/errata.c
> > > > index 202c83f677b2..96648c176f37 100644
> > > > --- a/arch/riscv/errata/thead/errata.c
> > > > +++ b/arch/riscv/errata/thead/errata.c
> > > > @@ -37,6 +37,7 @@ static bool errata_probe_cmo(unsigned int stage,
> > > >         if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > > >                 return false;
> > > >
> > > > +       riscv_cbom_block_size =3D L1_CACHE_BYTES;
> > > >         riscv_noncoherent_supported();
> > > >         return true;
> > > >  #else
> > > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > > index 95ef6e2bf45c..2dfc463b86bb 100644
> > > > --- a/arch/riscv/kernel/setup.c
> > > > +++ b/arch/riscv/kernel/setup.c
> > > > @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
> > > >         setup_smp();
> > > >  #endif
> > > >
> > > > -       riscv_fill_hwcap();
> > > >         riscv_init_cbom_blocksize();
> > > > +       riscv_fill_hwcap();
> > > >         apply_boot_alternatives();
> > > >  }
> > > >
> > > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > > index 336c5deea870..e5b087be1577 100644
> > > > --- a/arch/riscv/mm/cacheflush.c
> > > > +++ b/arch/riscv/mm/cacheflush.c
> > > > @@ -89,39 +89,40 @@ void flush_icache_pte(pte_t pte)
> > > >  }
> > > >  #endif /* CONFIG_MMU */
> > > >
> > > > -unsigned int riscv_cbom_block_size =3D L1_CACHE_BYTES;
> > > > +unsigned int riscv_cbom_block_size;
> > > >
> > > >  #ifdef CONFIG_RISCV_ISA_ZICBOM
> > > >  void riscv_init_cbom_blocksize(void)
> > > >  {
> > > >         struct device_node *node;
> > > > +       unsigned long cbom_hartid;
> > > > +       u32 val, probed_block_size;
> > > >         int ret;
> > > > -       u32 val;
> > > >
> > > > +       probed_block_size =3D 0;
> > > >         for_each_of_cpu_node(node) {
> > > >                 unsigned long hartid;
> > > > -               int cbom_hartid;
> > > >
> > > >                 ret =3D riscv_of_processor_hartid(node, &hartid);
> > > >                 if (ret)
> > > >                         continue;
> > > >
> > > > -               if (hartid < 0)
> > > > -                       continue;
> > > > -
> > > >                 /* set block-size for cbom extension if available */
> > > >                 ret =3D of_property_read_u32(node, "riscv,cbom-bloc=
k-size",
> > > > &val);
> > > >                 if (ret)
> > > >                         continue;
> > > >
> > > > -               if (!riscv_cbom_block_size) {
> > > > -                       riscv_cbom_block_size =3D val;
> > > > +               if (!probed_block_size) {
> > > > +                       probed_block_size =3D val;
> > > >                         cbom_hartid =3D hartid;
> > > >                 } else {
> > > > -                       if (riscv_cbom_block_size !=3D val)
> > > > -                               pr_warn("cbom-block-size mismatched
> > > > between harts %d and %lu\n",
> > > > +                       if (probed_block_size !=3D val)
> > > > +                               pr_warn("cbom-block-size mismatched
> > > > between harts %lu and %lu\n",
> > > >                                         cbom_hartid, hartid);
> > > >
> > > =

> > > Maybe add more info saying the first one will be selected in that cas=
e as
> > > it is just a warning.
> > =

> > If we detect a mismatch then should we disable the CMO extension?
> =

> From a user's pov I'd think their system might stop working with disabled
> cmo - for things like networking / mass storage or so.
> =

> Also the amount of misbehaviour might depend on weather the value is
> shrinking or expanding.
> =

> Going from block_size x -> x/2 will "just" result in some areas being
> handled twice, where going from x -> 2x will leave out some areas,
> when the cpu itself still just does "x" .
> =

> =

> An experiment on the D1 supports that thought ;-)
> with L1_CACHE_BYTES / 2, networking keeps working
> with L1_CACHE_BYTES * 2 (plus adapting MINALIGN) breaks networking.
> =

> =

> So I'd think, we should loudly warn about misconfiguration anyway,
> but could just use the smallest value as block_size (in a future patch)
> to keep the most amounts of systems running in such a case.

That sounds reasonable, but maybe we should even upgrade the pr_warn
to a pr_err. Given the current specification, we know that the mismatch
is a DT error, let's report it as such.

Thanks,
drew

> =

> =

> Heiko
> =

> =

> > The
> > current spec says "size of a cache block shall be uniform throughout the
> > system", even though that may be relaxed in later extensions. I also now
> > recall you suggested that when DT parsing ends up with a zero block size
> > we should disable the CMO extension. riscv_init_cbom_blocksize() still
> > doesn't handle zeros in the DT correctly, even with this patch, though.
> > For example, if the first harts parsed are zero, but the latter harts
> > all match, we won't even get the mismatch warning.
> > =

> > But, for now, my preference would be to merge this patch, as it's an
> > improvement on its own. I can try to write another patch which handles
> > zeros and mismatches by disabling the feature. What do you think?
> > =

> > Thanks,
> > drew
> > =

> > > =

> > > =

> > > >                 }
> > > >         }
> > > > +
> > > > +       if (probed_block_size)
> > > > +               riscv_cbom_block_size =3D probed_block_size;
> > > >  }
> > > >  #endif
> > > > diff --git a/arch/riscv/mm/dma-noncoherent.c
> > > > b/arch/riscv/mm/dma-noncoherent.c
> > > > index 3f502a1a68b1..d919efab6eba 100644
> > > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > > @@ -74,5 +74,7 @@ void arch_setup_dma_ops(struct device *dev, u64
> > > > dma_base, u64 size,
> > > >
> > > >  void riscv_noncoherent_supported(void)
> > > >  {
> > > > +       WARN(!riscv_cbom_block_size,
> > > > +            "Non-coherent DMA support enabled without a block size=
\n");
> > > >         noncoherent_supported =3D true;
> > > >  }
> > > > --
> > > > 2.37.2
> > > >
> > > >
> > > Otherwise, LGTM.
> > > =

> > > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > > =

> > =

> =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
