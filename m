Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D0EC44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:To:Cc:Message-Id
	:From:Mime-Version:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P838W0RtO/5ualY6hhY3IU1SZ+XDhoP5KE8gGB46uhA=; b=BIffcKhEop423D
	O0KEq4YyYzHbSz0iszVKejXk8auPFADzvEBuImfMI10r6v7Uy/kMCK/BcEiw/pxLfVRJSyPwT28Iy
	u3/13Q1aG2VM68wIlGwKk4SSC8XL658i2LZpmEZeT1ZkTHeNcUsa3cQROGO0QfupALVYnTNmJnoU5
	nWSnWgxoRl3VTS2QrWNcSdqpjgZjxiJTStilYlm3zjob1OEe5DMrdeXxockQryGzi5yyv6hOfmSoF
	cfYBaKDNna8I5CfHgGQ9TxlFJ5HfPbBGBu8E4mP9upFSZ3WcRQqYXUQjcyMHSOvmRSdQJxxuOv6XH
	TafhhMCqJxEp5m+Zc4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvHM-0000000ECB0-0hro;
	Wed, 15 Jul 2026 08:47:44 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvHH-0000000EC9T-3fFP
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 08:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784105255; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=XsIPKdKCwlzru9RPiujARjYYHUtQo4HGiKlZ87+s/tM=;
 b=h/wyhsEpJpMLoVsSM7ajBrcPLvj+87Ghg1z6mFliq0yPEnbDxRd3EGwF4hncps35RPGQTx
 zZrfQnj4VY1LojjfcDvmW03UtiPpnYxtpOU428e6kFm1Y/RACFhd+rCRZTyN+IEzELj4YE
 j/fOufP5SYUGKla+rgTCVnwOLmPBdaCsO6M5rARasR6+jUzHBhoTfYtNZHGhBMgESExy/k
 /gpXuYeAHwkPKjGHi3VojJMkNXT9Yb+eolwWYa1mK2R28k/u+YTSyE8Q4C0+NDD9Jebd3O
 UetMwmneFEOa1F3faua9bzW0qLiF7F9whZKwPdxtBrsXowdAtUV3adXRaGWkcw==
Subject: [PATCH v1 2/3] riscv: errata: picoheart: Add workaround for cbo.clean errata
Date: Wed, 15 Jul 2026 16:47:23 +0800
Mime-Version: 1.0
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <20260715084724.26578-3-yang.yicong@picoheart.com>
Cc: <geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<yang.yicong@picoheart.com>, <cuiyunhui@bytedance.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.112]) by smtp.feishu.cn with ESMTPS; Wed, 15 Jul 2026 16:47:31 +0800
X-Lms-Return-Path: <lba+26a574925+5920f3+lists.infradead.org+yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
In-Reply-To: <20260715084724.26578-1-yang.yicong@picoheart.com>
References: <20260715084724.26578-1-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014740_020295_E8839076 
X-CRM114-Status: GOOD (  18.65  )
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
 arch/riscv/Kconfig.errata            |  12 +++
 arch/riscv/errata/picoheart/errata.c | 144 +++++++++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h |  25 ++++-
 arch/riscv/include/asm/insn.h        |   4 +
 arch/riscv/kernel/cpufeature.c       |   3 +
 arch/riscv/kernel/traps.c            |   4 +
 6 files changed, 191 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 374d7fcf7936..8ce5c0314321 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -164,4 +164,16 @@ config ERRATA_PICOHEART
 
 	  Otherwise, please say "N" here to avoid unnecessary overhead.
 
+config ERRATA_PICOHEART_CBO_CLEAN
+	bool "Apply Picoheart cbo.clean errata"
+	depends on ERRATA_PICOHEART
+	select RISCV_NONSTANDARD_CACHE_OPS
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
index 53b690878f78..9392c1634ece 100644
--- a/arch/riscv/errata/picoheart/errata.c
+++ b/arch/riscv/errata/picoheart/errata.c
@@ -5,20 +5,164 @@
  * Author: Yicong Yang <yang.yicong@picoheart.com>
  */
 
