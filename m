Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F8FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYWQEuUHs3Pukk3PHqZgC6M847ldf3cMTuhKdAy8vQY=; b=yON+TW82CEFLEo
	3rC/iyMdLmveQkjgv5JgISyhyN4GGGvwTiAWkBfrgfzk59huQRRuXqEGGFwMkSLRenTwCy1pqrjXu
	J9npjrkVxHFTJTTHrCM/Z1iK4tp53zczWNXp4i+17lfnFdaIUZfsUKrJZEgEokW18wjRTNvhdmVVh
	yeanU8QtzgLd1GsCqdqS3JRWC0a0S/CGpOPISOOCKMVRv1U6xLf0b1SCZNwqauk4XE3i0Y2KlDIJ6
	xjsvbYXiwScYl7mAyP9OPEJ1WCQdCUl95H+CoF0mnh96J7Xn+J+fKkQ3ZhWgAVPCX2F0O+qQ9Hds6
	wf3BnfuIZp1DFOOETD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpAh-00EZHe-Hx; Sat, 30 Apr 2022 15:38:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpAY-00EZB4-CH
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 15:38:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id h1so9200007pfv.12
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=uLn9nEAVfqfhF99bZmCoDyMs8/O9emD7jJiMXxYFAyY=;
 b=jB62pUCVrsBBWgk3g/p2juBmwhI8a4Jh1x7TlcBNmDmJGAG6PaxZE+M3PZcJj+jg9T
 0iwrwbwp72h6V88rQPMbzIZsP4IpGTz5q9yERP4YLef+W+tIHP7/gntK1Jk0sJFq+YCB
 NJbWXx+W69U1T0Z2EjSYZTt6T15hvtMQcnch/kf+XW1iP0aNrMhACS24jp2yFH8lyeI3
 nkc+Wa+2NkrmLILV8dAzs1Z7Wxk4Irsxgf+XGdhN3xHKnqEGkwvBzBsU7nN9UMGk9AA4
 AikUbAz22IfR5jO2puqZ66QF+AD8umrShdTRxEgul/QR7LqlgZSw01y2sJ4BW9oAvI9o
 FFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=uLn9nEAVfqfhF99bZmCoDyMs8/O9emD7jJiMXxYFAyY=;
 b=ybLh9C791iXDL7ez2Z+omLgeseeftASSbNXlpIDuhR8xrpJxbKnip3QPQM0su5qTA9
 Xt0hM22ib1Jo+JYjp/dHPUkZJ3vU7LnrkncNu65OJzSlEwMEnjCfyVj9bHmR22H5GiWQ
 RLqPdUq+4gX7WytfAtHzTJgzvt4a2SEB2efiF1zCUsn2Mq57yrYgjTqmQwa7g5trUBWB
 xYyRO2eOlpvyEAAyM+TqWf0eTdGkq54JPZPVg78IEPmMa7BkK5cImZIvX+1r/+zI52Mu
 kQJNmsPyOUcJo1RYYwIvK/qDIqpeoVnQGZMfMRB7hs8aVf8UoExTRZkOQRsWlNhysFso
 102A==
X-Gm-Message-State: AOAM5324WbuFG2SDWcB2hu5S6srfZ64pX0ktsxu8bt2qTd1TiDbcZtTS
 PrjIFm7IydRR0Gyg1oPIorr7iA==
X-Google-Smtp-Source: ABdhPJx/DqzRzvSgQ995MUeH3WVVmaYceu4MzC5GgHW89dbtErwZa8oZe5QDvyTn1qGcu3QALKuXVQ==
X-Received: by 2002:a05:6a00:98b:b0:50d:ac70:c39a with SMTP id
 u11-20020a056a00098b00b0050dac70c39amr4083386pfg.25.1651333080906; 
 Sat, 30 Apr 2022 08:38:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 j4-20020a62b604000000b0050dc7628184sm1716696pff.94.2022.04.30.08.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:38:00 -0700 (PDT)
Subject: [PATCH v4 7/7] csky: Move to generic ticket-spinlock
Date: Sat, 30 Apr 2022 08:36:26 -0700
Message-Id: <20220430153626.30660-8-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk, jszhang@kernel.org, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, 
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_083802_976594_A09031A0 
X-CRM114-Status: GOOD (  14.09  )
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
