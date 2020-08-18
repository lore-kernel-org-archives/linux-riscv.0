Return-Path: <SRS0=g+2U=B4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F3C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2020 15:17:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A906F2076E
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2020 15:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMzlt/Cu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZ4Dw/78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A906F2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+VjU96nTwEk+mG2c9hIBvx3veWd/IZ1Ab71+kPLjuRo=; b=KMzlt/CuNYI7Cxdwo/WpAnVhq8
	eeBn2GsqLynSW+5bjwQN5PX9x4HYCW2vPZw5kxGhCNFEugGxaggeFOPuBnYHlJJYLEv14RbFSfjGk
	8S6Ni+qQfjKATuVVM8J0mSNwXLiVhZkXbBFB9MklRGPzMTB52HjO2YMAjQFsKkGxcEmWZgrqv1bGO
	pDT3obSKJAYKkA2psEIWeBsoi/DRKbhSPKBt5481PD2NVBN/df5K3t1bYA2/BOofEX4s0CcaPB4iy
	35creJdDPJZrnbjfsvvKYekX+yPDabvs30gWOlUh7153PG4Ey+on7PpjUOwAXFXrm52x8/6Hlk9p4
	EqpdKwKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k83M6-0006na-GJ; Tue, 18 Aug 2020 15:16:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k83M1-0006lK-9J; Tue, 18 Aug 2020 15:16:50 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 140422054F;
 Tue, 18 Aug 2020 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763808;
 bh=pWqW8YgLG90UU3p8BWQ4xo9QKFARTHRes7KpRDQutEY=;
 h=From:To:Cc:Subject:Date:From;
 b=mZ4Dw/78TkBwbT4zckybu8GS6IeYljCyckNW7F7V9LPqkH0uP6lZLns364B8ofjDq
 g40MFxNJ9gEv01k6pNkEpjYOvmf4wvbJAjpvy8rkOX3Ub/pu7s4r9Q//DEwKnW4wz3
 DIa8FLdmh9cooXoz1dI6BSyEhKPCYBl/+8BDlFOg=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 00/17] memblock: seasonal cleaning^w cleanup
