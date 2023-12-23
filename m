Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E241AC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCWudRGH0vC21pe4is/ya6+lZ6UaJT4Ry2WUMrz1Z9E=; b=tdIhAfiF3is+9S
	7yDUf4F4J2EGiaLYTB+xIsCmYqvRZ3y25mU8lhWHSiRWP5DUeR4h7C13gdP5lksyBbN8tuldSuvsE
	PJqTSup9Zlea1z5JKjI+z23Ir0U/dR45JqasWFNyOLpEstpvdaOUm0HrqjrtGZrTuqc5Ufug08ZBx
	q9TSQMB5L5KB7WK7oZJL9ygAQzzNOOJeyRxBmUuqdNZiFq8ltyK9h1fLOJ6GvyICjYeLU6AZVdaAG
	GC4knCYOnlE5reKBWBZs1v+V2wtqDnDP3XgfKW4LU6f/FwW6xkWUYWQk/ILEqqqDPWJXGvLyPuatJ
	53ynubO9iCGfwqpL3KUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH4V5-0088S4-1z;
	Sat, 23 Dec 2023 16:05:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH4V0-0088Qd-1y
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 16:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 53A4DB801BF;
	Sat, 23 Dec 2023 16:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00A5C433CD;
	Sat, 23 Dec 2023 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703347512;
	bh=v6WGCTMiMOCTlpt4SkvLg03xjdq5zQMjhktOr8ueBgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UO+6uySzueLe3eDdS9Quk61zCkY7sorf45mCzxqWKL9Eh2d49xqiE6ftJ11ZKKPWO
	 lblt+nBlAQ6rmJ/gbTba+Un/KKX5iJ+lpvxRjpupaiFI3VsG8pB0Ig/gCqVdPKA4zJ
	 BAPGT+5Xwlxy0nXtW882nZ6p3P+aJ4qpA69T1gyPXInakkVgrXhy+lpxi8ErdfIJPZ
	 6y7GGgQqH8FOKqZ6ZNi3D+CiULUULMdOxFIRChDD+IeLfLd0X8ldKHXpOF7mQI02EL
	 5JMO6SElA7uGNbfiDY4MbOICSI4VSs1Vhc2lnXoHw/Vb1+aRDXRKNBj+i+mATFHpq/
	 xNcDB3PzXVJmw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingfang DENG <dqfext@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 2/2] riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
Date: Sat, 23 Dec 2023 23:52:26 +0800
Message-Id: <20231223155226.4050-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231223155226.4050-1-jszhang@kernel.org>
References: <20231223155226.4050-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_080514_929118_47723955 
X-CRM114-Status: GOOD (  16.31  )
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
 arch/riscv/include/asm/word-at-a-time.h | 27 +++++++++++++++++++++
 arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b91094ea53b7..52e45760863c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -654,6 +654,7 @@ config RISCV_MISALIGNED
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
index 7c086ac6ecd4..f3f031e34191 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -9,6 +9,7 @@
 #define _ASM_RISCV_WORD_AT_A_TIME_H
 
 
+#include <asm/asm-extable.h>
 #include <linux/kernel.h>
 
 struct word_at_a_time {
@@ -45,4 +46,30 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+
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
+#endif	/* CONFIG_DCACHE_WORD_ACCESS */
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
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
