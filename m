Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A6C61DC6
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bEEEV/tgE/7WIbGsga86j0mc4hcrWjFV28d8d7LGTw=; b=sf9Tb4ZJEap916
	W9K3qE8b85cYstK3iI8ysc8qbs3rGQ18kEuDLZH5eLOnUlUSpzE5wUObISv9x7UO+KbjejAC0lBO+
	Ot0xjQfB3MWoOkeYAX+iy4Cz4SZU3svkE8yAsqpqJLoDdhMPnDJCzH8jjY24LBIlNxvU5Vh3cnY00
	wqLIN0bOuC/TC72u0lhA1SV6ew8siufkKiNdGtkFWeArUhWdYrzqZg30IvoRT0eOxUsxwFYkGExbl
	jqhgsr9BUH+WD5hmPo0Ums4CNXIJBTz/eBkUlslH0KIzLm1CUMVUniIh5XkUyqghpMVDiipFdB2IA
	ljIRQQ/dtMAhfyLJPBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgJ-0000000365N-2Rxo;
	Wed, 26 Aug 2026 23:05:19 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgF-00000003624-2dUt
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:17 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2cc73f47bdcso1124135ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785514; x=1788390314; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRDzIvJTa0HXgdmAJ1iBjSEqSYXJcGrZt7XM2C/1134=;
        b=pDSA/S0sn+5SewY3oLPGnJykquxLU+E2J3eHsntQmnN8yl8Ha+nSyxlJ7zxnUOnf5T
         lJ1xWC96lJ34HYFmw5vsjwRJxd8/uRkblqpBsU4LyBnxqDrTeG3TpOLFUSROOdGX/you
         KddVWhSgNSDUQQWgAQwkcJaqS7G9qL6VU907/d+lkKQvMpCScTQdSi/OgcjZl14KlgRo
         C1DIj+z1wQ+3mRvQraAzT1YBk06/KzgnidfY5XlCXKdlUpLgwfVUW1hGtF+xDuMXonCd
         mBSlyCp6LAzLz0DSOkiJo2ykRKMKF1dEteFlSwSfmUyCxZGJIb4AN9Q7PKyd4gDad+9T
         gPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785514; x=1788390314;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gRDzIvJTa0HXgdmAJ1iBjSEqSYXJcGrZt7XM2C/1134=;
        b=XpF2NDa4b2abDiG/xCf2V/sDRaNdME/3MPsSDK/teKZlftJVLoUopTdglT691RQjeC
         7L/iYF/EHh41P1vfY/horV7HbeMuyxfegWaRF/z5YOEvmoA8Z+PBdN0Pi8TJEC2zMIaE
         QjAAqPn86alc+1v6opAnZF1QLIXkwJAUyFXpFSEAlM5ek49AOadOQ+0odKRWhkpmHl46
         01Elmrn+YHZgV7x940iZzGEChVy3D1TtXcdaojat4WUwhMr5JJJWHj57ysW4W6S0BIyl
         eAUAdVicDTxUHZjZ7fHciArpwYr4zB1nZokIkjuWQpO8H25C6mm9J5hPG8DqJJWmfDPl
         DYIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6VNMsBvHejWXCyoIo8FKj3/vnz70llQRyM+W6eSSt35zHRZb4vi9VJsxspLAjnoAonX6zuu3VNTiKLQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nSvdLbmCx6vMZKuiGTyOwH48NjrbNAoooB6P+upb98IMMVUwSa
	TcJCJflNol5MDYNrxxSILxGElRzjJCFdw0AX7ZGf6g/WNcgMwIft91t1Qm/gekilhqwO0s/drhy
	wJRfAZA==
