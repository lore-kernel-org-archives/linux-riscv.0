Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D55606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIPfD3yh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=exA5ySEq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Date:To:Cc:In-Reply-To:
	Mime-Version:Message-Id:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=myeRyqoCg1GQqhhL6TRvO0mnx8IiaZZSv2TKptv7hQk=; b=HIPfD3yhJY+gWfzlri1yF1dEi6
	qcEvtiEvoy58bgJ6h2CN0FEO5b2wtrjqQcfDcVVEZGl8Uvjzq0bKHvMUIZknRF20qXwL9cBZtsoYy
	eFKU1OKvVFQW72SsppvHhJDsaawYTQ06w6pq0HfIZjlRZZ8hw4uOCiAhEZOhYfyl8FjbY3P5eqZMr
	tgxUlY1t8cyYCwJeFX7hvgN4iVxYjuleBBfslA/EGqA2LsjN2aW89tkfnulNgWJbEdgMvM7uqdteU
	L8vI+282x7zyMC45A/J3ZHlKQerN2hVtWubRkE04tEH2ct19Zb+Ua4TQ+Q/dUARfQp0yc8LxaStTY
	5WnNZMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVsI-00000004cil-3lKa;
	Wed, 04 Nov 2026 07:57:38 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVsD-00000004ccY-2Qhx
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779042; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=KQEFMCGFfhcMa3Zcq3b30jZ/7K2xG0HIu1z2UnuQhxw=;
 b=exA5ySEqzmauTvu+FfXy7HnRjHvEhYW+4ZBveyPbqfLColCuKkXKpxLDfAFIaIiX6JB3Ku
 qPHY0i1t/wZyZ8e7Tpum14qECxbGE4rhRMyETI09zsaoYNIvJnAyqaMVuqPFUwyal4PlFJ
 XFqPzICYdL8mx8iARVezIjHnQIzHH/Jsktyl6eUaDHgFojgFzcLBqFV6lwieCWs6MY5BGW
 l0jV8AafMJj4A4GgGzpkSGFHT5CYmByCEQ4tt0xKGS1NK3YjLYtf/R4VFE61h97roBFFes
 PVnT/IWFmJXsRLTLP0YNWVydIkSDO0BJjFMtXmnE6NsbhnTxJhbQe+4wZ4nQ4w==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v6 4/5] riscv: errata: picoheart: Add workaround for cbo.clean errata
Message-Id: <20261104075706.73657-5-yang.yicong@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104075706.73657-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.113]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 15:57:19 +0800
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <cleger@meta.com>, <geshijian@picoheart.com>, 
	<niehaitao@picoheart.com>, <cuiyunhui@bytedance.com>, 
	<gaohan@iscas.ac.cn>, <yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26aeae560+52080a+lists.infradead.org+yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Date: Wed,  4 Nov 2026 15:57:05 +0800
References: <20261104075706.73657-1-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235733_700553_839D3E45 
X-CRM114-Status: GOOD (  20.72  )
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cbo.clean may fail to write back the cacheline in a few very corner
cases on the affected Picoheart SoCs. Since cbo.flush is not affected,
the problem could be solved by promoting cbo.clean to cbo.flush to
keep the data coherent. So Implement and register Picoheart specific
riscv_nonstd_cache_ops for all the kernel space cache maintenance
operations. Implement riscv_nonstd_cache_ops->wback with cbo.clean
while other callbacks with corresponding CBO operations.

This could solve the issue in the kernel space. For userspace, clear
the xenvcfg.CBCFE to trap the cbo.{clean, flush} and emulate
the cbo.clean with cbo.flush in the kernel space to avoid the issue.

Tested-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/Kconfig.errata            |  13 +++
 arch/riscv/errata/picoheart/errata.c | 159 +++++++++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h |  25 ++++-
 arch/riscv/kernel/cpufeature.c       |   3 +
 arch/riscv/kernel/traps.c            |   4 +
 5 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3713e88bb446..c75dec4b0ba7 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -189,4 +189,17 @@ config ERRATA_PICOHEART
 
 	  Otherwise, please say "N" here to avoid unnecessary overhead.
 
