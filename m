Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6FBEE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJalxIDYDqvv0ZAVxOziMK+8P2do04Bh/hAGQ/P5ODA=; b=HIpSZjxaf2J0xP
	JzTPj59hwo56YFUAkulQZQ7FP9WB17SEGSp2ou2WjGxuqRjZnXh0l5atAzemtD+CoyD2L6Ga80ozY
	zgEJ9dRBsXsm5sK/vXn1h52RN7G1eXpFZXQZ2hT50/7h4a7NBxWfyTaK2Hn+XqUesfErJiqu2F8kJ
	HNoCbr3IQmJRLjMELRdUWXRzOJhHt/QHhAW9JIK50bxXS6QUwCX5w7ud28J97pMvVqyhgycSbtf1i
	+QkgI2ZZPR/DutgNYGU3W3pF5LMh1zKSlN5GThDBiBj4kpvhJE0rzFj2VF/AK6hxLCR49gfxilFpU
	94TaassHxjmOuOwcK2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgba2-0072il-0p;
	Thu, 14 Sep 2023 01:55:42 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbZy-0072dn-1D
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:55:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c40ac5b6e7so2352885ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656535; x=1695261335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJKy84XSuMTmOC63vQkGfkXTGkwOOuRa5fNJs1nSv9Y=;
        b=ysOzy4E34Wkb7JgOezNR+2rWt893PJZYopSKVKbU3mh8lIZmAO3LZ/9fi7JxU0SJiv
         eKrxgPIgn8ViJPWloGkZQZ5LY7avQoXbbt1YKpql43P5ljShLhVIOqDOMRLyzusP7pye
         TNeQVW15pAEJlow+R9bDSHMpvv3g3CCfYRm4JYJbPVUcyJBJqqyShsBUF5dMG/iMnlEF
         +C4huzchQC4CtQOvBjKNseokOFg6d2th/qxhQqNDk8e7t9lB6UewuMOvSk2ng+LSOKKL
         CxnlQcG5vAKPS3K6hYBlNP1klEvPsFH5jSBi/HpHYLX+BI5Vb0irMXABXGhJVrD6pEfZ
         H9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656535; x=1695261335;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJKy84XSuMTmOC63vQkGfkXTGkwOOuRa5fNJs1nSv9Y=;
        b=wil/SbaiYfOnNF86JmNKu2BQznF4HprnFtsHs6qEZI2JsCbzVCeD3/iZIdBZs9VdgR
         ws+QX9kkId2xSm7BAUkBAOKi0Owq5pTEbEu39bVbu35HfhQoErNFx5U6WN/tA6bA0JUx
         /9kX5JWJvmO2lz6vi55BTxVI6X2qWqgXeh7Q7hNVakxE5Z2xWCPhxIUoC4LlU8bfaX+h
         MxWzsqBTkctHvq/y3K9VE5Fhrm+QgfTipEazQDwCoBHpR96GdWs8ahNhrs04hKHZl7VQ
         5L3x+oKgEnqTi97ZuuTYOOx9IswOHs28gWN88i6OcXmQF9da1piAWsUt/eZSZGZ0PNxs
         Nhpw==
X-Gm-Message-State: AOJu0YzimBemTgLZjERMwwtyi69uZew5gri3RALO+pw51skuaJ9pVqqZ
	dvuZUCSteS8tiWVohg+tqlJQbgD+XUw=
X-Google-Smtp-Source: AGHT+IGnw6PJDWM0E1VK/7ZuUO30qpP9NQbgvDz7dNd87qt+PDes/hO2OajwY8ZpLg9diAiXM3Vfd4Drz0o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2445:b0:1c3:1ceb:97b6 with SMTP id
 l5-20020a170903244500b001c31ceb97b6mr183120pls.7.1694656535510; Wed, 13 Sep
 2023 18:55:35 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:54:58 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-1-seanjc@google.com>
Subject: [RFC PATCH v12 00/33] KVM: guest_memfd() and per-page attributes
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20230913_185538_470848_78515A83 
X-CRM114-Status: GOOD (  25.03  )
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

This is hopefully the last RFC for implementing fd-based (instead of vma-based)
memory for KVM guests.  If you want the full background of why we are doing
this, please go read the v10 cover letter.  With luck, v13 will be a "normal"
series that's ready for inclusion.

Tagged RFC as there are still several empty changelogs, a lot of missing
documentation, and a handful of TODOs.  And I haven't tested or proofread this
anywhere near as much as I normally would.  I am posting even though the
remaining TODOs aren't _that_ big so that people can test this new version
without having to wait a few weeks to close out the remaining TODOs, i.e. to
give us at least some chance of hitting v6.7.

The most relevant TODO item for non-KVM folks is that we are planning on
dropping the dedicated "gmem" file system.  Assuming that pans out, the patch
to export security_inode_init_security_anon() should go away.