X-Received: from plxl5.prod.google.com ([2002:a17:902:db45:b0:2d6:f794:4e76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b24:b0:2c9:9a2e:dab0
 with SMTP id d9443c01a7336-2d707954e7amr191786295ad.3.1787785513509; Wed, 26
 Aug 2026 16:05:13 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:51 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-1-seanjc@google.com>
Subject: [PATCH 00/20] KVM: selftests: PPC pre-enabling
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160515_667865_B93E46F2 
X-CRM114-Status: GOOD (  11.35  )
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

This is a big pile of cleanups and refactoring to prepare for PPC support in
KVM selftests.  PPC has paging modes that require multi-page page tables, and
those page tables need to be naturally aligned.  The original proposal was to
plumb in an @align param to the page allocators[*], but I didn't love the idea
of adding another rarely used param to the allocators.

Reworking the APIs to take a region type requires a fair bit of churn, and was
more painful than expected as I didn't realize just how many one-off tests did
weird things, but overall I think it's worth it?  If only to keep cutting down
on the use of magic memslot numbers in tests.

This needs explicit testing on s390.  I tested on arm64 and x86, and given the
number of failures I had to wade through, I wouldn't be at all suprised if I
broke something subtle on s390 as well.

I'm less concerned about RISC-V and LoongArch as they don't have any custom
tests that are affected (which is where I got burned).

[*] https://lore.kernel.org/all/df86b5ccdbdafc3509d9538bd5e6796737bab2db.1781093720.git.ritesh.list@gmail.com

Nicholas Piggin (1):
  KVM: selftests: Use goto instead of do-while to retry finding unused
    physical pages

Sean Christopherson (19):
  KVM: selftests: Use MEM_REGION_PT memslot instead of '0' for s390
    regions/segments
  KVM: selftests: Bump the minimum GPA for page tables to 0x200000
  KVM: selftests: Use vm_alloc_page_table() to allocate LoongArch page
    tables
  KVM: selftests: Rename "num" param to "nr_pages" for physical page
    allocators
  KVM: selftests: Extend page allocator to support naturally aligned
    allocations
  KVM: selftests: Make the single-page allocator APIs static inline
  KVM: selftests: Use the innermost page allocator API in the memslot
    perf test
  KVM: selftests: Use the innermost page allocator API in s390's IRQ
    routing test
  KVM: selftests: Add a wrapper API to allocate multiple page table
    pages
  KVM: selftests: Initialize vm->memslots[] with invalid memslots during
    creation
  KVM: selftests: Add APIs to override memory region types with custom
    memslots
  KVM: selftests: Add TEST_EXTRA memory region type for "special"
    memslots
  KVM: selftests: Use TEST_EXTRA region in arm64's vGIC LPI stress test
  KVM: selftests: Use TEST_EXTRA region in x86's smaller MAXPHYADDR test
  KVM: selftests: Use TEST_EXTRA region in set memory region test
  KVM: selftests: Take the memory region type, not memslot, in page
    allocators
  KVM: selftests: Use TEST_ASSERT(), not assert(), in
    vm_get_mem_region()
  KVM: selftests: Automatically pick min_gpa for allocations based on
    region type
  KVM: selftests: Add arch hook to force page tables to be naturally
    aligned

 .../selftests/kvm/arm64/page_fault_test.c     |  18 ++-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  19 ++-
 .../testing/selftests/kvm/include/kvm_util.h  | 106 +++++++++++++--
 tools/testing/selftests/kvm/include/x86/smm.h |   2 +-
 .../selftests/kvm/lib/arm64/processor.c       |   4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 127 +++++++++++-------
 .../selftests/kvm/lib/loongarch/processor.c   |   5 +-
 .../selftests/kvm/lib/riscv/processor.c       |   4 +-
 .../selftests/kvm/lib/s390/processor.c        |   7 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  15 ++-
 .../testing/selftests/kvm/memslot_perf_test.c |   3 +-
 tools/testing/selftests/kvm/s390/cmma_test.c  |  19 +--
 .../testing/selftests/kvm/s390/irq_routing.c  |   2 +-
 .../selftests/kvm/set_memory_region_test.c    |   8 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |   9 +-
 15 files changed, 219 insertions(+), 129 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
