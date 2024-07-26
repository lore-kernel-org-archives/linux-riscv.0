Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F98DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YVsmu2HysNfBsH86ZH9r/fsK7roJm0JDYQLtLqC8q0=; b=vQu7Zq5ER2w/fk
	x/zCpd+GTsEY+uVZWYLp7KDqh2ztvOw/O4MtuNkItXGWcheMK3iX9xA48Ai6DXmvc64Ftq3yqpMLU
	f51r0G687cu1VmWPWCuhGLGCpAz3068Y+F7KnMgOD3k1Bb6aCIgdYQkktTEerfMBEW3mOtCHXOKwK
	JVqk0wAqFRQfnwivGNAkB2ThT4kLGzbT9aF+eTDxfmg7w7MhvIvxHzUKjh2t4ians0rzpG0TEepgQ
	YxjjhpusI9hTLjss2Eo9dM7bz1Mu2CZUyeUcs9TLx/BW1NVqK53nCNaQP4cd0h+6ixndLcw3CAmL/
	AHErJzXr27Sx3AzfJh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjs-00000005PAS-1jDC;
	Fri, 26 Jul 2024 23:52:44 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjo-00000005P7S-0azw
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:42 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0b2ca961ebso497039276.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037958; x=1722642758; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlsoNmguYxHdPLcIEUjx1oIy+wRnU4Jxi7Q36OcxhEA=;
        b=GULBZGEKoudmB4aunUfYmNtopc1FgEssZr5cdob0q+L8ECYHAq4tV2mOLqeZY8NzGU
         igOxBpG78duz/KKTr8QARu3rSVq2FzuAOVxvRnQCbyI54mKsUaxENLJ81CMcnCx7eSYd
         4ZtTKPXjYn/oFNiRVvC3H6H6vT6tbxOfzaOGJ5hvOL9nV3egB5o4LkywkOMjQwpmDmam
         gfn9JJaD8yNHJ5ZkgiVG5lvWDdYPmPWLKdYFk76NUVuWFjmo2Ay0hyAe/wr4SVNjwOnR
         +NQVgKSnDDMx4F0AqSv4CiOjuSrtBGzNXLxoZ8+lwA3Dhgx/8na0hKH4uGKPyo+hpQG/
         VOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037958; x=1722642758;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlsoNmguYxHdPLcIEUjx1oIy+wRnU4Jxi7Q36OcxhEA=;
        b=v5gCpDkM4om4JROvbYV2Tc1wWLKVaLVQ9EBncmoxvgbyOmFzzjdK1XjxGFwHv75Alo
         GtA6bDeA0LcJhBOj1Uf0rHWkj2c+eABQIxitgxTdLGO5MpnZeFRJ4OTN/qeJEe/HfwCL
         BBbjrvoMZBf8XNr/X6DGnQEyhXqRDohtmYbiSbluAj+vJWDf+EABjonydV5uTvYeB+8n
         04dJ4YZSehgAycMnc7xC+t12N0CAS+RUxC3SSPf7Vntp+yTHBZy0/fTcHEZR4DOTLDwp
         +rGO5WVmfNWUJLaIkBdjyUEdRUdbkU9pW1INHalBKIiLCa9YBZAv9BdaIfvZtkbmXHoE
         2rcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvC1R5vkG+32SIDvK4y8XIurBejFsVzSiMOoXAZWSY1gLMalXbqAHXnb71E8bYQPaufX6BsQXjrPOogL6Dr4tgVd9DEIJNA2UCvusM2k8i
X-Gm-Message-State: AOJu0Yz2dg1PS+w1XYY7kEgwa5wEpqqmZBNat/Ne44tdGR9uNT9cTO2m
	wvxttaMct7RAMLjv1Cn7g+iIkIyL8uHE5Bkb5mwmgfl8vW+Ix9SCnboC1Jbs5VTwebDXqiRHGm0
	H/g==
