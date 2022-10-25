Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79BAECDFA1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 23:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/X1lDhjqviCLtNZU9Lj1chMBn2OwPrYZALgZ4lZbzLw=; b=aAoqdrdPiNZR9R
	rq4y26ZBDjykd07P3+9zEZ3907alCENcyMq+3jvbN7NvW8xXMggjGdBGpdE0yNafCP0kZq6gi05ZA
	u3L9ks0vnAuPoZteNbjayBj/kbV85hiY5eyXqlkg3/Ju2KISRe45Lit3WB3ZqDkLLsIt6rfEctD+q
	uFZEQ1I7oChq+11Mq/3+iY/t161K+kzSRWBW6sQ4oUa4v0++twbUBRxUUMjSPOrHgpDi+09NBYaLU
	s+PQ12VLb7hK5Z88wDVibERJX9p8kIUccb2MbToieTxsIYT0hGMMNb+R/a4MAb+3iAQu7OWaBsZEh
	TDQd4KoD81kQMTEQoQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onT20-007VdN-8i; Tue, 25 Oct 2022 23:08:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onT1w-007VcB-1x
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 23:08:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id f27so6180037eje.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Oct 2022 16:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D4lWEoP/oALrfx0SONbW6u4ecu86DqhOP2SYz2V+t0k=;
        b=q6X5t17YhB6QCn2eWuj957hfmNnSluBzBeKxrW/dDOc8FFg7aE6TZVMeOTbsoJqjz9
         RxM4lr3vuhfLGgs6AvPNMcKzdBQU9s9dR6FTGn2zKC+rxCwN/BpS3mYcBuptH9dUN1f9
         jVPve2wTvD7OXlBiWl3w/KJip1oZQAxKe+AuSSF/p5OmjGlqt4mUQ1ILruIWF451fVjM
         w35zLVRVbWlHTeCGzsYOVJt1wRcDpPExI7G9jgVbYxi+khbSwnLTOqtLPtfZJIbMVrAC
         7amfhUe8DBB6NhbQExIQ9VZAc26zfgfN5A0wUZRlBzX8xEg2vhr4PuIxMXaXAUj902QB
         m+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4lWEoP/oALrfx0SONbW6u4ecu86DqhOP2SYz2V+t0k=;
        b=fHSwaG+abyAk34FXiiyck6y0z71YnuZcycSwJz7rcUJaJSm1u6wxjJjegOF5Z7GiEy
         5d971X/ly3ufcjMRb66fbL+y1n1JnoIeu3kGUOjDSCgYrdtbr2zlN2NVe7on5qJnZ13R
         IoC+YAC7hupAdHRFfbaPBo6C2rm01jBG5PriMW+2N1o1kab+z/IZqHyTspIv7yku3VIJ
         Fawegwnrv5zRZC6qA7q0aQnOoqwfYLR1eBV/bLYeVYY0uNzD2K2M4LkuMF7E+yIBL50/
         OgRx3AyZUxeOXHWjvsmK3TyQbKKU7v+CWdXGxp/S+I5an4klcsX1uW+ZZwlgR4Giunr6
         9EkA==
X-Gm-Message-State: ACrzQf2cHTFFsvJglg1SW8aX+vz8BUgglp7KlJCj+ob4bm0nvoE40otB
	SiZgMRbAOBLOmW9xCf6HnzBYkK5GK84MQ6bsc4c=
X-Google-Smtp-Source: AMsMyM5fVNfLrZjj8LkeMT2+uefsbwyWzDFMCr2Fgc2ZZUZO0jEhXtYcbCbME8zpAJIsEQPle6VcAmvklNxNUlYMkEk=
X-Received: by 2002:a17:906:9bd8:b0:78d:85f9:36ae with SMTP id
 de24-20020a1709069bd800b0078d85f936aemr35228660ejc.342.1666739297313; Tue, 25
 Oct 2022 16:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXSk7RJa4JQNCV6hU9ZMeC3oSEj=MJhTtKauxaWpiGREw@mail.gmail.com>
