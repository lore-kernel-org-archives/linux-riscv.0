Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C0BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6s6FA2iSpNGXGmQtn1GKurnAXgR8Cr+8LHiEN+BIp8I=; b=VVRKE77AIKdm0G
	HIX05BNbrmOLuUyAwn/qk5/8rHwCJHmnBy8bHOL4pKa3K6qZlPOUJhjFgKouIVfww9CCO4Ks4U1FF
	mh5AzO3Oc3HBSwUYpg2PtFJBZWTGCVuFBxvH5dKhXhR+4NYyiLm/Dcc5VqK2k2H2rd6jd1dBDRMma
	DPFYg36lj6/n3W0CzZisi/hbvhLXHLjWFa1wcNItDMrhemYBQDLTchIJ9gCl3oN2v3WBNcDhZbYQt
	gZ9ZuTNb6ZSsJ88hNA8kE+xnrvN19MYbgYHA3Qf1nhMOPkUOZyp7Vaie9jybMCAd70vwSwpIGTlBs
	+nhW6ocVCXFu2ZRMrq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvn-00GZFd-0G; Mon, 09 May 2022 22:32:43 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvc-00GZ8a-B6
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id j14so15181812plx.3
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Z3KkgMzaCsKED3+22qU0jRs/X/gxCeKEBc73aw1loXs=;
 b=5vPCveToxUi4ttmh8DPCDy3ak9rPZYrBa1vVaCCIrmS6NeHkVk5bHBq8IVjFktNkNG
 AvYErCFvU0+hXObXVqDU8qyV4bDHC4+o8GCF5qmDERdGC4UhP8jFXa9zTk7wsrCBS3Ur
 hYBnHEgjZeYUJO6BBpoZJiINRKpgW38BN9zIXLfpOOD6MVlW+Mj9iXUaiyV7h5ASvLqZ
 hVURqRgWeSjGJCcO3SUgK9XiJKniI+25OVH+/6Lr3S1gUjbadvAJMRYa/PDQ436HjsAT
 QrveNwpwVx4a+V1WgcLhb2cl1ZogdB/YI2keetilTCYkVwt47kvVoj8unXjX9rKFjbkg
 CWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Z3KkgMzaCsKED3+22qU0jRs/X/gxCeKEBc73aw1loXs=;
 b=eLONBs+ilZ6rbBO38xXBilB3nZlNdJM7Gd5vFzI0Yl6WyUHPaoqMUeANz0NLq8hN2d
 547UQ7XcHeVu4bcScHANyMyaNl374NWgBGY2+e+ovyYWZ/QmCksuoMAzeZL8Wu5qqCMs
 4E3+Bc1Lsx8qcZSCt8NVI6Z8Z0pyZbztIaNSR/vcI5SgO2wlOrdWsFUrYMpM5pCxgv8f
 8Lcwv10tqAriXu0+a2zKp20HKTwYzUw4l4HRWMyjxjVRh2fqQ/qEWFH7m93TTZz5qRr4
 wvYWdzGwiqFMVURlElENjBBA90oH3h4mvGQ11pQ6L5f/wg+v4bvNRwE6OwGm2xIXL0zT
 GlSg==
X-Gm-Message-State: AOAM5337C3eQSkpieIEjBidO9v1A8PtQJqakjDkcJunHeaxUU76lOeZ/
 G41g5Z0ag3QZnegPo/Ob/qPwTA==
X-Google-Smtp-Source: ABdhPJw7JCborLgVxycE/OcVHLhZbdmXu7Ia1T+hDGVVlKqCVv1PQUH1RupjT9FzRxe0AXir7lMqhA==
X-Received: by 2002:a17:90a:a385:b0:1cb:bfa8:ae01 with SMTP id
 x5-20020a17090aa38500b001cbbfa8ae01mr19875610pjp.116.1652135551812; 
 Mon, 09 May 2022 15:32:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 r5-20020a170902ea4500b0015eddb8e450sm412122plg.25.2022.05.09.15.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:31 -0700 (PDT)
Subject: [PATCH v5 7/7] csky: Move to generic ticket-spinlock
Date: Mon,  9 May 2022 15:29:56 -0700
Message-Id: <20220509222956.2886-8-palmer@rivosinc.com>
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
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153232_496022_98780B8B 
X-CRM114-Status: GOOD (  14.26  )
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de
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
