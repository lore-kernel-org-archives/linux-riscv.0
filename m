Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F74C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 07:23:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D166561059
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 07:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D166561059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ieYKCY2i3jqFed5jk2ix3SOtFsmmioAHZh4QLCzEds=; b=L1TZnIy0HEG/yQOLbkuCvxmll
	bw4uqmNCBvGJ1+pH6TQfoVbqQ1wf5iQGNNjtUKy3K0uxyiBgtklgccMtQnhPMX6wU6cDqxoEn4Juc
	XNYHP2bN8IsCy5S8E1Hso4dxY7OTfjNEr5OqNrv2zs8nrGBWDg4cf12L/VkobKM3uDSvpWcR0dFSt
	K5uvDeZ28F37SRDZxHN3xqg2E5oqi3FAxSm/qUL4acpgtHRtz1sfdz5xipCyIGX73OPzA845F7u6S
	Eu2aczc28wfqszWrTNyHHKD1+W+MxVNF00X7+07115xTJXv6dWRp1+6zMsQR4gAOhno4HLg89wNye
	MIOcqXXcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liu4Q-00HJMl-Tv; Tue, 18 May 2021 07:23:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liu2m-00HIfZ-18; Tue, 18 May 2021 07:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3CeYDB0cBLViGb+yedTe0M/ufHXKkvq2OjRG6pbxMlM=; b=4+72usKMDTzWH5nodIlR9aeMJJ
 fuvUGJYLr895jat+qMwdSOUGyFvM0sI4cw5r+/UkvJfaSW0CdfJs8pkkooxXE5sQj+WmV73w0wPe9
 ftmuH7sbBzOELNE4RKCtNTwvE/99aexiPDT+W4UiyMiJjqck+2GeGY8JO1r/XNNRQlwjTbhcObWOf
 X7UzLETbGLrN18zgupdW115d57jdli46+nMjYoiY5FNNH/Tt1CIPKhj3FcMPsALaE+zkJ+0BxH21N
 3zvdJ9+LlO5V5uqt0CTMLeDQt7FS12LngW8V0AWfokMIf7Sb49K840egyspZrs/Wgy/7XNUlsR7vb
 EUx4Djig==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liu2h-00EP5O-8P; Tue, 18 May 2021 07:21:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F4946135F;
 Tue, 18 May 2021 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621322486;
 bh=/KigOkMNE1Z6fcyoZ/lh7stlbqW7rjfo2ZgyqVvK+Eg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P1EWOJzo2ovv4NqPytAn9qIoIbJf0JIW9Fj+P+3fFOxr3unuXhqa9ymnxWgvRxZUL
 25xnSdUQBAuy/TYEKFRcJgbPftI0PKmvLzEu+L7TdPShtELgXUAcnnEpj2W4qBGoVM
 ha9Y2VoVCJj76CE1BHJg3klSKqO7EtAUstI+zuJWqfTjovL8SFlGE9Wp6UAnt/NSln
 PCGVy9xiHo3l6JqxlRGSOQXRPu1tLjNQWsCBzKTwVSH9PczxTR/0twOkkpunIjEqUR
 SoojVZjSPTQLbkG7U98q157sX9LkwONSj9kLjJnnITERXxAe4NoWzHOfdJk8awwwjz
 v6VQ3CZ4RQRvQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH v20 3/7] set_memory: allow querying whether set_direct_map_*()
 is actually enabled
Date: Tue, 18 May 2021 10:20:30 +0300
Message-Id: <20210518072034.31572-4-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210518072034.31572-1-rppt@kernel.org>
References: <20210518072034.31572-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_002127_388301_18D77004 
X-CRM114-Status: GOOD (  24.61  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

On arm64, set_direct_map_*() functions may return 0 without actually
changing the linear map.  This behaviour can be controlled using kernel
parameters, so we need a way to determine at runtime whether calls to
set_direct_map_invalid_noflush() and set_direct_map_default_noflush() have
any effect.

Extend set_memory API with can_set_direct_map() function that allows
checking if calling set_direct_map_*() will actually change the page
table, replace several occurrences of open coded checks in arm64 with the
new function and provide a generic stub for architectures that always
modify page tables upon calls to set_direct_map APIs.

[arnd@arndb.de: arm64: kfence: fix header inclusion ]

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Christopher Lameter <cl@linux.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Hagen Paul Pfeifer <hagen@jauu.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Roman Gushchin <guro@fb.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tycho Andersen <tycho@tycho.ws>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/Kbuild       |  1 -
 arch/arm64/include/asm/cacheflush.h |  6 ------
 arch/arm64/include/asm/kfence.h     |  2 +-
 arch/arm64/include/asm/set_memory.h | 17 +++++++++++++++++
 arch/arm64/kernel/machine_kexec.c   |  1 +
 arch/arm64/mm/mmu.c                 |  6 +++---
 arch/arm64/mm/pageattr.c            | 13 +++++++++----
 include/linux/set_memory.h          | 12 ++++++++++++
 8 files changed, 43 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/include/asm/set_memory.h

diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index 07ac208edc89..73aa25843f65 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -3,5 +3,4 @@ generic-y += early_ioremap.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
-generic-y += set_memory.h
 generic-y += user.h
diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 52e5c1623224..4e3c13799735 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -131,12 +131,6 @@ static __always_inline void __flush_icache_all(void)
 	dsb(ish);
 }
 
