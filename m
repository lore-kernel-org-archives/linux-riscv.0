Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7EAC282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBE920855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qez9JfDj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="oIl7FnYI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBE920855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6CbOT8TBXHMCOBgnCAqRfvanZSgp7AOFc08l17P4USs=; b=Qez9JfDj5qZU0RcobhqpsI6OL2
	SfiQQUzthxjhCID4rCOarWQA/2HqvUrpCKhKiveVW2Rh4NAagO1jrCCUtIzlfQIDOOzF09NTBH7c7
	QWgFHDYE9qq8pMVMc3B539qfUhBa5XBLyVTkZHnhkU93//XJjozY+I6ZxBb5On0ZnH4JUmXGhtg7G
	iVh1AHIirxB6LXtsK9zloqYWMxNjiW337LMzxW2oC9qz2SfyEMQkgGrrGQZu76gBth95odWXmiLgs
	ska/+B7Fb+tndUKEx2rzVAIHml2t9X3hFiluPCqg0BqFK6h/XstbP205PKeFGjaH8izGCkgPu/9iA
	ogQGKoMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt3My-0001A0-SQ; Mon, 11 Feb 2019 04:39:00 +0000
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt3Mq-00014t-6W
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 04:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1549859930; bh=N3DkdQ1G/mIdtXuYHSjiYtaGROeFFDPHlUFxtBaWDdQ=;
 h=From:To:Subject:Date:Message-Id;
 b=oIl7FnYI7yya5IWqqp8eLLhHK9zBIelr7/PIs4/UzkNvBDJok2v5iCsym7YiKXqef
 7vykO2W//8nrKACptJY9r4BFvc0XkQUN+V/HXagHaAips5w8UdhdA60xQSw517qcy8
 yOXvZCKrZIkEl1v1gmR7PigsRoeBbdVJGNF3vCid9kOaOhn34WjLxOI6Td2QsTVNh9
 H+NgBPYB+M1f4rjfkKA66tSaQqLqVI1+i0v1ul6pehxYoX8l5KEYOdJuoL7XQCdmyx
 vRKDDyNIUdiIm4jGUg17fxsrMn6pWzAip0M8O/qdD5sycjdxY6yZ5/y2dU9bzDx9IS
 cKDzPk2Nd++eQ==
Received: from localhost.localdomain (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id E02E5D200E0;
 Mon, 11 Feb 2019 04:38:49 +0000 (UTC)
From: Michael Clark <michaeljclark@mac.com>
To: Linux RISC-V <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/3] RISC-V: convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
Date: Mon, 11 Feb 2019 17:38:28 +1300
Message-Id: <20190211043829.30096-3-michaeljclark@mac.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190211043829.30096-1-michaeljclark@mac.com>
References: <20190211043829.30096-1-michaeljclark@mac.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=917 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_203852_255102_969E0308 
X-CRM114-Status: GOOD (  14.47  )
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

Update the RISC-V port to use the generic qspinlock and qrwlock.

This patch requires support for xchg and cmpxchg for small words
(char and short) which are added by a previous patch.

Cc: RISC-V Patches <patches@groups.riscv.org>
Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
Signed-off-by: Michael Clark <michaeljclark@mac.com>
---
 arch/riscv/Kconfig                      |   2 +
 arch/riscv/include/asm/mcs_spinlock.h   |   7 ++
 arch/riscv/include/asm/qrwlock.h        |   8 ++
 arch/riscv/include/asm/qspinlock.h      |   8 ++
 arch/riscv/include/asm/spinlock.h       | 141 +-----------------------
 arch/riscv/include/asm/spinlock_types.h |  33 +-----
 6 files changed, 32 insertions(+), 167 deletions(-)
 create mode 100644 arch/riscv/include/asm/mcs_spinlock.h
 create mode 100644 arch/riscv/include/asm/qrwlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..ac4c9f889c61 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,6 +43,8 @@ config RISCV
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS
 
 config MMU
 	def_bool y
