Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74D2C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54MccLY5pBcOKThuH8dVoPZ0aL/BB5TsKr0D2J7YVcI=; b=EqazOUxCpsLxwc
	zXi7CkXrHNrtou3A+cTSBe6EEs7imEykS+FWMp2TXi0YuOEVQ1l9o/GIYHectwEv1JiDhXQsEqVrK
	sCr56/wYzKHrrbPqHFVLQ0b/Vb5jtW04pBaqs6aBIIP0QvBFxIOr6BBM7Gm4lWDo8ufrMbp/OehNU
	x3mCvx4tcIeOuTdMX5MLvzNF9xy+EG34uw5hULaZ8BV8ynunXZOQe0p/ojF6y71O+Ivr95GrFqFtC
	TNBhMPrT/MwesRdamJ4k82s/HsRvzgjln+h/yAKkRKkDiTp/Lgv95aKwloZxj6Apl4cyi/9wl4l/1
	I0ZmckE5ZCaVqaNiIgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBbhL-00Fk8S-1i;
	Fri, 08 Dec 2023 14:19:23 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBbhH-00Fk7E-0f
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 14:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/lBnAPLXd3bmIiEmokYvLT/eas4j7AzPy7ap5uVAF/8=; b=EKHweu9EyyqV4AJrNpxLR7vMJM
	pgV19pa8l1FfLAzDsVJfDNmO3Rz8kk7DBEXCKI78NqSa3PAkxrj7662ZAFogRsJo1oHHdxwa5GTN1
	niJFkZIeMCSauQO+xkgULLagCkRv4VQhfM0z++zpFtK+l5hXXhr1YYUHeovZndJyj0xLbRVicfE4Y
	6j5Kbm8/lBIUytrBbFRihoeem4Br04wF745GptMq6tAQlOZcWdULkiHdbCWgyRuyHVDQnRi8U7+aB
	Lr9XdyT7rsYiqdiocsJDplTKebTucJmA0DAgjffs5gH2/kFQl/6ZzYUh06UZxrzDMnPRR4LDSY+wC
	PxpvDsUw==;
Received: from [167.98.27.226] (helo=ct-lt-2504.office.codethink.co.uk)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1rBbh4-00DTLb-QI; Fri, 08 Dec 2023 14:19:07 +0000
From: Ivan Orlov <ivan.orlov@codethink.co.uk>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: Ivan Orlov <ivan.orlov@codethink.co.uk>,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	bjorn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: lib: Implement optimized memchr function
Date: Fri,  8 Dec 2023 14:18:39 +0000
Message-Id: <20231208141839.174284-1-ivan.orlov@codethink.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_061919_502812_BEACC27A 
X-CRM114-Status: GOOD (  23.89  )
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

At the moment we don't have an architecture-specific memchr
implementation for riscv in the Kernel. The generic version of this
function iterates the memory area bytewise looking for the target value,
which is not the optimal approach.

Instead of iterating the memory byte by byte, we can iterate over words
of memory. Word still takes only one cycle to be loaded, and it could be
checked for containing the target byte in just 5 operations:

1. Let's say we are looking for the byte BA. XOR the word with
0xBABA..BA
2. If we have zero byte in the result, the word contains byte BA. Let's
subtract 0x0101..01 from the xor result.
3. Calculate the ~(xor result).
4. And the results of steps 2 and 3. If in the xor result we had a zero
bit somewhere, and after subtracting the 0x0101..01 it turned to 1,
we will get 1 in the result
5. And the result of step 4 with 0x8080..80. If we had a leading zero
bit in the xor result which turned to 1 after subtracting 0x0101..01,
it was the leading bit of a zero byte. So, if result of this step != 0,
the word contains the byte we are looking for.

The same approach is used in the arm64 implementation of this function.

So, this patch introduces the riscv-specific memchr function which
accepts 3 parameters (address, target byte and count) and works in the
following way:

0. If count is smaller than 128, iterate the area byte by byte as we
would not get any performance gain here.
1. If address is not aligned, iterate SZREG - (address % SZREG) bytes
to avoid unaligned memory access.
2. If count is larger than 128, iterate words of memory until we find
the word which contains the target byte.
3. If we have found the word, iterate through it byte by byte and return
the address of the first occurrence.
4. If we have not found the word, iterate the remainder (in case if
the count was not divisible by 8).
5. If we still have not found the target byte, return 0.

Here you can see the benchmark results for "Sifive Hifive Unmatched"
board, which compares the old and new memchr implementations.

