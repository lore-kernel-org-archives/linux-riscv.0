Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EEBC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D69820855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lURIOvpT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="SjptrIGd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D69820855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=33A0LJRNzJpdTCQPgL8IwBR0efgJRlTMXZZ0+C3LkVU=; b=lURIOvpTW6qol14K8oANuYccx6
	axBOvm8pvOqAmLntAjsbAP4xG36CQPNXdtNJLVhTtLvcei7OLEhKJrfjhgn90rnRe3nNPgkOS/iqU
	xJ+HSg5ShIg1ecAdl0BRMxX2KWHwjqwJ1wVu3g91jXI+u7KNgvO+Vn8HS4JAV+Tn2bLxagqKI7Qld
	kUGb5vy5zJtNd1R/z4gBIQ1c2lYHEg63vmFdkM28xncp2z0gypSN48Bl8SrCHCRi9GEoEj2/6QSHu
	yKskEqM2v8MfmkVcVyDjsBhpc+AQjtpzB3od4GJkxQFmjneDsdlPjzAG8Nat99G5tpaJcTDFnvC9i
	rEo1wYrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt3Mt-00015k-IX; Mon, 11 Feb 2019 04:38:55 +0000
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt3Mp-00014L-PB
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 04:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1549859929; bh=42AwbyZQ7UMoJqmpMN7V2Y/mPLvna3WTQN3T/DlFiDE=;
 h=From:To:Subject:Date:Message-Id;
 b=SjptrIGdGXQKWBZyEXXz+1Xtda7LhmSvbdLss2q6E1yisNsIixOD8G63i5E7YyPXV
 8lz5VYPZUfbQ26U+NZzDyiyJ0DGTqEJonf4eE188O3/GXTdY3vOVBiOBAIH2oViRMM
 5Py8QiL75xmkJu1H1A3rvXdDLL+/G7Bp/srbNvniartS9lBpj+7JiVlC1s/ZTuWW6N
 J8GI8TFTQGdTAvj27VbmnAMiOPFM1vTL7mTp8ohlncARXjcaNB8EDmR5IDw6bnJNvm
 yO4E2r6vrYOZmMWD4nkGFnESPst1h12saogf0FhE0k0rZgEAh2hD96CQM9EleIdWQS
 4GUjiyooUcQhw==
Received: from localhost.localdomain (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 20B85D200E4;
 Mon, 11 Feb 2019 04:38:47 +0000 (UTC)
From: Michael Clark <michaeljclark@mac.com>
To: Linux RISC-V <linux-riscv@lists.infradead.org>
Subject: [PATCH 1/3] RISC-V: implement xchg_small and cmpxchg_small for char
 and short
Date: Mon, 11 Feb 2019 17:38:27 +1300
Message-Id: <20190211043829.30096-2-michaeljclark@mac.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190211043829.30096-1-michaeljclark@mac.com>
References: <20190211043829.30096-1-michaeljclark@mac.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_203851_845991_A4849D61 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Michael Clark <michaeljclark@mac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements xchg and cmpxchg for char and short. xchg
and cmpxchg on small words are necessary to use the generic
qspinlock and qrwlock which are enabled in a subsequent patch.

The MIPS cmpxchg code is adapted into a macro template to implement
the additional three variants (relaxed|acquire|release)] supported
by the RISC-V memory model.

