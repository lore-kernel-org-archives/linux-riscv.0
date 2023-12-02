Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD98C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mY4JqDkXBau0fPFe7Ed7EgyHE/T8CWJzVUJtTK114i4=; b=oadmtqsB/br+Dw
	l/OURSx2uV/pjI5XraBz7ZtJw6WUILbsaY9BRiKbCIQKsnAf9pJuqMxJzf2AEyD/ZnOgAdYQ61TLU
	e/Cs5tM8ZRfVnm4ZMwBpWkC366nL5NrGQFuEDWof3Dp7pJgm/JGcXl7KHvwQs8Ee8f8pPxxCD8FHs
	h65gFQhPa1lG0cBAm8+MBezdK89s4V+Pg6J+KpBXL3+hBrp8K2y2LCpISiS9fAE8I7OTn+udI99Bw
	ko9FYZK1iAFWBFsSGhvMxcYn73HzFAldXV5fO7v513KUZMRNjpRdM3mlco4xcCunwUk3Vwb2XA+na
	b89JmQPpGxAwSut3g8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OD4-00FbMM-0V;
	Sat, 02 Dec 2023 11:30:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OD1-00FbJM-01
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 11:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E610CE1043;
	Sat,  2 Dec 2023 11:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2535CC433C8;
	Sat,  2 Dec 2023 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701516651;
	bh=rkDS2IBecDt7J2zRqqr6JaMkgcMoWUiIilFCMd6Llus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xo3h81o4SOsZgewKhvmyTV2Zj/40rxCtOTKddVTpzg9zF4/Zku7mMHWIVqXSWCEgP
	 +CyMJUIOpiyAXr2eCnqWjwvW8NjryddrvUd9dAEaJnwZUnVY2HuXQlKbTd3m5Wuh5n
	 JLBwI9Igz0Cp4Z+U/6VRIBtBHbjOjPHpjutDYrwtiK7HRph7m3hKHJVFpIqTWtEl98
	 W1S70016s/KgRfcks+hGjryvJ/4E3M0XAxaw06bxPNUQqkdy/3RBtVBYQihtJRnjkt
	 hv5RK8JonV/Y6+JHEj2TciJIR+SmaISmeA/v3fkDGvr8auJULIl9sRA9CRsssfsYJN
	 7d/TDDXAgxBYg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
Date: Sat,  2 Dec 2023 19:18:22 +0800
Message-Id: <20231202111822.3569-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231202111822.3569-1-jszhang@kernel.org>
References: <20231202111822.3569-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_033055_517879_FBCACA90 
X-CRM114-Status: GOOD (  16.69  )
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

DCACHE_WORD_ACCESS uses the word-at-a-time API for optimised string
comparisons in the vfs layer.

This patch implements support for load_unaligned_zeropad in much the
same way as has been done for arm64.

Here is the test program and step:

 $ cat tt.c
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>

 #define ITERATIONS 1000000

 #define PATH "123456781234567812345678123456781"

 int main(void)
 {
         unsigned long i;
         struct stat buf;

         for (i = 0; i < ITERATIONS; i++)
                 stat(PATH, &buf);

         return 0;
 }

 $ gcc -O2 tt.c
 $ touch 123456781234567812345678123456781
 $ time ./a.out

Per my test on T-HEAD C910 platforms, the above test performance is
improved by about 7.5%.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig                      |  1 +
 arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
 arch/riscv/include/asm/word-at-a-time.h | 23 ++++++++++++++++++
 arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0a76209e9b02..bb366eb1870e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -657,6 +657,7 @@ config RISCV_MISALIGNED
 config RISCV_EFFICIENT_UNALIGNED_ACCESS
 	bool "Use unaligned access for some functions"
 	depends on NONPORTABLE
+	select DCACHE_WORD_ACCESS if MMU
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	default n
 	help
diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 00a96e7a9664..0c8bfd54fc4e 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -6,6 +6,7 @@
 #define EX_TYPE_FIXUP			1
 #define EX_TYPE_BPF			2
 #define EX_TYPE_UACCESS_ERR_ZERO	3
