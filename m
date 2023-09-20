Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554D6CE79D4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lLQ4QmUyOwOR3ZMsM9vxuKO9a7B8ninT8qIcuLvr5wc=; b=eWvuasnfbPdH8se5DIYFzgPwEq
	5aP5aY1IMFjEkLVdhPvRoymJeMyIiDDHnNtuw5dDQ7u4H5QBKHXVUuNHJALUyo1b6ELR5ymBm9yOR
	WsYw8gpYETtnDm1NRmxsY5CQGUUY3FHe7PWAlv8JOYatZYdShkMca3IWVWT97LubFJjCz9F7Uuq0R
	06T7M6/YUeHY7x9VYUwLnYS/n2IyuMgSP1vT+XXkfuqqMpZwCR80envAScvDgLcnuOE5NtZs0A4V7
	EWT9W62m2js8jAtjA8fsM92lUKB9/NoYBBo9pHbezNeyUCtI55MtCWlZoQWKmWE1+oZV8I+Bxv0nX
	TGmM58Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiy7j-003JTF-0P;
	Wed, 20 Sep 2023 14:24:15 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiy7f-003JRE-29
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 14:24:13 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-57774c725ebso5154090a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695219850; x=1695824650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DOI6e5Fz0eSccYOGv0a2XgOrMIQyrqURVkPdu4XpUSk=;
        b=fb/NMiFOQtxIM2CxRvwqKfL+qRQstBi0KYVF+yiZHEQ30XMZFxtZu+GAUDcK+FRsKF
         Or6R0WoARa4kK9xU64SJ3u/bMCRHvNA380+lKy3lyJKdKZWfTU7ZH9VNANdZUkYpteBp
         p5VW5uAyLZpO0kMWnoBeleKTWTYNRsTGagg5zCGRo1RaZAoBLAXttLjS4oPgvi1Af2ve
         DEVo6Cphsztn4lqX2UEhr7RNgkzjSWSpB4F4utqfrCyLGYu7GWrtYb1uoB4dNOIrt/+4
         n6cfSATLlDjLsb6jRnRPrp8kIoj7zlLXbQSncohP1hw3TFneNxlcC0bBkna9VO1/6a9x
         605g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695219850; x=1695824650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOI6e5Fz0eSccYOGv0a2XgOrMIQyrqURVkPdu4XpUSk=;
        b=WKYzHBlnCU0cdNTDp3khUK40rjJSi9Uo0X5HlhA+QacS1QLTKRYZwbeETjFLufGzz7
         nXJnq15SGnFyCfVV5i0tFEhrF6otZvhuLza0mQu3UU1K082+XzGyNMEglrxPbwzscRjH
         qTj5Ii/qaRrvVACDaZDO9nu6PQWLbr/a89ZOpPPljOt6dICrVt1iiu4bpFhKiaNoOW7K
         S4j6tY8X79XB/3+nd2Tg+/C7WOijas1gaCB44W9CNrntuC2x36W8fB+RwJOsNK4QI0o9
         jq/zze4w73xw/GFEC6zi6GRzrOiUX+OOh0URpq5YNec+1MoYvMWg0EHRGOo+ierA62l8
         jluQ==
X-Gm-Message-State: AOJu0Yw79kGUUx5Lx+7h7SJG0e3FDbeCWoXDStH2nTAdp9kgXepmBxhS
	xUywuM3V6Zbrt0Ne7LqDi/Y6i+k2MaE=
X-Google-Smtp-Source: AGHT+IG+7+KaIB01fLVIPGeb7tjb/zu/hrsNFs+xXo/mmyM/aDSVQYbb0kWI4ACm+gkgu18FM/xCEI0V+P0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f203:b0:1c0:ac09:4032 with SMTP id
 m3-20020a170902f20300b001c0ac094032mr25326plc.9.1695219850013; Wed, 20 Sep
 2023 07:24:10 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:24:08 -0700
In-Reply-To: <e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-15-seanjc@google.com>
 <e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com>
Message-ID: <ZQsAiGuw/38jIOV7@google.com>
Subject: Re: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_072411_723156_37418485 
X-CRM114-Status: GOOD (  23.33  )
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

