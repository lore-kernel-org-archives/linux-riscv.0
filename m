Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BAFD29F9D
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 06:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xi+tzcgrdsUOnhYEdTRHeJ/aZ4MvVDJ590IqnJbehTM=; b=wC8jedTaZ+zrpw
	oWW1OfWNCEZhsqV+X7Hc/wzlEnx6y3w+2/VoAexcjEWcsgCtnuAaX1b4F8tc8wVqCRIQBDqJaIXSr
	T3sIbq6RQNSU0zsgVqZ52WMU36eIVsniLPPjzzOk9mmELDnp7WdNpxlNt94As081dsH4+OGJ7BuKh
	bykkpuouFXWaNtGi2nyAyjJt6VzGRMjmXtmSJ281o0YN5ohzuJfYnwXVTwlPZv6FTRusMJXn16Mbk
	YQCT2TeYM+6hrX6bVYbT/U0ZDEMSC2CZatPEnM1hmLvsWJXZTFqOCrkggC+tey7q/Eahfi057oRMm
	n82sme/2MbEZFUKy3InQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zd8-000000020SH-1m1W;
	Wed, 06 Nov 2024 06:35:02 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZbH-000000020B0-3EsC
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 06:33:09 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e5f835c024so3539576b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 22:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730874786; x=1731479586; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ep9vB5JcSq75Q0rxA1MByd+Tqpe2bHUEQqu4CN5eEpE=;
        b=De6MjWHDxO6GDWeObGzwgw2He8eG9Rgclccxu/aCZXie+qgmO5BZWMmTkQ6lJSurOJ
         mNOENn8q/EvMbWmFg/yx90X0ty9+usc11Wydn+5o3T8wmptPKdjIWswKG6o6Tkzo/5Sb
         nBJetGcChLE6hKEg+f881GPKlP9+1hktkGeSoj0DgdjhjscyHseHO9NIeJRGFw8qT8q+
         k+gEPBgsypTSLSs0yXe34yHA36NVYj272CqtQtx8aEAs7ef+52R7AAALsXWQ1jy8mu+c
         EbvXmNAbqB9nek5qOYwADh4DQVXzIzha4GNL3de7qlUaN83J9khgRJmpxSIILbOdAE+1
         Cemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730874786; x=1731479586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ep9vB5JcSq75Q0rxA1MByd+Tqpe2bHUEQqu4CN5eEpE=;
        b=rb4BXD+35R+oPjJKLNPCoo1XtfU64dvLxkeDD/rb8QcZ7UHzsRYwnkPjqkE8/qQy7y
         DBtq3zu6vfaeTeoC4QJLqHDms0LRuE+Q6a4SfMX92q8/r4GKWHwuOXDeTrWlgNXAh7es
         f4JapWAJQLsLmLpT1fo5fsBqY88VbA3F/R3/fO7tTb8rFfyT8QfjDTLPUWjmAWdO4FlN
         YzvSRyfEnPdRKzAAcon57eXj1dPpN1ivw9cK2ym7N2XJqVvSkj/edPYpKLMd4g91CSLF
         0B6Weg/uaQBTtc+BBkrWTrncbFnLvgiE4gK2BXCk6NGCgphMDkqJ2denx4q0OU0QWSOS
         +rDw==
X-Forwarded-Encrypted: i=1; AJvYcCV39hbs5JpSRMcj/yIuN5yD3Ug9KJoNyPKtDKercg/8IIRqJbWNeF/QCQCVeiokWnsdQOsNSEhu3u0Ujg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHO/LxuAPLBGqJ2swi+w6IntWTy8m3S9LMBhWkHqB25LE8rLMd
	O0lQZsndFBwwGPgWMyzduT67lxafL4DDTJMJ56M+j5y2foeTjwowI4HlerqpLmbLjz/rbVwxOYC
	8XuB1UuyeDW+NcWK/vZmwrSjunjA=
X-Google-Smtp-Source: AGHT+IFOKZfUn7pYVwMgqCTC9LcSqnZVclpzyVHyqZt1XS7Kxu5crLN19wMDQo58VzaFs+8VGh45/GqUda6J3wWSsuw=
X-Received: by 2002:a05:6808:1527:b0:3e5:f141:bad with SMTP id
 5614622812f47-3e638480bd8mr34003447b6e.24.1730874785791; Tue, 05 Nov 2024
 22:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20240830011101.3189522-1-zhangchunyan@iscas.ac.cn>
 <20240830011101.3189522-2-zhangchunyan@iscas.ac.cn> <bedac8d9-4ba4-427c-9323-edcdbd7876ee@ghiti.fr>
In-Reply-To: <bedac8d9-4ba4-427c-9323-edcdbd7876ee@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 6 Nov 2024 14:32:29 +0800
Message-ID: <CAAfSe-u9L21e=x6i3oX2qCKSLLQw8p8fyuJwnLTijdHx_A-gnQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V4 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_223307_852267_28204776 
X-CRM114-Status: GOOD (  23.85  )
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

Hi Alex,

On Tue, 5 Nov 2024 at 20:45, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 30/08/2024 03:10, Chunyan Zhang wrote:
> > The PTE bit(9) on RISC-V is reserved for software, it is used by DEVMAP
> > now which has to be disabled if we want to use bit(9) for other features,
> > since there's no more free PTE bit on RISC-V now.
> >
> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
> > the build condition of devmap definitions.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   arch/riscv/include/asm/pgtable-64.h   | 2 +-
> >   arch/riscv/include/asm/pgtable-bits.h | 6 ++++++
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 0897dd99ab8d..babb8d2b0f0b 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -398,7 +398,7 @@ static inline struct page *pgd_page(pgd_t pgd)
> >   #define p4d_offset p4d_offset
> >   p4d_t *p4d_offset(pgd_t *pgd, unsigned long address);
> >
> > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && defined(CONFIG_ARCH_HAS_PTE_DEVMAP)
> >   static inline int pte_devmap(pte_t pte);
> >   static inline pte_t pmd_pte(pmd_t pmd);
> >
> > diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> > index a8f5205cea54..5bcc73430829 100644
> > --- a/arch/riscv/include/asm/pgtable-bits.h
> > +++ b/arch/riscv/include/asm/pgtable-bits.h
> > @@ -19,7 +19,13 @@
> >   #define _PAGE_SOFT      (3 << 8)    /* Reserved for software */
> >
> >   #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> > +
> > +#ifdef CONFIG_ARCH_HAS_PTE_DEVMAP
> >   #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
> > +#else
> > +#define _PAGE_DEVMAP 0
> > +#endif /* CONFIG_ARCH_HAS_PTE_DEVMAP */
> > +
> >   #define _PAGE_TABLE     _PAGE_PRESENT
> >
> >   /*
>
>
> There is a small inconsistency in our code: pte_devmap() is protected by
> a #ifdef but pte_mkdevmap() is not, I guess that's why you had to define

pte_devmap() is defined in include/linux/mm.h as well, we have to use
#ifdef to avoid compile error since we will change the
CONFIG_ARCH_HAS_PTE_DEVMAP to be selectable on riscv.

> _PAGE_DEVMAP if !CONFIG_ARCH_HAS_PTE_DEVMAP.
>
> I'd be in favor of removing the #ifdef around pte_devmap() too.

So we cannot remove the #ifdef here, the compiler would report
redefinition errors if CONFIG_ARCH_HAS_PTE_DEVMAP is not selected.

Thanks for the review,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