+#include <linux/align.h>
 #include <linux/cacheflush.h>
 #include <linux/cleanup.h>
+#include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/memory.h>
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
+	if (rd != 0 || opcode != 15 || funct3 != RV_ENCODE_FUNCT3(CBO) ||
+	    (funct12 != RV_ENCODE_FUNCT12(CBO_CLEAN) &&
+	     funct12 != RV_ENCODE_FUNCT12(CBO_FLUSH)))
+		return false;
+
+	return true;
+}
+
+bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
+{
+	u32 __user *epc = (u32 __user *)regs->epc;
+	u32 insn = (u32)regs->badaddr;
+	void __user *line_addr;
+	int ret = 0;
+	u64 addr;
+	u32 rs1;
+
+	/* Do the emulation only for userspace on the sufferred platform */
+	if (!user_mode(regs) || !riscv_cpu_has_zicbom_errata())
+		return false;
+
+	if (!insn) {
+		if (__get_user(insn, epc))
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
+	do_trap(regs, SIGSEGV, SEGV_MAPERR, addr);
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
+static void picoheart_errata_cache_inv(phys_addr_t paddr, size_t size)
+{
+	void *vaddr = phys_to_virt(paddr);
+
+	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
+}
+
+static void picoheart_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	void *vaddr = phys_to_virt(paddr);
+
+	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
+}
+
+struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
+	.wback = &picoheart_errata_cache_wback,
+	.inv = &picoheart_errata_cache_inv,
+	.wback_inv = &picoheart_errata_cache_wback_inv,
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
index 6694b5ccdcf8..2b786decfa39 100644
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
+static inline bool riscv_cpu_has_zicbom_errata(void)
+{
+	return static_branch_unlikely(&has_picoheart_cbo_clean_errata);
+}
+
+bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs);
+
+#else /* !CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
+
+static inline bool riscv_cpu_has_zicbom_errata(void) { return false; }
+static inline bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
+{
+	return false;
+}
+
+#endif /* CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
+
+#endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..5b7c0e6fabbd 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -12,6 +12,7 @@
 #define RV_INSN_FUNCT3_OPOFF	12
 #define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
 #define RV_INSN_OPCODE_OPOFF	0
+#define RV_INSN_FUNCT12_MASK	GENMASK(31, 20)
 #define RV_INSN_FUNCT12_OPOFF	20
 
 #define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
@@ -171,6 +172,7 @@
 #define RVG_FUNCT3_JALR		0x0
 #define RVG_FUNCT3_BEQ		0x0
 #define RVG_FUNCT3_BNE		0x1
+#define RVG_FUNCT3_CBO		0x2
 #define RVG_FUNCT3_BLT		0x4
 #define RVG_FUNCT3_BGE		0x5
 #define RVG_FUNCT3_BLTU		0x6
@@ -186,6 +188,8 @@
 #define RVC_FUNCT4_C_EBREAK	0x9
 
 #define RVG_FUNCT12_EBREAK	0x1
+#define RVG_FUNCT12_CBO_CLEAN	0x1
+#define RVG_FUNCT12_CBO_FLUSH	0x2
 #define RVG_FUNCT12_SRET	0x102
 
 #define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1fe647e03515..11ae0f00cc82 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1208,6 +1208,9 @@ void __init riscv_user_isa_enable(void)
 	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOP) &&
 	    any_cpu_has_zicbop)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
+
+	if (riscv_cpu_has_zicbom_errata())
+		current->thread.envcfg &= ~ENVCFG_CBCFE;
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..9cd21073babc 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -177,6 +177,10 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 		local_irq_enable();
 
 		handled = riscv_v_first_use_handler(regs);
+
+		if (!handled)
+			handled = riscv_picoheart_illegal_insn_handler(regs);
+
 		if (!handled)
 			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 				      "Oops - illegal instruction");
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
