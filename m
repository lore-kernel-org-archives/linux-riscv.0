Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E24EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1vk3BotdfhMcGOOHD8ZnxqUGqSiDtJ6rCzaoUuV/UQ=; b=gEbkMfxrqXrhrV
	Y4anA7iv6QwNnl9zHZp37YD3WCz34N3nVdb4LhgnniYGk5AuKERNnzA8ETuaojtOUVDaqcKaqX500
	A9TM6O+J7xxNPMLHh596CVxaQudDrSrkoQY0CmLbj6L7E8EHE/8Ia+uOdPpHKCGkx6lz0/w0W20/V
	T4BvGkbTSqHQuEf8Pm459oR34hRbYrlE0NNwryLL3g6tgAYmUDLXCdfBaGBwtscOyZBMd7TBSuXR+
	MqIlVMkzgPzfQ81BFTVk0sjYeBKYIpIWJ1/dULvotNJSqWrZE8yrXUJrBrl25WDBQj56IyWuE2bzX
	xL7TQTHubZmPgDV1Njyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvo-00GZGk-UI; Mon, 09 May 2022 22:32:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvd-00GZ7f-Oy
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:37 +0000
Received: by mail-pf1-x42e.google.com with SMTP id i24so13414970pfa.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=2MXHg1nHEtz4YJcqPiDeGeD1CCu8R+98LObcjAIALKk=;
 b=SJNyDksBDfIy/xljFU8N94+9xDStduZbfk4JRmLuZrEJTnw4pR6x4tyOHaQX9b58/4
 9gRdGJsoxHnnj5fhHBGLz4Ue5weaPnH1WfHru2lYGS2C7lkigvlGQvhbc+Im+y9IGfMI
 9Oi8B2OBK/KLbFctypQdxCNxtMMYcL06SeUAQUgKm6AEblKLByUQd+iI8j8r4hg+7frq
 TZfHEcdlPH2DTYQz04dU+Lj/tt2JOEIwqRE4pt6YLIOZNGwgOb0AZSDv90KM+5WaIvOG
 fdEyTwI74cuLZZaGNxtOe3XJIDxtge7EeO9OyGQrM/YPvrcN3pNdLKenYoxn3lsj5UZk
 uFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=2MXHg1nHEtz4YJcqPiDeGeD1CCu8R+98LObcjAIALKk=;
 b=QMxrkBV2QF8QTBu8SzUoohXbYYLdyREvZSTNKNzNfImkHaZz/L+LIGVGdQng/grWtx
 nCVZreH8x/1HXqyDTELQINfwoFH3N2b9EbV0HNf+dg9r2fiDxT6VA7uEBRFMqVgHhpDE
 ByNFUVVJf27i2Mnbi5I3gJc5fjXQglYpH6quAugckXOJuSK5hkgSm68HwiEsD3tNYPoE
 QF4RiQFbQtfEJILeSRKMl2NzevR1ApjRchorHmFZ8dhAcLcRuU8xoGNKBj+w1hAIWm7C
 8W8s54ElnHZjusBxorfRSGU+dKiWumriJtd/eWLqKq8lWXRNd9XVCchOazwMG63BHGXE
 CNHw==
X-Gm-Message-State: AOAM530DkMS2hEsJ841K9soO759m76gn07X4HUd7FgaThACpm1fFh2Qg
 wuZs1ffmixTF4LPPJnXEsDNxQA==
X-Google-Smtp-Source: ABdhPJyFc9YI7DdX/uV+BDVfSMLOd/pBGy6EZDj4wH/qE+g163tG1PYUrufgfLqUrsRlHs4sY7lu5w==
X-Received: by 2002:a62:b60f:0:b0:508:2a61:2c8b with SMTP id
 j15-20020a62b60f000000b005082a612c8bmr17904643pff.2.1652135550618; 
 Mon, 09 May 2022 15:32:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 d2-20020a170902f14200b0015e8d4eb204sm398533plb.78.2022.05.09.15.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:30 -0700 (PDT)
Subject: [PATCH v5 6/7] RISC-V: Move to queued RW locks
Date: Mon,  9 May 2022 15:29:55 -0700
Message-Id: <20220509222956.2886-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509222956.2886-1-palmer@rivosinc.com>
References: <20220509222956.2886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org,         linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153233_850628_B3FF2A3C 
X-CRM114-Status: GOOD (  14.78  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Now that we have fair spinlocks we can use the generic queued rwlocks,
so we might as well do so.

Reviewed-by: Arnd Bergmann <arnd@arndb.de
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig                      |  1 +
 arch/riscv/include/asm/Kbuild           |  2 +
 arch/riscv/include/asm/spinlock.h       | 99 -------------------------
 arch/riscv/include/asm/spinlock_types.h | 24 ------
 4 files changed, 3 insertions(+), 123 deletions(-)
 delete mode 100644 arch/riscv/include/asm/spinlock.h
 delete mode 100644 arch/riscv/include/asm/spinlock_types.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..f8a55d94016d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -39,6 +39,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_USE_MEMTEST
+	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index c3f229ae8033..504f8b7e72d4 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -3,6 +3,8 @@ generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += parport.h
+generic-y += spinlock.h
+generic-y += spinlock_types.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
 generic-y += user.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
deleted file mode 100644
index 88a4d5d0d98a..000000000000
--- a/arch/riscv/include/asm/spinlock.h
+++ /dev/null
@@ -1,99 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2015 Regents of the University of California
- * Copyright (C) 2017 SiFive
- */
-
-#ifndef _ASM_RISCV_SPINLOCK_H
-#define _ASM_RISCV_SPINLOCK_H
-
-/* This is horible, but the whole file is going away in the next commit. */
-#define __ASM_GENERIC_QRWLOCK_H
-
-#include <linux/kernel.h>
-#include <asm/current.h>
-#include <asm/fence.h>
-#include <asm-generic/spinlock.h>
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
-
-#endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
deleted file mode 100644
index f2f9b5d7120d..000000000000
--- a/arch/riscv/include/asm/spinlock_types.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2015 Regents of the University of California
- */
-
-#ifndef _ASM_RISCV_SPINLOCK_TYPES_H
-#define _ASM_RISCV_SPINLOCK_TYPES_H
-
-/* This is horible, but the whole file is going away in the next commit. */
-#define __ASM_GENERIC_QRWLOCK_TYPES_H
-
-#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
-# error "please don't include this file directly"
-#endif
-
-#include <asm-generic/spinlock_types.h>
-
-typedef struct {
-	volatile unsigned int lock;
-} arch_rwlock_t;
-
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
-
-#endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
