Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ECBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fo8V/0QhkKJBSne/k2kxG0qrNSVuCK724KX/4zLb0Rw=; b=YgEFFxdUONzCB5
	p23SkBuk7KjZSiYlVlYBM0SoJE9ZGHuBhGFyt2ztpx5FLXAzaViU9ijZTcGnjZsSiZW0QwNu/hMBU
	oyTUqdHNoY/C2Z8f0LiSOrh7+x82F+aVd9/q+FxTc+ZA5tATRFZiMv7BH0MQNgrW7phtXWxqTAKuB
	sA6AAGGPriVuT2R5hVghUs1UF2tDPImZsLz0e4el2PFtT64/OeY+8YNlhCf4HNTpLC4aejmxx4xt8
	KXQkJ1onHuk8KPkjjDsoXPCXTlEh9ZEaaq5xBf4VI+FO8Y6gc7afa8n7QiBb2wYUI1bkLpubyqAG7
	vK/3+Okm4U14U/sOfCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVMU-00H1Se-Q6; Mon, 14 Nov 2022 09:02:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVMR-00H1Qd-Mo
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:02:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id x102so1037427ede.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85z0FueDeeX/w3Y1hW/rg/FK4TTzV51haj7VJfYVY+Y=;
        b=cU/WGLQ47YlFBkz3SzXQW8qPwSrx7snlBaAhdRLW+iIppj875eVKouALr1r6Ssoawj
         ivLTT4BZaYq0tJRlgjO7d0u9UdCljcFSmJwP+tlAlHn+Rcyv9/M2K9c1eVrDdmrsJE6m
         oBF17BbXOLaUKZLQ6ZgdbB9SS40xQDkppzLydGIIXD6YSF0oNGQeTXscgaPFsBBFAuTn
         FShRXbiLv7/Z4w/Cc/9yVxbEwyNlRQ5eXNjmAWN2Km7SwXZztalajPPmdsxDsR9syJzS
         vUEXI14K4YyhyIXBLn84xY6a61ylhdHu+R+xG7PBE4NQnAaeSo/E3NzQ9Lyh08VLBbVh
         MucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85z0FueDeeX/w3Y1hW/rg/FK4TTzV51haj7VJfYVY+Y=;
        b=e3VfczrcmzF5BlqnmwyNOdiN2Dc4urCmo6pO0tJvL9j9B9h59CBzlGCfXgbz8xNHRZ
         IPo8K3ZR80ewF5LdXAi8kj76ze+eawFI8ur+DCo6foeeS1zDtxFUqlbIfDsLPD4wLqjf
         CnYeqWYAafk0j+ZHFzroHfr4imWU+7htdBOBU+JAA3R46K0rk9oucg5tkg6TwXxGunYM
         5MyCe6uqYguVwFjcZE8lAsAbrd2bEQv6x4kTIDUmpmgK5+LGZIgtLvQMxDyPepNnCcNM
         jv0ZChKtcsw/hxkK/VoHeBV/V8Z6E2WSssp//DQSxfROMJtxRFeWCTUhPoax7kvIsxC7
         PKmg==
X-Gm-Message-State: ANoB5pllZLaVcdP7jN7lFxEtPKicjRYyzw+2odI8PFZQSLgwO7vDyYCe
	awneHpSOR+ka9Aiceog+PuLfUAj4Cc/TMnJHrUWsCA==
X-Google-Smtp-Source: AA0mqf6nXnxNB8DjWcrr7dD1lyFcvSY2ucw4lFnep9j5lmKVTaWv/vUXrbIG1XG/rUmaJHYaxbihG59sQwcMeJW5edY=
X-Received: by 2002:a50:d657:0:b0:461:17e9:4ea3 with SMTP id
 c23-20020a50d657000000b0046117e94ea3mr10358974edj.49.1668416553238; Mon, 14
 Nov 2022 01:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20221020075846.305576-1-apatel@ventanamicro.com>
 <20221020075846.305576-4-apatel@ventanamicro.com> <Y1bs50GXeUoTcv2V@spud>
In-Reply-To: <Y1bs50GXeUoTcv2V@spud>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Nov 2022 14:32:04 +0530
Message-ID: <CAAhSdy317XVDXO6DPaEwL7_xBbAO=RTmfQMiMu5DAdWOLa1iTA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] RISC-V: Implement arch specific PMEM APIs
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010235_986356_9C20E799 
X-CRM114-Status: GOOD (  23.53  )
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

On Tue, Oct 25, 2022 at 1:22 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Oct 20, 2022 at 01:28:45PM +0530, Anup Patel wrote:
> > The NVDIMM PMEM driver expects arch specific APIs for cache maintenance
> > and if arch does not provide these APIs then NVDIMM PMEM driver will
> > always use MEMREMAP_WT to map persistent memory which in-turn maps as
> > UC memory type defined by the RISC-V Svpbmt specification.
> >
> > Now that the Svpbmt and Zicbom support is available in RISC-V kernel,
> > we implement PMEM APIs using ALT_CMO_OP() macros so that the NVDIMM
> > PMEM driver can use MEMREMAP_WB to map persistent memory.
> >
> > Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig     |  1 +
> >  arch/riscv/mm/Makefile |  1 +
> >  arch/riscv/mm/pmem.c   | 21 +++++++++++++++++++++
> >  3 files changed, 23 insertions(+)
> >  create mode 100644 arch/riscv/mm/pmem.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6b48a3ae9843..025e2a1b1c60 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -25,6 +25,7 @@ config RISCV
> >       select ARCH_HAS_GIGANTIC_PAGE
> >       select ARCH_HAS_KCOV
> >       select ARCH_HAS_MMIOWB
> > +     select ARCH_HAS_PMEM_API
> >       select ARCH_HAS_PTE_SPECIAL
> >       select ARCH_HAS_SET_DIRECT_MAP if MMU
> >       select ARCH_HAS_SET_MEMORY if MMU
> > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > index d76aabf4b94d..3b368e547f83 100644
> > --- a/arch/riscv/mm/Makefile
> > +++ b/arch/riscv/mm/Makefile
> > @@ -31,3 +31,4 @@ endif
> >
> >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> >  obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
> > +obj-$(CONFIG_ARCH_HAS_PMEM_API) += pmem.o
>
> Hey Anup,
> Might be a silly question - ARCH_HAS_PMEM_API is unconditionally enabled
> right? It should therefore be okay to make this an obj-y?

Yes, it is simpler to just add pmem.o in obj-y

I will update and send v6.

Thanks,
Anup


> Thanks
> Conor.
>
> > diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
> > new file mode 100644
> > index 000000000000..089df92ae876
> > --- /dev/null
> > +++ b/arch/riscv/mm/pmem.c
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2022 Ventana Micro Systems Inc.
> > + */
> > +
> > +#include <linux/export.h>
> > +#include <linux/libnvdimm.h>
> > +
> > +#include <asm/cacheflush.h>
> > +
> > +void arch_wb_cache_pmem(void *addr, size_t size)
> > +{
> > +     ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
> > +}
> > +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
> > +
> > +void arch_invalidate_pmem(void *addr, size_t size)
> > +{
> > +     ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
> > +}
> > +EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
