Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAB5ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBHbuUA+lh8s2Kkpk0+MNtlEnpwArvdsU3aVjJZDb9g=; b=4+dZSCYDgXX46J
	FDk7DAsKoJEtjYtanBqQTLfhs7+7Gg1a28cU5XWB5WAyuDW+vjnsuYsrig5Mt2Vu8OUpWdqLYvchP
	VEVGRGv1asiNLDszSr6KW8Q42IPNN4S8bestJZJBcPj7/Oy8SsBgx+JIEolge4kcblH4a1S+MVUgC
	ZUjTLvAPF4/DCiZPIH7ZJ+G03fe4HSRvA0+hUsmcvMyL2XwGGfpz9ntafV15KUq0F3Vsr9bXWEbLd
	M6Xl3aY3p0tLAT8S92IeApyTh9xoglSY8KK1RPd0LUdt0EJ9U2qTdGIdLXDPhidtpAkg+KHSLhBSk
	bcjYSMFR0ujF/vMiq4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyLw-001u61-U6; Mon, 24 Oct 2022 14:22:56 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyLt-001u4b-KT
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 14:22:55 +0000
Received: by mail-qt1-f174.google.com with SMTP id hh9so5651770qtb.13
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 07:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9qF1Rvllj4BtsCBG7Cn5V9JrHYVjBhx5pA0E/JzBw8=;
        b=UKzo2JZUr/6ZclYayVwGtRXw83HTtOzN39Rv7Qs5Lu+Oo+/0FFmM4LJOFdyAm/UCEQ
         6pO97bwoMHKbFhDMT/uNVdGKaR5c+9ymdjjJObXXgIuIfbZVhLtNFuzVU3otT9VWXRFR
         X4qHkrEjPx0PFZcg7n5UFe7nT0CHFB/kmkATee3w4qV3h3jpKe/xvHeGTQqZFIJpe5pD
         Llcyuiu5NLvblBj5x9Ks4tExi6X9kPN33TK4wGNqbJH2+q+elpOKbWNEtsyTG5GT8D/t
         7mf7v/eEe0M6Bd5ao1qZV8tSGTZGa0RqnIoRFqokIGrj8OKPOxoLYE9rl7g9DfPiu1sB
         XV5A==
X-Gm-Message-State: ACrzQf3TT0s4q655WHbZIKoEmLbwA6tzkiFVjpREEGMRSUh2bPMmieF9
	tNKGVzi2i5IkqpLhZPTMYLVpXqvUTfTUgw==
X-Google-Smtp-Source: AMsMyM5qOlIEERWFOwpJRgEgvefIc6dv2VyfEufHd8QgNfGPwKNyVpgki23tlhtXwhfTRPL4pmsFcg==
X-Received: by 2002:a05:622a:1793:b0:39c:f3cd:e725 with SMTP id s19-20020a05622a179300b0039cf3cde725mr28560098qtk.333.1666621369877;
        Mon, 24 Oct 2022 07:22:49 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id g4-20020ac84684000000b0039cd508f1d3sm2774qto.75.2022.10.24.07.22.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 07:22:49 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id l145so11268147ybl.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 07:22:49 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr27332087ybb.604.1666621368623; Mon, 24
 Oct 2022 07:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2022 16:22:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSk7RJa4JQNCV6hU9ZMeC3oSEj=MJhTtKauxaWpiGREw@mail.gmail.com>
Message-ID: <CAMuHMdXSk7RJa4JQNCV6hU9ZMeC3oSEj=MJhTtKauxaWpiGREw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
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
X-CRM114-CacheID: sfid-20221024_072253_706495_6E2B6B75 
X-CRM114-Status: GOOD (  36.22  )
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

Hi Prabhakar,

