Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B353C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibh/KaYKzYmFDDD3sS99vkIWx6e11AJN86xkIGI5M+M=; b=y+RBC5Ll+zVpI2
	Cz588MLZGFUMgH5IUh4GdnV4qPSYVcyPsGMZlTwvbGApeA5ubF5hEroNWjJTR5dD6WjMNDoPvJz9S
	kD3OfEDVC/SFxeojBNjJyPwQjNzs1DAzn9buYh6mDkmwQtxk+wfhGkNcJUhlorY2Y153kPXUWiSqI
	5sztqftpFNujVNeb7Osd07gG6drAGHSxC0pjK3UQrHR4VLxzxIEBNHWYzTUpzgU2yGAVnpZ3S54Py
	J+AAM224FSvQrnsujkptgakB+fhaMWmn+TQDGwGO7evcdATyCA+f2s0PVi5Lt3VcRr0A9I03IUvpm
	pOgTKL4ms+Z0KDLCYJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4oXO-004RID-6F; Mon, 12 Dec 2022 19:32:30 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4oXC-004RFn-Pf
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 19:32:21 +0000
Received: by mail-qk1-x732.google.com with SMTP id z17so5577618qki.11
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 11:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Mowh6IPNmR3LfyP4Dfupt4EtlOdkli9ymGjaw17vXI=;
        b=rm4I+wZFg2eJb2x8Va4Maw+iWq9AhwTPFcd5+4c65xHXN6A5VLXkr9Pzd+ERVn8WhT
         rXhKRHb0OCZ+Y251Cv06Op2FK6vM2ZvEcORuna52lFhL+6E0foSYaY0b0PInsi9lsPV8
         Bgem1uzt3AsOakc9GqY8CaGWz+mrz3XBlCJqtwog7YunyQdMthSrwnUiksKZYyXlRAE0
         U9EOqeHbYuzJisNspTwwqAApwqaC+6zidytdTp+shU4lKB0hfKRno0XiysILsLDo8L/z
         g3pQYrNCjufpK6hqXNdALJyiGfuRRPgueVHAc2pb1HOTaCnJmd2+UOOHx+8cakJYk0rR
         nBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Mowh6IPNmR3LfyP4Dfupt4EtlOdkli9ymGjaw17vXI=;
        b=x6vnPi1uPj34qhHcVeFQBwz9a6yzbNSl1KDVwZbX1odVCTNGOOId2CxwJyGrR09QHm
         PlglLDBPtmKdcHjTYWpGA1T61jH/OpYzncBrfHkwTwaj+rKA4hI37p5A2/ivQVrXmIOW
         o3fE1YfULKct1LCdAgZKDDBQSO2i2PxTePReO6ZjGyCm7jbdYqKtGp7Vfb3i/HSn1mOg
         wZ4oaSc8AyBooYrM1NcaM8aRygxySSHtuiMBvq/1TPQAOKH1N1OW17VXwuzpUl6rL57d
         oO9EnM23wcwatBlsXiCrzmW5LVTzw1fcsGzKKwADp2Xtxoq05W1eeIdyBiKpE+635tEZ
         /wIQ==
X-Gm-Message-State: ANoB5pnNvlpnAF9ioi//bZU1Siu/9xiH5H6KawdbH/2gu+KEq35hAXzc
	My1Q5yph72joJgWXsHXduB5fWL2OaV1vnnI8aUdJAQ==
X-Google-Smtp-Source: AA0mqf76PYiP6JK2x7WnSIvO5AyXyfgzfQ+XX+DgyhybSiTFwMNyTSUY4u6lHGW51+1mrY7J65iPpmVnUeYRL2TUxNA=
X-Received: by 2002:a05:620a:4394:b0:6ff:680:f3c with SMTP id
 a20-20020a05620a439400b006ff06800f3cmr1474664qkp.670.1670873535923; Mon, 12
 Dec 2022 11:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-21-dmatlack@google.com>
In-Reply-To: <20221208193857.4090582-21-dmatlack@google.com>
From: Ben Gardon <bgardon@google.com>
Date: Mon, 12 Dec 2022 11:32:05 -0800
Message-ID: <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
Subject: Re: [RFC PATCH 20/37] KVM: x86/mmu: Abstract away computing the max
 mapping level
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Krish Sadhukhan <krish.sadhukhan@oracle.com>, 
	Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_113218_908670_58901810 
X-CRM114-Status: GOOD (  26.36  )
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

On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
>
> Abstract away kvm_mmu_max_mapping_level(), which is an x86-specific
> function for computing the max level that a given GFN can be mapped in
> KVM's page tables. This will be used in a future commit to enable moving
> the TDP MMU to common code.
>
> Provide a default implementation for non-x86 architectures that just
> returns the max level. This will result in more zapping than necessary
> when disabling dirty logging (i.e. less than optimal performance) but no
> correctness issues.

Apologies if you already implemented it in a later patch in this
series, but would it not at least be possible to port
host_pfn_mapping_level to common code and check that?
I'm assuming, though I could be wrong, that all archs map GFNs with at
most a host page table granularity mapping.
I suppose that doesn't strictly need to be included in this series,
but it would be worth addressing in the commit description.

>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/tdp_mmu.c     | 14 ++++++++++----
>  arch/x86/kvm/mmu/tdp_pgtable.c |  7 +++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 7670fbd8e72d..24d1dbd0a1ec 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1696,6 +1696,13 @@ void kvm_tdp_mmu_clear_dirty_pt_masked(struct kvm *kvm,
>                 clear_dirty_pt_masked(kvm, root, gfn, mask, wrprot);
>  }
>
> +__weak int tdp_mmu_max_mapping_level(struct kvm *kvm,
> +                                    const struct kvm_memory_slot *slot,
> +                                    struct tdp_iter *iter)
> +{
> +       return TDP_MAX_HUGEPAGE_LEVEL;
> +}
> +
>  static void zap_collapsible_spte_range(struct kvm *kvm,
>                                        struct kvm_mmu_page *root,
>                                        const struct kvm_memory_slot *slot)
> @@ -1727,15 +1734,14 @@ static void zap_collapsible_spte_range(struct kvm *kvm,
>                 /*
>                  * If iter.gfn resides outside of the slot, i.e. the page for
>                  * the current level overlaps but is not contained by the slot,
> -                * then the SPTE can't be made huge.  More importantly, trying
> -                * to query that info from slot->arch.lpage_info will cause an
> +                * then the SPTE can't be made huge. On x86, trying to query
> +                * that info from slot->arch.lpage_info will cause an
>                  * out-of-bounds access.
>                  */
>                 if (iter.gfn < start || iter.gfn >= end)
>                         continue;
>
> -               max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot,
> -                                                             iter.gfn, PG_LEVEL_NUM);
> +               max_mapping_level = tdp_mmu_max_mapping_level(kvm, slot, &iter);
>                 if (max_mapping_level < iter.level)
>                         continue;
>
> diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
> index b07ed99b4ab1..840d063c45b8 100644
> --- a/arch/x86/kvm/mmu/tdp_pgtable.c
> +++ b/arch/x86/kvm/mmu/tdp_pgtable.c
> @@ -163,3 +163,10 @@ void tdp_mmu_arch_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
>         if (shared)
>                 spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>  }
> +
> +int tdp_mmu_max_mapping_level(struct kvm *kvm,
> +                             const struct kvm_memory_slot *slot,
> +                             struct tdp_iter *iter)
> +{
> +       return kvm_mmu_max_mapping_level(kvm, slot, iter->gfn, PG_LEVEL_NUM);
> +}
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
