Return-Path: <SRS0=gmBF=KD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D82C433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 08:30:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED856143B
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 08:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED856143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LGWu3cNGnJHjjS+iY2LqY01XJ7K6TzKn2UoxHUmhIkk=; b=GlkN1NDAJtFEfdNRCehQ4XSvu
	OJcFctYq0stnVc/6GKT3nfmuZlz0OenLfpULhfEAtvM9XC298jcatoXSHPX0tH9zmT+GKqu70XgMN
	ukKSwAkGqarfYvQ+B9hjJAkZTzTCPrLOmODNfgrtbrQXkSRxFVS5Bxbp6Pje8tqWszYic0hAjdc9w
	x2tmB3/euKjfqawZdqUE4kHBqKXLIWmN6xPgFFdm3DTnAlDcD7cuxDrDEmzWOeasmq9HvRwtmNN7+
	FMxIinc0s2r1g0tek8AmffnwVcS9t6EygVoFKJGlIpX2hE0s7sTnZxbXGQDy2VOGzvDRX4IOFLJmd
	PlaVmbu8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfILp-0099rc-U5; Sat, 08 May 2021 08:30:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfILl-0099rF-Qn
 for linux-riscv@desiato.infradead.org; Sat, 08 May 2021 08:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QHWD9J6ofLEJEBPQ1owqvKysj/6TUwLubW0zYntQWn4=; b=S9XiodSJl7R2RUDHRzt1HXZdQ2
 ga6jXufEDk6KNjdQS+fQmnMR2p+tyXTAEBwpDnteQpoPHLiaxRdrgm3We/i2mR4xDG216eZUEk6bC
 O/0A/M3p7bT4RWHsO1RfcA7IIcEWlhBcyfb1Zybv2aRPyIJ5KY43ZQQ1Ta+0w2mfDZwrLP4+Mcp4o
 /F2WS3yBIkwjKAHym5F0QJW3Oh28rBt+7SXAN27jv/3dxNkOFXAhv8IyGG8e8IzWziTEQ0m6mgWaR
 m1Xm7s+KL/Q5XbcmJP74WWh6XqPFpGMweRrPHZK/MsToGvp1+dFdJ1erUH4TQm5gvi5eD9nDGjRtj
 KrvKzrNA==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfILi-007RVk-Ur
 for linux-riscv@lists.infradead.org; Sat, 08 May 2021 08:30:12 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so9983280otf.12
 for <linux-riscv@lists.infradead.org>; Sat, 08 May 2021 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QHWD9J6ofLEJEBPQ1owqvKysj/6TUwLubW0zYntQWn4=;
 b=dZdBMLYgAigD1CqNxf6YBFHDAPSBKHRMkHGbzd3aLFVUccCVbaX2zvdoOIGP3gH4sQ
 Ua9OJC0czYfg/l4IvsLCzHBdz681/Vpe/4Ww2cVSjrSPv84/152BRCkcmbJZQeijqg+Q
 csm9TUMgBZ3IxQgHZkRP1buVQAdlmX2ARVeyiwbg8wIRHbS4L2WG0TUjU/7xSIb9u18t
 viwUnlZfEVTj/m2VEWC19lqt0BjhOaFif6xNuR0E2yub//sjCd0Z9ZCljcGBVcacSg1j
 ix9EVtmEtY0JBPinRwJOiL8WeBtMZZH+y9+3DcTuAe+cPMiY4iiohsnBgR1q4O3wtEsT
 9+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QHWD9J6ofLEJEBPQ1owqvKysj/6TUwLubW0zYntQWn4=;
 b=RYZWmPx7lmPv7S8j7ziTA3JWyhax9ycdXo8qgfvAaNgQD/dtcDfxBo8G1vAEV8slS5
 AwP+Saq9RA38qrnZiqPI2zG5Xbzd+QJFMmYisX52KWcHD3AldLsUzJ7hhGS9N4RPsXII
 /A+mVTRXhejXtp2AwwEFXPgfeQ/qoP6Z9L4/ePwA5lk3F7wA6d09mU+ng+MudRBJ0D/F
 mDYl/MK4z8NcTjiABdODznQ5tINoYXIcLkvhDap95t+s8/QRKSE8X2ADbFDiVj5zxRC/
 7RaaC2bFptHIuUhEgHMv27LoimHFb6nFaBbywFFTuAZVcCzll5sw2VsD1JX6l7lCA8Ab
 RsPA==
X-Gm-Message-State: AOAM531NHnv5pizl14c0XOjZGkBoATblPLsZc/2xJW+zbYE4LS1LNy1O
 pkFulPQCN8r7hxjSFVP+3Nid7IwAqI5PIHmkfYbgeA==
X-Google-Smtp-Source: ABdhPJw9n+5UK5135MXj2DGo1mIATAjRHZ9GUm5rP6s1FqJ+mCaL9iDvQgZHtcre2zC7F2ebShO4XavGUaTcY6Rofys=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr12276751otn.233.1620462608813; 
 Sat, 08 May 2021 01:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210508032912.2693212-1-liushixin2@huawei.com>
In-Reply-To: <20210508032912.2693212-1-liushixin2@huawei.com>
From: Marco Elver <elver@google.com>
Date: Sat, 8 May 2021 10:29:56 +0200
Message-ID: <CANpmjNP_ybX6eK=AqGNCBfVSLtOxzihQpNGL95s8itOS=eCdfQ@mail.gmail.com>
Subject: Re: [RFC] riscv: Enable KFENCE for riscv64
To: Liu Shixin <liushixin2@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_013011_036432_326F02EC 
X-CRM114-Status: GOOD (  19.06  )
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

On Sat, 8 May 2021 at 04:56, Liu Shixin <liushixin2@huawei.com> wrote:
>
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the riscv64 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.

Nice to see KFENCE on more architectures.

> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the kfence pool to be mapped at
> page granularity.
>
> I tested this patch using the testcases in kfence_test.c and all passed.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
[...]
> diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
> new file mode 100644
> index 000000000000..590c5b7e3514
> --- /dev/null
> +++ b/arch/riscv/include/asm/kfence.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_KFENCE_H
> +#define _ASM_RISCV_KFENCE_H
> +
> +#include <linux/pfn.h>
> +#include <linux/slab.h>
> +#include <linux/kfence.h>
> +#include <asm/pgtable.h>
> +
> +static inline bool arch_kfence_init_pool(void)
> +{
> +       int i;
> +       unsigned long addr;
> +       pte_t *pte;
> +       pmd_t *pmd;
> +
> +       for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
> +            addr += PAGE_SIZE) {
> +               pte = virt_to_kpte(addr);
> +               pmd = pmd_off_k(addr);
> +
> +               if (!pmd_leaf(*pmd) && pte_present(*pte))
> +                       continue;
> +
> +               pte = kmalloc(PAGE_SIZE, GFP_ATOMIC);

Using kmalloc() to allocate pte looks weird. Does riscv have helpers
for allocating pte? Otherwise, __get_free_page() perhaps?

> +               for (i = 0; i < PTRS_PER_PTE; i++)
> +                       set_pte(pte + i, pfn_pte(PFN_DOWN(__pa((addr & PMD_MASK) + i * PAGE_SIZE)), PAGE_KERNEL));
> +
> +               set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(pte)), PAGE_TABLE));
> +               flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> +       }
> +
> +       return true;
> +}
> +
> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
> +{
> +       pte_t *pte = virt_to_kpte(addr);
> +
> +       if (protect)
> +               set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> +       else
> +               set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> +
> +       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +       return true;
> +}
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
