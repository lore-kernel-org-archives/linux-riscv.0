Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C136606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GuD2uUfh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=d7E87zM/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:From:Mime-Version:
	Date:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+AyBhLZJrW7CagCWTPk+guN8lNL4yGslczZr7hCcOCw=; b=GuD2uUfh0gkawg2NINionBLC7x
	AfJtLFPCkafZ056vP1Q6wOi/HVTif/obZ7BUZJDO52wtNeA3CHejks2mg69YbZVAGr4w8n6lePVO8
	McGKT8Lwli/ygbw26YZcISgWb/Hrb71z0qvUtaHqYB98NsYh3m6Pik8yqoSGMelzr4YwwuExwGJbJ
	L4E2GJg7Y81K4XiJdqKryBiagNHAGCT/hZnaadrJijiHcCwJ5TCH2MlX2sFWlmmEG5XfBJyIeNH3N
	VCYsIGB9zX5cgFh5y8E/cAz3PmyamEdWazUhy+owuXM/nSCSrW69p6b4x1jGCgFzL/AKBl/rR83+A
	sVe61BZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrMK-0000000E2QZ-21ee;
	Thu, 22 Oct 2026 11:53:24 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrME-0000000E2Pj-20fR
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 11:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792669987; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wwNZsqH4WwjIxo3V+udGCSsZZgNsNxQdDxK8sok/lF0=;
 b=d7E87zM/6FdiVORDFZWdsuHKrPpU8g8xdVn/gJZuU562umHDoiDbM6IKttUKAFMjnOtJJt
 /e5tMyDUtVUeCXhuxJwOSSaJ8P7gTuQJj/OqIL/UlbQfrV1VOCldN5rg2saYo+sM0zVeN6
 zmWj67F3x9uMSKBQPykCIiXU7p0dsGRwVq6hEelO0DYYIuNxj0UVqCrKHsvZcOV2NBvFwK
 E69RW/onzw6a/Vu0Jchdc0tYuUniHnY4+LD7SMUUedI0G7EZpstGOqZWrcCkPj3RauZ+Nl
 LO1TzgaLelUSDjn2Go1PU5iwx8aqOjC3DLqAOxahzoIy/0MG2c7VMnk2GiE+1w==
To: <rafael@kernel.org>
Cc: "Rui Qi" <qirui.001@bytedance.com>, 
	"Catalin Marinas" <catalin.marinas@arm.com>, 
	"Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, 
	"Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Tony Luck" <tony.luck@intel.com>, 
	"Hanjun Guo" <guohanjun@huawei.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Shuai Xue" <xueshuai@linux.alibaba.com>, "Len Brown" <lenb@kernel.org>, 
	"Chengwen Feng" <fengchengwen@huawei.com>, 
	"Jonathan Cameron" <jic23@kernel.org>, 
	"Punit Agrawal" <punit.agrawal@oss.qualcomm.com>, 
	"Osama Abdelkader" <osama.abdelkader@gmail.com>, 
	"mrigendrachaubey" <mrigendra.chaubey@gmail.com>, 
	"Peixin Xie" <peixin.xie@linux.spacemit.com>, 
	"Vivian Wang" <wangruikang@iscas.ac.cn>, 
	"Lorenzo Pieralisi" <lpieralisi@kernel.org>, 
	"Ricardo Neri" <ricardo.neri-calderon@linux.intel.com>, 
	"Dexuan Cui" <dexuan@kernel.org>, "Dave Jiang" <dave.jiang@intel.com>, 
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, 
	"Breno Leitao" <leitao@debian.org>, 
	"Terry Bowman" <terry.bowman@amd.com>, "Dan Williams" <djbw@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	"open list" <linux-kernel@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:ACPI APEI" <linux-acpi@vger.kernel.org>
Date: Thu, 22 Oct 2026 19:52:06 +0800
X-Lms-Return-Path: <lba+26ad9f921+c00ca1+lists.infradead.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH] ACPI: APEI: GHES: Cache EFI memory attributes
Message-Id: <20261022115218.1937861-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_045318_574999_C8B7FEC8 
X-CRM114-Status: GOOD (  19.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GHES copies error status blocks through a fixmap because the physical
address of the firmware buffer may only be known from IRQ, timer or
other atomic notification contexts. On arm64, each fixmap update asks
the architecture code to derive the mapping attributes from the EFI
memory map.

efi_mem_desc_lookup() scans the EFI descriptor map. A multi-page CPER
record can therefore repeat the same descriptor search for adjacent
pages while ghes_notify_lock_irq is held and interrupts are disabled.
GHES records are bounded, so this is not normally a hot path, but
corrected error storms on systems with fragmented EFI memory maps can
amplify that latency.

Return the end of the matching EFI descriptor through the APEI memory
attribute hook and let GHES reuse the computed page protection while
copying pages covered by the same descriptor.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/arm64/include/asm/acpi.h |  7 ++++---
 arch/arm64/kernel/acpi.c      | 11 ++++++++---
 arch/riscv/include/asm/acpi.h |  5 ++++-
 arch/x86/include/asm/acpi.h   |  5 ++++-
 drivers/acpi/apei/ghes.c      | 25 +++++++++++++++++++++----
 5 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 8a54ca6ba602..055205f52f9f 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -66,7 +66,7 @@ static inline unsigned int arch_get_idle_state_flags(u32 arch_flags)
 
 /* Basic configuration for ACPI */
 #ifdef	CONFIG_ACPI
-pgprot_t __acpi_get_mem_attribute(phys_addr_t addr);
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr, phys_addr_t *end);
 
 /* ACPI table mapping after acpi_permanent_mmap is set */
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
@@ -155,9 +155,10 @@ static __always_inline const char *acpi_get_enable_method(int cpu)
  * for compatibility.
  */
 #define acpi_disable_cmcff 1