On Tue, Sep 19, 2023, Binbin Wu wrote:
> 
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> [...]
> > +
> > +static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
> > +				      pgoff_t end)
> > +{
> > +	struct kvm_memory_slot *slot;
> > +	struct kvm *kvm = gmem->kvm;
> > +	unsigned long index;
> > +	bool flush = false;
> > +
> > +	KVM_MMU_LOCK(kvm);
> > +
> > +	kvm_mmu_invalidate_begin(kvm);
> > +
> > +	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> > +		pgoff_t pgoff = slot->gmem.pgoff;
> > +
> > +		struct kvm_gfn_range gfn_range = {
> > +			.start = slot->base_gfn + max(pgoff, start) - pgoff,
> > +			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
> > +			.slot = slot,
> > +			.may_block = true,
> > +		};
> > +
> > +		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> > +	}
> > +
> > +	if (flush)
> > +		kvm_flush_remote_tlbs(kvm);
> > +
> > +	KVM_MMU_UNLOCK(kvm);
> > +}
> > +
> > +static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
> > +				    pgoff_t end)
> > +{
> > +	struct kvm *kvm = gmem->kvm;
> > +
> > +	KVM_MMU_LOCK(kvm);
> > +	if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT))
> > +		kvm_mmu_invalidate_end(kvm);
> kvm_mmu_invalidate_begin() is called unconditionally in
> kvm_gmem_invalidate_begin(),
> but kvm_mmu_invalidate_end() is not here.
> This makes the kvm_gmem_invalidate_{begin, end}() calls asymmetric.

Another ouch :-(

And there should be no need to acquire mmu_lock() unconditionally, the inode's
mutex protects the bindings, not mmu_lock.

I'll get a fix posted today.  I think KVM can also add a sanity check to detect
unresolved invalidations, e.g.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7ba1ab1832a9..2a2d18070856 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1381,8 +1381,13 @@ static void kvm_destroy_vm(struct kvm *kvm)
         * No threads can be waiting in kvm_swap_active_memslots() as the
         * last reference on KVM has been dropped, but freeing
         * memslots would deadlock without this manual intervention.
+        *
+        * If the count isn't unbalanced, i.e. KVM did NOT unregister between
+        * a start() and end(), then there shouldn't be any in-progress
+        * invalidations.
         */
        WARN_ON(rcuwait_active(&kvm->mn_memslots_update_rcuwait));
+       WARN_ON(!kvm->mn_active_invalidate_count && kvm->mmu_invalidate_in_progress);
        kvm->mn_active_invalidate_count = 0;
 #else
        kvm_flush_shadow_all(kvm);


or an alternative style

	if (kvm->mn_active_invalidate_count)
		kvm->mn_active_invalidate_count = 0;
	else
		WARN_ON(kvm->mmu_invalidate_in_progress)

> > +	KVM_MMU_UNLOCK(kvm);
> > +}
> > +
> > +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> > +{
> > +	struct list_head *gmem_list = &inode->i_mapping->private_list;
> > +	pgoff_t start = offset >> PAGE_SHIFT;
> > +	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> > +	struct kvm_gmem *gmem;
> > +
> > +	/*
> > +	 * Bindings must stable across invalidation to ensure the start+end
> > +	 * are balanced.
> > +	 */
> > +	filemap_invalidate_lock(inode->i_mapping);
> > +
> > +	list_for_each_entry(gmem, gmem_list, entry) {
> > +		kvm_gmem_invalidate_begin(gmem, start, end);
> > +		kvm_gmem_invalidate_end(gmem, start, end);
> > +	}
> Why to loop for each gmem in gmem_list here?
> 
> IIUIC, offset is the offset according to the inode, it is only meaningful to
> the inode passed in, i.e, it is only meaningful to the gmem binding with the
> inode, not others.

The code is structured to allow for multiple gmem instances per inode.  This isn't
actually possible in the initial code base, but it's on the horizon[*].  I included
the list-based infrastructure in this initial series to ensure that guest_memfd
can actually support multiple files per inode, and to minimize the churn when the
"link" support comes along.

[*] https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