Date: Tue, 18 Aug 2020 18:16:17 +0300
Message-Id: <20200818151634.14343-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_111649_498867_AA2496C3 
X-CRM114-Status: GOOD (  14.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

These patches simplify several uses of memblock iterators and hide some of
the memblock implementation details from the rest of the system.

The patches are on top of v5.9-rc1

v3 changes:
* rebase on v5.9-rc1, as the result this required some non-trivial changes
  in patches 10 and 16. I didn't add Baoquan's Reviewed-by to theses
  patches, but I keept Thomas and Miguel
* Add Acked-by from Thomas and Miguel as there were changes in MIPS and
  only trivial changes in .clang-format
* Added Reviewed-by from Baoquan except for the patches 10 and 16
* Fixed misc build errors and warnings reported by kbuild bot
* Updated PowerPC KVM reservation size (patch 2), as per Daniel's comment

v2 changes:
* replace for_each_memblock() with two versions, one for memblock.memory
  and another one for memblock.reserved
* fix overzealous cleanup of powerpc fadamp: keep the traversal over the
  memblocks, but use better suited iterators
* don't remove traversal over memblock.reserved in x86 numa cleanup but
  replace for_each_memblock() with new for_each_reserved_mem_region()
* simplify ramdisk and crash kernel allocations on x86
* drop more redundant and unused code: __next_reserved_mem_region() and
  memblock_mem_size()
* add description of numa initialization fix on arm64 (thanks Jonathan)
* add Acked and Reviewed tags

Mike Rapoport (17):
  KVM: PPC: Book3S HV: simplify kvm_cma_reserve()
  dma-contiguous: simplify cma_early_percent_memory()
  arm, xtensa: simplify initialization of high memory pages
  arm64: numa: simplify dummy_numa_init()
  h8300, nds32, openrisc: simplify detection of memory extents
  riscv: drop unneeded node initialization
  mircoblaze: drop unneeded NUMA and sparsemem initializations
  memblock: make for_each_memblock_type() iterator private
  memblock: make memblock_debug and related functionality private
  memblock: reduce number of parameters in for_each_mem_range()
  arch, mm: replace for_each_memblock() with for_each_mem_pfn_range()
  arch, drivers: replace for_each_membock() with for_each_mem_range()
  x86/setup: simplify initrd relocation and reservation
  x86/setup: simplify reserve_crashkernel()
  memblock: remove unused memblock_mem_size()
  memblock: implement for_each_reserved_mem_region() using
    __next_mem_region()
  memblock: use separate iterators for memory and reserved regions

 .clang-format                            |  5 +-
 arch/arm/kernel/setup.c                  | 18 +++--
 arch/arm/mm/init.c                       | 59 +++------------
 arch/arm/mm/mmu.c                        | 39 ++++------
 arch/arm/mm/pmsa-v7.c                    | 23 +++---
 arch/arm/mm/pmsa-v8.c                    | 17 ++---
 arch/arm/xen/mm.c                        |  7 +-
 arch/arm64/kernel/machine_kexec_file.c   |  6 +-
 arch/arm64/kernel/setup.c                |  4 +-
 arch/arm64/mm/init.c                     | 11 +--
 arch/arm64/mm/kasan_init.c               | 10 +--
 arch/arm64/mm/mmu.c                      | 11 +--
 arch/arm64/mm/numa.c                     | 15 ++--
 arch/c6x/kernel/setup.c                  |  9 ++-
 arch/h8300/kernel/setup.c                |  8 +-
 arch/microblaze/mm/init.c                | 21 ++----
 arch/mips/cavium-octeon/dma-octeon.c     | 12 +--
 arch/mips/kernel/setup.c                 | 31 ++++----
 arch/mips/netlogic/xlp/setup.c           |  2 +-
 arch/nds32/kernel/setup.c                |  8 +-
 arch/openrisc/kernel/setup.c             |  9 +--
 arch/openrisc/mm/init.c                  |  8 +-
 arch/powerpc/kernel/fadump.c             | 57 +++++++-------
 arch/powerpc/kexec/file_load_64.c        | 16 ++--
 arch/powerpc/kvm/book3s_hv_builtin.c     | 12 +--
 arch/powerpc/mm/book3s64/hash_utils.c    | 16 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c | 10 +--
 arch/powerpc/mm/kasan/kasan_init_32.c    |  8 +-
 arch/powerpc/mm/mem.c                    | 33 ++++----
 arch/powerpc/mm/numa.c                   |  7 +-
 arch/powerpc/mm/pgtable_32.c             |  8 +-
 arch/riscv/mm/init.c                     | 36 +++------
 arch/riscv/mm/kasan_init.c               | 10 +--
 arch/s390/kernel/setup.c                 | 27 ++++---
 arch/s390/mm/page-states.c               |  6 +-
 arch/s390/mm/vmem.c                      |  7 +-
 arch/sh/mm/init.c                        |  9 +--
 arch/sparc/mm/init_64.c                  | 12 +--
 arch/x86/kernel/setup.c                  | 56 +++++---------
 arch/x86/mm/numa.c                       |  2 +-
 arch/xtensa/mm/init.c                    | 55 +++-----------
 drivers/bus/mvebu-mbus.c                 | 12 +--
 drivers/irqchip/irq-gic-v3-its.c         |  2 +-
 include/linux/memblock.h                 | 88 +++++++++++++---------
 kernel/dma/contiguous.c                  | 11 +--
 mm/memblock.c                            | 95 ++++++++++--------------
 mm/page_alloc.c                          | 11 ++-
 mm/sparse.c                              | 10 +--
 48 files changed, 387 insertions(+), 562 deletions(-)

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
