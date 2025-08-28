Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE74CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJtB2BtD77qjSx2p65TpEKMJusHimMtQIiTu/Tt1DVI=; b=n+5ni2RAWjULgA
	b18H73KQmE7l7cBYI4A7wJptHM2a5Bubtn7gOdwOqu3j0kxamqi+YIpKoI7Xa8mPA7Vu8+xKuKMxr
	4xWVBN5JxJwbwovu0Cx8teT5orn9oUIjVUt0Gp2ru8w89kY+rD6L3do40VFsiP62uD421WDIwzgVr
	KVAkHrlJFKD9BMI2A5Bse1wPvXpavNtfurlzBoAHcDCysqsbefIeH7dVNYMKRv1GClPmtqJZPTP4K
	QPn4NwBahftJRYHBYIkDRzn7gZLqo07YPc+ron4KHp4rlDoXgLwx5ezviQKZ/IEb/DA6lSaL8AgVT
	jP9bXYeVg0LVaTnk5yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ32-00000000zNm-3Oqe;
	Thu, 28 Aug 2025 09:36:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYEc-00000000q8k-2nrh
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 08:43:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-246151aefaaso14629235ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Aug 2025 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756370633; x=1756975433; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLT2osl3N94HJBBJWKPAk2avCo16Lo88yw1WJjz/wsM=;
        b=W7LX1yzd4Kd8NO9hoCAAVV+uSX1mh2Ce6Zc4t4jo9OGFxTH64SxVsz22a8PRTHkEAT
         N/b3tbamGtLO3aHlqVsXdiN92xJJ9o2UGEZysWwLNYmPh2Ssd5V5k2Jy7azJRqE5StIt
         PaBAgZ2iW1cc3AKY/thVoGxkKQnqodH0KVqQQ5iJtqM0w0ahhzX61D9ugDeCnGF9tN4v
         FyTRz2yqIkjmoMZYvtElqs8TS3+8TJoABeXz1T3ONMc8iUFyGFyFDvpkxF1D6b3G0E2M
         Bej2Kj3lwUjIvCgSKkRRHX/i+G72krxf0PVESfAjCukIaRpi6jbED857d44yVr3gtFEN
         uOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756370633; x=1756975433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLT2osl3N94HJBBJWKPAk2avCo16Lo88yw1WJjz/wsM=;
        b=wvBs1VMwasf19OQY/hCFmAsIN+10FPupBu6BEiMKQd3XZB6wfJ+snmhkkbO86LWj10
         3iUEs/rgc5tah4DmbD1KlsqA8mDXF4jyg1R2MQ6aSorxaOz1OqriKB4dz+GL+7SwgDyp
         9xTm6hRQxFLL4BHauo2BPISKpgH0AKAjFxdm42Q7zIPPpyBwRPBZlk9fYzhWdt6L5Obx
         eXGTWIz9nmAQ5jiD6X9fzjh7cxnjTllDp35wDekgyDS1zKNhbSfCKagf/qz2mSy/ySaH
         6dzWC7iTHrQb0qvuk+hns+ZNuCJ2TP5xOSXVMo6nCYVNsD2nJLL9a0yuyIWqYOaZN7wQ
         N/gg==
X-Forwarded-Encrypted: i=1; AJvYcCXww+SQIQuEAZSMGkm0g4muc7lakhUnUnCYblPBfrfKYTjPXOIlSqVPO7a00DDlfnNRw1EqicK34t0SZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhr9vcKsfH6kPgEoycsqP4bNbMHihbkLFvNXbVjdirouXXTPx8
	RigMvVjEECYMO1BnOChwRpq8w2PbChhgp2g34B/79hBH1eMCsBzhTEbdetDoGuYAmIaJwS2gsFm
	LHEVsg0LEFULarxx+LgwC3gicWBs/aGlc8Gn+eXVC
