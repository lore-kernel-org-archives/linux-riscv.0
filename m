Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0371C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 05:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENuQHj/4zIRlWQj1V2jmYvOXqiokZSsfa4ztlTYmLEk=; b=LRbSJ2F7LJzf94
	e5wGxaGwAFiCJVnRIqDQyr5hSMuWI2elflv6DlrDBqbjReFUn/HTh2ghR2B0iBYYYTqeH/2zTDAVE
	iPs0BQD1PNXiXBljQHZuzsoASBdn4ezkPivGHQOrRrz1gzwIUITVJL5CjTv4zAoDadZMaQCjRm0gc
	A8abEeIrR7TeA0cJj4+xRGTMRO/8JYQEsTLbzyMOXiuesiW42qYQnbtVqEt/N+F0s8qM3Fh5LEf/I
	TnyqPoPFfWRBsIdQdU9MQ2tWPiGFwfBWbVX9JPK14pnkoV7UoQH9A9zF5y1kH6VN9jYKbTMQAWI15
	qBaB8UzL2ogZxzrWBxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRosa-007Lzu-Jj; Wed, 09 Mar 2022 05:28:56 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRosW-007Lyo-NB
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 05:28:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1646803728; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Subject: Cc: To: To: From: From: Sender:
 Sender; bh=+sWx87HYZMenwbTfBVtuAPFWfQM7uwVvXSo+pegWqLk=;
 b=Yzf3sepAYG6OkxL6MU1Pud2XDq/LAJtb9cI0TUbM3JPV+ZKOfTlCj7aM1l8w3w5Ygs/k/Lpe
 RAKltjPjNeNKTddCAtKtch9hPQUfqdtIh5spOLQx7yGwi0t9F6jptxnYyJ/ivXA8EMNIP5Q9
 LfKNYvD5AdN/M+Sigr9DCGgBGyU=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 62283b0fea5f8dddb586a997 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 09 Mar 2022 05:28:47 GMT
