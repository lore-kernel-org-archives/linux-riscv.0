Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BCDC02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JauczmagxZIhr3poQjUVeYRCQBF1DT1ARvSPtxTHojA=; b=r1tpDNivXu0+Rq
	bhfyl399DSgX+53uhFoIZDRah/dSmhsPAVQhAV0G4UENyMDq5mfSyTyvOTCV31fOfgBUOQ1cwzTI4
	oxKSLBl7yaCYvl/c85ZJkrklWVNaKA8iEwNtrWc2hunhfMuvnlZDamyakvH8B9ggoIFMaohBzqAVe
	M32Fii3CSQUZoKAHQqbqRTQE/UQ9+ULQX1fF2laXGZqbt0j0N+f1ANU+FR+at08lSe3RQKfB3G5T7
	ZTY/uuWhqyOkyzlM2QEhSRc8b3kPJ/26Ak66XJNBDguFiRfZaE1cP/9B1z8c4dMaxatOmX3LXv+VI
	DSAvFYOXwYjLvcUgjixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMpz-0000000174V-2fzq;
	Tue, 04 Feb 2025 17:35:51 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMot-000000016fx-0vD8;
	Tue, 04 Feb 2025 17:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690483; x=1770226483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gkSVi874oZamWXqTFhaAOZ4pp4va5gatG6W8+kcuVHA=;
  b=fBMsuqgOs59Pecnr6lTgOEtxjHipg3n14C+YxuqPOPRvqWkB6RrxPOpl
   g2vjzRcvlWznAPa8zdIBA2s3CNTC/g7rcYK0oDq27xdCsr6LV0uIGS7nV
   I9X8lkoyHvd7IuFflfbGYcxOOjYQQxYBcS+BbeFVlKlIXk1OE8DyYfTFp
   qYBpbQpvgVcRSuoIj0KGlZpoUI0Acof2PzjkeSrIk9vxvFrIpo/mO8ap+
   fI9AbtR5q1k7X6LwQn/ct01wTA6oljFhv4xlGV/qOo9lANqtvKBC7GZyk
   DEC8Hppsp3rMGNc/iI6IJqPXQkhCG4PIzFGfjfnMGmSZlH5xffg55NMjT
   Q==;
X-CSE-ConnectionGUID: hZSP2fjPS+uIABJd1AAIdA==
X-CSE-MsgGUID: YrFzi7XNRvGAucpalQ24mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930260"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:37 -0800
X-CSE-ConnectionGUID: prkHYuVRSJ2uR8d8lQLj6Q==
X-CSE-MsgGUID: /nP6Sa9pRLaAvJF1jo5+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866051"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:25 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
Date: Tue,  4 Feb 2025 18:33:41 +0100
Message-ID: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_093443_338296_1A08D2BD 
X-CRM114-Status: GOOD (  28.55  )
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

======= Introduction
The patchset aims to add a KASAN tag-based mode for the x86 architecture
with the help of the new CPU feature called Linear Address Masking
(LAM). Main improvement introduced by the series is 4x lower memory
usage compared to KASAN's generic mode, the only currently available
mode on x86.

There are two logical parts to this series. The first one attempts to
add a new memory saving mechanism called "dense mode" to the generic
part of the tag-based KASAN code. The second one focuses on implementing
and enabling the tag-based mode for the x86 architecture by using LAM.

======= How KASAN tag-based mode works?
When enabled, memory accesses and allocations are augmented by the
compiler during kernel compilation. Instrumentation functions are added
to each memory allocation and each pointer dereference.

The allocation related functions generate a random tag and save it in
two places: in shadow memory that maps to the allocated memory, and in
the top bits of the pointer that points to the allocated memory. Storing
the tag in the top of the pointer is possible because of Top-Byte Ignore
(TBI) on arm64 architecture and LAM on x86.

The access related functions are performing a comparison between the tag
stored in the pointer and the one stored in shadow memory. If the tags
don't match an out of bounds error must have occurred and so an error
report is generated.

The general idea for the tag-based mode is very well explained in the
series with the original implementation [1].

[1] https://lore.kernel.org/all/cover.1544099024.git.andreyknvl@google.com/