Cc: RISC-V Patches <patches@groups.riscv.org>
Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
Signed-off-by: Michael Clark <michaeljclark@mac.com>
---
 arch/riscv/include/asm/cmpxchg.h |  54 ++++++++++++++
 arch/riscv/kernel/Makefile       |   1 +
 arch/riscv/kernel/cmpxchg.c      | 118 +++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 arch/riscv/kernel/cmpxchg.c

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index c12833f7b6bd..64b3d36e2d6e 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -19,12 +19,34 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+extern unsigned long __xchg_relaxed_small(volatile void *ptr, unsigned long new,
+					  unsigned int size);
+extern unsigned long __xchg_acquire_small(volatile void *ptr, unsigned long new,
+					  unsigned int size);
+extern unsigned long __xchg_release_small(volatile void *ptr, unsigned long new,
+					  unsigned int size);
+extern unsigned long __xchg_small(volatile void *ptr, unsigned long new,
+				  unsigned int size);
+
+extern unsigned long __cmpxchg_relaxed_small(volatile void *ptr, unsigned long old,
+					     unsigned long new, unsigned int size);
+extern unsigned long __cmpxchg_acquire_small(volatile void *ptr, unsigned long old,
+					     unsigned long new, unsigned int size);
+extern unsigned long __cmpxchg_release_small(volatile void *ptr, unsigned long old,
+					     unsigned long new, unsigned int size);
+extern unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
+				     unsigned long new, unsigned int size);
+
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__xchg_relaxed_small(	\
+			(void*)ptr, (unsigned long)__new, size);	\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w %0, %2, %1\n"			\
@@ -58,6 +80,10 @@
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__xchg_acquire_small(	\
+			(void*)ptr, (unsigned long)__new, size);	\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w %0, %2, %1\n"			\
@@ -93,6 +119,10 @@
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__xchg_release_small(	\
+			(void*)ptr, (unsigned long)__new, size);	\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			RISCV_RELEASE_BARRIER				\
@@ -128,6 +158,10 @@
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__xchg_small(		\
+			(void*)ptr, (unsigned long)__new, size);	\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w.aqrl %0, %2, %1\n"		\
@@ -179,6 +213,11 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__cmpxchg_relaxed_small(	\
+			(void*)__ptr, (unsigned long)__old, 		\
+			(unsigned long)__new, size);			\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -223,6 +262,11 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__cmpxchg_acquire_small(	\
+			(void*)__ptr, (unsigned long)__old, 		\
+			(unsigned long)__new, size);			\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -269,6 +313,11 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__cmpxchg_release_small(	\
+			(void*)__ptr, (unsigned long)__old, 		\
+			(unsigned long)__new, size);			\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			RISCV_RELEASE_BARRIER				\
@@ -315,6 +364,11 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))__cmpxchg_small(		\
+			(void*)__ptr, (unsigned long)__old, 		\
+			(unsigned long)__new, size);			\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f13f7f276639..9f96ba34fd85 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -27,6 +27,7 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= vdso.o
 obj-y	+= cacheinfo.o
+obj-y	+= cmpxchg.o
 obj-y	+= vdso/
 
 CFLAGS_setup.o := -mcmodel=medany
