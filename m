Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D29C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Mar 2022 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rT4XmnnOecGps0TFSBw0tg7Z6b5ABAnlmMoiOJt57w=; b=o16/f3hLMWb3Z5
	pDQNYGq24xoQD7dcHGuQuykm3XkDB0sJtmOxVotiRBJjtQw1YArWhXLT52BrHnTOVONNDQyx3F5EV
	4+P2U9KcV4w5nUdkIRIhX17chrVux0F2QWur1KQpSRtRDxYupMNa5y5i1IsmNJGzys3c4edHVg1AA
	/QGaVWTA14OeEeAI4llQSCRp2WIh0f3dFzoZSsQkcNmeM8m7tpf09BuyQGlcPNBmkxBAZWb1XlD2x
	EyURU9737d0eFc8WtnIsoXn1qbxXKq+aqb2NqaMMEhN6dbotSjSRLFlc76dabR+UloCTUPABQrPVk
	jJVurouoFyn6bwwvSVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnp6-002qAX-NR; Fri, 25 Mar 2022 17:34:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnfp-002m1O-SV
 for linux-riscv@lists.infradead.org; Fri, 25 Mar 2022 17:24:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so9377946wme.5
 for <linux-riscv@lists.infradead.org>; Fri, 25 Mar 2022 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=61uPj/rj26BE1pKbx2yqdZqSScT/Ebu6b1T0hmQP/yU=;
 b=Zu0nnygE442k9wqjLry1C8H6UAAihZXqZB51Z8/2IReuDHZlj8ZTqVkTiApzAYmElY
 6gXydG3bAebWuF7Rj3yAx5kF9YSXsf7qJXE6dTsP6VxyhtQ+EOatxL+FjKc5l/E/oCZT
 Rt4EK4VV1GUcXncW5J/0Dx01O1E+Q4FVaMxLVm+FvM8ORvds7OCgBTHsoBN7VSEwPNy8
 oBI8ZW8KmOIS70KO0hDxZzE8rxZaVFArvuX6MOI5nmuuScDeqO7F1auGlti++4+qfoh/
 5x/uuIedITigbDAwmShPGTDX9bnoYiAbXjll57ZS1iqNkfuO4ZMbU8HsDVf9M69x/TW3
 3rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=61uPj/rj26BE1pKbx2yqdZqSScT/Ebu6b1T0hmQP/yU=;
 b=VhGSxPzQa7NpX8yEFKWKPsZuW+ZeGfHgxDgEemlL0f/mPMZDez8x3zpw78y5aPZNM9
 NcFXKAz5+luOAMh9pAFGjiKWVVJZPvyqHgRiu7zgO3Hmv2Zn0z/vnT8oyu3WrNPzrYYC
 lYDwRQVjx6/Badb2lTzeOcNaJVLRybdH9Wdd2qfO/aHpGqzKPpFkQJEDsawx35oXOTyD
 0xTJ2Z0LqpTQ85X7lPVKwnNx6IqNcyao5dstnTpYsv3xiIeC6UbShprxvBdQeoc4/a0G
 NvJ66I0ve72/rKI/6lWoBH8VrVXGxmsW1+1WE9+05hT9a6wdGv2s6yAgriMeK4efS3ri
 pmBw==
X-Gm-Message-State: AOAM530ZLeIIozcnp42od1H2SyslyRaJOfeUoRsLQSQf8xOWuOlA7vmf
 6Du1H6XXhhmxgPUEA5VAAiABtBdVyNG246gog6Vklg==
X-Google-Smtp-Source: ABdhPJxxqAfZBMwEf9e2HAUjsf3upWIjzD2DrEQ3VaMbY9N9dAKxeA4Kk68xy44mQKELtJnTdiFS7dl9OaZeijZS69c=
X-Received: by 2002:a05:600c:1d24:b0:38c:9f89:d1ac with SMTP id
 l36-20020a05600c1d2400b0038c9f89d1acmr20175740wms.69.1648229068139; Fri, 25
 Mar 2022 10:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220307224620.1933061-1-heiko@sntech.de>
 <20220307224620.1933061-2-heiko@sntech.de>
 <CAAhSdy2FR3eSAYgcCtoo9wDe9XXwoPk_Anf17mqy_T1C6_3Hog@mail.gmail.com>
In-Reply-To: <CAAhSdy2FR3eSAYgcCtoo9wDe9XXwoPk_Anf17mqy_T1C6_3Hog@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Fri, 25 Mar 2022 18:24:16 +0100
Message-ID: <CAAeLtUBzAY4D_duc8OzX46YOd3BNexo27wPDbAAORyQtJq-EUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Implement Zicbom-based cache management
 operations