| test_count | array_size | old_mean_ktime  | new_mean_ktime  |
---------------------------------------------------------------
|      10000 |         10 |             415 |             409 |
|      10000 |        100 |             642 |             717 |
|      10000 |        128 |             714 |             775 |
|      10000 |        256 |            1031 |             611 |
|       5000 |        512 |            1686 |             769 |
|       5000 |        768 |            2320 |             925 |
|       5000 |       1024 |            2968 |            1095 |
|       5000 |       1500 |            4165 |            1383 |
|       5000 |       2048 |            5567 |            1731 |
|       3000 |       4096 |           10698 |            3028 |
|       3000 |      16384 |           41630 |           10766 |
|       1000 |     524288 |         1475454 |          498183 |
|       1000 |    1048576 |         2952080 |          997018 |
|        500 |   10485760 |        49491492 |        29335358 |
|        100 |  134217728 |       636033660 |       377157970 |
|         20 |  536870912 |      2546979300 |      1510817350 |
|         20 | 1073741824 |      5095776750 |      3019167250 |

The target symbol was always placed at the last index of the array, and
the mean time of function execution was measured using the ktime_get
function.

As you can see, the new function shows much better results even for
the small arrays of 256 elements, therefore I believe it could be a
useful addition to the existing riscv-specific string functions.

Signed-off-by: Ivan Orlov <ivan.orlov@codethink.co.uk>
---
 arch/riscv/include/asm/string.h |  2 +
 arch/riscv/kernel/riscv_ksyms.c |  1 +
 arch/riscv/lib/Makefile         |  1 +
 arch/riscv/lib/memchr.S         | 98 +++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 arch/riscv/lib/memchr.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index a96b1fea24fe..ec1a643cb625 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,8 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+#define __HAVE_ARCH_MEMCHR
+extern asmlinkage void *memchr(const void *, int, size_t);
 
 #define __HAVE_ARCH_STRCMP
 extern asmlinkage int strcmp(const char *cs, const char *ct);
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index a72879b4249a..08c0d846366b 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -9,6 +9,7 @@
 /*
  * Assembly functions that may be used (directly or indirectly) by modules
  */
+EXPORT_SYMBOL(memchr);
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memmove);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 26cb2502ecf8..0a8b64f8ca88 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+lib-y			+= memchr.o
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
diff --git a/arch/riscv/lib/memchr.S b/arch/riscv/lib/memchr.S
new file mode 100644
index 000000000000..d48e0fa3cd84
--- /dev/null
+++ b/arch/riscv/lib/memchr.S
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Codethink Ltd.
+ * Author: Ivan Orlov <ivan.orlov@codethink.co.uk>
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+#define REP_01 __REG_SEL(0x0101010101010101, 0x01010101)
+#define REP_80 __REG_SEL(0x8080808080808080, 0x80808080)
+
+#define MIN_BORDER 128
+
+SYM_FUNC_START(memchr)
+	andi a1, a1, 0xFF
+
+	// use byte-wide iteration for small numbers
+	add t1, x0, a2
+	sltiu t2, a2, MIN_BORDER
+	bnez t2, 6f
+
+	// get the number of bytes we should iterate before alignment
+	andi t0, a0, SZREG - 1
+	beqz t0, 4f
+
+	# get the SZREG - t0
+	xor t0, t0, SZREG - 1
+	addi t0, t0, 1
+
+	sub a2, a2, t0
+	// iterate before alignment
+1:
+	beq t0, x0, 4f
+	lbu t2, 0(a0)
+	beq t2, a1, 3f
+	addi t0, t0, -1
+	addi a0, a0, 1
+	j 1b
+
+2:
+	// found a word. Iterate it until we find the target byte
+	li t1, SZREG
+	j 6f
+3:
+	ret
+
+4:
+	// get the count remainder
+	andi t1, a2, SZREG - 1
+
+	// align the count
+	sub a2, a2, t1
+
+	// if we have no words to iterate, iterate the remainder
+	beqz a2, 6f
+
+	// from 0xBA we will get 0xBABABABABABABABA
+	li t3, REP_01
+	mul t3, t3, a1
+
+	add a2, a2, a0
+
+	li t4, REP_01
+	li t5, REP_80
+
+5:
+	REG_L t2, 0(a0)
+
+	// after this xor we will get one zero byte in the word if it contains the target byte
+	xor t2, t2, t3
+
+	// word v contains the target byte if (v - 0x01010101) & (~v) & 0x80808080 is positive
+	sub t0, t2, t4
+
+	not t2, t2
+
+	and t0, t0, t2
+	and t0, t0, t5
+
+	bnez t0, 2b
+	addi a0, a0, SZREG
+	bne a0, a2, 5b
+
+6:
+	// iterate the remainder
+	beq t1, x0, 7f
+	lbu t4, 0(a0)
+	beq t4, a1, 3b
+	addi a0, a0, 1
+	addi t1, t1, -1
+	j 6b
+
+7:
+	addi a0, x0, 0
+	ret
+SYM_FUNC_END(memchr)
+SYM_FUNC_ALIAS(__pi_memchr, memchr)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
