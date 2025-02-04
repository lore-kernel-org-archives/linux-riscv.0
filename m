Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2391C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dO6EOiwqyVXJ+3bZZKWT2T85Ld0iGdPYx1NTq77AZ0=; b=BeGYIdyqDPI3Kx
	EB8VJD+fpD5bkfwb5sjSu56Hy+1t2GfO88fR/6RsWHfcyTzM42WC1/8/SW3k4XynXkIyeqgG+0WjZ
	tacrsztfOyqG1U+3ehfbEXenzIQOitNGUN0JzKmFK5y4Vua2qZLaoKSiMG+wZ5MJ5sz5aavMPEH8j
	pK0QGB8bCPmrnFIm0Few5gKWc0eunS/wCTSQ3P9+2yBDmHT5ixtqGrVHLfdKQrFw30b8M0pOwX/2Y
	JcE7h6/lqPn+Zxg4tmdoaB0CXjfu0LdzatdDNuY+F0yr3Gu3HeMMwgUUlks5IHUtE6ORB4kYQIf1M
	tpJeJPct5O/4ivZJd41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6X-00000001SZj-3WPO;
	Tue, 04 Feb 2025 20:01:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMrW-0000000186E-1sDz;
	Tue, 04 Feb 2025 17:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AJ+KNrmQGw87u/Lv3sW/ixn2Pc83/zgfJdm0b3G7QSs=; b=S5W63giuseUSKR3TufUpyefe70
	tZQJenlhTVO3ETpUdt7KlXVCf0mRkDm5Cthms8F+tuWpUMY+qcFSGdtmeYBTp04fjxDKkU3j8jHlj
	n+E192WiTXCBLXltJhGXtqL0m4+t/qGxjfisP9ynorAXd953kCZZbZD7K+M7MbVMn2a7TBBgxcPgQ
	NbNN0Q48xcH0Ie7vhwSbHGSaDQeZR0KWm2QEOPVWuhHcZOsQU4XERUt6jxyXCRgQZNAvsAuS75J4t
	nYc2rVMfdgQGO/lZ5dUDmMc3BKX8gs7mSCRqpJDaP03kYc4tZI6HjcMqV6YE6C0XbcBd1zhExrdm2
	0/1aiTPg==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMrS-0000000GM8P-0Mio;
	Tue, 04 Feb 2025 17:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690642; x=1770226642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tgQnPnMq4WHkStd3vJbMqoHpzLn5Ygn4fGXf7vNlMB4=;
  b=mFESbTU9nXeiVEzQwpZ0873UAhu6UFcSPd8YK8UqGu4wfncKoanfqlkN
   pudmvobTB4jR11zXTVUS6w+hoJmZTPnAkF6ofXPDY+SWTiDTGI7Ik+Ani
   qphC/4zUT7lbeY6I37t27/uc0/rkCOIL+bCgcSc9RgBg/z9zpxwjjkqqw
   +3+V746PjlR8qn0y2mz7zeNK4LbD5qJeoD1fZq6oPZs7EXx/lgwfz+g8l
   w881eXWJ2zdFe1HSJkds0lHgbnuISFhJA7s7HHWKMRXTsy5BNvzt1Fk9u
   96GV8y2FByJO+I9P/X6VbkVpO4CHPSrNeS43bANE60rrZ3+f5qSluqKsR
   g==;
X-CSE-ConnectionGUID: 5rrGllTJSVuYB98NsCiYYQ==
X-CSE-MsgGUID: ycg+7T+UQge8Dyj10ZoYiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931123"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:19 -0800
X-CSE-ConnectionGUID: OH9xu6cPRWustG/bFhP1dw==
X-CSE-MsgGUID: vAuLaG4TRpmkRprgXY7/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147867096"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:04 -0800
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
Subject: [PATCH 13/15] x86: runtime_const used for KASAN_SHADOW_END
Date: Tue,  4 Feb 2025 18:33:54 +0100
Message-ID: <5d0f9dbd0f7c2326229f2a1f3dcedd46842a9615.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173722_528662_CD2A8B74 
X-CRM114-Status: GOOD (  17.93  )
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

On x86, generic KASAN is setup in a way that needs a single
KASAN_SHADOW_OFFSET value for both 4 and 5 level paging. It's required
to facilitate boot time switching and it's a compiler ABI so it can't be
changed during runtime.

Software tag-based mode doesn't tie shadow start and end to any linear
addresses as part of the compiler ABI so it can be changed during
runtime. This notion, for KASAN purposes, allows to optimize out macros
such us pgtable_l5_enabled() which would otherwise be used in every
single KASAN related function.

Use runtime_const infrastructure with pgtable_l5_enabled() to initialize
the end address of KASAN's shadow address space. It's a good choice
since in software tag based mode KASAN_SHADOW_OFFSET and
KASAN_SHADOW_END refer to the same value and the offset in
kasan_mem_to_shadow() is a signed negative value.