-int set_memory_valid(unsigned long addr, int numpages, int enable);
-
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
-bool kernel_page_present(struct page *page);
-
 #include <asm-generic/cacheflush.h>
 
 #endif /* __ASM_CACHEFLUSH_H */
diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
index d061176d57ea..aa855c6a0ae6 100644
--- a/arch/arm64/include/asm/kfence.h
+++ b/arch/arm64/include/asm/kfence.h
@@ -8,7 +8,7 @@
 #ifndef __ASM_KFENCE_H
 #define __ASM_KFENCE_H
 
-#include <asm/cacheflush.h>
+#include <asm/set_memory.h>
 
 static inline bool arch_kfence_init_pool(void) { return true; }
 
diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
new file mode 100644
index 000000000000..0f740b781187
--- /dev/null
+++ b/arch/arm64/include/asm/set_memory.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_ARM64_SET_MEMORY_H
+#define _ASM_ARM64_SET_MEMORY_H
+
+#include <asm-generic/set_memory.h>
+
+bool can_set_direct_map(void);
+#define can_set_direct_map can_set_direct_map
+
+int set_memory_valid(unsigned long addr, int numpages, int enable);
+
+int set_direct_map_invalid_noflush(struct page *page);
+int set_direct_map_default_noflush(struct page *page);
+bool kernel_page_present(struct page *page);
+
+#endif /* _ASM_ARM64_SET_MEMORY_H */
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 90a335c74442..0ec94e718724 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/page-flags.h>
+#include <linux/set_memory.h>
 #include <linux/smp.h>
 
 #include <asm/cacheflush.h>
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 6dd9369e3ea0..e42aeff6c344 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -22,6 +22,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <linux/set_memory.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -515,7 +516,7 @@ static void __init map_mem(pgd_t *pgdp)
 	 */
 	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end));
 
-	if (rodata_full || crash_mem_map || debug_pagealloc_enabled())
+	if (can_set_direct_map() || crash_mem_map)
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	/*
@@ -1483,8 +1484,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	 * KFENCE requires linear map to be mapped at page granularity, so that
 	 * it is possible to protect/unprotect single pages in the KFENCE pool.
 	 */
-	if (rodata_full || debug_pagealloc_enabled() ||
-	    IS_ENABLED(CONFIG_KFENCE))
+	if (can_set_direct_map() || IS_ENABLED(CONFIG_KFENCE))
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 92eccaf595c8..a3bacd79507a 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -19,6 +19,11 @@ struct page_change_data {
 
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
 
+bool can_set_direct_map(void)
+{
+	return rodata_full || debug_pagealloc_enabled();
+}
+
 static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
 {
 	struct page_change_data *cdata = data;
@@ -155,7 +160,7 @@ int set_direct_map_invalid_noflush(struct page *page)
 		.clear_mask = __pgprot(PTE_VALID),
 	};
 
-	if (!debug_pagealloc_enabled() && !rodata_full)
+	if (!can_set_direct_map())
 		return 0;
 
 	return apply_to_page_range(&init_mm,
@@ -170,7 +175,7 @@ int set_direct_map_default_noflush(struct page *page)
 		.clear_mask = __pgprot(PTE_RDONLY),
 	};
 
-	if (!debug_pagealloc_enabled() && !rodata_full)
+	if (!can_set_direct_map())
 		return 0;
 
 	return apply_to_page_range(&init_mm,
@@ -181,7 +186,7 @@ int set_direct_map_default_noflush(struct page *page)
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-	if (!debug_pagealloc_enabled() && !rodata_full)
+	if (!can_set_direct_map())
 		return;
 
 	set_memory_valid((unsigned long)page_address(page), numpages, enable);
@@ -206,7 +211,7 @@ bool kernel_page_present(struct page *page)
 	pte_t *ptep;
 	unsigned long addr = (unsigned long)page_address(page);
 
-	if (!debug_pagealloc_enabled() && !rodata_full)
+	if (!can_set_direct_map())
 		return true;
 
 	pgdp = pgd_offset_k(addr);
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index fe1aa4e54680..f36be5166c19 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -28,7 +28,19 @@ static inline bool kernel_page_present(struct page *page)
 {
 	return true;
 }
+#else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
+/*
+ * Some architectures, e.g. ARM64 can disable direct map modifications at
+ * boot time. Let them overrive this query.
+ */
+#ifndef can_set_direct_map
+static inline bool can_set_direct_map(void)
+{
+	return true;
+}
+#define can_set_direct_map can_set_direct_map
 #endif
+#endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifndef set_mce_nospec
 static inline int set_mce_nospec(unsigned long pfn, bool unmap)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
