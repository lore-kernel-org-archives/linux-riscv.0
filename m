Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C711CC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0DaYDJUj0pArtFK5lTayVHIyqKVM45fNBWUf398bEA=; b=cK1DHkbthJw4lk
	TQ4pNxIoN0I+3r6oUzLkydwoSGCOrX/8lovmBj9WsV3CVTAeIAmFRshjBMqZKGIlixD8ycunjcqoj
	xx6Exia2Jm/fifwryf03XWpvlhMKkyUmNYr6ACEbjM6wAMkCJ3qfG2Meriv7IYIPGVHxtH7UR6t5/
	IrQW36JXFhj934q9e39FE0NjWXHp3YUahF9mkm93nOYyudjpob99X94bwyXPftXegfjQlsuMWXV1G
	4JtnyrZx0MbXZqR0L+ZwiPTcP9eLBQHpDDYNem145ZZjXaSAldsRw/rBCwUA+yif3121XLiFvmTts
	heVy11PO3dQR1ef5Gv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7KzL-00AGIi-0Q;
	Thu, 08 Jun 2023 19:08:03 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7KzH-00AGF9-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:08:01 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-56974f42224so8900327b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251269; x=1688843269;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mFXKG+o8ou8b37NYYPzSeVEYTzI6RrQFUcBP7+Z0kCs=;
        b=gLnB65KDapj/L8oyti3OCPecdhfNzwnK27SyCP2Ij67wjZIq+Urt/Xj2ohzoxWGcqt
         9md6NykL5+BICuB+yTQeY5noQu9v1v2MRkxsYM467PbVoGKY6MsnqM4jAqCuFHP/FIOV
         Nmc3w5j8hy4a/q9QA4nUfQcqIorbpGtzTxxEZU3pKmFAyFx7OeJiQ8OIYPYs4ppaQJ99
         d7EiKfcmdkw5gC0oGauuDJG9I1T0YqKfADh5DbR+Bsy6i3IAOqDTgdIwUCl9173XfMxd
         gqB+NbUlpX0CJ1Eyi3fexT8Oih2q1dLLzjaj4zv6Fl4AW8zYJNZ/E0CIlX5rvC2IOp4N
         oYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251269; x=1688843269;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFXKG+o8ou8b37NYYPzSeVEYTzI6RrQFUcBP7+Z0kCs=;
        b=K7FelfuxWsjkHMF+Zgvs4/qF7PNtujxgb1aBWVP9EGZomUjvJCQWlaCAhOZUbqvcOB
         KZtEIBy3O/2vCBNoqZKYpn3dVHVdLB6ixNoyIslUpspXf+T9W0PyGa7jp8eS4BlpBywT
         84lZiIdaWNTrDAMrtTAOCZJfLI7rKKa/D5IGLbzG7gdCrkqh6/nHCO3dihIIWGrVl5i8
         L79u94uNO3VfGmvdfRpSA3sKQcQCcoAVtpFawmXa/Qag+vR1wqSTNmYhF9Ew/vh3SRz9
         kic/s2oStxJyK1vs8mfRbNSKhA573d1HfoBSYBVmkcsCBSQoqQU58xIurH2zCtN89tJK
         6zBw==
X-Gm-Message-State: AC+VfDztmLrlYHd2wm2zm8bwjpSYF+M+o01b6w5cxi+L6O2KSa4ntYuR
	ynovV1o0VSHBm/qn1X7t4EIxXg==
X-Google-Smtp-Source: ACHHUZ4Dnk2jZ5ALQkJtH8c5bPqBsquF3+AZZ+zLteBdxMPlpIWo547PqJq12gBBTgb+B20F8e/7/A==
X-Received: by 2002:a81:7b0b:0:b0:561:afca:5b4d with SMTP id w11-20020a817b0b000000b00561afca5b4dmr662072ywc.3.1686251268705;
        Thu, 08 Jun 2023 12:07:48 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j77-20020a819250000000b00565862c5e90sm103014ywg.83.2023.06.08.12.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:07:48 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:07:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_120759_835763_2D5DC07F 
