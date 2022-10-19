Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266DFC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fThQHM1tk5BfTvElIZV+udxYNWMOtyqLjSbscFTDAJM=; b=dYrVKDzpN/q/uC
	vkF9Vp0ESHc8CMUO8G0eMm8HEobaj7pUpURboZYPvoL8GBzc0A3tc8ytm+NzA1F3fxUm4e1E4VQAl
	1xhnCyqrB5XhALzGTTT4xBiS/rTE4fvvgSl3V+Zs7xy4MspCjw24dapv19dyxCzyo2U4EWNV3krNa
	uiSMrgOFtQLQOgWtCwllolXalByu4Llf032fF6oKKp5rGkGczoKdmb+ofQxsg1iOCzBHFNNQRtpRy
	rMejK65k5azLgswlAPJ7ImWgJOKuZlV5MG4cPFYmz4GIVvQEeg6vURZfkwPWb2MggIhGGs4YEYR3R
	qqr/tgG0qOMXFSHZ73pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8J5-001XDL-Fp; Wed, 19 Oct 2022 12:36:23 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8J0-001XBE-D7
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:36:21 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b1so27851808lfs.7
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oYN264dQZ8nr4oIPkUkzpYJVPgC0y1gnv/lMRuwW2jE=;
        b=Zs+cwTqRv3wsVXoxiS5bQeSD4Ce0xvVSTIvcUm9QZfLJ6SO7YHqwWqJl7Wa3DL8RSS
         n0dr67t6CBQYCtayX/KqWHUsphREEIFbvqVBOPVOR4NDt38eP9kFQl2HZfpracREfht7
         /5vDDtMutFZkiduO0IzNJiyoYc6EUb0kbUUljaBE1PGsub9WyyTmHlhANP2BLCa+PYfN
         X7tiAi1wEKlI2BAGfTyr9lk9fwPNjV3NyDvs3Xc0nl0EoygfBEK5w3+kyFUvNgg5GjLU
         xlJj6sSfYx0BEzmbcv+Iy1pK/dM6NjzNGqlRxOZCNXlTAbVhvf+ax5j6XljeAiCMYxKP
         17Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYN264dQZ8nr4oIPkUkzpYJVPgC0y1gnv/lMRuwW2jE=;
        b=ijXDZH7ju92HuP76MU0N8HpTrcQSXPBdtI5osO4CA7qB0mHaRvgXgxZAYQc1/DraGL
         kjV4a8hdi/18s7RY/9PgXeJlwS4nl8xNtgk6Hny/pnFgDWLhfbHJFH5CwG3RyU58meQp
         a5ti2f+he81sV94gGA1+ZJGfsCv2+eQhGWfAU8XltHk3o2xVeimJ+EzZzkXfeX6bs0sT
         4KyFg1SShz20nXcDATYKVs0mooJ+5iHNdYYjKv9ddvY/qBDEWZ0WrAmKrDzaZp5BCX45
         p5bI3pFjJaGdHKN9fpAT73BZ0KF2UfBLbOqi4X4bYYy5xZ7dS88U09ftumm279PZmizX
         YJxg==
X-Gm-Message-State: ACrzQf22r+NMzzwAOFd1vf/40NtBw4CU6NAotz/KZRXVylHU+QT6LkGX
	ixBDyVHOF1hIFsdQ7pkNUSovID2qY44Sxo6M+yTceih0Nmw=
X-Google-Smtp-Source: AMsMyM7UvBrzfcI2OROYmcF46yFodZk+wafe/oMoaM36W8zJIRnc+d014b4NTSf4EGFljsmbsmPxXQuSk5WiM266SlU=
X-Received: by 2002:a05:6512:31c9:b0:4a2:5349:7103 with SMTP id
 j9-20020a05651231c900b004a253497103mr2734896lfe.497.1666182975312; Wed, 19
 Oct 2022 05:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221019121622.179024-1-apatel@ventanamicro.com>
 <20221019121622.179024-2-apatel@ventanamicro.com> <5869751.lOV4Wx5bFT@phil>
In-Reply-To: <5869751.lOV4Wx5bFT@phil>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 19 Oct 2022 18:06:04 +0530
Message-ID: <CAK9=C2WZ4m=6JOeP6t+7FK-Jr5bp7+cjKLCApa9nuHFBFZwOTw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, kernel test robot <lkp@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_053618_464849_BDF035CB 
X-CRM114-Status: GOOD (  31.09  )
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