+config ERRATA_PICOHEART_CBO_CLEAN
+	bool "Apply Picoheart cbo.clean errata"
+	depends on ERRATA_PICOHEART && MMU
+	select RISCV_NONSTANDARD_CACHE_OPS
+	select JUMP_LABEL
+	default y
+	help
+	   This will apply the cbo.clean errata workaround on the affected
+	   Picoheart SoCs where cbo.clean instructions may fail to write back
+	   the cacheline in few corner cases.
+
+	   If you don't know what to do here, say "Y".
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
index aad0bf5ed7d2..c945ae694396 100644
--- a/arch/riscv/errata/picoheart/errata.c
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -5,20 +5,179 @@
  * Author: Yicong Yang <yang.yicong@picoheart.com>
  */
 
+#include <linux/align.h>
 #include <linux/cacheflush.h>
 #include <linux/cleanup.h>
+#include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/memory.h>
+#include <linux/mm_types.h>
+#include <linux/mmap_lock.h>
+#include <linux/signal.h>
 #include <linux/string.h>
+#include <asm/asm-extable.h>
 #include <asm/alternative.h>
+#include <asm/cpufeature.h>
+#include <asm/dma-noncoherent.h>
 #include <asm/errata_list.h>
+#include <asm/insn.h>
+#include <asm/insn-def.h>
 #include <asm/text-patching.h>
+#include <asm/uaccess.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendorid_list.h>
 