(fixed Palmer's address)

On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the AX45MP core, cache coherency is a specification option so it may
> not be supported. In this case DMA will fail. As a workaround, firstly we
> allocate a global dma coherent pool from which DMA allocations are taken
> and marked as non-cacheable + bufferable using the PMA region as specified
> in the device tree. Synchronization callbacks are implemented to
> synchronize when doing DMA transactions.
>
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
>
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
>
> This patch adds support to configure the memory attributes of the memory
> regions as passed from the l2 cache node and exposes the cache management
> ops.
>
> More info about PMA (section 10.3):
> http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
> This feature is based on the work posted [0] by Vincent Chen
> <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
>
> [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -340,9 +340,14 @@ if RISCV
>  config ARCH_R9A07G043
>         bool "RISC-V Platform support for RZ/Five"
>         select ARCH_RZG2L
> +       select AX45MP_L2_CACHE
> +       select DMA_GLOBAL_POOL
> +       select RISCV_DMA_NONCOHERENT
>         help
>           This enables support for the Renesas RZ/Five SoC.
>
> +source "drivers/soc/renesas/rzf/Kconfig"

s/rzf/rzfive/? (or "rz5"? "rzv"?)

> +
>  endif # RISCV
>
>  config RST_RCAR
> diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
> index 535868c9c7e4..a20cc7ad5b12 100644
> --- a/drivers/soc/renesas/Makefile
> +++ b/drivers/soc/renesas/Makefile
> @@ -31,6 +31,10 @@ ifdef CONFIG_SMP
>  obj-$(CONFIG_ARCH_R9A06G032)   += r9a06g032-smp.o
>  endif
>
> +ifdef CONFIG_RISCV
> +obj-y += rzf/
> +endif

obj-$(CONFIG_RISCV)

> --- /dev/null
> +++ b/drivers/soc/renesas/rzf/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config AX45MP_L2_CACHE
> +       bool "AX45MP L2 Cache controller"

Andes Technology ...

> +       help
> +         Support for the L2 cache controller on AX45MP platforms.

... Andes Technology ...

> --- /dev/null
> +++ b/drivers/soc/renesas/rzf/ax45mp_cache.c
> @@ -0,0 +1,431 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PMA setup and non-coherent cache functions for AX45MP
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/sbi.h>
> +
> +#include "ax45mp_sbi.h"
> +
> +/* L2 cache registers */
> +#define AX45MP_L2C_REG_CTL_OFFSET              0x8
> +#define AX45MP_L2C_IPREPETCH_OFF               3
> +#define AX45MP_L2C_DPREPETCH_OFF               5
> +#define AX45MP_L2C_IPREPETCH_MSK               (3 << AX45MP_L2C_IPREPETCH_OFF)
> +#define AX45MP_L2C_DPREPETCH_MSK               (3 << AX45MP_L2C_DPREPETCH_OFF)

#define AX45MP_L2C_IPREPETCH    GENMASK(4, 3)
etc., and then you can use the FIELD_PREP() macros.

> +#define AX45MP_L2C_TRAMOCTL_OFF                        8
> +#define AX45MP_L2C_TRAMICTL_OFF                        10
> +#define AX45MP_L2C_TRAMOCTL_MSK                        (3 << AX45MP_L2C_TRAMOCTL_OFF)
> +#define AX45MP_L2C_TRAMICTL_MSK                        BIT(AX45MP_L2C_TRAMICTL_OFF)
> +#define AX45MP_L2C_DRAMOCTL_OFF                        11
> +#define AX45MP_L2C_DRAMICTL_OFF                        13
> +#define AX45MP_L2C_DRAMOCTL_MSK                        (3 << AX45MP_L2C_DRAMOCTL_OFF)
> +#define AX45MP_L2C_DRAMICTL_MSK                        BIT(AX45MP_L2C_DRAMICTL_OFF)

> +
> +#define AX45MP_MAX_CACHE_LINE_SIZE             256
> +
> +#define AX45MP_MAX_PMA_REGIONS                 16
> +
> +struct ax45mp_priv {
> +       void __iomem *l2c_base;
> +       unsigned int ax45mp_cache_line_size;
> +       bool l2cache_enabled;
> +       bool ucctl_ok;
> +};
> +
> +static struct ax45mp_priv *ax45mp_priv;
> +static DEFINE_STATIC_KEY_FALSE(ax45mp_l2c_configured);
> +
> +/* PMA setup */
> +static long ax45mp_sbi_set_pma(unsigned long start,
> +                              unsigned long size,
> +                              unsigned long flags,
> +                              unsigned int entry_id)
> +{
> +       struct sbiret ret;
> +
> +       ret = sbi_ecall(SBI_EXT_ANDES, AX45MP_SBI_EXT_SET_PMA,
> +                       start, start + size, size, entry_id,
> +                       flags, 0);

Fits on two lines.

> +
> +       return ret.value;
> +}
> +
> +static int ax45mp_configure_pma_regions(struct device_node *np)
> +{
> +       const char *propname = "andestech,pma-regions";
> +       u64 start, size, flags;
> +       unsigned int entry_id;
> +       unsigned int i;
> +       int count;
> +       int ret;
> +
> +       count = of_property_count_elems_of_size(np, propname,
> +                                               sizeof(u32) * 6);

Fits on a single line.

> +static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
> +{
> +       return readl((void *)(ax45mp_priv->l2c_base + AX45MP_L2C_REG_STATUS_OFFSET));

Why the cast to "(void *)"?

> +}
> +
> +static inline uint32_t ax45mp_cpu_l2c_ctl_status(void)
> +{
> +       return readl((void *)(ax45mp_priv->l2c_base + AX45MP_L2C_REG_CTL_OFFSET));

Likewise.

> +}

> +static void ax45mp_cpu_dcache_wb_range(unsigned long start,
> +                                      unsigned long end,
> +                                      int line_size)
> +{
> +       void __iomem *base = ax45mp_priv->l2c_base;
> +       unsigned long pa;
> +       int mhartid = 0;
> +#ifdef CONFIG_SMP
> +       mhartid = smp_processor_id();
> +#endif
> +
> +       while (end > start) {
> +               if (ax45mp_priv->ucctl_ok) {
> +                       csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> +                       csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_WB);
> +               }
> +
> +               if (ax45mp_priv->l2cache_enabled) {
> +                       pa = virt_to_phys((void *)start);

Looks like start and end should be "void *" instead of " unsigned long",
as they are virtual addresses. See also below...

> +                       writel(pa, (void *)(base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid)));
> +                       writel(AX45MP_CCTL_L2_PA_WB,
> +                              (void *)(base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid)));

Why the casts to "(void *)"?

> +                       while ((ax45mp_cpu_l2c_get_cctl_status() &
> +                               AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
> +                               AX45MP_CCTL_L2_STATUS_IDLE)
> +                               ;
> +               }
> +
> +               start += line_size;
> +       }
> +}
> +
> +static void ax45mp_cpu_dcache_inval_range(unsigned long start,
> +                                         unsigned long end,
> +                                         int line_size)
> +{
> +       void __iomem *base = ax45mp_priv->l2c_base;
> +       unsigned long pa;
> +       int mhartid = 0;
> +#ifdef CONFIG_SMP
> +       mhartid = smp_processor_id();
> +#endif
> +
> +       while (end > start) {
> +               if (ax45mp_priv->ucctl_ok) {
> +                       csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> +                       csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_INVAL);
> +               }
> +
> +               if (ax45mp_priv->l2cache_enabled) {
> +                       pa = virt_to_phys((void *)start);

Looks like start and end should be "void *" instead of " unsigned long",
as they are virtual addresses. See also below...

> +                       writel(pa, (void *)(base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid)));
> +                       writel(AX45MP_CCTL_L2_PA_INVAL,
> +                              (void *)(base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid)));
> +                       while ((ax45mp_cpu_l2c_get_cctl_status() &
> +                               AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
> +                               AX45MP_CCTL_L2_STATUS_IDLE)
> +                               ;
> +               }
> +
> +               start += line_size;
> +       }
> +}
> +
> +void ax45mp_cpu_dma_inval_range(void *vaddr, size_t size)
> +{
> +       char cache_buf[2][AX45MP_MAX_CACHE_LINE_SIZE] = { 0 };

AX45MP_MAX_CACHE_LINE_SIZE = 256, so 512 bytes of data on the stack,
auto-initialized by memset().

Please remove the { 0 }, ...

> +       unsigned long start = (unsigned long)vaddr;
> +       unsigned long end = start + size;
> +       unsigned long old_start = start;
> +       unsigned long old_end = end;
> +       unsigned long line_size;
> +       unsigned long flags;
> +
> +       if (static_branch_unlikely(&ax45mp_l2c_configured) && !ax45mp_priv)
> +               return;
> +
> +       if (unlikely(start == end))
> +               return;
> +
> +       line_size = ax45mp_priv->ax45mp_cache_line_size;

... and call memset() here, so the buffer is not initialized when unused.
Perhaps use two buffers, so you can easily memset() only the part that is
used?

> +
> +       start = start & (~(line_size - 1));
> +       end = ((end + line_size - 1) & (~(line_size - 1)));

These are the only calculations that need to use "unsigned long"
instead of "void *", but you can use PTR_ALIGN_DOWN() and PTR_ALIGN()
to avoid explicit casts.

> +
> +       local_irq_save(flags);
> +       if (unlikely(start != old_start))
> +               memcpy(&cache_buf[0][0], (void *)start, line_size);
> +
> +       if (unlikely(end != old_end))
> +               memcpy(&cache_buf[1][0], (void *)(old_end & (~(line_size - 1))), line_size);

PTR_ALIGN_DOWN()

> +
> +       ax45mp_cpu_dcache_inval_range(start, end, line_size);
> +
> +       if (unlikely(start != old_start))
> +               memcpy((void *)start, &cache_buf[0][0], (old_start & (line_size - 1)));
> +
> +       if (unlikely(end != old_end))
> +               memcpy((void *)(old_end + 1),
> +                      &cache_buf[1][(old_end & (line_size - 1)) + 1],
> +                      end - old_end - 1);
> +
> +       local_irq_restore(flags);
> +}
> +EXPORT_SYMBOL(ax45mp_cpu_dma_inval_range);
> +
> +void ax45mp_cpu_dma_wb_range(void *vaddr, size_t size)
> +{
> +       unsigned long start = (unsigned long)vaddr;
> +       unsigned long end = start + size;
> +       unsigned long line_size;
> +       unsigned long flags;
> +
> +       if (static_branch_unlikely(&ax45mp_l2c_configured) && !ax45mp_priv)
> +               return;
> +
> +       line_size = ax45mp_priv->ax45mp_cache_line_size;
> +       local_irq_save(flags);
> +       start = start & (~(line_size - 1));

PTR_ALIGN_DOWN() etc...

> +       ax45mp_cpu_dcache_wb_range(start, end, line_size);
> +       local_irq_restore(flags);
> +}
> +EXPORT_SYMBOL(ax45mp_cpu_dma_wb_range);
> +
> +static int ax45mp_configure_l2_cache(struct device_node *np)
> +{
> +       u8 ram_ctl[2];
> +       u32 cache_ctl;
> +       u32 prefetch;
> +       int ret;
> +
> +       cache_ctl = ax45mp_cpu_l2c_ctl_status();
> +
> +       /* Instruction and data fetch prefetch depth */
> +       ret = of_property_read_u32(np, "andestech,inst-prefetch", &prefetch);
> +       if (!ret) {
> +               cache_ctl &= ~AX45MP_L2C_IPREPETCH_MSK;
> +               cache_ctl |= (prefetch << AX45MP_L2C_IPREPETCH_OFF);

FIELD_PREP(), also below

> +       }
> +
> +       ret = of_property_read_u32(np, "andestech,data-prefetch", &prefetch);
> +       if (!ret) {
> +               cache_ctl &= ~AX45MP_L2C_DPREPETCH_MSK;
> +               cache_ctl |= (prefetch << AX45MP_L2C_DPREPETCH_OFF);

prefect / 2

> +       }
> +
> +       /* tag RAM and data RAM setup and output cycle */
> +       ret = of_property_read_u8_array(np, "andestech,tag-ram-ctl", ram_ctl, 2);
> +       if (!ret) {
> +               cache_ctl &= ~(AX45MP_L2C_TRAMOCTL_MSK | AX45MP_L2C_TRAMICTL_MSK);
> +               cache_ctl |= ram_ctl[0] << AX45MP_L2C_TRAMOCTL_OFF;
> +               cache_ctl |= ram_ctl[1] << AX45MP_L2C_TRAMICTL_OFF;
> +       }
> +
> +       ret = of_property_read_u8_array(np, "andestech,data-ram-ctl", ram_ctl, 2);
> +       if (!ret) {
> +               cache_ctl &= ~(AX45MP_L2C_DRAMOCTL_MSK | AX45MP_L2C_DRAMICTL_MSK);
> +               cache_ctl |= ram_ctl[0] << AX45MP_L2C_DRAMOCTL_OFF;
> +               cache_ctl |= ram_ctl[1] << AX45MP_L2C_DRAMICTL_OFF;
> +       }
> +
> +       writel(cache_ctl, ax45mp_priv->l2c_base + AX45MP_L2C_REG_CTL_OFFSET);
> +
> +       ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv->ax45mp_cache_line_size);

According to the bindings, this must be 64?

> +       if (ret) {
> +               pr_err("Failed to get cache-line-size defaulting to 64 bytes\n");
> +               ax45mp_priv->ax45mp_cache_line_size = SZ_64;
> +       }
> +
> +       ax45mp_priv->ucctl_ok = ax45mp_cpu_cache_controlable();
> +       ax45mp_priv->l2cache_enabled = ax45mp_cpu_l2c_ctl_status() & AX45MP_L2_CACHE_CTL_CEN_MASK;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
