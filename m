Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71734C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7QcI95nr4dBPXhzBHwzG52SDjdm65WSOjlluQ7S7qM=; b=CBiquT4LJBhtKb
	UzJA6IWHH3JUHed6R0sh4dkPYrF0MMTxgBuCApR7Suy4j8fGRPTm0WTo80+zW9GiTsVUCrUZLkKD7
	h7T57lSkd+T83gECf2xBdM9QRui45IB5dWYj9dkUDeo7paY6A90hrUTIsY8NMXU8u6RJ5pkcvYIqf
	eauTYdiZA/inpTzC+KfkEsHYWJP3kOuMDvodJSvRrIF//B2rpdgEANWo9hlx6UBMoLpVsjZA97O+B
	FHm/5yVL3qQqKLh75rENm0IrnM36aXvoxhTediynvjHjQNT79OTh7U1V2ftQYfPS4AeJsIaETNhqz
	26ReA2VZWUrHwvpxrKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4tkg-008eM4-Vc; Tue, 13 Dec 2022 01:06:35 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4tkd-008eIU-OS
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 01:06:33 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-40b40ff39f1so134395147b3.10
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pv4WCEHXWY+FV1YUq8UNcPDkKm6bq2JSRGE//Kj9vf8=;
        b=nHZzxj7Q780CVpKNF5gPN9HC44/Nc5HxGgyb1Juqwj1LdHZaoEfIug7PLPSpIoG2yv
         bmGt6M4gEviMg/4oleu94/zXTiZWfGijEovvaEHGgA7Eev1ScUr3lmzTjd64Mi03kCxs
         PbGxjVHqOnyt6ZPcxJwRG/wcbDAMZUx3Xl4SiOpcV0axmJA2GnEXju4M06z4rBwHhhEb
         yE957qAZ7PBaas2oZC443pTFXpt0xmYGnt5zUCk7Qk2H1quPnvfsIn/n2xF6RlLVxEn/
         7qsqOx/N1UaziUkHy3R+gnhN/7hTYyhLpEA7pfvyzNtgwB54yoGqLe9EO7E5FBPlJUQ0
         OJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv4WCEHXWY+FV1YUq8UNcPDkKm6bq2JSRGE//Kj9vf8=;
        b=gXzkGGKbgVgxyqe96XL8EtaycxMuQdR6P1Nq0uy71c1nqUMW3V0OdvrIx+OGORNYeo
         f+oGK5tR0yYmG3e7dFjRGZ2WEqeij29ubxx3D+jG6TEcEbIr82O2LpvMt0a9EhI3pE0C
         8YBkWdeobYXWhLNwxOqGvyClwtcCPd9PMwXwZV5WdfWx26Ev0FaE55ayJcmleNhGMpWi
         7RuKjs5SP4z4Lqg9tFnnlajp2F6da0DiKNeIWRf47k+QHvMhtQt5VzXJ7NMl2m/2XyQK
         gIt/s/4SGMc78lKg2OMKiu/+q21e3zu1FjNeB4C/69CA5W91gb0oGg2Yxtv21q5x88Hw
         5e/w==
X-Gm-Message-State: ANoB5pnJxyn4qH6JeDsydtD05vNAAhIvTVYls8jj0yNxrnAHCvPULMi9
	NMbOPAcSE31bbNs+y/bMCoCsahr9C6E9XZPdF55Edg==
X-Google-Smtp-Source: AA0mqf6UC/AYrRSJ+MEPYQjgdOAUYa1qq71cF4IZc0dJwhxjGVc2rf3hOO63DAbZlhHX9B51ehBcsSfwU5FzFAQu4JA=
X-Received: by 2002:a81:4d6:0:b0:402:7be6:f265 with SMTP id
 205-20020a8104d6000000b004027be6f265mr4263609ywe.188.1670893589689; Mon, 12
 Dec 2022 17:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-3-dmatlack@google.com>
 <48f4df00-8ef6-042f-c9ae-4023c4f70058@redhat.com>
In-Reply-To: <48f4df00-8ef6-042f-c9ae-4023c4f70058@redhat.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 17:06:03 -0800
Message-ID: <CALzav=crvFwCo50N5QOFD5FstrR9wJ=FmQAkYDHaKzQuatCNfw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/37] KVM: MMU: Move struct kvm_mmu_page_role into
 common code
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_170631_819746_933EFF97 
X-CRM114-Status: GOOD (  21.01  )
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

On Mon, Dec 12, 2022 at 3:11 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > +/*
> > + * kvm_mmu_page_role tracks the properties of a shadow page (where shadow page
> > + * also includes TDP pages) to determine whether or not a page can be used in
> > + * the given MMU context.
> > + */
> > +union kvm_mmu_page_role {
> > +     u32 word;
> > +     struct {
> > +             struct {
> > +                     /* The address space ID mapped by the page. */
> > +                     u16 as_id:8;
> > +
> > +                     /* The level of the page in the page table hierarchy. */
> > +                     u16 level:4;
> > +
> > +                     /* Whether the page is invalid, i.e. pending destruction. */
> > +                     u16 invalid:1;
> > +             };
> > +
> > +             /* Architecture-specific properties. */
> > +             struct kvm_mmu_page_role_arch arch;
> > +     };
> > +};
> > +
>
> Have you considered adding a tdp_mmu:1 field to the arch-independent
> part?  I think that as long as _that_ field is the same, there's no need
> to have any overlap between TDP MMU and shadow MMU roles.
>
> I'm not even sure if the x86 TDP MMU needs _any_ other role bit.  It
> needs of course the above three, and it also needs "direct" but it is
> used exactly to mean "is this a TDP MMU page".  So we could have
>
> union {
>         struct {
>                 u32 tdp_mmu:1;
>                 u32 invalid:1;
>                 u32 :6;
>                 u32 level:8;
>                 u32 arch:8;
>                 u32 :8;
>         } tdp;
>         /* the first field must be "u32 tdp_mmu:1;" */
>         struct kvm_mmu_page_role_arch shadow;

We could but then that prevents having common fields between the
Shadow MMU and TDP MMU. For example, make_spte() and
make_huge_page_split_spte() use sp->role.level regardless of TDP or
Shadow MMU, and is_obsolete_sp() uses sp->role.invalid. Plus then you
need the `arch:8` byte for SMM.

It's possible to make it work, but I don't see what the benefit would be.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