X-Google-Smtp-Source: AGHT+IFCH1oh4Y8/oiPAKKZDfTSrq8OctuCbDjHGO9FWuVz/aIwZKKAQhyg1yG69wkiF5914XVtW9HUBfXk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0b5427fa67mr79730276.0.1722037957798; Fri, 26 Jul 2024 16:52:37
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:09 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-1-seanjc@google.com>
Subject: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165240_198105_D3051EDE 
X-CRM114-Status: GOOD (  27.81  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm64 folks, the first two patches are bug fixes, but I have very low
confidence that they are correct and/or desirable.  If they are more or
less correct, I can post them separately if that'd make life easier.  I
included them here to avoid conflicts, and because I'm pretty sure how
KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
to provide to arch code.

On to the series...  The TL;DR is that I would like to get input on two
things:

 1. Marking folios dirty/accessed only on the intial stage-2 page fault
 2. The new APIs for faulting, prefetching, and doing "lookups" on pfns

This is (spiritually) v12 of David Steven's series to play nice with pfns
that are "valid", i.e. have a struct page, but are not refcounted.  Whereas
David's series only (mostly) fixed things for x86, this series goes for
broke and completely eliminates KVM's long-standing (and heinous) behavior
of essentially guessing which pfns are refcounted pages (see
kvm_pfn_to_refcounted_page()).

Getting there requires "fixing" arch code that isn't obviously broken.
Specifically, to get rid of kvm_pfn_to_refcounted_page(), KVM needs to
stop marking pages/folios dirty/accessed based solely on the pfn that's
stored in KVM's stage-2 page tables.  In v11, KVM x86 did this by tagging
SPTEs with a flag (using a software-available bit).

But that isn't a viable option for some flavors of x86 (we're out of
software-available bits), and more importantly I've convinced myself[*]
that marking folios _dirty_ after SPTEs have been installed is completely
unnecessary, and that marking folios accessed is likewise unnecessary for
real world workloads (and if this is a sticking point, I have ideas on
how to handle it more gracefully; more at the bottom).

So, instead of tracking which SPTEs correspond to refcounted pages, v12
simply removes all of the code that operates on "struct page" based on
the pfn in stage-2 PTEs.  This is the back ~40-50% of the series.  Most
of the patches are relevatively uninteresting from a code perspective,
it's the concept itself (of not marking folios dirty/accessed from SPTEs)
that needs discussion.

For x86 in particular, which sets accessed/dirty status when that info
would be "lost", e.g. when SPTEs are zapped or KVM clears the dirty flag
in a SPTE, foregoing the updates provides very measurable performance
improvements for related operations.  E.g. when clearing dirty bits as
part of dirty logging, and zapping SPTEs to reconstitue huge pages when
disabling dirty logging.

The other big change from v11 is that I opted to go with dedicated,
specific, and hopefully descriptive APIs to wrap kvm_follow_pfn() instead
of expose the "inner" helper to arch code.  In part because I still don't
love kvm_follow_pfn(), and fewer callers means its easier to change if/when
someone comes up with a better name.  But also because I think/hope that
having dedicated APIs will make it easier for arch developers to understand
what is the right/preferred way to do certain operations.  E.g. so that all
architectures use the same core flow for handling stage-2 page faults.
Long term, I would love to standardize that code even more, but this series
is already waaaay too big.

