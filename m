Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F8CCF2C7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:From:To:
	Mime-Version:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YRFjwbZB+C/ksL5qvx48qsg7s7I7uCGYQazX928qVs=; b=qOYZKhvvHLjkcp
	dMda04uh19DTrBIf7nbQILL7c4MOQVzL+71dkE3oXGj9BW43FkroHnbpaj/KIrvVA5XgBrTGKyw7b
	Tn8f+rZv9lFHgobIrdQK5tX4i1Zqjd+g20LsDxIYD8OEJJiEDAyygSN7WrEOvMJlZVVR9dp6cpU2F
	zsSVqU1I2udF4xYDiivgPb0yGeZSGJ6Mbfs4cfCu8VwSUBX8uXHG7hc8b+895LJjg3ACfnEGfZPcC
	sjyLdDdMRSInItHbna/AhjomvYGIn1fKmHKuDoFU5DxUbnWQFRi/RfTpvfHsxykO/go87UYQNpbsw
	jsikr+Q1zFQbWNXepABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp9-00000004ZgN-3TOY;
	Sat, 17 Oct 2026 08:31:27 +0000
Received: from va-2-40.ptr.blmpb.com ([209.127.231.40])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp2-00000004Zdk-0OIv
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 08:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792225875; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ilE12jP0+KaoSI9LqyY1FHkzV0ffbv1WVdV0yvjcamc=;
 b=VG7H+9Nri5MKOGsYKJ32P2fP2inpxVi6zzeyEp076osLdtP8SJbhNPc1RLs5HSMvMHjDcn
 KHnrTx3ZTK0wZtjxydAb7u9sCixREZ/hB/GC3f77BjECXD5FKSXeC4Obg4fFNEQYtjM6k8
 Jzxl773PDW52ClLQVpVKx7ywhxqEHhyMv37Y1RP+IXfjy0R6rQS0yxYzre73lnMeYiLu+v
 U5GPOsvyHs0V4yiZHZUI4DWAgjsAsGoE/9nd0ldoVJ0QvsF5mTBDQlHNgetq6ldrx3TblY
 eugYk/ub5mAJsMtXldfgz2Jtfc+HezxaYZUJk+WYPCfD5/R964cWhQK13CrZAg==
Date: Sat, 17 Oct 2026 16:30:59 +0800
Message-Id: <20261017083100.40157-5-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 16:31:12 +0800
X-Mailer: git-send-email 2.54.0
Subject: [PATCH v5 4/5] riscv: errata: picoheart: Add workaround for cbo.clean errata
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad33251+9500aa+lists.infradead.org+yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
In-Reply-To: <20261017083100.40157-1-yang.yicong@picoheart.com>
References: <20261017083100.40157-1-yang.yicong@picoheart.com>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_013120_436609_D7E4B48A 
X-CRM114-Status: GOOD (  19.47  )
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

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/Kconfig.errata            |  13 +++
 arch/riscv/errata/picoheart/errata.c | 159 +++++++++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h |  25 ++++-
 arch/riscv/kernel/cpufeature.c       |   3 +
 arch/riscv/kernel/traps.c            |   4 +
 5 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index d532f0d4e426..76b2301e87e3 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -179,4 +179,17 @@ config ERRATA_PICOHEART
 
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
index 6694b5ccdcf8..7e31acae4e0a 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -117,6 +117,29 @@ asm volatile(ALTERNATIVE(						\
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
index 7329792978cc..51c19e210ed1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1231,6 +1231,9 @@ void __init riscv_user_isa_enable(void)
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