Setup KASAN_SHADOW_END values so that they're aligned to 4TB in 4-level
paging mode and to 2PB in 5-level paging mode. Also update x86 memory
map documentation.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 Documentation/arch/x86/x86_64/mm.rst |  6 ++++--
 arch/x86/Kconfig                     |  3 +--
 arch/x86/include/asm/kasan.h         | 14 +++++++++++++-
 arch/x86/kernel/vmlinux.lds.S        |  1 +
 arch/x86/mm/kasan_init_64.c          |  5 ++++-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/x86_64/mm.rst
index 35e5e18c83d0..4e8c04d71a13 100644
--- a/Documentation/arch/x86/x86_64/mm.rst
+++ b/Documentation/arch/x86/x86_64/mm.rst
@@ -48,7 +48,8 @@ Complete virtual memory map with 4-level page tables
    ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused hole
    ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual memory map (vmemmap_base)
    ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused hole
-   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory
+   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory (generic mode)
+   fffff80000000000 |   -8    TB | fffffc0000000000 |    4 TB | KASAN shadow memory (software tag-based mode)
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
                                                               | Identical layout to the 56-bit one from here on:
@@ -107,7 +108,8 @@ Complete virtual memory map with 5-level page tables
    ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused hole
    ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual memory map (vmemmap_base)
    ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused hole
-   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory (generic mode)
+   ffe8000000000000 |   -6    PB | fff0000000000000 |    2 PB | KASAN shadow memory (software tag-based mode)
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
                                                               | Identical layout to the 47-bit one from here on:
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7b9a7e8f39ac..dfec7bc692d4 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -392,8 +392,7 @@ config AUDIT_ARCH
 
 config KASAN_SHADOW_OFFSET
 	hex
-	depends on KASAN
-	default 0xdffffc0000000000
+	default 0xdffffc0000000000 if KASAN_GENERIC
 
 config HAVE_INTEL_TXT
 	def_bool y
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index f7a8d3763615..79151356d5f2 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -5,7 +5,7 @@
 #include <linux/const.h>
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
-#define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+
 #define KASAN_SHADOW_SCALE_SHIFT 3
 
 /*
@@ -14,6 +14,8 @@
  * for kernel really starts from compiler's shadow offset +
  * 'kernel address space start' >> KASAN_SHADOW_SCALE_SHIFT
  */
+#ifdef CONFIG_KASAN_GENERIC
+#define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 #define KASAN_SHADOW_START      (KASAN_SHADOW_OFFSET + \
 					((-1UL << __VIRTUAL_MASK_SHIFT) >> \
 						KASAN_SHADOW_SCALE_SHIFT))
@@ -24,12 +26,22 @@
 #define KASAN_SHADOW_END        (KASAN_SHADOW_START + \
 					(1ULL << (__VIRTUAL_MASK_SHIFT - \
 						  KASAN_SHADOW_SCALE_SHIFT)))
+#endif
+
 
 #ifndef __ASSEMBLY__
+#include <asm/runtime-const.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 
+#ifdef CONFIG_KASAN_SW_TAGS
+extern unsigned long KASAN_SHADOW_END_RC;
+#define KASAN_SHADOW_END	runtime_const_ptr(KASAN_SHADOW_END_RC)
+#define KASAN_SHADOW_OFFSET	KASAN_SHADOW_END
+#define KASAN_SHADOW_START	(KASAN_SHADOW_END - ((UL(1)) << (__VIRTUAL_MASK_SHIFT - KASAN_SHADOW_SCALE_SHIFT)))
+#endif
+
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
 #define arch_kasan_get_tag(addr)	__tag_get(addr)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index feb8102a9ca7..46183f7439c9 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -359,6 +359,7 @@ SECTIONS
 
 	RUNTIME_CONST_VARIABLES
 	RUNTIME_CONST(ptr, USER_PTR_MAX)
+	RUNTIME_CONST(ptr, KASAN_SHADOW_END_RC)
 
 	. = ALIGN(PAGE_SIZE);
 
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 55d468d83682..0f8190e0e5f6 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -358,6 +358,9 @@ void __init kasan_init(void)
 	int i;
 
 	memcpy(early_top_pgt, init_top_pgt, sizeof(early_top_pgt));
+	unsigned long KASAN_SHADOW_END_RC = pgtable_l5_enabled() ? 0xfff0000000000000 : 0xfffffc0000000000;
+
+	runtime_const_init(ptr, KASAN_SHADOW_END_RC);
 
 	/*
 	 * We use the same shadow offset for 4- and 5-level paging to
@@ -372,7 +375,7 @@ void __init kasan_init(void)
 	 * bunch of things like kernel code, modules, EFI mapping, etc.
 	 * We need to take extra steps to not overwrite them.
 	 */
-	if (pgtable_l5_enabled()) {
+	if (pgtable_l5_enabled() && !IS_ENABLED(CONFIG_KASAN_SW_TAGS)) {
 		void *ptr;
 
 		ptr = (void *)pgd_page_vaddr(*pgd_offset_k(KASAN_SHADOW_END));
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