In-Reply-To: <CAMuHMdXSk7RJa4JQNCV6hU9ZMeC3oSEj=MJhTtKauxaWpiGREw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Oct 2022 00:07:50 +0100
Message-ID: <CA+V-a8vaf+9MUVZbEdu=vyApsR72a_m5ZkUon+O0bvPkaw6TjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_160820_135519_B970D008 
X-CRM114-Status: GOOD (  47.66  )
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

Hi Geert,

Thank you for the review.

On Mon, Oct 24, 2022 at 3:22 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> (fixed Palmer's address)
>
> On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the AX45MP core, cache coherency is a specification option so it may
> > not be supported. In this case DMA will fail. As a workaround, firstly we
> > allocate a global dma coherent pool from which DMA allocations are taken
> > and marked as non-cacheable + bufferable using the PMA region as specified
> > in the device tree. Synchronization callbacks are implemented to
> > synchronize when doing DMA transactions.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> >
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
> >
> > This patch adds support to configure the memory attributes of the memory
> > regions as passed from the l2 cache node and exposes the cache management
> > ops.
> >
> > More info about PMA (section 10.3):
> > http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > This feature is based on the work posted [0] by Vincent Chen
> > <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
> >
> > [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -340,9 +340,14 @@ if RISCV
> >  config ARCH_R9A07G043
> >         bool "RISC-V Platform support for RZ/Five"
> >         select ARCH_RZG2L
> > +       select AX45MP_L2_CACHE
> > +       select DMA_GLOBAL_POOL
> > +       select RISCV_DMA_NONCOHERENT
> >         help
> >           This enables support for the Renesas RZ/Five SoC.
> >
> > +source "drivers/soc/renesas/rzf/Kconfig"
>
> s/rzf/rzfive/? (or "rz5"? "rzv"?)
>
OK, I'll rename it to rzfive instead.

> > +
> >  endif # RISCV
> >
> >  config RST_RCAR
> > diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
> > index 535868c9c7e4..a20cc7ad5b12 100644
> > --- a/drivers/soc/renesas/Makefile
> > +++ b/drivers/soc/renesas/Makefile
> > @@ -31,6 +31,10 @@ ifdef CONFIG_SMP
> >  obj-$(CONFIG_ARCH_R9A06G032)   += r9a06g032-smp.o
> >  endif
> >
> > +ifdef CONFIG_RISCV
> > +obj-y += rzf/
> > +endif
>
> obj-$(CONFIG_RISCV)
>
Agreed.

> > --- /dev/null
> > +++ b/drivers/soc/renesas/rzf/Kconfig
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config AX45MP_L2_CACHE
> > +       bool "AX45MP L2 Cache controller"
>
> Andes Technology ...
>
OK, "Andes Technology AX45MP L2 Cache controller"

> > +       help
> > +         Support for the L2 cache controller on AX45MP platforms.
>
> ... Andes Technology ...
>
OK.

> > --- /dev/null
> > +++ b/drivers/soc/renesas/rzf/ax45mp_cache.c
> > @@ -0,0 +1,431 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PMA setup and non-coherent cache functions for AX45MP
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/cacheflush.h>
> > +#include <linux/cacheinfo.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +
> > +#include <asm/sbi.h>
> > +
> > +#include "ax45mp_sbi.h"
> > +
> > +/* L2 cache registers */
> > +#define AX45MP_L2C_REG_CTL_OFFSET              0x8
> > +#define AX45MP_L2C_IPREPETCH_OFF               3
> > +#define AX45MP_L2C_DPREPETCH_OFF               5
> > +#define AX45MP_L2C_IPREPETCH_MSK               (3 << AX45MP_L2C_IPREPETCH_OFF)
> > +#define AX45MP_L2C_DPREPETCH_MSK               (3 << AX45MP_L2C_DPREPETCH_OFF)
>
> #define AX45MP_L2C_IPREPETCH    GENMASK(4, 3)
> etc., and then you can use the FIELD_PREP() macros.
>
Agreed, now that we have decided to drop the setup of l2c controls the
above macros can be dropped.

> > +#define AX45MP_L2C_TRAMOCTL_OFF                        8
> > +#define AX45MP_L2C_TRAMICTL_OFF                        10
> > +#define AX45MP_L2C_TRAMOCTL_MSK                        (3 << AX45MP_L2C_TRAMOCTL_OFF)
> > +#define AX45MP_L2C_TRAMICTL_MSK                        BIT(AX45MP_L2C_TRAMICTL_OFF)
> > +#define AX45MP_L2C_DRAMOCTL_OFF                        11
> > +#define AX45MP_L2C_DRAMICTL_OFF                        13
> > +#define AX45MP_L2C_DRAMOCTL_MSK                        (3 << AX45MP_L2C_DRAMOCTL_OFF)
> > +#define AX45MP_L2C_DRAMICTL_MSK                        BIT(AX45MP_L2C_DRAMICTL_OFF)
>
> > +
> > +#define AX45MP_MAX_CACHE_LINE_SIZE             256
> > +
> > +#define AX45MP_MAX_PMA_REGIONS                 16
> > +
> > +struct ax45mp_priv {
> > +       void __iomem *l2c_base;
> > +       unsigned int ax45mp_cache_line_size;
> > +       bool l2cache_enabled;
> > +       bool ucctl_ok;
> > +};
> > +
> > +static struct ax45mp_priv *ax45mp_priv;
> > +static DEFINE_STATIC_KEY_FALSE(ax45mp_l2c_configured);
> > +
> > +/* PMA setup */
> > +static long ax45mp_sbi_set_pma(unsigned long start,
> > +                              unsigned long size,
> > +                              unsigned long flags,
> > +                              unsigned int entry_id)
> > +{
> > +       struct sbiret ret;
> > +
> > +       ret = sbi_ecall(SBI_EXT_ANDES, AX45MP_SBI_EXT_SET_PMA,
> > +                       start, start + size, size, entry_id,
> > +                       flags, 0);
>
> Fits on two lines.
>
OK.

On a second look the "start + size" arg can be dropped as this can be
calculated in OpenSBI, so I'll fix it in OpenSBI and here too.

> > +
> > +       return ret.value;
> > +}
> > +
> > +static int ax45mp_configure_pma_regions(struct device_node *np)
> > +{
> > +       const char *propname = "andestech,pma-regions";
> > +       u64 start, size, flags;
> > +       unsigned int entry_id;
> > +       unsigned int i;
> > +       int count;
> > +       int ret;
> > +
> > +       count = of_property_count_elems_of_size(np, propname,
> > +                                               sizeof(u32) * 6);
>
> Fits on a single line.
>
OK.

> > +static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
> > +{
> > +       return readl((void *)(ax45mp_priv->l2c_base + AX45MP_L2C_REG_STATUS_OFFSET));
>
> Why the cast to "(void *)"?
>
Can be dropped.

> > +}
> > +
> > +static inline uint32_t ax45mp_cpu_l2c_ctl_status(void)
> > +{
> > +       return readl((void *)(ax45mp_priv->l2c_base + AX45MP_L2C_REG_CTL_OFFSET));
>
> Likewise.
>
Ditto.

> > +}
>
> > +static void ax45mp_cpu_dcache_wb_range(unsigned long start,
> > +                                      unsigned long end,
> > +                                      int line_size)
> > +{
> > +       void __iomem *base = ax45mp_priv->l2c_base;
> > +       unsigned long pa;
> > +       int mhartid = 0;
> > +#ifdef CONFIG_SMP
> > +       mhartid = smp_processor_id();
> > +#endif
> > +
> > +       while (end > start) {
> > +               if (ax45mp_priv->ucctl_ok) {
> > +                       csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> > +                       csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_WB);
> > +               }
> > +
> > +               if (ax45mp_priv->l2cache_enabled) {
> > +                       pa = virt_to_phys((void *)start);
>
> Looks like start and end should be "void *" instead of " unsigned long",
> as they are virtual addresses. See also below...
>
OK.

> > +                       writel(pa, (void *)(base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid)));
> > +                       writel(AX45MP_CCTL_L2_PA_WB,
> > +                              (void *)(base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid)));
>
> Why the casts to "(void *)"?
>
Can be dropped.

> > +                       while ((ax45mp_cpu_l2c_get_cctl_status() &
> > +                               AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
> > +                               AX45MP_CCTL_L2_STATUS_IDLE)
> > +                               ;
> > +               }
> > +
> > +               start += line_size;
> > +       }
> > +}
> > +
> > +static void ax45mp_cpu_dcache_inval_range(unsigned long start,
> > +                                         unsigned long end,
> > +                                         int line_size)
> > +{
> > +       void __iomem *base = ax45mp_priv->l2c_base;
> > +       unsigned long pa;
> > +       int mhartid = 0;
> > +#ifdef CONFIG_SMP
> > +       mhartid = smp_processor_id();
> > +#endif
> > +
> > +       while (end > start) {
> > +               if (ax45mp_priv->ucctl_ok) {
> > +                       csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> > +                       csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_INVAL);
> > +               }
> > +
> > +               if (ax45mp_priv->l2cache_enabled) {
> > +                       pa = virt_to_phys((void *)start);
>
> Looks like start and end should be "void *" instead of " unsigned long",
> as they are virtual addresses. See also below...
>
OK.

> > +                       writel(pa, (void *)(base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid)));
> > +                       writel(AX45MP_CCTL_L2_PA_INVAL,
> > +                              (void *)(base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid)));
> > +                       while ((ax45mp_cpu_l2c_get_cctl_status() &
> > +                               AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
> > +                               AX45MP_CCTL_L2_STATUS_IDLE)
> > +                               ;
> > +               }
> > +
> > +               start += line_size;
> > +       }
> > +}
> > +
> > +void ax45mp_cpu_dma_inval_range(void *vaddr, size_t size)
> > +{
> > +       char cache_buf[2][AX45MP_MAX_CACHE_LINE_SIZE] = { 0 };
>
> AX45MP_MAX_CACHE_LINE_SIZE = 256, so 512 bytes of data on the stack,
> auto-initialized by memset().
>
> Please remove the { 0 }, ...
>
Ok will do.

> > +       unsigned long start = (unsigned long)vaddr;
> > +       unsigned long end = start + size;
> > +       unsigned long old_start = start;
> > +       unsigned long old_end = end;
> > +       unsigned long line_size;
> > +       unsigned long flags;
> > +
> > +       if (static_branch_unlikely(&ax45mp_l2c_configured) && !ax45mp_priv)
> > +               return;
> > +
> > +       if (unlikely(start == end))
> > +               return;
> > +
> > +       line_size = ax45mp_priv->ax45mp_cache_line_size;
>
> ... and call memset() here, so the buffer is not initialized when unused.
> Perhaps use two buffers, so you can easily memset() only the part that is
> used?
>
OK.

> > +
> > +       start = start & (~(line_size - 1));
> > +       end = ((end + line_size - 1) & (~(line_size - 1)));
>
> These are the only calculations that need to use "unsigned long"
> instead of "void *", but you can use PTR_ALIGN_DOWN() and PTR_ALIGN()
> to avoid explicit casts.
>
Good point.

> > +
> > +       local_irq_save(flags);
> > +       if (unlikely(start != old_start))
> > +               memcpy(&cache_buf[0][0], (void *)start, line_size);
> > +
> > +       if (unlikely(end != old_end))
> > +               memcpy(&cache_buf[1][0], (void *)(old_end & (~(line_size - 1))), line_size);
>
> PTR_ALIGN_DOWN()
>
OK.

> > +
> > +       ax45mp_cpu_dcache_inval_range(start, end, line_size);
> > +
> > +       if (unlikely(start != old_start))
> > +               memcpy((void *)start, &cache_buf[0][0], (old_start & (line_size - 1)));
> > +
> > +       if (unlikely(end != old_end))
> > +               memcpy((void *)(old_end + 1),
> > +                      &cache_buf[1][(old_end & (line_size - 1)) + 1],
> > +                      end - old_end - 1);
> > +
> > +       local_irq_restore(flags);
> > +}
> > +EXPORT_SYMBOL(ax45mp_cpu_dma_inval_range);
> > +
> > +void ax45mp_cpu_dma_wb_range(void *vaddr, size_t size)
> > +{
> > +       unsigned long start = (unsigned long)vaddr;
> > +       unsigned long end = start + size;
> > +       unsigned long line_size;
> > +       unsigned long flags;
> > +
> > +       if (static_branch_unlikely(&ax45mp_l2c_configured) && !ax45mp_priv)
> > +               return;
> > +
> > +       line_size = ax45mp_priv->ax45mp_cache_line_size;
> > +       local_irq_save(flags);
> > +       start = start & (~(line_size - 1));
>
> PTR_ALIGN_DOWN() etc...
>
OK.

> > +       ax45mp_cpu_dcache_wb_range(start, end, line_size);
> > +       local_irq_restore(flags);
> > +}
> > +EXPORT_SYMBOL(ax45mp_cpu_dma_wb_range);
> > +
> > +static int ax45mp_configure_l2_cache(struct device_node *np)
> > +{
> > +       u8 ram_ctl[2];
> > +       u32 cache_ctl;
> > +       u32 prefetch;
> > +       int ret;
> > +
> > +       cache_ctl = ax45mp_cpu_l2c_ctl_status();
> > +
> > +       /* Instruction and data fetch prefetch depth */
> > +       ret = of_property_read_u32(np, "andestech,inst-prefetch", &prefetch);
> > +       if (!ret) {
> > +               cache_ctl &= ~AX45MP_L2C_IPREPETCH_MSK;
> > +               cache_ctl |= (prefetch << AX45MP_L2C_IPREPETCH_OFF);
>
> FIELD_PREP(), also below
>
This entire function will be dropped now...

> > +       }
> > +
> > +       ret = of_property_read_u32(np, "andestech,data-prefetch", &prefetch);
> > +       if (!ret) {
> > +               cache_ctl &= ~AX45MP_L2C_DPREPETCH_MSK;
> > +               cache_ctl |= (prefetch << AX45MP_L2C_DPREPETCH_OFF);
>
> prefect / 2
>
> > +       }
> > +
> > +       /* tag RAM and data RAM setup and output cycle */
> > +       ret = of_property_read_u8_array(np, "andestech,tag-ram-ctl", ram_ctl, 2);
> > +       if (!ret) {
> > +               cache_ctl &= ~(AX45MP_L2C_TRAMOCTL_MSK | AX45MP_L2C_TRAMICTL_MSK);
> > +               cache_ctl |= ram_ctl[0] << AX45MP_L2C_TRAMOCTL_OFF;
> > +               cache_ctl |= ram_ctl[1] << AX45MP_L2C_TRAMICTL_OFF;
> > +       }
> > +
> > +       ret = of_property_read_u8_array(np, "andestech,data-ram-ctl", ram_ctl, 2);
> > +       if (!ret) {
> > +               cache_ctl &= ~(AX45MP_L2C_DRAMOCTL_MSK | AX45MP_L2C_DRAMICTL_MSK);
> > +               cache_ctl |= ram_ctl[0] << AX45MP_L2C_DRAMOCTL_OFF;
> > +               cache_ctl |= ram_ctl[1] << AX45MP_L2C_DRAMICTL_OFF;
> > +       }
> > +
> > +       writel(cache_ctl, ax45mp_priv->l2c_base + AX45MP_L2C_REG_CTL_OFFSET);
> > +
> > +       ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv->ax45mp_cache_line_size);
>
> According to the bindings, this must be 64?
>
Agreed, I'll add a check to make sure it's always 64.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