X-CRM114-Status: GOOD (  22.64  )
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

Here is v2 series of patches to various architectures, based on v6.4-rc5:
preparing for v2 of changes following in mm, affecting pte_offset_map()
and pte_offset_map_lock().  There are very few differences from v1:
noted patch by patch below.

v1 was "arch: allow pte_offset_map[_lock]() to fail"
https://lore.kernel.org/linux-mm/77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com/
series of 23 posted on 2023-05-09,
followed by "mm: allow pte_offset_map[_lock]() to fail"
https://lore.kernel.org/linux-mm/68a97fbe-5c1e-7ac6-72c-7b9c6290b370@google.com/
series of 31 posted on 2023-05-21,
followed by  "mm: free retracted page table by RCU"
https://lore.kernel.org/linux-mm/35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com/
series of 12 posted on 2023-05-28.

The first two series are "independent": neither depends
for build or correctness on the other, and the arch patches can either be
merged separately via arch trees, or be picked up by akpm; but both series
must be in before the third series is added to make the effective changes
(and that adds just a little more in arm, powerpc, s390 and sparc).

What is it all about?  Some mmap_lock avoidance i.e. latency reduction.
Initially just for the case of collapsing shmem or file pages to THPs;
but likely to be relied upon later in other contexts e.g. freeing of
empty page tables (but that's not work I'm doing).  mmap_write_lock
avoidance when collapsing to anon THPs?  Perhaps, but again that's not
work I've done: a quick attempt was not as easy as the shmem/file case.

I would much prefer not to have to make these small but wide-ranging
changes for such a niche case; but failed to find another way, and
have heard that shmem MADV_COLLAPSE's usefulness is being limited by
that mmap_write_lock it currently requires.

These changes (though of course not these exact patches, and not all
of these architectures!) have been in Google's data centre kernel for
three years now: we do rely upon them.

What are the per-arch changes about?  Generally, two things.

One: the current mmap locking may not be enough to guard against that
tricky transition between pmd entry pointing to page table, and empty
pmd entry, and pmd entry pointing to huge page: pte_offset_map() will
have to validate the pmd entry for itself, returning NULL if no page
table is there.  What to do about that varies: often the nearby error
handling indicates just to skip it; but in some cases a "goto again"
looks appropriate (and if that risks an infinite loop, then there
must have been an oops, or pfn 0 mistaken for page table, before).

Deeper study of each site might show that 90% of them here in arch
code could only fail if there's corruption e.g. a transition to THP
would be surprising on an arch without HAVE_ARCH_TRANSPARENT_HUGEPAGE.
But given the likely extension to freeing empty page tables, I have
not limited this set of changes to THP; and it has been easier, and
sets a better example, if each site is given appropriate handling.

Two: pte_offset_map() will need to do an rcu_read_lock(), with the
corresponding rcu_read_unlock() in pte_unmap().  But most architectures
never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
after pte_offset_map(), or have used userspace pte_offset_map() where
pte_offset_kernel() is more correct.  No problem in the current tree,
but a problem once an rcu_read_unlock() will be needed to keep balance.