Along the way, I also discovered that several of the inputs to hva_to_pfn()
(and it's myriad wrappers) could be removed.  E.g. the rather weirdly named
@atomic flag can be removed by deduplicating x86's prefetching code.

As for capturing accessed information on zapped SPTEs, e.g. to prevent
losing accessed information because NUMA balancing mucks with things, my
thought is that arch code can preserve the accessed information in SPTEs
that are unmapped/zapped because protections were modified, e.g. so that
LRU-initiated aging can still collect information.  I'm not at all
convinced that this is necessary outside of tests that care about exact
counts, e.g. KVM selftests, but I'll post an RFC KVM x86 series to get
the conversation started.

Note, I'm purposefully not capturing the delta from v11=>v12, because
there is zero chance I will get everything, and while this is a spiritual
successor to David's v11, in practice it's like 98% new code.

[*] https://lore.kernel.org/all/20240320005024.3216282-1-seanjc@google.com

David Stevens (3):
  KVM: Replace "async" pointer in gfn=>pfn with "no_wait" and error code
  KVM: Introduce kvm_follow_pfn() to eventually replace "gfn_to_pfn"
    APIs
  KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()

Sean Christopherson (81):
  KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits
    ZONE_DEVICE
  KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty
    logging
  KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead return NULL to indicate an
    error
  KVM: Allow calling kvm_release_page_{clean,dirty}() on a NULL page
    pointer
  KVM: Add kvm_release_page_unused() API to put pages that KVM never
    consumes
  KVM: x86/mmu: Skip the "try unsync" path iff the old SPTE was a leaf
    SPTE
  KVM: x86/mmu: Mark folio dirty when creating SPTE, not when
    zapping/modifying
  KVM: x86/mmu: Mark page/folio accessed only when zapping leaf SPTEs
  KVM: x86/mmu: Don't force flush if SPTE update clears Accessed bit
  KVM: x86/mmu: Use gfn_to_page_many_atomic() when prefetching indirect
    PTEs
  KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
  KVM: Drop @atomic param from gfn=>pfn and hva=>pfn APIs
  KVM: Annotate that all paths in hva_to_pfn() might sleep
  KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't track intermediate
    hva
  KVM: Drop unused "hva" pointer from __gfn_to_pfn_memslot()
  KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
  KVM: Explicitly initialize all fields at the start of kvm_vcpu_map()
  KVM: Use NULL for struct page pointer to indicate mremapped memory
  KVM: nVMX: Rely on kvm_vcpu_unmap() to track validity of eVMCS mapping
  KVM: nVMX: Drop pointless msr_bitmap_map field from struct nested_vmx
  KVM: nVMX: Add helper to put (unmap) vmcs12 pages
  KVM: Use plain "struct page" pointer instead of single-entry array
  KVM: Provide refcounted page as output field in struct kvm_follow_pfn
  KVM: Move kvm_{set,release}_page_{clean,dirty}() helpers up in
    kvm_main.c
  KVM: pfncache: Precisely track refcounted pages
  KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
  KVM: nVMX: Mark vmcs12's APIC access page dirty when unmapping
  KVM: Pass in write/dirty to kvm_vcpu_map(), not kvm_vcpu_unmap()
  KVM: Get writable mapping for __kvm_vcpu_map() only when necessary
  KVM: Disallow direct access (w/o mmu_notifier) to unpinned pfn by
    default
  KVM: Add a helper to lookup a pfn without grabbing a reference
  KVM: x86: Use kvm_lookup_pfn() to check if retrying #PF is useful
  KVM: x86: Use kvm_lookup_pfn() to check if APIC access page was
    installed
  KVM: x86/mmu: Add "mmu" prefix fault-in helpers to free up generic
    names
  KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
  KVM: x86/mmu: Add common helper to handle prefetching SPTEs
  KVM: x86/mmu: Add helper to "finish" handling a guest page fault
  KVM: x86/mmu: Mark pages/folios dirty at the origin of make_spte()
  KVM: Move declarations of memslot accessors up in kvm_host.h
  KVM: Add kvm_faultin_pfn() to specifically service guest page faults
  KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
  KVM: guest_memfd: Provide "struct page" as output from
    kvm_gmem_get_pfn()
  KVM: x86/mmu: Put refcounted pages instead of blindly releasing pfns
  KVM: x86/mmu: Don't mark unused faultin pages as accessed
  KVM: Move x86's API to release a faultin page to common KVM
  KVM: VMX: Hold mmu_lock until page is released when updating APIC
    access page
  KVM: VMX: Use __kvm_faultin_page() to get APIC access page/pfn
  KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
  KVM: PPC: e500: Mark "struct page" pfn accessed before dropping
    mmu_lock
  KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
  KVM: arm64: Mark "struct page" pfns accessed/dirty before dropping
    mmu_lock
  KVM: arm64: Use __kvm_faultin_pfn() to handle memory aborts
  KVM: RISC-V: Mark "struct page" pfns dirty iff a stage-2 PTE is
    installed
  KVM: RISC-V: Mark "struct page" pfns accessed before dropping mmu_lock
  KVM: RISC-V: Use kvm_faultin_pfn() when mapping pfns into the guest
  KVM: PPC: Use __kvm_faultin_pfn() to handle page faults on Book3s HV
  KVM: PPC: Use __kvm_faultin_pfn() to handle page faults on Book3s
    Radix
  KVM: PPC: Drop unused @kvm_ro param from
    kvmppc_book3s_instantiate_page()
  KVM: PPC: Book3S: Mark "struct page" pfns dirty/accessed after
    installing PTE
  KVM: PPC: Use kvm_faultin_pfn() to handle page faults on Book3s PR
  KVM: LoongArch: Mark "struct page" pfns dirty only in "slow" page
    fault path
  KVM: LoongArch: Mark "struct page" pfns accessed only in "slow" page
    fault path
  KVM: LoongArch: Mark "struct page" pfn accessed before dropping
    mmu_lock
  KVM: LoongArch: Use kvm_faultin_pfn() to map pfns into the guest
  KVM: MIPS: Mark "struct page" pfns dirty only in "slow" page fault
    path
  KVM: MIPS: Mark "struct page" pfns accessed only in "slow" page fault
    path
  KVM: MIPS: Mark "struct page" pfns accessed prior to dropping mmu_lock
  KVM: MIPS: Use kvm_faultin_pfn() to map pfns into the guest
  KVM: PPC: Remove extra get_page() to fix page refcount leak
  KVM: PPC: Use kvm_vcpu_map() to map guest memory to patch dcbz
    instructions
  KVM: Convert gfn_to_page() to use kvm_follow_pfn()
  KVM: Add support for read-only usage of gfn_to_page()
  KVM: arm64: Use __gfn_to_page() when copying MTE tags to/from
    userspace
  KVM: PPC: Explicitly require struct page memory for Ultravisor sharing
  KVM: Drop gfn_to_pfn() APIs now that all users are gone
  KVM: s390: Use kvm_release_page_dirty() to unpin "struct page" memory
  KVM: Make kvm_follow_pfn.refcounted_page a required field
  KVM: x86/mmu: Don't mark "struct page" accessed when zapping SPTEs
  KVM: arm64: Don't mark "struct page" accessed when making SPTE young
  KVM: Drop APIs that manipulate "struct page" via pfns
  KVM: Don't grab reference on VM_MIXEDMAP pfns that have a "struct
    page"

 Documentation/virt/kvm/locking.rst     |  80 ++--
 arch/arm64/include/asm/kvm_pgtable.h   |   4 +-
 arch/arm64/kvm/guest.c                 |  25 +-
 arch/arm64/kvm/hyp/pgtable.c           |   7 +-
 arch/arm64/kvm/mmu.c                   |  21 +-
 arch/loongarch/kvm/mmu.c               |  40 +-
 arch/mips/kvm/mmu.c                    |  26 +-
 arch/powerpc/include/asm/kvm_book3s.h  |   4 +-
 arch/powerpc/kvm/book3s.c              |   7 +-
 arch/powerpc/kvm/book3s_32_mmu_host.c  |   7 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c  |  12 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  25 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  35 +-
 arch/powerpc/kvm/book3s_hv_nested.c    |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  25 +-
 arch/powerpc/kvm/book3s_pr.c           |  14 +-
 arch/powerpc/kvm/book3s_xive_native.c  |   2 +-
 arch/powerpc/kvm/e500_mmu_host.c       |  19 +-
 arch/riscv/kvm/mmu.c                   |   9 +-
 arch/s390/kvm/vsie.c                   |   4 +-
 arch/x86/kvm/lapic.c                   |  15 +-
 arch/x86/kvm/mmu/mmu.c                 | 191 ++++----
 arch/x86/kvm/mmu/mmu_internal.h        |   5 +-
 arch/x86/kvm/mmu/paging_tmpl.h         |  29 +-
 arch/x86/kvm/mmu/spte.c                |  23 +-
 arch/x86/kvm/mmu/tdp_mmu.c             |  16 -
 arch/x86/kvm/svm/nested.c              |   4 +-
 arch/x86/kvm/svm/sev.c                 |  12 +-
 arch/x86/kvm/svm/svm.c                 |   8 +-
 arch/x86/kvm/vmx/nested.c              |  42 +-
 arch/x86/kvm/vmx/vmx.c                 |  28 +-
 arch/x86/kvm/vmx/vmx.h                 |   2 -
 arch/x86/kvm/x86.c                     |  16 +-
 include/linux/kvm_host.h               | 124 +++--
 virt/kvm/guest_memfd.c                 |  19 +-
 virt/kvm/kvm_main.c                    | 603 ++++++++++---------------
 virt/kvm/kvm_mm.h                      |  36 +-
 virt/kvm/pfncache.c                    |  20 +-
 38 files changed, 698 insertions(+), 865 deletions(-)


base-commit: 332d2c1d713e232e163386c35a3ba0c1b90df83f
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
