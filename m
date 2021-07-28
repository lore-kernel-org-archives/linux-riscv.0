Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2439DC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B492D6052B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B492D6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE8gzncIl7innyYgLsmDzeO+1wz66WgCs6NE84r167c=; b=y3rlHxhsqRXXZb
	v1uNCA92+2cveHdcPf+bt82rUYu9hkkdoXdk4lbfPK0a+H/xO9PXANE7QwyOvlzY+nKPzApLjoEJt
	8N4+PQjkgSLjJJqAmLeKoGx4oL1dpMkqhhRF/VILs8SMzgb7MxsHtngvwEhAIKeTxKVSPQQ8QYT+a
	PwnYCK64YllTIuEMUS/BhjBs3J4MzDSiC8mD3SJJmUr1+jS2R6nqvqgsUCk/v+xj6TNrGqH5BXIxG
	hwIOJ+RPt/TQ+QuR4ZBzytY1nsf1k6MbIHgl2a8q3Hpce74WGq7/6vYsyT5oL1HX4l9m1gehqT4E7
	Y+IzU9X4PO1jDTYPHr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dgZ-00HKof-M8; Wed, 28 Jul 2021 07:08:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dgW-00HKoB-Rk
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 07:08:58 +0000
Received: by mail-ed1-x534.google.com with SMTP id n2so1782250eda.10
 for <linux-riscv@lists.infradead.org>; Wed, 28 Jul 2021 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JjPvEowFGL6UZrwIae4+mX8GEAM2UbRoPh6+ytUjR30=;
 b=oFr5K/fpoahCow/gRvyhTXkPSF4bv2YLwLJzZt2uu6dw5Hck0k5xUjLq6aFWIKQJPf
 53eNIV/ipD0wqKB+uf0ISBer4oVNr1BW6QBmHnApQBLKPHSJJuj1gmn8XyCOZr9ZidfW
 0oc4aD6Tox0SQJV+/fdwrIX70ohwBldvZWUdf/+jYHtPACnCBePUPtO2QQGyC8IF23dN
 Hb89hboNgrwjuanTqqNtgWME4FympMrkX8TWAi/js3ppfe7/ohslnurhLq7iKzmOsEd1
 XaqDXXnR90iVvTYBC/5AB1x7hlh8nCfDHmXSXydA9IIgXmKG7d9PorWlGgSCO1nfLOys
 jmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjPvEowFGL6UZrwIae4+mX8GEAM2UbRoPh6+ytUjR30=;
 b=sfMiNcNaVSHt/1SfUfMcW9anzLgBr2M5/M5CjZl2NipWIckFo+V7O+PlaV/hrZZeO0
 vOoSB8dj5Lv4NDHIoyiybZSGG/kigzNy7HajOF1TNgXU6012kudoqPFKE2Kj9DhD/BJK
 JQmaMp3NuXkLgy+UHeQjIyvNTVu4C1y23eUiSm9OiiqlSO5RttItCRbX1GqDV3g61STZ
 nGSCAMrubREVYcYHm9Ccvc8cbJOxVMnVxSGkpqu45XHkxvXHNXLlNzx/GmQgipZXOvNb
 BW6YWe8r06xDgR5+54w+wWq33nnJVFZG2YKPKPNrZ/2IQGVI4uN9S1k0BXND8jB9kPIF
 rq9A==
X-Gm-Message-State: AOAM533DXfJWxCqx9F61frhIb5YUBj44iw2JT5RSZH/UfYa9T2OExe7j
 A83RR+jRBSdfq/PvGB7hPXd0axtwwgbcl5CYIvU=
X-Google-Smtp-Source: ABdhPJxYBTroTzdxy9YKmu/HMBDj6pWRxK9c3ND7B09OSrNtoGisb4PHyGgi37KgQI4hcsT+ZiuQ2rbE2qkBENIVkZg=
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr32165551edd.361.1627456134487; 
 Wed, 28 Jul 2021 00:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210728064318.375747-1-nek.in.cn@gmail.com>
 <YQD/Zb0EszIWr6RJ@kernel.org>
In-Reply-To: <YQD/Zb0EszIWr6RJ@kernel.org>
From: Lee Ken <nek.in.cn@gmail.com>
Date: Wed, 28 Jul 2021 15:08:43 +0800
Message-ID: <CA+CqrBTPT+dFJk7L1gzjuGn_6W2QJquNXtTdH3c_iHAmSodRgA@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
To: Mike Rapoport <rppt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@wdc.com>, Kenneth Lee <liguozhu@hisilicon.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, 
 Guo Ren <guoren@linux.alibaba.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, guohanjun@huawei.com, 
 Zhou Wang <wangzhou1@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_000856_983637_55F4AB62 
X-CRM114-Status: GOOD (  24.75  )
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

indeed. I'll send a new one.

On Wed, Jul 28, 2021 at 2:55 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Wed, Jul 28, 2021 at 02:43:18PM +0800, Kenneth Lee wrote:
> > From: Kenneth Lee <liguozhu@hisilicon.com>
> >
> > RISCV use a global variable pfn_base for page/pfn translation. But this
> > is a common name and will be used elsewhere. In those case,
> > the page-pfn macro which refer this name will refer to the local/input
> > variable of those function (such as in vfio_pin_pages_remote). This make
> > everything wrong.
> >
> > This patch change the name from pfn_base to riscv_global_pfn_base to fix
>
> I think global is excessive, just riscv_pfn_base should be ok for proper
> namespacing.
>
> > this problem
> >
> > Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> > ---
> >  arch/riscv/include/asm/page.h | 4 ++--
> >  arch/riscv/mm/init.c          | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index cca8764aed83..8711e415f37c 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
> >  #endif
> >
> >  #ifdef CONFIG_MMU
> > -extern unsigned long pfn_base;
> > -#define ARCH_PFN_OFFSET              (pfn_base)
> > +extern unsigned long riscv_global_pfn_base;
> > +#define ARCH_PFN_OFFSET              (riscv_global_pfn_base)
> >  #else
> >  #define ARCH_PFN_OFFSET              (PAGE_OFFSET >> PAGE_SHIFT)
> >  #endif /* CONFIG_MMU */
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index a14bf3910eec..2ce4e9a46ca0 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
> >  #define pt_ops _pt_ops
> >  #endif
> >
> > -unsigned long pfn_base __ro_after_init;
> > -EXPORT_SYMBOL(pfn_base);
> > +unsigned long riscv_global_pfn_base __ro_after_init;
> > +EXPORT_SYMBOL(riscv_global_pfn_base);
> >
> >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > @@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >       kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
> >  #endif
> >
> > -     pfn_base = PFN_DOWN(kernel_map.phys_addr);
> > +     riscv_global_pfn_base = PFN_DOWN(kernel_map.phys_addr);
> >
> >       /*
> >        * Enforce boot alignment requirements of RV32 and
> > --
> > 2.25.1
> >
>
> --
> Sincerely yours,
> Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