A common special case of that comes in arch/*/mm/hugetlbpage.c, if
the architecture supports hugetlb pages down at the lowest PTE level.
huge_pte_alloc() uses pte_alloc_map(), but generic hugetlb code does
no corresponding pte_unmap(); similarly for huge_pte_offset().
Thanks to Mike Kravetz and Andrew Morton, v6.4-rc1 already provides
pte_alloc_huge() and pte_offset_huge() to help fix up those cases.

This posting is based on v6.4-rc5, but good for any v6.4-rc,
current mm-everything and linux-next.

01/23 arm: allow pte_offset_map[_lock]() to fail
      v2: same as v1
02/23 arm64: allow pte_offset_map() to fail
      v2: add ack from Catalin
03/23 arm64/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: add ack from Catalin
04/23 ia64/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
05/23 m68k: allow pte_offset_map[_lock]() to fail
      v2: same as v1
06/23 microblaze: allow pte_offset_map() to fail
      v2: same as v1
07/23 mips: update_mmu_cache() can replace __update_tlb()
      v2: same as v1
08/23 parisc: add pte_unmap() to balance get_ptep()
      v2: typo fix from Helge; stronger commit message
09/23 parisc: unmap_uncached_pte() use pte_offset_kernel()
      v2: same as v1
10/23 parisc/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
11/23 powerpc: kvmppc_unmap_free_pmd() pte_offset_kernel()
      v2: same as v1
12/23 powerpc: allow pte_offset_map[_lock]() to fail
      v2: same as v1
13/23 powerpc/hugetlb: pte_alloc_huge()
      v2: same as v1
14/23 riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: add review from Alex, ack from Palmer
15/23 s390: allow pte_offset_map_lock() to fail
      v2: add comment for Claudio
16/23 s390: gmap use pte_unmap_unlock() not spin_unlock()
      v2: add ack from Alexander
17/23 sh/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
18/23 sparc/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
19/23 sparc: allow pte_offset_map() to fail
      v2: same as v1
20/23 sparc: iounit and iommu use pte_offset_kernel()
      v2: same as v1
21/23 x86: Allow get_locked_pte() to fail
      v2: add WARN_ON_ONCE from PeterZ
22/23 x86: sme_populate_pgd() use pte_offset_kernel()
      v2: same as v1
23/23 xtensa: add pte_unmap() to balance pte_offset_map()
      v2: stronger commit message

 arch/arm/lib/uaccess_with_memcpy.c      |  3 ++
 arch/arm/mm/fault-armv.c                |  5 +++-
 arch/arm/mm/fault.c                     |  3 ++
 arch/arm64/mm/fault.c                   |  3 ++
 arch/arm64/mm/hugetlbpage.c             | 11 ++-----
 arch/ia64/mm/hugetlbpage.c              |  4 +--
 arch/m68k/include/asm/mmu_context.h     |  6 ++--
 arch/m68k/kernel/sys_m68k.c             |  2 ++
 arch/m68k/mm/mcfmmu.c                   | 52 +++++++++++++--------------------
 arch/microblaze/kernel/signal.c         |  5 ++--
 arch/mips/include/asm/pgtable.h         | 15 ++--------
 arch/mips/mm/tlb-r3k.c                  |  5 ++--
 arch/mips/mm/tlb-r4k.c                  |  9 ++----
 arch/parisc/kernel/cache.c              | 26 +++++++++++++----
 arch/parisc/kernel/pci-dma.c            |  2 +-
 arch/parisc/mm/hugetlbpage.c            |  4 +--
 arch/powerpc/kvm/book3s_64_mmu_radix.c  |  2 +-
 arch/powerpc/mm/book3s64/hash_tlb.c     |  4 +++
 arch/powerpc/mm/book3s64/subpage_prot.c |  2 ++
 arch/powerpc/mm/hugetlbpage.c           |  2 +-
 arch/powerpc/xmon/xmon.c                |  5 +++-
 arch/riscv/mm/hugetlbpage.c             |  4 +--
 arch/s390/kernel/uv.c                   |  2 ++
 arch/s390/mm/gmap.c                     | 31 ++++++++++++--------
 arch/s390/mm/pgtable.c                  | 12 ++++++--
 arch/sh/mm/hugetlbpage.c                |  4 +--
 arch/sparc/kernel/signal32.c            |  2 ++
 arch/sparc/mm/fault_64.c                |  3 ++
 arch/sparc/mm/hugetlbpage.c             |  4 +--
 arch/sparc/mm/io-unit.c                 |  2 +-
 arch/sparc/mm/iommu.c                   |  2 +-
 arch/sparc/mm/tlb.c                     |  2 ++
 arch/x86/kernel/ldt.c                   |  6 ++--
 arch/x86/mm/mem_encrypt_identity.c      |  2 +-
 arch/xtensa/mm/tlb.c                    |  5 +++-
 35 files changed, 146 insertions(+), 105 deletions(-)

Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