-static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr,
+						   phys_addr_t *end)
 {
-	return __acpi_get_mem_attribute(addr);
+	return __acpi_get_mem_attribute(addr, end);
 }
 #endif /* CONFIG_ACPI_APEI */
 
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 681aa2bbc399..b3097f6e0ea8 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -270,7 +270,7 @@ static pgprot_t __acpi_get_writethrough_mem_attribute(void)
 	return __pgprot(PROT_NORMAL_NC);
 }
 
-pgprot_t __acpi_get_mem_attribute(phys_addr_t addr)
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr, phys_addr_t *end)
 {
 	/*
 	 * According to "Table 8 Map: EFI memory types to AArch64 memory
@@ -280,9 +280,14 @@ pgprot_t __acpi_get_mem_attribute(phys_addr_t addr)
 	 * of a memory region.
 	 */
 
-	u64 attr;
+	efi_memory_desc_t md;
+	u64 attr = 0;
 
-	attr = efi_mem_attributes(addr);
+	if (!efi_mem_desc_lookup(addr, &md)) {
+		attr = md.attribute;
+		if (end)
+			*end = md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT);
+	}
 	if (attr & EFI_MEMORY_WB)
 		return PAGE_KERNEL;
 	if (attr & EFI_MEMORY_WC)
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index c11fc0fa9bee..882ed5433214 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -121,8 +121,11 @@ static inline void acpi_map_cpus_to_nodes(void) { }
  * RISC-V does not have CMC, so always disable it.
  */
 #define acpi_disable_cmcff 1
-static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr,
+						   phys_addr_t *end)
 {
+	if (end)
+		*end = (phys_addr_t)-1;
 	return PAGE_KERNEL;
 }
 #endif /* CONFIG_ACPI_APEI */
diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index c4e6459bd56b..a3f1f1b0a9f7 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -227,7 +227,8 @@ extern int x86_acpi_numa_init(void);
 struct cper_ia_proc_ctx;
 
 #ifdef CONFIG_ACPI_APEI
-static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr,
+						   phys_addr_t *end)
 {
 	/*
 	 * We currently have no way to look up the EFI memory map
@@ -242,6 +243,8 @@ static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
 	 * is active, the ACPI information will not be encrypted,
 	 * so return PAGE_KERNEL_NOENC until we know differently.
 	 */
+	if (end)
+		*end = (phys_addr_t)-1;
 	return PAGE_KERNEL_NOENC;
 }
 
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 663dc2e601cf..b4cd95d3e697 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -176,13 +176,12 @@ static struct gen_pool *ghes_estatus_pool;
 static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
 static atomic_t ghes_estatus_cache_alloced;
 
-static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
+static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx,
+			      pgprot_t prot)
 {
 	phys_addr_t paddr;
-	pgprot_t prot;
 
 	paddr = PFN_PHYS(pfn);
-	prot = arch_apei_get_mem_attribute(paddr);
 	__set_fixmap(fixmap_idx, paddr, prot);
 
 	return (void __iomem *) __fix_to_virt(fixmap_idx);
@@ -345,10 +344,28 @@ static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
 	void __iomem *vaddr;
 	u64 offset;
 	u32 trunk;
+	phys_addr_t prot_end = 0;
+	pgprot_t prot = __pgprot(0);
 
 	while (len > 0) {
 		offset = paddr - (paddr & PAGE_MASK);
-		vaddr = ghes_map(PHYS_PFN(paddr), fixmap_idx);
+		/*
+		 * Cache the page protection to avoid an EFI descriptor
+		 * lookup on every page.  prot is valid for all addresses
+		 * below prot_end.
+		 */
+		if (paddr >= prot_end) {
+			prot = arch_apei_get_mem_attribute(paddr, &prot_end);
+			/*
+			 * If the EFI lookup fails, *end is not written and
+			 * prot_end stays at a stale value <= paddr.  Restore
+			 * the invariant prot_end > paddr so the cached prot
+			 * remains valid for the current page.
+			 */
+			if (prot_end <= paddr)
+				prot_end = paddr + PAGE_SIZE;
+		}
+		vaddr = ghes_map(PHYS_PFN(paddr), fixmap_idx, prot);
 		trunk = PAGE_SIZE - offset;
 		trunk = min(trunk, len);
 		if (from_phys)
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