======= What is the new "dense mode"?
To further save memory the dense mode is introduced. The idea is that
normally one shadow byte stores one tag and this one tag covers one
granule of allocated memory which is 16 bytes. In the dense mode, one
tag still covers 16 bytes of allocated memory but is shortened in length
from 8 bits to 4 bits which makes it possible to store two tags in one
shadow memory byte.

=== Example:
The example below shows how the shadow memory looks like after
allocating 48 bytes of memory in both normal tag-based mode and the
dense mode. The contents of shadow memory are overlaid onto address
offsets that they relate to in the allocated kernel memory. Each cell
|        | symbolizes one byte of shadow memory.

= The regular tag based mode:
- Randomly generated 8-bit tag equals 0xAB.
- 0xFE is the tag that symbolizes unallocated memory.

Shadow memory contents:           |  0xAB  |  0xAB  |  0xAB  |  0xFE  |
Shadow memory address offsets:    0        1        2        3        4
Allocated memory address offsets: 0        16       32       48       64

= The dense tag based mode:
- Randomly generated 4-bit tag equals 0xC.
- 0xE is the tag that symbolizes unallocated memory.

Shadow memory contents:           |0xC 0xC |0xC 0xE |0xE 0xE |0xE 0xE |
Shadow memory address offsets:    0        1        2        3        4
Allocated memory address offsets: 0        32       64       96       128

=== Dense mode benefits summary
For a small price of a couple of bit shifts, the dense mode uses only
half the memory compared to the current arm64 tag-based mode, while
still preserving the 16 byte tag granularity which allows catching
smaller offsets of out of bounds errors.

======= Differences summary compared to the arm64 tag-based mode
- Tag width:
	- Tag width influences the chance of a tag mismatch due to two
	  tags from different allocations having the same value. The
	  bigger the possible range of tag values the lower the chance
	  of that happening.
	- Shortening the tag width from 8 bits to 4, while helping with
	  memory usage also increases the chance of not reporting an
	  error. 4 bit tags have a ~7% chance of a tag mismatch.

- TBI and LAM
	- TBI in arm64 allows for storing metadata in the top 8 bits of
	  the virtual address.
	- LAM in x86 allows storing tags in bits [62:57] of the pointer.
	  To maximize memory savings the tag width is reduced to bits
	  [60:57].

======= Testing
Checked all the kunits for both software tags and generic KASAN after
making changes.

In generic mode the results were:

kasan: pass:59 fail:0 skip:13 total:72
Totals: pass:59 fail:0 skip:13 total:72
ok 1 kasan

and for software tags:

kasan: pass:63 fail:0 skip:9 total:72
Totals: pass:63 fail:0 skip:9 total:72
ok 1 kasan

======= Benchmarks
All tests were ran on a Sierra Forest server platform with 512GB of
memory. The only differences between the tests were kernel options:
	- CONFIG_KASAN
	- CONFIG_KASAN_GENERIC
	- CONFIG_KASAN_SW_TAGS
	- CONFIG_KASAN_INLINE [1]
	- CONFIG_KASAN_OUTLINE [1]

Used memory in GBs after boot [2][3]:
* 14 for clean kernel
* 91 / 90 for generic KASAN (inline/outline)
* 31 for tag-based KASAN

Boot time (until login prompt):
* 03:48 for clean kernel
* 08:02 / 09:45 for generic KASAN (inline/outline)
* 08:50 for dense tag-based KASAN
* 04:50 for dense tag-based KASAN with stacktrace disabled [4]

Compilation time comparison (10 cores):
* 7:27 for clean kernel
* 8:21/7:44 for generic KASAN (inline/outline)
* 7:41 for tag-based KASAN

Network performance [5]:
* 13.7 Gbits/sec for clean kernel
* 2.25 Gbits/sec for generic KASAN inline
* 1.50 Gbits/sec for generic KASAN outline
* 1.55 Gbits/sec for dense tag-based KASAN
* 2.86 Gbits/sec for dense tag-based KASAN with stacktrace disabled

[1] Based on hwasan and asan compiler parameters used in
scripts/Makefile.kasan it looks like inline/outline modes have a bigger
impact on generic mode than the tag-based mode. In the former inlining
actually increases the kernel image size and improves performance. In
the latter it un-inlines some code portions for debugging purposes when
the outline mode is chosen but no real difference is visible in
performance and kernel image size.

