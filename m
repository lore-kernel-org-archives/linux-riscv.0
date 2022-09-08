Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC332ECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6cFNnB1WNqRMfCW6y0Cq6oKDRgfc1Aau8LtPb4VkNQ=; b=l0I0egqipa6e5K
	0ctfPiIJd7gSvaJzBfHoXmlsZdFfXWYVmbo+vMekhqThDQc3qo03PW6ohdzBgCNOFT6k2py83AJSe
	oyo7HTxTRk0Rmh5enP5quv7xRi/Kw1GC8uXNJZYhuk27DiLicV/9UzusnkHIu0XMYBCNLZTH4SFHH
	gH8vp+w1nsJwo3rqauQJHmnkR+VU4JHPFXdCgRpRRFhnq/VscD04dxftpsQE4OWbn/ky7GgaDeovR
	QXsuLpVbGqQqNhuEYYKNCx7b5/1G16LxOyn3oNXdEhuu5A7xDl8gsfaItNYz7XImCsDwbW2yuhCYk
	OQPAIlWQExNcVdTEyt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBhm-000BWm-I7; Thu, 08 Sep 2022 07:12:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBhj-000BOO-J4
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 07:12:05 +0000
Received: by mail-ej1-x633.google.com with SMTP id r18so8668222eja.11
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/k87ornRZBOmHg/mP0H1m5aav6a/+lA/NzsOHf7czKc=;
        b=lJx1QXm/XwwZM+CNr5fqgh6xYsFDx8ZeYkwl1qGhoABz+38Wzina7iE/46cYJwAQFY
         77QyQE37YdnsS2U0vGBDcMpJ3uoXN3nt1ailODNjc5eVqbkT+lO7TyNZ95H/GcHHpfiL
         saD0MjrGVy8M5UIx8Swai6ZET99ZQzWW+lB6UudABSge0A6aASHL1UP8wgYzZXTWH0J5
         4uXiEP5RRqt5ZLahhxUxRTWTdt/lhCEyn8mhUDhcAl7Ub3fQTc9luMOyh5oP+5myPO0g
         WoThaXmrCfpLqFtDzcNUfTRaDQtte1PR4hsHzDWrye4LYpFuIxQmyMDYkXntL8utk5+v
         MpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/k87ornRZBOmHg/mP0H1m5aav6a/+lA/NzsOHf7czKc=;
        b=hf9NnkiJw8XKlZe9W3a9dehQ5S3WLBaWOH5r3YkPJK1Y9jYJdClxqqBg8kxbgWZKb+
         yj3JzzDhQe2BSl0ihR9CixYfy8/pQWb9Oe3aBZAWWo0O31DsjuklMThk1xQNwxXz0CYC
         MRUUfue7HyDnGpJn3FgNDCG5lhO99saxHJUHGsZMJo30xrZZA/mhRkMkvSsaIu5TBlqd
         WdLMjU7u5hR75fE/BsyYlzA4WigDnT7Whu4zf2NQXZ2lor6WAIJQs2U679STsxVzF2Rp
         qtMVNh01zhMciwIHdZzpU9DBoB+5p6UoNGWQkr0HujWOm5Hk9BX7jM/kOdIbQFFDILuI
         17pA==
X-Gm-Message-State: ACgBeo3SYAj0fFVJkfjXOxG3YCYxEYbezv/OgCKOgsKxFUNmcU09QD1t
	fmPhvseb9c2RAN7ZmwD/7JUExyCj3CVVkw==
X-Google-Smtp-Source: AA6agR7dokGDq1JFvLIZQh05sHXDTaPRiv6QlnhZox27WnET9cnJ+CKTBSVYQUz53k7mNgqicRDTyA==
X-Received: by 2002:a17:907:3f15:b0:741:7ab9:1c5a with SMTP id hq21-20020a1709073f1500b007417ab91c5amr4813789ejc.369.1662621118821;
        Thu, 08 Sep 2022 00:11:58 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id s6-20020aa7c546000000b00448cb764290sm7477793edr.92.2022.09.08.00.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 00:11:58 -0700 (PDT)
Date: Thu, 8 Sep 2022 09:11:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Message-ID: <20220908071157.ajjascv5ebhbwhv4@kamzik>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <20220906074509.928865-3-ajones@ventanamicro.com>
 <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_001203_656905_96CB3DD4 
X-CRM114-Status: GOOD (  35.36  )
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

