Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCD4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYhQFRonBSXw02ctRA2UwT9Pbqs5iKkoUpe7GDgrZnA=; b=oflwHn1eoxgdZg
	nQ9Z5TDDbwfwlz74khYz1mKEW72toP2baLevzsJmN23tV8fUabrXIdvqIo9iHSz+201jScPDp0CpJ
	g9mULduZEWzK+do7SKbIMhwGtY4jfePCpWgS/hfWFsQYGo5thZly2E6eCNEj0S4ZsXL59t9VamRDa
	yifHn+UKhopdSteVs6o26iawxkgDmUWQEtSjNRon6kZ6VZ0jC/ylO7dqv4lm4anIsuFnIBrh/XG3C
	nMo7s3cxfeNU3TCV2pB9I6qnl3jxR1OGBkskBf2RfmYnwK1LWTeUhJmQ9OyI8k/nWLZk5ZhUZnmwa
	tWUkRpko4bMYUc5dqVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX50g-00EUyT-U3; Wed, 23 Mar 2022 17:43:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX50d-00EUvu-Im
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 17:43:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id t1so2755941edc.3
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXItiXCQz5Vw2Hrps28AyoQxpxOIY3YlmmRg+b0brOE=;
 b=Ad5P83rtyjFJkIHpTwqdisAfJ/ztomVrkyAP+/G5xcG7X7fSZdTAaNlkX1NuUaO62v
 6aGCEicDllFaaP4wKxcjPdZ8/eBjrIcBioriIOWrBPlQXjDgDH3HATEcmEq4pjmYmyuL
 sNPU+M67PiW55rp6J4ntdoUUQq3sdqTdfGCWVfLFYxhpAQWUXVy4wevJiFkU2IMHO6Xl
 JPn1R6Jk+K+BjwjAF55y5ojrOPrvDZxddQtL6CQMHjNSNskYTkA8hejsHn2YnvwD/rz0
 mzsS1QCUXyKXqlpj49Xo/tbAm5QXBY6vtamYRPwNdpX+LKjs8TCuwOUPC003HsbCgdXZ
 Y9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXItiXCQz5Vw2Hrps28AyoQxpxOIY3YlmmRg+b0brOE=;
 b=qtJ2PGHAwEajDR0J07y+rPXdZmyjfJOEuK7D/5kLh1A+SJIMPFRsq7KCiFmL1EkWoC
 gBy+xvBQC+eyJvzVhCuhfLG9w+2vbNks5nVr3uuV6tKAEn3/Mk4ya8iUb/bjZkfQ0n1r
 Ps5HWWvuHOd1+9Lxr6dZyKeA0dEwr2k6OTRjZXHTel0Q23QIk/kih3hUzDOMbjsElmJ0
 j9cNyBxjLOcFFgCLYadZqVS9H8K7PTaJHwfexyt1AxYXsyfR+kawV5jfOYw07YORB0fQ
 goKQOvd3TI7Wsw97l+Ct8x1Tq9dCHGLEzZx3iZdotlrPBaNRtLZ9VZocweS7pL0dDaEL
 t9YA==
X-Gm-Message-State: AOAM533TfwkqfR5ZTRxaJbEC5OyfFDXSEnGMu3rNCNnHMdTTs9NEd0/D
 jeG5U24r+AVLJ368h0/vFPuvJYOayHcVBKh0vZY/1Q==
X-Google-Smtp-Source: ABdhPJy6cLr1ddZfcfPHFBk/SvkOJjbyy8M1sRFi3dxI2xQMUYKnKZHJSoBfOoqSYj8bhYV5u6Fc1RkjdJy1KyGB1XQ=
X-Received: by 2002:aa7:dbd0:0:b0:416:633c:a0cc with SMTP id
 v16-20020aa7dbd0000000b00416633ca0ccmr1530996edt.349.1648057373156; Wed, 23
 Mar 2022 10:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144447.3563146-1-tongtiangen@huawei.com>
 <20220322144447.3563146-3-tongtiangen@huawei.com>
In-Reply-To: <20220322144447.3563146-3-tongtiangen@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Mar 2022 13:42:16 -0400
Message-ID: <CA+CK2bAa96oE0FbtJUjAJ=vpuzQsW3R60K9SUhca6mZ3BL1f8w@mail.gmail.com>
Subject: Re: [PATCH -next v2 2/4] mm: page_table_check: add hooks to public
 helpers
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_104259_639796_2A5B0630 
X-CRM114-Status: GOOD (  17.27  )
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

On Tue, Mar 22, 2022 at 10:25 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> Move ptep_clear() to the include/linux/pgtable.h and add page table check
> relate hooks to some helpers, it's prepare for support page table check
> feature on new architecture.
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/x86/include/asm/pgtable.h | 10 ----------
>  include/linux/pgtable.h        | 27 +++++++++++++++++++--------
>  2 files changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 8cd6514e3052..8c85f2eabbaa 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1077,16 +1077,6 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
>         return pte;
>  }
>
> -#define __HAVE_ARCH_PTEP_CLEAR
> -static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
> -                             pte_t *ptep)
> -{
> -       if (IS_ENABLED(CONFIG_PAGE_TABLE_CHECK))
> -               ptep_get_and_clear(mm, addr, ptep);
> -       else
> -               pte_clear(mm, addr, ptep);
> -}
> -
>  #define __HAVE_ARCH_PTEP_SET_WRPROTECT
>  static inline void ptep_set_wrprotect(struct mm_struct *mm,
>                                       unsigned long addr, pte_t *ptep)
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index f4f4077b97aa..d27fd0ed84a9 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -12,6 +12,7 @@
>  #include <linux/bug.h>
>  #include <linux/errno.h>
>  #include <asm-generic/pgtable_uffd.h>
> +#include <linux/page_table_check.h>
>
>  #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
>         defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
> @@ -259,14 +260,6 @@ static inline int pmdp_clear_flush_young(struct vm_area_struct *vma,
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  #endif
>
> -#ifndef __HAVE_ARCH_PTEP_CLEAR
> -static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
> -                             pte_t *ptep)
> -{
> -       pte_clear(mm, addr, ptep);
> -}
> -#endif
> -
>  #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
>  static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>                                        unsigned long address,
> @@ -274,10 +267,23 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>  {
>         pte_t pte = *ptep;
>         pte_clear(mm, address, ptep);
> +       page_table_check_pte_clear(mm, address, pte);
>         return pte;
>  }
>  #endif
>
> +#ifndef __HAVE_ARCH_PTEP_CLEAR
> +static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
> +                             pte_t *ptep)
> +{
> +#ifdef CONFIG_PAGE_TABLE_CHECK
> +       ptep_get_and_clear(mm, addr, ptep);
> +#else
> +       pte_clear(mm, addr, ptep);
> +#endif

I have a preference to use if (IS_ENABLED(CONFIG_PAGE_TABLE_CHECK))
instead of #ifdef. The end result is the same. Otherwise it looks
good.

Thanks,
Pasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