diff --git a/arch/riscv/kernel/cmpxchg.c b/arch/riscv/kernel/cmpxchg.c
new file mode 100644
index 000000000000..6208d81e4461
--- /dev/null
+++ b/arch/riscv/kernel/cmpxchg.c
@@ -0,0 +1,118 @@
+/*
+ * Copyright (C) 2017 Imagination Technologies
+ * Author: Paul Burton <paul.burton@mips.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/bitops.h>
+#include <asm/cmpxchg.h>
+
+#define TEMPLATE_XCGH_SMALL(__func,__op)				\
+unsigned long __func(volatile void *ptr, unsigned long new,		\
+		     unsigned int size)					\
+{									\
+	u32 old32, new32, load32, mask;					\
+	volatile u32 *ptr32;						\
+	unsigned int shift;						\
+									\
+	/* Check that ptr is naturally aligned */			\
+	WARN_ON((unsigned long)ptr & (size - 1));			\
+									\
+	/* Mask value to the correct size. */				\
+	mask = GENMASK((size * BITS_PER_BYTE) - 1, 0);			\
+	new &= mask;							\
+									\
+	/*								\
+	 * Calculate a shift & mask that corresponds to the value	\
+	 * we wish to exchange within the naturally aligned 4 byte 	\
+	 * integer that includes it.					\
+	 */								\
+	shift = (unsigned long)ptr & 0x3;				\
+	shift *= BITS_PER_BYTE;						\
+	mask <<= shift;							\
+									\
+	/*								\
+	 * Calculate a pointer to the naturally aligned 4 byte 		\
+	 * integer that includes our byte, and load its value.		\
+	 */								\
+	ptr32 = (volatile u32 *)((unsigned long)ptr & ~0x3);		\
+	load32 = *ptr32;						\
+									\
+	do {								\
+		old32 = load32;						\
+		new32 = (load32 & ~mask) | (new << shift);		\
+		load32 = __op(ptr32, old32, new32);			\
+	} while (load32 != old32);					\
+									\
+	return (load32 & mask) >> shift;				\
+}
+
+TEMPLATE_XCGH_SMALL(__xchg_small,cmpxchg)
+TEMPLATE_XCGH_SMALL(__xchg_relaxed_small,cmpxchg_relaxed)
+TEMPLATE_XCGH_SMALL(__xchg_acquire_small,cmpxchg_acquire)
+TEMPLATE_XCGH_SMALL(__xchg_release_small,cmpxchg_release)
+
+#define TEMPLATE_CMPXCGH_SMALL(__func,__op)				\
+unsigned long __func(volatile void *ptr, unsigned long old,		\
+		     unsigned long new, unsigned int size)		\
+{									\
+	u32 old32, new32, load32, mask;					\
+	volatile u32 *ptr32;						\
+	unsigned int shift;						\
+	u32 load;							\
+									\
+	/* Check that ptr is naturally aligned */			\
+	WARN_ON((unsigned long)ptr & (size - 1));			\
+									\
+	/* Mask inputs to the correct size. */				\
+	mask = GENMASK((size * BITS_PER_BYTE) - 1, 0);			\
+	old &= mask;							\
+	new &= mask;							\
+									\
+	/*								\
+	 * Calculate a shift & mask that corresponds to the value	\
+	 * we wish to exchange within the naturally aligned 4 byte 	\
+	 * integer that includes it.					\
+	 */								\
+	shift = (unsigned long)ptr & 0x3;				\
+	shift *= BITS_PER_BYTE;						\
+	mask <<= shift;							\
+									\
+	/*								\
+	 * Calculate a pointer to the naturally aligned 4 byte 		\
+	 * integer that includes our byte, and load its value.		\
+	 */								\
+	ptr32 = (volatile u32 *)((unsigned long)ptr & ~0x3);		\
+	load32 = *ptr32;						\
+									\
+	while (true) {							\
+		/*							\
+		 * Ensure the subword we want to exchange matches 	\
+		 * the expected old value, and if not then bail.	\
+		 */							\
+		load = (load32 & mask) >> shift;			\
+		if (load != old)					\
+			return load;					\
+									\
+		/*							\
+		 * Calculate the old & new values of the naturally	\
+		 * aligned 4 byte integer including the byte we want	\
+		 * to exchange. Attempt to exchange the old value	\
+		 * for the new value, and return if we succeed.		\
+		 */							\
+		old32 = (load32 & ~mask) | (old << shift);		\
+		new32 = (load32 & ~mask) | (new << shift);		\
+		load32 = __op(ptr32, old32, new32);			\
+		if (load32 == old32)					\
+			return old;					\
+	}								\
+}
+
+TEMPLATE_CMPXCGH_SMALL(__cmpxchg_small,cmpxchg)
+TEMPLATE_CMPXCGH_SMALL(__cmpxchg_relaxed_small,cmpxchg_relaxed)
+TEMPLATE_CMPXCGH_SMALL(__cmpxchg_acquire_small,cmpxchg_acquire)
+TEMPLATE_CMPXCGH_SMALL(__cmpxchg_release_small,cmpxchg_release)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