On Wed, Sep 07, 2022 at 03:47:09PM -0700, Atish Patra wrote:
> On Tue, Sep 6, 2022 at 12:45 AM Andrew Jones <ajones@ventanamicro.com>
> wrote:
> 
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > This fixes two issues: I truncated the warning's hart ID when porting to
> > the 64-bit hart ID code, and the original code's warning handling could
> > fire on an uninitialized hart ID.
> >
> > The biggest change here is that riscv_cbom_block_size is no longer
> > initialized, as IMO the default isn't sane: there's nothing in the ISA
> > that mandates any specific cache block size, so falling back to one will
> > just silently produce the wrong answer on some systems.  This also
> > changes the probing order so the cache block size is known before
> > enabling Zicbom support.
> >
> > Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the
> > t-head variant")
> > Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using
> > zicbom extension")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > [Rebased on Anup's move patch and applied Conor Dooley's and Heiko
> >  Stuebner's changes.]
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/errata/thead/errata.c |  1 +
> >  arch/riscv/kernel/setup.c        |  2 +-
> >  arch/riscv/mm/cacheflush.c       | 21 +++++++++++----------
> >  arch/riscv/mm/dma-noncoherent.c  |  2 ++
> >  4 files changed, 15 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/riscv/errata/thead/errata.c
> > b/arch/riscv/errata/thead/errata.c
> > index 202c83f677b2..96648c176f37 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -37,6 +37,7 @@ static bool errata_probe_cmo(unsigned int stage,
> >         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> >                 return false;
> >
> > +       riscv_cbom_block_size = L1_CACHE_BYTES;
> >         riscv_noncoherent_supported();
> >         return true;
> >  #else
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 95ef6e2bf45c..2dfc463b86bb 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
> >         setup_smp();
> >  #endif
> >
> > -       riscv_fill_hwcap();
> >         riscv_init_cbom_blocksize();
> > +       riscv_fill_hwcap();
> >         apply_boot_alternatives();
> >  }
> >
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 336c5deea870..e5b087be1577 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -89,39 +89,40 @@ void flush_icache_pte(pte_t pte)
> >  }
> >  #endif /* CONFIG_MMU */
> >
> > -unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> > +unsigned int riscv_cbom_block_size;
> >
> >  #ifdef CONFIG_RISCV_ISA_ZICBOM
> >  void riscv_init_cbom_blocksize(void)
> >  {
> >         struct device_node *node;
> > +       unsigned long cbom_hartid;
> > +       u32 val, probed_block_size;
> >         int ret;
> > -       u32 val;
> >
> > +       probed_block_size = 0;
> >         for_each_of_cpu_node(node) {
> >                 unsigned long hartid;
> > -               int cbom_hartid;
> >
> >                 ret = riscv_of_processor_hartid(node, &hartid);
> >                 if (ret)
> >                         continue;
> >
> > -               if (hartid < 0)
> > -                       continue;
> > -
> >                 /* set block-size for cbom extension if available */
> >                 ret = of_property_read_u32(node, "riscv,cbom-block-size",
> > &val);
> >                 if (ret)
> >                         continue;
> >
> > -               if (!riscv_cbom_block_size) {
> > -                       riscv_cbom_block_size = val;
> > +               if (!probed_block_size) {
> > +                       probed_block_size = val;
> >                         cbom_hartid = hartid;
> >                 } else {
> > -                       if (riscv_cbom_block_size != val)
> > -                               pr_warn("cbom-block-size mismatched
> > between harts %d and %lu\n",
> > +                       if (probed_block_size != val)
> > +                               pr_warn("cbom-block-size mismatched
> > between harts %lu and %lu\n",
> >                                         cbom_hartid, hartid);
> >
> 
> Maybe add more info saying the first one will be selected in that case as
> it is just a warning.

If we detect a mismatch then should we disable the CMO extension? The
current spec says "size of a cache block shall be uniform throughout the
system", even though that may be relaxed in later extensions. I also now
recall you suggested that when DT parsing ends up with a zero block size
we should disable the CMO extension. riscv_init_cbom_blocksize() still
doesn't handle zeros in the DT correctly, even with this patch, though.
For example, if the first harts parsed are zero, but the latter harts
all match, we won't even get the mismatch warning.

But, for now, my preference would be to merge this patch, as it's an
improvement on its own. I can try to write another patch which handles
zeros and mismatches by disabling the feature. What do you think?

Thanks,
drew

> 
> 
> >                 }
> >         }
> > +
> > +       if (probed_block_size)
> > +               riscv_cbom_block_size = probed_block_size;
> >  }
> >  #endif
> > diff --git a/arch/riscv/mm/dma-noncoherent.c
> > b/arch/riscv/mm/dma-noncoherent.c
> > index 3f502a1a68b1..d919efab6eba 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -74,5 +74,7 @@ void arch_setup_dma_ops(struct device *dev, u64
> > dma_base, u64 size,
> >
> >  void riscv_noncoherent_supported(void)
> >  {
> > +       WARN(!riscv_cbom_block_size,
> > +            "Non-coherent DMA support enabled without a block size\n");
> >         noncoherent_supported = true;
> >  }
> > --
> > 2.37.2
> >
> >
> Otherwise, LGTM.
> 
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> 
> -- 
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