Received: from qpc.home.michaelkloos.com
 (cpe-173-88-115-50.columbus.res.rr.com [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id D8BE140176;
 Wed,  9 Mar 2022 05:28:45 +0000 (UTC)
From: "Michael T. Kloos" <michael@michaelkloos.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Michael T. Kloos" <michael@michaelkloos.com>
Subject: [PATCH] riscv: Work to remove kernel dependence on the M-extension
Date: Wed,  9 Mar 2022 00:28:42 -0500
Message-Id: <20220309052842.247031-1-michael@michaelkloos.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_212852_909921_6731965D 
X-CRM114-Status: GOOD (  25.65  )
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

Added a new config symbol RISCV_ISA_M to enable the usage of the
multiplication, division, and remainder (modulus) instructions
from the M-extension.  This configures the march build flag to
either include or omit it.

I didn't find any assembly using any of the instructions from
the M-extension.  However, the BPF JIT is a complicating factor.
Currently, it emits M-extension instructions to implement various
BPF operations.  For now, I have made HAVE_EBPF_JIT depend on
CONFIG_RISCV_ISA_M.

I have added the supplementary integer arithmetic functions in
the file "arch/riscv/lib/ext_m_supplement.c".  All the code
contained in this file is wrapped in an ifndef contingent on the
presence of CONFIG_RISCV_ISA_M.

Signed-off-by: Michael T. Kloos <michael@michaelkloos.com>
---
 arch/riscv/Kconfig                |  20 +-
 arch/riscv/Makefile               |   6 +-
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/ext_m_supplement.c | 588 ++++++++++++++++++++++++++++++
 4 files changed, 608 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/lib/ext_m_supplement.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..40e1110a405c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -83,7 +83,7 @@ config RISCV
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-	select HAVE_EBPF_JIT if MMU
+	select HAVE_EBPF_JIT if (MMU && RISCV_ISA_M)
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
@@ -323,15 +323,25 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config RISCV_ISA_M
+	bool "Emit multiplication instructions when building Linux"
+	default y
+	help
+	  Adds "M" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in multiplication, division, and
+	  remainder instructions in the Linux binary.
+
+	  If you don't know what to do here, say Y.
+
 config RISCV_ISA_C
 	bool "Emit compressed instructions when building Linux"
 	default y
 	help
-	   Adds "C" to the ISA subsets that the toolchain is allowed to emit
-	   when building Linux, which results in compressed instructions in the
-	   Linux binary.
+	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in compressed instructions in the
+	  Linux binary.
 
-	   If you don't know what to do here, say Y.
+	  If you don't know what to do here, say Y.
 
 menu "supported PMU type"
 	depends on PERF_EVENTS
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..7e24cfe51ef7 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -46,8 +46,10 @@ endif
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32i
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64i
+riscv-march-$(CONFIG_RISCV_ISA_M)	:= $(riscv-march-y)m
+riscv-march-y				:= $(riscv-march-y)a
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..965eebaaa1ce 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -5,5 +5,6 @@ lib-y			+= memset.o
 lib-y			+= memmove.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
+lib-y			+= ext_m_supplement.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/ext_m_supplement.c b/arch/riscv/lib/ext_m_supplement.c
new file mode 100644
index 000000000000..42ced0ea9fe2
--- /dev/null
+++ b/arch/riscv/lib/ext_m_supplement.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Michael T. Kloos <michael@michaelkloos.com>
+ */
+
+/*
+ * The GNU manual page here:
+ * https://gcc.gnu.org/onlinedocs/gccint/Integer-library-routines.html
+ * describes these functions in terms of signed and unsigned, int and long.
+ * However, these prototypes are wrong when the size of int and long are
+ * considered per the RISC-V ABI specification.  The RISC-V port of the GCC
+ * complier does not follow the standard of those prototypes.  This is
+ * discussed in this thread:
+ * https://github.com/riscv-collab/riscv-gcc/issues/324
+ *
+ * On the RISC-V Architecture:
+ * - __xyyysi3 always refers to  32-bit integers.
+ * - __xyyydi3 always refers to  64-bit integers.
+ * - __xyyyti3 always refers to 128-bit integers. (Only implemented for rv64)
+ *
+ * Per the RISC-V ABI specification, the C base types are:
+ * - int:       32-bits wide.
+ * - long:      XLEN-bits wide.  It matches the register width.
+ * - long long: 64-bits wide.
+ *
+ * Therefore, the correct RISC-V function prototypes are:
+ * - signed int __mulsi3(signed int a, signed int b);
+ * - signed long long __muldi3(signed long long a, signed long long b);
+ * - signed __int128 __multi3(signed __int128 a, signed __int128 b);
+ *
+ * - signed int __divsi3(signed int a, signed int b);
+ * - signed long long __divdi3(signed long long a, signed long long b);
+ * - signed __int128 __divti3(signed __int128 a, signed __int128 b);
+ *
+ * - unsigned int __udivsi3(unsigned int a, unsigned int b);
+ * - unsigned long long __udivdi3(unsigned long long a, unsigned long long b);
+ * - unsigned __int128 __udivti3(unsigned __int128 a, unsigned __int128 b);
+ *
+ * - signed int __modsi3(signed int a, signed int b);
+ * - signed long long __moddi3(signed long long a, signed long long b);
+ * - signed __int128 __modti3(signed __int128 a, signed __int128 b);
+ *
+ * - unsigned int __umodsi3(unsigned int a, unsigned int b);
+ * - unsigned long long __umoddi3(unsigned long long a, unsigned long long b);
+ * - unsigned __int128 __umodti3(unsigned __int128 a, unsigned __int128 b);
+ */
+
+/*
+ * This C code is not portable across architectures.  It is RISC-V specific.
+ */
+
+#ifndef CONFIG_RISCV_ISA_M
+
+#include <linux/export.h>
+
+signed int __mulsi3(signed int a, signed int b)
+{
+	unsigned int ua;
+	unsigned int ub;
+	unsigned int j;
+	unsigned int i;
+	signed int r;
+
+	ua = a;
+	ub = b;
+
+	j = 0;
+	for (i = 0; i < sizeof(signed int) * 8; i++) {
+		if (!ua || !ub)
+			break;
+		if (ua & 0x1)
+			j += ub;
+		ua >>= 1;
+		ub <<= 1;
+	}
+
+	r = j;
+
+	return r;
+}
+EXPORT_SYMBOL(__mulsi3);
+
+signed long long __muldi3(signed long long a, signed long long b)
+{
+	unsigned long long ua;
+	unsigned long long ub;
+	unsigned long long j;
+	unsigned int i;
+	signed long long r;
+
+	ua = a;
+	ub = b;
+
+	j = 0;
+	for (i = 0; i < sizeof(signed long long) * 8; i++) {
+		if (!ua || !ub)
+			break;
+		if (ua & 0x1)
+			j += ub;
+		ua >>= 1;
+		ub <<= 1;
+	}
+
+	r = j;
+
+	return r;
+}
+EXPORT_SYMBOL(__muldi3);
+
+#ifdef CONFIG_64BIT
+signed __int128 __multi3(signed __int128 a, signed __int128 b)
+{
+	unsigned __int128 ua;
+	unsigned __int128 ub;
+	unsigned __int128 j;
+	unsigned int i;
+	signed __int128 r;
+
+	ua = a;
+	ub = b;
+
+	j = 0;
+	for (i = 0; i < sizeof(signed __int128) * 8; i++) {
+		if (!ua || !ub)
+			break;
+		if (ua & 0x1)
+			j += ub;
+		ua >>= 1;
+		ub <<= 1;
+	}
+
+	r = j;
+
+	return r;
+}
+EXPORT_SYMBOL(__multi3);
+#endif
+
+signed int __divsi3(signed int a, signed int b)
+{
+	unsigned int ua;
+	unsigned int ub;
+	unsigned int j;
+	unsigned int i;
+	signed int r;
+
+	if (b == 0)
+		return (signed int)(-1);
+
+	ua = a;
+	ub = b;
+	if (a < 0)
+		ua = -a;
+	if (b < 0)
+		ub = -b;
+
+	j = 0;
+	i = 0;
+	while (ua >= ub) {
+		if ((signed int)ub < 0) {
+			ua -= ub;
+			j |= 1u << i;
+			break;
+		}
+		ub <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		ub >>= 1;
+		if (ua >= ub) {
+			ua -= ub;
+			j |= 1u << i;
+		}
+	}
+
+	r = j;
+	a ^= b;
+	if (a < 0)
+		r = -r;
+
+	return r;
+}
+EXPORT_SYMBOL(__divsi3);
+
+signed long long __divdi3(signed long long a, signed long long b)
+{
+	unsigned long long ua;
+	unsigned long long ub;
+	unsigned long long j;
+	unsigned int i;
+	signed long long r;
+
+	if (b == 0)
+		return (signed long long)(-1);
+
+	ua = a;
+	ub = b;
+	if (a < 0)
+		ua = -a;
+	if (b < 0)
+		ub = -b;
+
+	j = 0;
+	i = 0;
+	while (ua >= ub) {
+		if ((signed long long)ub < 0) {
+			ua -= ub;
+			j |= 1ull << i;
+			break;
+		}
+		ub <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		ub >>= 1;
+		if (ua >= ub) {
+			ua -= ub;
+			j |= 1ull << i;
+		}
+	}
+
+	r = j;
+	a ^= b;
+	if (a < 0)
+		r = -r;
+
+	return r;
+}
+EXPORT_SYMBOL(__divdi3);
+
+#ifdef CONFIG_64BIT
+signed __int128 __divti3(signed __int128 a, signed __int128 b)
+{
+	unsigned __int128 ua;
+	unsigned __int128 ub;
+	unsigned __int128 j;
+	unsigned int i;
+	signed __int128 r;
+
+	if (b == 0)
+		return (signed __int128)(-1);
+
+	ua = a;
+	ub = b;
+	if (a < 0)
+		ua = -a;
+	if (b < 0)
+		ub = -b;
+
+	j = 0;
+	i = 0;
+	while (ua >= ub) {
+		if ((signed __int128)ub < 0) {
+			ua -= ub;
+			j |= ((unsigned __int128)1) << i;
+			break;
+		}
+		ub <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		ub >>= 1;
+		if (ua >= ub) {
+			ua -= ub;
+			j |= ((unsigned __int128)1) << i;
+		}
+	}
+
+	r = j;
+	a ^= b;
+	if (a < 0)
+		r = -r;
+
+	return r;
+}
+EXPORT_SYMBOL(__divti3);
+#endif
+
+unsigned int __udivsi3(unsigned int a, unsigned int b)
+{
+	unsigned int j;
+	unsigned int i;
+
+	if (b == 0)
+		return (signed int)(-1);
+
+	j = 0;
+	i = 0;
+	while (a >= b) {
+		if ((signed int)b < 0) {
+			a -= b;
+			j |= 1u << i;
+			break;
+		}
+		b <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		b >>= 1;
+		if (a >= b) {
+			a -= b;
+			j |= 1u << i;
+		}
+	}
+
+	return j;
+}
+EXPORT_SYMBOL(__udivsi3);
+
+unsigned long long __udivdi3(unsigned long long a, unsigned long long b)
+{
+	unsigned long long j;
+	unsigned long long i;
+
+	if (b == 0)
+		return (signed long long)(-1);
+
+	j = 0;
+	i = 0;
+	while (a >= b) {
+		if ((signed long long)b < 0) {
+			a -= b;
+			j |= 1ull << i;
+			break;
+		}
+		b <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		b >>= 1;
+		if (a >= b) {
+			a -= b;
+			j |= 1ull << i;
+		}
+	}
+
+	return j;
+}
+EXPORT_SYMBOL(__udivdi3);
+
+#ifdef CONFIG_64BIT
+unsigned __int128 __udivti3(unsigned __int128 a, unsigned __int128 b)
+{
+	unsigned __int128 j;
+	unsigned __int128 i;
+
+	if (b == 0)
+		return (signed __int128)(-1);
+
+	j = 0;
+	i = 0;
+	while (a >= b) {
+		if ((signed __int128)b < 0) {
+			a -= b;
+			j |= ((unsigned __int128)1) << i;
+			break;
+		}
+		b <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		b >>= 1;
+		if (a >= b) {
+			a -= b;
+			j |= ((unsigned __int128)1) << i;
+		}
+	}
+
+	return j;
+}
+EXPORT_SYMBOL(__udivti3);
+#endif
+
+signed int __modsi3(signed int a, signed int b)
+{
+	unsigned int ua;
+	unsigned int ub;
+	unsigned int i;
+	signed int r;
+
+	if (b == 0)
+		return a;
+
+	ua = a;
+	ub = b;
+	if (a < 0)
+		ua = -a;
+	if (b < 0)
+		ub = -b;
+
+	i = 0;
+	while (ua >= ub) {
+		if ((signed int)ub < 0) {
+			ua -= ub;
+			break;
+		}
+		ub <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		ub >>= 1;
+		if (ua >= ub)
+			ua -= ub;
+	}
+
+	r = ua;
+	if (a < 0)
+		r = -r;
+
+	return r;
+}
+EXPORT_SYMBOL(__modsi3);
+
+signed long long __moddi3(signed long long a, signed long long b)
+{
+	unsigned long long ua;
+	unsigned long long ub;
+	unsigned int i;
+	signed long long r;
+
+	if (b == 0)
+		return a;
+
+	ua = a;
+	ub = b;
+	if (a < 0)
+		ua = -a;
+	if (b < 0)
+		ub = -b;
+
+	i = 0;
+	while (ua >= ub) {
+		if ((signed long long)ub < 0) {
+			ua -= ub;
+			break;
+		}
+		ub <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		ub >>= 1;
+		if (ua >= ub)
+			ua -= ub;
+	}
+
+	r = ua;
+	if (a < 0)
+		r = -r;
+
+	return r;
+}
+EXPORT_SYMBOL(__moddi3);
+
+#ifdef CONFIG_64BIT
+signed __int128 __modti3(signed __int128 a, signed __int128 b)
+{
+	unsigned __int128 ua;
+	unsigned __int128 ub;
+	unsigned int i;
+	signed __int128 r;
+
+	if (b == 0)
+		return a;
+
+	ua = a;
+	ub = b;
+	if (a < 0)
+		ua = -a;
+	if (b < 0)
+		ub = -b;
+
+	i = 0;
+	while (ua >= ub) {
+		if ((signed __int128)ub < 0) {
+			ua -= ub;
+			break;
+		}
+		ub <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		ub >>= 1;
+		if (ua >= ub)
+			ua -= ub;
+	}
+
+	r = ua;
+	if (a < 0)
+		r = -r;
+
+	return r;
+}
+EXPORT_SYMBOL(__modti3);
+#endif
+
+unsigned int __umodsi3(unsigned int a, unsigned int b)
+{
+	unsigned int i;
+
+	if (b == 0)
+		return a;
+
+	i = 0;
+	while (a >= b) {
+		if ((signed int)b < 0) {
+			a -= b;
+			break;
+		}
+		b <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		b >>= 1;
+		if (a >= b)
+			a -= b;
+	}
+
+	return a;
+}
+EXPORT_SYMBOL(__umodsi3);
+
+unsigned long long __umoddi3(unsigned long long a, unsigned long long b)
+{
+	unsigned long long i;
+
+	if (b == 0)
+		return a;
+
+	i = 0;
+	while (a >= b) {
+		if ((signed long long)b < 0) {
+			a -= b;
+			break;
+		}
+		b <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		b >>= 1;
+		if (a >= b)
+			a -= b;
+	}
+
+	return a;
+}
+EXPORT_SYMBOL(__umoddi3);
+
+#ifdef CONFIG_64BIT
+unsigned __int128 __umodti3(unsigned __int128 a, unsigned __int128 b)
+{
+	unsigned __int128 i;
+
+	if (b == 0)
+		return a;
+
+	i = 0;
+	while (a >= b) {
+		if ((signed __int128)b < 0) {
+			a -= b;
+			break;
+		}
+		b <<= 1;
+		i++;
+	}
+	while (i > 0) {
+		i--;
+		b >>= 1;
+		if (a >= b)
+			a -= b;
+	}
+
+	return a;
+}
+EXPORT_SYMBOL(__umodti3);
+#endif
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