+#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
 
 #ifdef CONFIG_MMU
 
@@ -47,6 +48,11 @@
 #define EX_DATA_REG_ZERO_SHIFT	5
 #define EX_DATA_REG_ZERO	GENMASK(9, 5)
 
+#define EX_DATA_REG_DATA_SHIFT	0
+#define EX_DATA_REG_DATA	GENMASK(4, 0)
+#define EX_DATA_REG_ADDR_SHIFT	5
+#define EX_DATA_REG_ADDR	GENMASK(9, 5)
+
 #define EX_DATA_REG(reg, gpr)						\
 	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
 
@@ -62,6 +68,15 @@
 #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
 	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)
 
+#define _ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD(insn, fixup, data, addr)		\
+	__DEFINE_ASM_GPR_NUMS							\
+	__ASM_EXTABLE_RAW(#insn, #fixup,					\
+			  __stringify(EX_TYPE_LOAD_UNALIGNED_ZEROPAD),		\
+			  "("							\
+			    EX_DATA_REG(DATA, data) " | "			\
+			    EX_DATA_REG(ADDR, addr)				\
+			  ")")
+
 #endif /* __ASSEMBLY__ */
 
 #else /* CONFIG_MMU */
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 7c086ac6ecd4..5a3865ac3623 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -9,6 +9,7 @@
 #define _ASM_RISCV_WORD_AT_A_TIME_H
 
 
+#include <asm/asm-extable.h>
 #include <linux/kernel.h>
 
 struct word_at_a_time {
@@ -45,4 +46,26 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+/*
+ * Load an unaligned word from kernel space.
+ *
+ * In the (very unlikely) case of the word being a page-crosser
+ * and the next page not being mapped, take the exception and
+ * return zeroes in the non-existing part.
+ */
+static inline unsigned long load_unaligned_zeropad(const void *addr)
+{
+	unsigned long ret;
+
+	/* Load word from unaligned pointer addr */
+	asm(
+	"1:	" REG_L " %0, %2\n"
+	"2:\n"
+	_ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD(1b, 2b, %0, %1)
+	: "=&r" (ret)
+	: "r" (addr), "m" (*(unsigned long *)addr));
+
+	return ret;
+}
+
 #endif /* _ASM_RISCV_WORD_AT_A_TIME_H */
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index 35484d830fd6..dd1530af3ef1 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -27,6 +27,14 @@ static bool ex_handler_fixup(const struct exception_table_entry *ex,
 	return true;
 }
 
+static inline unsigned long regs_get_gpr(struct pt_regs *regs, unsigned int offset)
+{
+	if (unlikely(!offset || offset > MAX_REG_OFFSET))
+		return 0;
+
+	return *(unsigned long *)((unsigned long)regs + offset);
+}
+
 static inline void regs_set_gpr(struct pt_regs *regs, unsigned int offset,
 				unsigned long val)
 {
@@ -50,6 +58,27 @@ static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
 	return true;
 }
 
+static bool
+ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
+				  struct pt_regs *regs)
+{
+	int reg_data = FIELD_GET(EX_DATA_REG_DATA, ex->data);
+	int reg_addr = FIELD_GET(EX_DATA_REG_ADDR, ex->data);
+	unsigned long data, addr, offset;
+
+	addr = regs_get_gpr(regs, reg_addr * sizeof(unsigned long));
+
+	offset = addr & 0x7UL;
+	addr &= ~0x7UL;
+
+	data = *(unsigned long *)addr >> (offset * 8);
+
+	regs_set_gpr(regs, reg_data * sizeof(unsigned long), data);
+
+	regs->epc = get_ex_fixup(ex);
+	return true;
+}
+
 bool fixup_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *ex;
@@ -65,6 +94,8 @@ bool fixup_exception(struct pt_regs *regs)
 		return ex_handler_bpf(ex, regs);
 	case EX_TYPE_UACCESS_ERR_ZERO:
 		return ex_handler_uaccess_err_zero(ex, regs);
+	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
+		return ex_handler_load_unaligned_zeropad(ex, regs);
 	}
 
 	BUG();
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