diff --git a/arch/riscv/include/asm/mcs_spinlock.h b/arch/riscv/include/asm/mcs_spinlock.h
new file mode 100644
index 000000000000..124dfe0a53d2
--- /dev/null
+++ b/arch/riscv/include/asm/mcs_spinlock.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_MCS_SPINLOCK_H
+#define _ASM_RISCV_MCS_SPINLOCK_H
+
+#include <asm-generic/mcs_spinlock.h>
+
+#endif /* _ASM_MCS_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/qrwlock.h b/arch/riscv/include/asm/qrwlock.h
new file mode 100644
index 000000000000..5f8a1478f207
--- /dev/null
+++ b/arch/riscv/include/asm/qrwlock.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_QRWLOCK_H
+#define _ASM_RISCV_QRWLOCK_H
+
+#include <asm-generic/qrwlock_types.h>
+#include <asm-generic/qrwlock.h>
+
+#endif /* _ASM_RISCV_QRWLOCK_H */
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
new file mode 100644
index 000000000000..0c2c1ee22b77
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_QSPINLOCK_H
+#define _ASM_RISCV_QSPINLOCK_H
+
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qspinlock.h>
+
+#endif /* _ASM_RISCV_QSPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 8eb26d1ede81..fc405eeb8163 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -1,143 +1,8 @@
-/*
- * Copyright (C) 2015 Regents of the University of California
- * Copyright (C) 2017 SiFive
- *
- *   This program is free software; you can redistribute it and/or
- *   modify it under the terms of the GNU General Public License
- *   as published by the Free Software Foundation, version 2.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU General Public License for more details.
- */
-
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _ASM_RISCV_SPINLOCK_H
 #define _ASM_RISCV_SPINLOCK_H
 
-#include <linux/kernel.h>
-#include <asm/current.h>
-#include <asm/fence.h>
-
-/*
- * Simple spin lock operations.  These provide no fairness guarantees.
- */
-
-/* FIXME: Replace this with a ticket lock, like MIPS. */
-
-#define arch_spin_is_locked(x)	(READ_ONCE((x)->lock) != 0)
-
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	smp_store_release(&lock->lock, 0);
-}
-
-static inline int arch_spin_trylock(arch_spinlock_t *lock)
-{
-	int tmp = 1, busy;
-
-	__asm__ __volatile__ (
-		"	amoswap.w %0, %2, %1\n"
-		RISCV_ACQUIRE_BARRIER
-		: "=r" (busy), "+A" (lock->lock)
-		: "r" (tmp)
-		: "memory");
-
-	return !busy;
-}
-
-static inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	while (1) {
-		if (arch_spin_is_locked(lock))
-			continue;
-
-		if (arch_spin_trylock(lock))
-			break;
-	}
-}
-
-/***********************************************************/
-
-static inline void arch_read_lock(arch_rwlock_t *lock)
-{
-	int tmp;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bltz	%1, 1b\n"
-		"	addi	%1, %1, 1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		: "+A" (lock->lock), "=&r" (tmp)
-		:: "memory");
-}
-
-static inline void arch_write_lock(arch_rwlock_t *lock)
-{
-	int tmp;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bnez	%1, 1b\n"
-		"	li	%1, -1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		: "+A" (lock->lock), "=&r" (tmp)
-		:: "memory");
-}
-
-static inline int arch_read_trylock(arch_rwlock_t *lock)
-{
-	int busy;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bltz	%1, 1f\n"
-		"	addi	%1, %1, 1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		"1:\n"
-		: "+A" (lock->lock), "=&r" (busy)
-		:: "memory");
-
-	return !busy;
-}
-
-static inline int arch_write_trylock(arch_rwlock_t *lock)
-{
-	int busy;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bnez	%1, 1f\n"
-		"	li	%1, -1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		"1:\n"
-		: "+A" (lock->lock), "=&r" (busy)
-		:: "memory");
-
-	return !busy;
-}
-
-static inline void arch_read_unlock(arch_rwlock_t *lock)
-{
-	__asm__ __volatile__(
-		RISCV_RELEASE_BARRIER
-		"	amoadd.w x0, %1, %0\n"
-		: "+A" (lock->lock)
-		: "r" (-1)
-		: "memory");
-}
-
-static inline void arch_write_unlock(arch_rwlock_t *lock)
-{
-	smp_store_release(&lock->lock, 0);
-}
+#include <asm/qrwlock.h>
+#include <asm/qspinlock.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index 83ac4ac9e2ac..fc1cbf61d746 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -1,33 +1,8 @@
-/*
- * Copyright (C) 2015 Regents of the University of California
- *
- *   This program is free software; you can redistribute it and/or
- *   modify it under the terms of the GNU General Public License
- *   as published by the Free Software Foundation, version 2.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU General Public License for more details.
- */
-
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _ASM_RISCV_SPINLOCK_TYPES_H
 #define _ASM_RISCV_SPINLOCK_TYPES_H
 
-#ifndef __LINUX_SPINLOCK_TYPES_H
-# error "please don't include this file directly"
-#endif
-
-typedef struct {
-	volatile unsigned int lock;
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
-
-typedef struct {
-	volatile unsigned int lock;
-} arch_rwlock_t;
-
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qrwlock_types.h>
 
-#endif
+#endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
