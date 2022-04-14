Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1146C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYWQEuUHs3Pukk3PHqZgC6M847ldf3cMTuhKdAy8vQY=; b=TB+MkHKiHFbtc9
	AKS1+67qMhAUzkVF1PRLcOhFI6O3fcd38hKB8UL1jgLe3Bosn3udrdrx7CZlBgD293TlOqPd2RK+h
	E3vrsadqFrc//2eoKaa9KITsLQSwZeE6lkLZrw2BTBsyCSb3lboJUnCd5T1UcP1fqZ0YFizplCq6T
	XikCzKdi+3aSjaIMuOE4FwesHN0vuYbQajVDLaQlW5muDGWmeOweRMXbK/mx4o3OTMNXz38JWN2UA
	B43R4DxRTXJdH0IBvz/uVYaVslGJULIx+X2iTSmer73mS5pfLbMXoyJm5KPDBwOi5SYKuwbKVtFIa
	agv/tN11oPCOmtleqSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7ar-007RQL-Al; Thu, 14 Apr 2022 22:05:37 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7af-007RG0-WC
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso10452701pju.1
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=uLn9nEAVfqfhF99bZmCoDyMs8/O9emD7jJiMXxYFAyY=;
 b=aCpk+hiR1i6NQteJMGoSFJLdn5Rgm8st+ic8YTNlQHLfaUlgHtMcfuGAfhQl3K+6g4
 UmI+PZBc6djUKQNDbQ28uCRN+kmDtOXIVTEKtwMumAnydxR3HnsqPH3DA0sbMlbQAwrU
 jpy7qcIA5R2RjbhZPPRb0MbiE3lAy7OS3Iwj1cDXaC4TvcQoItO9lj4SSCoUz8N2T03c
 am9CxRoIA8kWRn5kdkC7F60d0pSGRFKNubmWK4iNXouTAsvDUaX7fSzOK0gKgvqKwaub
 Qi9xqMYtyCJ43ckr4k2sI2wGmYCS0qBvDvWN1moO+kJfRhoTr4apwv5ff6foANjKKm0d
 vijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=uLn9nEAVfqfhF99bZmCoDyMs8/O9emD7jJiMXxYFAyY=;
 b=XtZJo2lmvHxZ4HPNuTt+sMTqw3YA2gDykWdD0pIb1FC7EyxhGnDnmlNWpRPIa4q/b3
 CpAeJnuLVzIwB3hN9RY9rbrF2Xq0Nmpa/BBPtEPhD4rdg7vo1QxwfgU1Tbt+6e1L65Kx
 7y9559h3pG8atB8NsZLJA+Fckc2dxxH/cgaWa0o5ZZLBnZ3pv6V2cA0ebdtSnvCa8GaM
 zwpFbviYfZj9RzzHZJIXomZ01IjjJlzRQHtf35lkkPG7qJ81GKzV6uAroojTZ80oRnCy
 wU0BIMcMieO/B6fchtKz+rrdMK4esyioEjWtLMWYA7IQZOrJrvXqnSWnm5gDYUsbPUZR
 qgIA==
X-Gm-Message-State: AOAM531XM452SiuWAUxK0cNCW4kb/IxXnFQ8HsyzaZX/4AUx47ee0D7V
 thyBDo58o9wyIzuPBszqhaAwYQ==
X-Google-Smtp-Source: ABdhPJzhfrbMDiR890Mvpaf1KfA0KcEG1o/qsHftMGK/3W28SItjuhSFgVLfw1qtTLZgABu0T8DOAQ==
X-Received: by 2002:a17:90a:a78f:b0:1bc:8042:9330 with SMTP id
 f15-20020a17090aa78f00b001bc80429330mr685887pjq.229.1649973923305; 
 Thu, 14 Apr 2022 15:05:23 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 r8-20020a17090a0ac800b001c9e35d3a3asm2852568pje.24.2022.04.14.15.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:22 -0700 (PDT)
Subject: [PATCH v3 7/7] csky: Move to generic ticket-spinlock
Date: Thu, 14 Apr 2022 15:02:14 -0700
Message-Id: <20220414220214.24556-8-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150526_081389_6D511F31 
X-CRM114-Status: GOOD (  13.65  )
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

From: Guo Ren <guoren@linux.alibaba.com>