+#ifdef CONFIG_ERRATA_PICOHEART_CBO_CLEAN
+
+static bool insn_is_cbo_clean_flush(u32 insn_buf)
+{
+	u32 rd, opcode, funct3, funct12;
+
+	/* CBO instructions don't have compressed variants */
+	if (GET_INSN_LENGTH(insn_buf) != 4)
+		return false;
+
+	rd = RV_EXTRACT_RD_REG(insn_buf);
+	opcode = insn_buf & __INSN_OPCODE_MASK;
+	funct3 = insn_buf & RV_INSN_FUNCT3_MASK;
+	funct12 = insn_buf & RV_INSN_FUNCT12_MASK;
+
+	if (rd != 0 || opcode != RVG_OPCODE_MISC_MEM ||
+	    funct3 != RV_ENCODE_FUNCT3(CBO) ||
+	    (funct12 != RV_ENCODE_FUNCT12(CBO_CLEAN) &&
+	     funct12 != RV_ENCODE_FUNCT12(CBO_FLUSH)))
+		return false;
+
+	return true;
+}
+
+static int cbo_clean_fault_sicode(unsigned long addr)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+
+	guard(mmap_read_lock)(mm);
+	vma = vma_lookup(mm, addr);
+	if (!vma)
+		return SEGV_MAPERR;
+
+	return SEGV_ACCERR;
+}
+
+bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
+{
+	unsigned long insn = regs->badaddr;
+	unsigned long epc = regs->epc;
+	void __user *line_addr;
+	unsigned long addr;
+	int ret = 0;
+	u32 rs1;
+
+	if (!insn) {
+		if (get_insn(regs, epc, &insn))
+			return false;
+	}
+
+	if (!insn_is_cbo_clean_flush(insn))
+		return false;
+
+	rs1 = RV_EXTRACT_RS1_REG(insn);
+	addr = rs1 ? ((unsigned long *)regs)[rs1] : 0;
+	line_addr = (void __user *)ALIGN_DOWN(addr, riscv_cbom_block_size);
+
+	/*
+	 * Check if the target address is within the valid userspace
+	 * address range. Otherwise update the bad_cause to match the
+	 * store page fault. See the comment below.
+	 */
+	if (!access_ok(line_addr, riscv_cbom_block_size)) {
+		current->thread.bad_cause = EXC_STORE_PAGE_FAULT;
+		goto err_map;
+	}
+
+	__enable_user_access();
+	asm volatile("\n"
+		"1:	\n"
+		CBO_FLUSH(%[addr])
+		"2:	\n"
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[err])
+	: [err] "+r" (ret)
+	: [addr] "r" (untagged_addr(addr))
+	: "memory");
+	__disable_user_access();
+
+	if (ret)
+		goto err_map;
+
+	regs->epc += GET_INSN_LENGTH(insn);
+	return true;
+
+err_map:
+	/*
+	 * We'll reach here if the target address is invalid.
+	 * cbo.{flush ,clean} on invalid address will cause
+	 * store page fault, update the cause and badaddr.
+	 */
+	regs->badaddr = addr;
+	regs->cause = current->thread.bad_cause;
+
+	/*
+	 * In emulation of the cbo.clean, a SIGSEGV rather than
+	 * a SIGILL should be issued if the target address is
+	 * invalid. Use do_trap() to handle the signal delivery
+	 * and related stuffs to make it analogous to the page
+	 * fault.
+	 */
+	do_trap(regs, SIGSEGV, cbo_clean_fault_sicode(untagged_addr(addr)),
+		untagged_addr(addr));
+
+	return true;
+}
+
+#endif /* CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
+
+static void picoheart_errata_cache_wback(phys_addr_t paddr, size_t size)
+{
+	void *vaddr = phys_to_virt(paddr);
+
+	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
+}
+
+/*
+ * The errata only affects the cbo.clean (wback) so use standard operations
+ * for other semantic.
+ */
+struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
+	.wback = &picoheart_errata_cache_wback,
+};
+
+DEFINE_STATIC_KEY_FALSE(has_picoheart_cbo_clean_errata);
+
+static void picoheart_errata_probe_cbo_clean(unsigned int stage,
+					     unsigned long archid,
+					     unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_CBO_CLEAN))
+		return;
+
+	if (stage != RISCV_ALTERNATIVES_BOOT)
+		return;
+
+	if (!riscv_isa_extension_available(NULL, ZICBOM))
+		return;
+
+	if (archid != 0x804a555049544552 || impid != 0x100)
+		return;
+
+	riscv_noncoherent_supported();
+	riscv_noncoherent_register_cache_ops(&picoheart_errata_cmo_ops);
+	static_branch_enable(&has_picoheart_cbo_clean_errata);
+}
+
 static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
 				  unsigned long impid)
 {
+	picoheart_errata_probe_cbo_clean(stage, archid, impid);
 	return 0;
 }
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 6fdb445c0f45..89216702814e 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -154,6 +154,29 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
 
-#endif /* __ASSEMBLER__ */
+#ifdef CONFIG_ERRATA_PICOHEART_CBO_CLEAN
+
+#include <linux/jump_label.h>
+
+DECLARE_STATIC_KEY_FALSE(has_picoheart_cbo_clean_errata);
+
+static inline bool riscv_has_picoheart_zicbom_errata(void)
+{
+	return static_branch_unlikely(&has_picoheart_cbo_clean_errata);
+}
+
+bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs);
+
+#else /* !CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
+
+static inline bool riscv_has_picoheart_zicbom_errata(void) { return false; }
+static inline bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
+{
+	return false;
+}
+
+#endif /* CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
+
+#endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..6ceb27085406 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1280,6 +1280,9 @@ void __init riscv_user_isa_enable(void)
 	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOP) &&
 	    any_cpu_has_zicbop)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_picoheart_zicbom_errata())
+		current->thread.envcfg &= ~ENVCFG_CBCFE;
 }
 
 void riscv_clear_hypervisor_csr(void)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..a103203622ff 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -176,6 +176,10 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 		local_irq_enable();
 
 		handled = riscv_v_first_use_handler(regs);
+
+		if (!handled && riscv_has_picoheart_zicbom_errata())
+			handled = riscv_picoheart_illegal_insn_handler(regs);
+
 		if (!handled)
 			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 				      "Oops - illegal instruction");
-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