On Wed, Oct 19, 2022 at 6:01 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Anup,
>
> Am Mittwoch, 19. Oktober 2022, 14:16:19 CEST schrieb Anup Patel:
> > From: Andrew Jones <ajones@ventanamicro.com>
> >
> > riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> > be available and riscv_init_cbom_blocksize() should always be
> > invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
> > is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> > instructions in the kernel" not "pretend there isn't zicbom, even
> > when there is". When zicbom is available, whether the kernel enables
> > its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> > Ensure we can build KVM and that the block size is initialized even
> > when compiling without RISCV_ISA_ZICBOM.
>
> either I'm way very low on coffee or something is strange here :-) .
>
> I can fully grasp the need to init the cbom blocksize for guests, even when
> the main kernel isn't using it, but below in the patch itself it is still:

The Guest might have pass-through access to a device which is not
cache-coherent whereas Host might have all devices cache-coherent.

>
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +void riscv_init_cbom_blocksize(void)
> +{
> [...]
>
> so the init_cbom_blocksize function is still inside a RISCV_ISA_ZICBOM
> ifdef?

Argh, I mixed changes from my previous patch and Drew's patch.

I will quickly send v4. Thanks for catching.

Regards,
Anup

>
>
> Heiko
>
>
> >
> > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/mm/cacheflush.c      | 41 +++++++++++++++++++++++++++++++++
> >  arch/riscv/mm/dma-noncoherent.c | 41 ---------------------------------
> >  2 files changed, 41 insertions(+), 41 deletions(-)
> >
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 6cb7d96ad9c7..f318b2553612 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -3,6 +3,8 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <asm/cacheflush.h>
> >
> >  #ifdef CONFIG_SMP
> > @@ -86,3 +88,42 @@ void flush_icache_pte(pte_t pte)
> >               flush_icache_all();
> >  }
> >  #endif /* CONFIG_MMU */
> > +
> > +unsigned int riscv_cbom_block_size;
> > +EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> > +
> > +#ifdef CONFIG_RISCV_ISA_ZICBOM
> > +void riscv_init_cbom_blocksize(void)
> > +{
> > +     struct device_node *node;
> > +     unsigned long cbom_hartid;
> > +     u32 val, probed_block_size;
> > +     int ret;
> > +
> > +     probed_block_size = 0;
> > +     for_each_of_cpu_node(node) {
> > +             unsigned long hartid;
> > +
> > +             ret = riscv_of_processor_hartid(node, &hartid);
> > +             if (ret)
> > +                     continue;
> > +
> > +             /* set block-size for cbom extension if available */
> > +             ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > +             if (ret)
> > +                     continue;
> > +
> > +             if (!probed_block_size) {
> > +                     probed_block_size = val;
> > +                     cbom_hartid = hartid;
> > +             } else {
> > +                     if (probed_block_size != val)
> > +                             pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > +                                     cbom_hartid, hartid);
> > +             }
> > +     }
> > +
> > +     if (probed_block_size)
> > +             riscv_cbom_block_size = probed_block_size;
> > +}
> > +#endif
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > index b0add983530a..d919efab6eba 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -8,13 +8,8 @@
> >  #include <linux/dma-direct.h>
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/mm.h>
> > -#include <linux/of.h>
> > -#include <linux/of_device.h>
> >  #include <asm/cacheflush.h>
> >
> > -unsigned int riscv_cbom_block_size;
> > -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> > -
> >  static bool noncoherent_supported;
> >
> >  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> >       dev->dma_coherent = coherent;
> >  }
> >
> > -#ifdef CONFIG_RISCV_ISA_ZICBOM
> > -void riscv_init_cbom_blocksize(void)
> > -{
> > -     struct device_node *node;
> > -     unsigned long cbom_hartid;
> > -     u32 val, probed_block_size;
> > -     int ret;
> > -
> > -     probed_block_size = 0;
> > -     for_each_of_cpu_node(node) {
> > -             unsigned long hartid;
> > -
> > -             ret = riscv_of_processor_hartid(node, &hartid);
> > -             if (ret)
> > -                     continue;
> > -
> > -             /* set block-size for cbom extension if available */
> > -             ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > -             if (ret)
> > -                     continue;
> > -
> > -             if (!probed_block_size) {
> > -                     probed_block_size = val;
> > -                     cbom_hartid = hartid;
> > -             } else {
> > -                     if (probed_block_size != val)
> > -                             pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > -                                     cbom_hartid, hartid);
> > -             }
> > -     }
> > -
> > -     if (probed_block_size)
> > -             riscv_cbom_block_size = probed_block_size;
> > -}
> > -#endif
> > -
> >  void riscv_noncoherent_supported(void)
> >  {
> >       WARN(!riscv_cbom_block_size,
> >
>
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