KVM folks, there a few changes I want to highlight and get feedback on, all of
which are directly related to the "annotated memory faults" series[*]:

 - Rename kvm_run.memory to kvm_run.memory_fault
 - Place "memory_fault" in a separate union
 - Return -EFAULT or -EHWPOISON with exiting with KVM_EXIT_MEMORY_FAULT

The first one is pretty self-explanatory, "run->memory.gpa" looks quite odd and
would prevent ever doing something directly with memory.

Putting the struct in a separate union is not at all necessary for supporting
private memory, it's purely forward looking to Anish series, which wants to
annotate (fill memory_fault) on all faults, even if KVM ultimately doesn't exit
to userspace (x86 has a few unfortunate flows where KVM can clobber a previous
exit, or suppress a memory fault exit).  Using a separate union, i.e. different
bytes in kvm_run, allows exiting to userspace with both memory_fault and the
"normal" union filled, e.g. if KVM starts an MMIO exit and then hits a memory
fault exit, the MMIO exit will be preserved.  It's unlikely userspace will be
able to do anything useful with the info in that case, but the reverse will
likely be much more interesting, e.g. if KVM hits a memory fault and then doesn't
report it to userspace for whatever reason.

As for returning -EFAULT/-EHWPOISON, far too many helpers that touch guest
memory, i.e. can "fault", return 0 on success, which makes it all bug impossible
to use '0' to signal "exit to userspace".  Rather than use '0' for _just_ the
case where the guest is accessing private vs. shared, my thought is to use
-EFAULT everywhere except for the poisoned page case.

[*] https://lore.kernel.org/all/20230908222905.1321305-1-amoorthy@google.com

TODOs [owner]:
 - Documentation [none]
 - Changelogs [Sean]
 - Fully anonymous inode vs. proper filesystem [Paolo]
 - kvm_gmem_error_page() testing (my version is untested) [Isaku?]