There is no benefit from custom implementation for ticket-spinlock,
so move to generic ticket-spinlock for easy maintenance.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/csky/include/asm/Kbuild           |  3 +
 arch/csky/include/asm/spinlock.h       | 89 --------------------------
 arch/csky/include/asm/spinlock_types.h | 27 --------
 3 files changed, 3 insertions(+), 116 deletions(-)
 delete mode 100644 arch/csky/include/asm/spinlock.h
 delete mode 100644 arch/csky/include/asm/spinlock_types.h

diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 888248235c23..103207a58f97 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -3,7 +3,10 @@ generic-y += asm-offsets.h
 generic-y += extable.h
 generic-y += gpio.h
 generic-y += kvm_para.h
+generic-y += spinlock.h
+generic-y += spinlock_types.h
 generic-y += qrwlock.h
+generic-y += qrwlock_types.h
 generic-y += parport.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
deleted file mode 100644
index 69f5aa249c5f..000000000000
--- a/arch/csky/include/asm/spinlock.h
+++ /dev/null
@@ -1,89 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_CSKY_SPINLOCK_H
-#define __ASM_CSKY_SPINLOCK_H
-
-#include <linux/spinlock_types.h>
-#include <asm/barrier.h>
-
-/*
- * Ticket-based spin-locking.
- */
-static inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	arch_spinlock_t lockval;
-	u32 ticket_next = 1 << TICKET_NEXT;
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%2) \n"
-		"	mov		%1, %0	 \n"
-		"	add		%0, %3	 \n"
-		"	stex.w		%0, (%2) \n"
-		"	bez		%0, 1b   \n"
-		: "=&r" (tmp), "=&r" (lockval)
-		: "r"(p), "r"(ticket_next)
-		: "cc");
-
-	while (lockval.tickets.next != lockval.tickets.owner)
-		lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
-
-	smp_mb();
-}
-
-static inline int arch_spin_trylock(arch_spinlock_t *lock)
-{
-	u32 tmp, contended, res;
-	u32 ticket_next = 1 << TICKET_NEXT;
-	u32 *p = &lock->lock;
-
-	do {
-		asm volatile (
-		"	ldex.w		%0, (%3)   \n"
-		"	movi		%2, 1	   \n"
-		"	rotli		%1, %0, 16 \n"
-		"	cmpne		%1, %0     \n"
-		"	bt		1f         \n"
-		"	movi		%2, 0	   \n"
-		"	add		%0, %0, %4 \n"
-		"	stex.w		%0, (%3)   \n"
-		"1:				   \n"
-		: "=&r" (res), "=&r" (tmp), "=&r" (contended)
-		: "r"(p), "r"(ticket_next)
-		: "cc");
-	} while (!res);
-
-	if (!contended)
-		smp_mb();
-
-	return !contended;
-}
-
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	smp_mb();
-	WRITE_ONCE(lock->tickets.owner, lock->tickets.owner + 1);
-}
-
-static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-{
-	return lock.tickets.owner == lock.tickets.next;
-}
-
-static inline int arch_spin_is_locked(arch_spinlock_t *lock)
-{
-	return !arch_spin_value_unlocked(READ_ONCE(*lock));
-}
-
-static inline int arch_spin_is_contended(arch_spinlock_t *lock)
-{
-	struct __raw_tickets tickets = READ_ONCE(lock->tickets);
-
-	return (tickets.next - tickets.owner) > 1;
-}
-#define arch_spin_is_contended	arch_spin_is_contended
-
-#include <asm/qrwlock.h>
-
-#endif /* __ASM_CSKY_SPINLOCK_H */
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm/spinlock_types.h
deleted file mode 100644
index db87a12c3827..000000000000
--- a/arch/csky/include/asm/spinlock_types.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_CSKY_SPINLOCK_TYPES_H
-#define __ASM_CSKY_SPINLOCK_TYPES_H
-
-#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
-# error "please don't include this file directly"
-#endif
-
-#define TICKET_NEXT	16
-
-typedef struct {
-	union {
-		u32 lock;
-		struct __raw_tickets {
-			/* little endian */
-			u16 owner;
-			u16 next;
-		} tickets;
-	};
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
-
-#include <asm-generic/qrwlock_types.h>
-
-#endif /* __ASM_CSKY_SPINLOCK_TYPES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
