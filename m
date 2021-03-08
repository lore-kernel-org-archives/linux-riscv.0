Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EFEC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 06:55:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D975651EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 06:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D975651EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G42pQKYjwBvViZDz8mYdpfIsOkfDGOp8LUrXocSeguo=; b=CHWRTWwBcXw22BxYZCwAQ2I4ir
	N9gqsRGbWrUngdorHVf1nJRGZYtwrwJ3zY/Dydkma2BO6q6xDAbWvNoICFK3DXiUnRGoo0pF/Eanv
	aaGGPRLB20zHrTkl6ckLcfySyNQRW2VrHZseUBZ9VsKhMg+Ov7wDULANTiPgC/WOo7mW4yrtLFsSH
	cJxnZ1McG9fFCMu4j5OFFVZWj8cv2Uh3zGDVgxQDAGHIHRA+eljJGD0mdZZT8AXmX7FIzvy+uvrM8
	0a54KKSrSRwDzoujfFqbT/VvZAcVWC5L2mnQdrytGriyDtOd8e4XLnmBlUNN5Fc+hQGp9CBPqsYyd
	uXcVhqqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9nM-00Fa3X-Pf; Mon, 08 Mar 2021 06:55:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9at-00FWqn-Ph; Mon, 08 Mar 2021 06:42:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B59A7ED1;
 Sun,  7 Mar 2021 22:42:12 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.67.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 931143F73C;
 Sun,  7 Mar 2021 22:42:03 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 5/6] mm: Drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK
Date: Mon,  8 Mar 2021 12:11:44 +0530
Message-Id: <1615185706-24342-6-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_064220_731875_D5BA7769 
X-CRM114-Status: GOOD (  10.35  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ARCH_ENABLE_SPLIT_PMD_PTLOCKS has duplicate definitions on platforms that
subscribe it. Drop these reduntant definitions and instead just select it
on applicable platforms.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig                     | 4 +---
 arch/powerpc/platforms/Kconfig.cputype | 5 +----
 arch/s390/Kconfig                      | 4 +---
 arch/x86/Kconfig                       | 5 +----
 4 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c0e75f62f08c..fb5b1630a4eb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -14,6 +14,7 @@ config ARM64
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -1054,9 +1055,6 @@ config HW_PERF_EVENTS
 
 config ARCH_WANT_HUGE_PMD_SHARE
 
-config ARCH_ENABLE_SPLIT_PMD_PTLOCK
-	def_bool y if PGTABLE_LEVELS > 2
-
 # Supported by clang >= 7.0
 config CC_HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 4465b71b2bff..be0e29f18dd4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -97,6 +97,7 @@ config PPC_BOOK3S_64
 	select PPC_HAVE_PMU_SUPPORT
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
+	select ARCH_ENABLE_PMD_SPLIT_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
@@ -356,10 +357,6 @@ config SPE
 
 	  If in doubt, say Y here.
 
-config ARCH_ENABLE_SPLIT_PMD_PTLOCK
-	def_bool y
-	depends on PPC_BOOK3S_64
-
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
 	depends on PPC_BOOK3S_64
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index f8b356550daa..d72989591223 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -62,6 +62,7 @@ config S390
 	select ARCH_BINFMT_ELF_STATE
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
@@ -628,9 +629,6 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
 
-config ARCH_ENABLE_SPLIT_PMD_PTLOCK
-	def_bool y
-
 config MAX_PHYSMEM_BITS
 	int "Maximum size of supported physical memory in bits (42-53)"
 	range 42 53
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 10702ef1eb57..5dd70c798167 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -63,6 +63,7 @@ config X86
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if x86_64 && HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64 || (X86_32 && HIGHMEM)
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
+	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if X86_64 || X86_PAE
 	select ARCH_ENABLE_THP_MIGRATION if x86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CACHE_LINE_SIZE
@@ -2431,10 +2432,6 @@ config USE_PERCPU_NUMA_NODE_ID
 	def_bool y
 	depends on NUMA
 
-config ARCH_ENABLE_SPLIT_PMD_PTLOCK
-	def_bool y
-	depends on X86_64 || X86_PAE
-
 menu "Power management and ACPI options"
 
 config ARCH_HIBERNATION_HEADER
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