v12:
 - Squash fixes from others. [Many people]
 - Kill of the .on_unlock() callback and use .on_lock() when handling
   memory attributes updates. [Isaku]
 - Add more tests. [Ackerley]
 - Move range_has_attrs() to common code. [Paolo]
 - Return actually number of address spaces for the VM-scoped version of
   KVM_CAP_MULTI_ADDRESS_SPACE. [Paolo]
 - Move forward declaration of "struct kvm_gfn_range" to kvm_types.h. [Yuan]
 - Plumb code to have HVA-based mmu_notifier events affect only shared
   mappings. [Asish]
 - Clean up kvm_vm_ioctl_set_mem_attributes() math. [Binbin]
 - Collect a few reviews and acks. [Paolo, Paul]
 - Unconditionally advertise a synchronized MMU on PPC. [Paolo]
 - Check for error return from filemap_grab_folio(). [A
 - Make max_order optional. [Fuad]
 - Remove signal injection, zap SPTEs on memory error. [Isaku]
 - Add KVM_CAP_GUEST_MEMFD. [Xiaoyao]
 - Invoke kvm_arch_pre_set_memory_attributes() instead of
   kvm_mmu_unmap_gfn_range().
 - Rename kvm_run.memory to kvm_run.memory_fault
 - Place "memory_fault" in a separate union
 - Return -EFAULT and -EHWPOISON with KVM_EXIT_MEMORY_FAULT
 - "Init" run->exit_reason in x86's vcpu_run()

v11:
 - https://lore.kernel.org/all/20230718234512.1690985-1-seanjc@google.com
 - Test private<=>shared conversions *without* doing fallocate()
 - PUNCH_HOLE all memory between iterations of the conversion test so that
   KVM doesn't retain pages in the guest_memfd
 - Rename hugepage control to be a very generic ALLOW_HUGEPAGE, instead of
   giving it a THP or PMD specific name.
 - Fold in fixes from a lot of people (thank you!)
 - Zap SPTEs *before* updating attributes to ensure no weirdness, e.g. if
   KVM handles a page fault and looks at inconsistent attributes
 - Refactor MMU interaction with attributes updates to reuse much of KVM's
   framework for mmu_notifiers.

v10: https://lore.kernel.org/all/20221202061347.1070246-1-chao.p.peng@linux.intel.com

Ackerley Tng (1):
  KVM: selftests: Test KVM exit behavior for private memory/access

Chao Peng (8):
  KVM: Use gfn instead of hva for mmu_notifier_retry
  KVM: Add KVM_EXIT_MEMORY_FAULT exit to report faults to userspace
  KVM: Introduce per-page memory attributes
  KVM: x86: Disallow hugepages when memory attributes are mixed
  KVM: x86/mmu: Handle page fault for private memory
  KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
  KVM: selftests: Expand set_memory_region_test to validate
    guest_memfd()
  KVM: selftests: Add basic selftest for guest_memfd()

Sean Christopherson (21):
  KVM: Tweak kvm_hva_range and hva_handler_t to allow reusing for gfn
    ranges
  KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
  KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
  KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
    CONFIG_KVM_GENERIC_MMU_NOTIFIER
  KVM: Introduce KVM_SET_USER_MEMORY_REGION2
  KVM: Add a dedicated mmu_notifier flag for reclaiming freed memory
  KVM: Drop .on_unlock() mmu_notifier hook
  KVM: Set the stage for handling only shared mappings in mmu_notifier
    events
  mm: Add AS_UNMOVABLE to mark mapping as completely unmovable
  security: Export security_inode_init_security_anon() for use by KVM
  KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing
    memory
  KVM: Add transparent hugepage support for dedicated guest memory
  KVM: x86: "Reset" vcpu->run->exit_reason early in KVM_RUN
  KVM: Drop superfluous __KVM_VCPU_MULTIPLE_ADDRESS_SPACE macro
  KVM: Allow arch code to track number of memslot address spaces per VM
  KVM: x86: Add support for "protected VMs" that can utilize private
    memory
  KVM: selftests: Drop unused kvm_userspace_memory_region_find() helper
  KVM: selftests: Convert lib's mem regions to
    KVM_SET_USER_MEMORY_REGION2
  KVM: selftests: Add support for creating private memslots
  KVM: selftests: Introduce VM "shape" to allow tests to specify the VM
    type
  KVM: selftests: Add GUEST_SYNC[1-6] macros for synchronizing more data

Vishal Annapurve (3):
  KVM: selftests: Add helpers to convert guest memory b/w private and
    shared
  KVM: selftests: Add helpers to do KVM_HC_MAP_GPA_RANGE hypercalls
    (x86)
  KVM: selftests: Add x86-only selftest for private memory conversions

 Documentation/virt/kvm/api.rst                | 116 ++++
 arch/arm64/include/asm/kvm_host.h             |   2 -
 arch/arm64/kvm/Kconfig                        |   2 +-
 arch/mips/include/asm/kvm_host.h              |   2 -
 arch/mips/kvm/Kconfig                         |   2 +-
 arch/powerpc/include/asm/kvm_host.h           |   2 -
 arch/powerpc/kvm/Kconfig                      |   8 +-
 arch/powerpc/kvm/book3s_hv.c                  |   2 +-
 arch/powerpc/kvm/powerpc.c                    |   7 +-
 arch/riscv/include/asm/kvm_host.h             |   2 -
 arch/riscv/kvm/Kconfig                        |   2 +-
 arch/x86/include/asm/kvm_host.h               |  17 +-
 arch/x86/include/uapi/asm/kvm.h               |   3 +
 arch/x86/kvm/Kconfig                          |  14 +-
 arch/x86/kvm/debugfs.c                        |   2 +-
 arch/x86/kvm/mmu/mmu.c                        | 264 +++++++-
 arch/x86/kvm/mmu/mmu_internal.h               |   2 +
 arch/x86/kvm/mmu/tdp_mmu.c                    |   2 +-
 arch/x86/kvm/vmx/vmx.c                        |  11 +-
 arch/x86/kvm/x86.c                            |  25 +-
 include/linux/kvm_host.h                      | 143 +++-
 include/linux/kvm_types.h                     |   1 +
 include/linux/pagemap.h                       |  19 +-
 include/uapi/linux/kvm.h                      |  67 ++
 include/uapi/linux/magic.h                    |   1 +
 mm/compaction.c                               |  43 +-
 mm/migrate.c                                  |   2 +
 security/security.c                           |   1 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 tools/testing/selftests/kvm/dirty_log_test.c  |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  | 165 +++++
 .../selftests/kvm/include/kvm_util_base.h     | 148 +++-
 .../testing/selftests/kvm/include/test_util.h |   5 +
 .../selftests/kvm/include/ucall_common.h      |  11 +
 .../selftests/kvm/include/x86_64/processor.h  |  15 +
 .../selftests/kvm/kvm_page_table_test.c       |   2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 231 ++++---
 tools/testing/selftests/kvm/lib/memstress.c   |   3 +-
 .../selftests/kvm/set_memory_region_test.c    | 100 +++
 .../kvm/x86_64/private_mem_conversions_test.c | 410 +++++++++++
 .../kvm/x86_64/private_mem_kvm_exits_test.c   | 121 ++++
 .../kvm/x86_64/ucna_injection_test.c          |   2 +-
 virt/kvm/Kconfig                              |  17 +
 virt/kvm/Makefile.kvm                         |   1 +
 virt/kvm/dirty_ring.c                         |   2 +-
 virt/kvm/guest_mem.c                          | 637 ++++++++++++++++++
 virt/kvm/kvm_main.c                           | 482 +++++++++++--
 virt/kvm/kvm_mm.h                             |  38 ++
 48 files changed, 2888 insertions(+), 271 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/guest_memfd_test.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
 create mode 100644 virt/kvm/guest_mem.c


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