X-Gm-Gg: ASbGnctHU86w/wjChvxHrISxl8jCx3KJkrUIZZxDxH54CwZZwiPCZ1F3AYcetRd2HyV
	AqTS2zoq56uQVMC2MebvebuAUvMtdlrvTcWSEmPGsL1hjdb51rgXq8E5q7OMy6NtgOdoJyWrgNr
	Z/h4U4Cko/aqFxeIw4pnhgzct7SU9PUZLpkzS5yGhOb9zNTR7p5t1+gz+NZJdFopKYJc++KfQV/
	eoadm6mhRp9gvKeQq2+DgAHCTE=
X-Google-Smtp-Source: AGHT+IGJmjz+YHPyNxr90AMhiQNNDQu9deq8PWwNfyq+zFWi/YcgUyPYkmS3VX3aACMgtkUmoKeOvBcyBRDmMb3NDeE=
X-Received: by 2002:a17:903:3d06:b0:248:8063:a8b4 with SMTP id
 d9443c01a7336-2488063abcbmr89508125ad.22.1756370632768; Thu, 28 Aug 2025
 01:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250827220141.262669-1-david@redhat.com> <20250827220141.262669-35-david@redhat.com>
In-Reply-To: <20250827220141.262669-35-david@redhat.com>
From: Marco Elver <elver@google.com>
Date: Thu, 28 Aug 2025 10:43:16 +0200
X-Gm-Features: Ac12FXwMzUnIHp_v7uH0kV3Hu6ram9vqgPmCMZ3TyuNNAlhDfe6K8rTgx1FpO8k
Message-ID: <CANpmjNP8-dM-cizCfsVOUNDS2jBaY6d=0Wx8OGen5RbXgaqcfQ@mail.gmail.com>
Subject: Re: [PATCH v1 34/36] kfence: drop nth_page() usage
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_014354_723174_BDFF6D80 
X-CRM114-Status: GOOD (  25.79  )
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

On Thu, 28 Aug 2025 at 00:11, 'David Hildenbrand' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> We want to get rid of nth_page(), and kfence init code is the last user.
>
> Unfortunately, we might actually walk a PFN range where the pages are
> not contiguous, because we might be allocating an area from memblock
> that could span memory sections in problematic kernel configs (SPARSEMEM
> without SPARSEMEM_VMEMMAP).
>
> We could check whether the page range is contiguous
> using page_range_contiguous() and failing kfence init, or making kfence
> incompatible these problemtic kernel configs.
>
> Let's keep it simple and simply use pfn_to_page() by iterating PFNs.
>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks.

> ---
>  mm/kfence/core.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 0ed3be100963a..727c20c94ac59 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -594,15 +594,14 @@ static void rcu_guarded_free(struct rcu_head *h)
>   */
>  static unsigned long kfence_init_pool(void)
>  {
> -       unsigned long addr;
> -       struct page *pages;
> +       unsigned long addr, start_pfn;
>         int i;
>
>         if (!arch_kfence_init_pool())
>                 return (unsigned long)__kfence_pool;
>
>         addr = (unsigned long)__kfence_pool;
> -       pages = virt_to_page(__kfence_pool);
> +       start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
>
>         /*
>          * Set up object pages: they must have PGTY_slab set to avoid freeing
> @@ -613,11 +612,12 @@ static unsigned long kfence_init_pool(void)
>          * enters __slab_free() slow-path.
>          */
>         for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> -               struct slab *slab = page_slab(nth_page(pages, i));
> +               struct slab *slab;
>
>                 if (!i || (i % 2))
>                         continue;
>
> +               slab = page_slab(pfn_to_page(start_pfn + i));
>                 __folio_set_slab(slab_folio(slab));
>  #ifdef CONFIG_MEMCG
>                 slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
> @@ -665,10 +665,12 @@ static unsigned long kfence_init_pool(void)
>
>  reset_slab:
>         for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> -               struct slab *slab = page_slab(nth_page(pages, i));
> +               struct slab *slab;
>
>                 if (!i || (i % 2))
>                         continue;
> +
> +               slab = page_slab(pfn_to_page(start_pfn + i));
>  #ifdef CONFIG_MEMCG
>                 slab->obj_exts = 0;
>  #endif
> --
> 2.50.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20250827220141.262669-35-david%40redhat.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