To: Anup Patel <anup@brainfault.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>, Christoph Hellwig <hch@lst.de>,
 Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_102430_007167_AC55154C 
X-CRM114-Status: GOOD (  35.46  )
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

On Fri, 25 Mar 2022 at 17:20, Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Mar 8, 2022 at 4:16 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > The Zicbom ISA-extension was ratified in november 2021
> > and introduces instructions for dcache invalidate, clean
> > and flush operations.
> >
> > Implement cache management operations based on them.
> >
> > Of course not all cores will support this, so implement an
> > alternative-based mechanism that replaces empty instructions
> > with ones done around Zicbom instructions.
> >
> > We're using prebuild instructions for the Zicbom instructions
> > for now, to not require a bleeding-edge compiler (gcc-12)
> > for these somewhat simple instructions.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig                   |  8 ++++
> >  arch/riscv/include/asm/errata_list.h | 37 ++++++++++++++++-
> >  arch/riscv/include/asm/hwcap.h       |  1 +
> >  arch/riscv/kernel/cpu.c              |  1 +
> >  arch/riscv/kernel/cpufeature.c       | 17 ++++++++
> >  arch/riscv/mm/Makefile               |  1 +
> >  arch/riscv/mm/dma-noncoherent.c      | 61 ++++++++++++++++++++++++++++
> >  7 files changed, 125 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/mm/dma-noncoherent.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 5adcbd9b5e88..d3a1cd41c203 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -208,6 +208,14 @@ config PGTABLE_LEVELS
> >  config LOCKDEP_SUPPORT
> >         def_bool y
> >
> > +config RISCV_DMA_NONCOHERENT
> > +       bool "Support non-coherent dma operation"
> > +       select ARCH_HAS_DMA_PREP_COHERENT
> > +       select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> > +       select ARCH_HAS_SYNC_DMA_FOR_CPU
> > +       select ARCH_HAS_SETUP_DMA_OPS
> > +       select DMA_DIRECT_REMAP
> > +
> >  source "arch/riscv/Kconfig.socs"
> >  source "arch/riscv/Kconfig.erratas"
> >
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index 4fac46b82c16..7a2dd61af24d 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -20,7 +20,8 @@
> >  #endif
> >
> >  #define        CPUFEATURE_SVPBMT 0
> > -#define        CPUFEATURE_NUMBER 1
> > +#define        CPUFEATURE_CMO 1
> > +#define        CPUFEATURE_NUMBER 2
> >
> >  #ifdef __ASSEMBLY__
> >
> > @@ -86,6 +87,40 @@ asm volatile(ALTERNATIVE(                                                            \
> >  #define ALT_THEAD_PMA(_val)
> >  #endif
> >
> > +/*
> > + * cbo.clean rs1
> > + * | 31 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *    0...01     rs1       010      00000  0001111
> > + *
> > + * cbo.flush rs1
> > + * | 31 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *    0...10     rs1       010      00000  0001111
> > + *
> > + * cbo.inval rs1
> > + * | 31 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *    0...00     rs1       010      00000  0001111
> > + */
> > +#define CBO_INVAL_A0   ".long 0x15200F"
> > +#define CBO_CLEAN_A0   ".long 0x25200F"
> > +#define CBO_FLUSH_A0   ".long 0x05200F"
> > +
> > +#define ALT_CMO_OP(_op, _start, _size)                                                 \
> > +asm volatile(ALTERNATIVE(                                                              \
> > +       "nop\n\t"                                                                       \
> > +       "nop\n\t"                                                                       \
> > +       "nop\n\t"                                                                       \
> > +       "nop\n\t"                                                                       \
> > +       "nop",                                                                          \
> > +       "mv a0, %1\n\t"                                                                 \
> > +       "j 2f\n\t"                                                                      \
> > +       "3:\n\t"                                                                        \
> > +       CBO_##_op##_A0 "\n\t"                                                           \
> > +       "addi a0, a0, %0\n\t"                                                           \
> > +       "2:\n\t"                                                                        \
> > +       "bltu a0, %2, 3b\n\t", 0, CPUFEATURE_CMO, CONFIG_RISCV_DMA_NONCOHERENT)         \
> > +       : : "I"(L1_CACHE_BYTES), "r"((_start) & ~(L1_CACHE_BYTES - 1)),                 \
> > +           "r"(ALIGN((_start) + (_size), L1_CACHE_BYTES)))
>
> Why not use a global variable (e.g. riscv_cbom_block_size) representing
> exact cbom block size instead of L1_CACHE_BYTES ?

Didn't the discussions around platforms gravitate towards a fixed
cache-block operations size (note that this is orthogonal from the
cache-line size) a requirement for Linux-capable platforms?

Philipp.

> The default value of riscv_cbom_block_size can be L1_CACHE_BYTES
> which can be overridden at boot-time using optional "riscv,cbom-block-size"
> DT property.
>
> The rationale here is that if underlying RISC-V implementation has cbom
> block size smaller than L1_CACHE_BYTES then it will result in incomplete
> cbom range operation. The riscv_cbom_block_size global variable ensures
> that the right block size is used at least for cbom operations.
>
> Regards,
> Anup
>
> > +
> >  #endif /* __ASSEMBLY__ */
> >
> >  #endif
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 656cd626eb1a..5943d5125a51 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
> >   */
> >  enum riscv_isa_ext_id {
> >         RISCV_ISA_EXT_SVPBMT = RISCV_ISA_EXT_BASE,
> > +       RISCV_ISA_EXT_ZICBOM,
> >         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index c582d557e555..dfcf592273a7 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -72,6 +72,7 @@ int riscv_of_parent_hartid(struct device_node *node)
> >
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> >         __RISCV_ISA_EXT_DATA("svpbmt", RISCV_ISA_EXT_SVPBMT),
> > +       __RISCV_ISA_EXT_DATA("zicbom", RISCV_ISA_EXT_ZICBOM),
>
> Drop the quotes around zicbom because __RISCV_ISA_EXT_DATA() will
> stringify the first parameter.
>
> >         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> >  };
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 5c5e6e7488ce..0e997fa5524a 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -200,6 +200,7 @@ void __init riscv_fill_hwcap(void)
> >                                 set_bit(*ext - 'a', this_isa);
> >                         } else {
> >                                 SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> > +                               SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> >                         }
> >  #undef SET_ISA_EXT_MAP
> >                 }
> > @@ -267,11 +268,27 @@ static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
> >         return ret;
> >  }
> >
> > +static bool cpufeature_cmo_check_func(unsigned int stage)
> > +{
> > +       switch (stage) {
> > +       case RISCV_ALTERNATIVES_EARLY_BOOT:
> > +               return false;
> > +       default:
> > +               return riscv_isa_extension_available(NULL, ZICBOM);
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  static const struct cpufeature_info __initdata_or_module cpufeature_list[CPUFEATURE_NUMBER] = {
> >         {
> >                 .name = "svpbmt",
> >                 .check_func = cpufeature_svpbmt_check_func
> >         },
> > +       {
> > +               .name = "cmo",
> > +               .check_func = cpufeature_cmo_check_func
> > +       },
> >  };
> >
> >  static u32 __init_or_module cpufeature_probe(unsigned int stage)
> > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > index ac7a25298a04..d76aabf4b94d 100644
> > --- a/arch/riscv/mm/Makefile
> > +++ b/arch/riscv/mm/Makefile
> > @@ -30,3 +30,4 @@ endif
> >  endif
> >
> >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> > +obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > new file mode 100644
> > index 000000000000..2c124bcc1932
> > --- /dev/null
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -0,0 +1,61 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * RISC-V specific functions to support DMA for non-coherent devices
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#include <linux/dma-direct.h>
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/libfdt.h>
> > +#include <linux/mm.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +
> > +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +       switch (dir) {
> > +       case DMA_TO_DEVICE:
> > +               ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr), size);
> > +               break;
> > +       case DMA_FROM_DEVICE:
> > +               ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size);
> > +               break;
> > +       case DMA_BIDIRECTIONAL:
> > +               ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), size);
> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +}
> > +
> > +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +       switch (dir) {
> > +       case DMA_TO_DEVICE:
> > +               break;
> > +       case DMA_FROM_DEVICE:
> > +       case DMA_BIDIRECTIONAL:
> > +               ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size);
> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +}
> > +
> > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > +{
> > +       void *flush_addr = page_address(page);
> > +
> > +       memset(flush_addr, 0, size);
> > +       ALT_CMO_OP(FLUSH, (unsigned long)flush_addr, size);
> > +}
> > +
> > +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > +               const struct iommu_ops *iommu, bool coherent)
> > +{
> > +       /* If a specific device is dma-coherent, set it here */
> > +       dev->dma_coherent = coherent;
> > +}
> > --
> > 2.30.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