[2] Used "cat /proc/meminfo | grep MemAvailable" and then subtracted
that from the total memory of the system. Initially wanted to use "grep
Slab" similarly to the cover letter for arm64 tag-based series but
because the tests were ran on a system with 512GB of RAM and memory
usage was more split up between different categories this better shows
the memory savings.

[3] If the 14 GBs from the clean build were subtracted from the KASAN
measurements one can see that the tag-based mode uses about 4x less of
the additional memory compared to the generic mode.

[4] Memory allocation and freeing performance suffers heavily from saving
stacktraces that can be later displayed in error reports.

[5] Measured as `iperf -s & iperf -c 127.0.0.1 -t 30`.

======= Compilation
Clang was used to compile the series (make LLVM=1) since gcc doesn't
seem to have support for KASAN tag-based compiler instrumentation on
x86.

======= Dependencies
Series is based on risc-v series [1] that's currently in review. Because
of this for the time being it only applies cleanly on top of 6.12
mainline kernel. Will rebase on the newest kernel once the risc-v series
is also rebased.

[1] https://lore.kernel.org/all/20241022015913.3524425-1-samuel.holland@sifive.com/

Maciej Wieczor-Retman (15):
  kasan: Allocation enhancement for dense tag-based mode
  kasan: Tag checking with dense tag-based mode
  kasan: Vmalloc dense tag-based mode support
  kasan: arm64: x86: risc-v: Make special tags arch specific
  x86: Add arch specific kasan functions
  x86: Reset tag for virtual to physical address conversions
  mm: Pcpu chunk address tag reset
  x86: Physical address comparisons in fill_p*d/pte
  x86: Physical address comparison in current_mm pgd check
  x86: KASAN raw shadow memory PTE init
  x86: LAM initialization
  x86: Minimal SLAB alignment
  x86: runtime_const used for KASAN_SHADOW_END
  x86: Make software tag-based kasan available
  kasan: Add mititgation and debug modes

 Documentation/arch/x86/x86_64/mm.rst |  6 +-
 MAINTAINERS                          |  2 +-
 arch/arm64/include/asm/kasan-tags.h  |  9 +++
 arch/riscv/include/asm/kasan-tags.h  | 12 ++++
 arch/riscv/include/asm/kasan.h       |  4 --
 arch/x86/Kconfig                     | 11 +++-
 arch/x86/boot/compressed/misc.h      |  2 +
 arch/x86/include/asm/kasan-tags.h    |  9 +++
 arch/x86/include/asm/kasan.h         | 50 +++++++++++++--
 arch/x86/include/asm/page.h          | 17 +++--
 arch/x86/include/asm/page_64.h       |  2 +-
 arch/x86/kernel/head_64.S            |  3 +
 arch/x86/kernel/setup.c              |  2 +
 arch/x86/kernel/vmlinux.lds.S        |  1 +
 arch/x86/mm/init.c                   |  3 +
 arch/x86/mm/init_64.c                |  8 +--
 arch/x86/mm/kasan_init_64.c          | 24 +++++--
 arch/x86/mm/physaddr.c               |  1 +
 arch/x86/mm/tlb.c                    |  2 +-
 include/linux/kasan-tags.h           | 12 +++-
 include/linux/kasan.h                | 94 +++++++++++++++++++++++-----
 include/linux/mm.h                   |  6 +-
 include/linux/page-flags-layout.h    |  7 +--
 lib/Kconfig.kasan                    | 49 +++++++++++++++
 mm/kasan/Makefile                    |  3 +
 mm/kasan/dense.c                     | 83 ++++++++++++++++++++++++
 mm/kasan/kasan.h                     | 27 +-------
 mm/kasan/report.c                    |  6 +-
 mm/kasan/report_sw_tags.c            | 12 ++--
 mm/kasan/shadow.c                    | 47 ++++++++++----
 mm/kasan/sw_tags.c                   |  8 +++
 mm/kasan/tags.c                      |  5 ++
 mm/percpu-vm.c                       |  2 +-
 33 files changed, 432 insertions(+), 97 deletions(-)
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/riscv/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h
 create mode 100644 mm/kasan/dense.c

-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
