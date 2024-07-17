Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE16DC3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81l1vnndeH6RGQ7RI3IttTQT/Ue2c84FixhX6Y1lqPk=; b=mFAjHggOuiwBxs
	VQuFum0bt7It3oAddMV/ICo5kme4EiRyNd28ecmeS6N/HE3hHiBGC4FNQV4+ZbqpwRNA3GWxfVGSs
	qqpc4z7mpX392og1oeZyTZ0cwTWitIq6AydDsGwcwru1Qnu2sZQtkw1sQinwWP0lgNwe1ORNT0LX2
	qB4JOxf/lO+1k0Uv6NHZEstYj+xlESf9HC6Ei9Or9c8QrQffYp6CZDrpqtT0QfjLDf1oPkO/Wa+2a
	EDTQwOHbOR4MGnZOOGW3T+vUYRggEuj0fv51DVxTEJcBjQyUgWCmw2TwYLasHu+70pwRCNFsW7Vjm
	JdwFgKHtYljQyf3uFs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy89-0000000Cpk0-3V8p;
	Wed, 17 Jul 2024 06:27:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy86-0000000Cpix-3FXx
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:27:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-367b0cc6c65so3921223f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197629; x=1721802429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heAbIXv1oMx4SoDoWG1mJ8ALiEwmwn+mI3czPDKQjFY=;
        b=WEdCOJ2lvPBK5w00zUXzqMeHbMUQSWKOy1Mt37P1J/ODiFo7w3mSvIWieqxMH/gonN
         m4FJxNu+QwiDZ/H598/EJFPsN1uBIj0MHQq3tzd8ROlN/ZJYKhDBTgMvaFSk1HYTvsxK
         4x3klxhwR/BejDnIM8UVnnmDOm68wuB4J1/XSHsg0a51/+nqryDzNA45r07Csg+oYFrr
         al3CbBMd3gBI4eGJrY3kFb9hHi5dQWBQmWTvGDq8GleGfSGsjuFBhy94BRy9lDqC2nlr
         CLxxNJw2iV9aT8ZGGimPuRBDLRUbfLXQs8y+rS8Tp1mSuiM3gJRb1P0DWBGniQUhWNdw
         9G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197629; x=1721802429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heAbIXv1oMx4SoDoWG1mJ8ALiEwmwn+mI3czPDKQjFY=;
        b=xI1lYC60g+NrQSPZ4dc1jsfkGDVxNpFW9Gyk8wDxcbMqmjddA+9v2t5xWC4jcargLT
         mEMkUzIJT5tRBLQkiuAhbrndJO1/0v69eBdaq6B6/deW5Og9NBcJWwgZ5zsclOxPH7ff
         ZV6mUvNoI5+2D4jMG9/f1FNwoytHC5TulsFbnmu40y45L/mxgym//KxHh1jMdju8keeJ
         SmIynUPO93343Q+w3Htu2PGtl4R2W4J8sPPSWQFN4XC0Y7N6sGYXseaL3qMRNUQkE4Mg
         V+l5jODFiPdmQuVj6YlAAzSEDKivCULVD45KFpLkQ8SS1tzLSY5MheQIWnRPpqtSdExy
         T9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVeHc0sAVp1MyAdmvTD3uF4HdtnzyMpBl0L4sBp2I75qnHl58zw47wXiaC1IUFc3QXSbuUTnXi9xv50eJADl+uFlGhuJBu5LfOj8kw9QlmG
X-Gm-Message-State: AOJu0Ywifn9fv6WQ/FJlZA7m6gK6YL4dg/qQZUnQ1A/KsLNqur9yqNxB
	Dh950zX7uughWGUcAZXDfwJij3CJnCObjBQzOd+r0psssp1RtZlXN05Ed9qves4=
X-Google-Smtp-Source: AGHT+IEcx5vbXw9AngQayUYduH0av6OpvecXDO/fzCki4vNwqd2UbQND86b7G8WFV0E/r2hUOY9S4Q==
X-Received: by 2002:adf:f6c8:0:b0:367:bb20:b3e1 with SMTP id ffacd0b85a97d-3683171f8bemr430134f8f.51.1721197628922;
        Tue, 16 Jul 2024 23:27:08 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e8e2ecsm160904995e9.21.2024.07.16.23.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:27:08 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v3 07/11] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
Date: Wed, 17 Jul 2024 08:19:53 +0200
Message-Id: <20240717061957.140712-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232710_955046_449178CB 
X-CRM114-Status: GOOD (  12.86  )
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

The arch_spinlock_t of qspinlock has contained the atomic_t val, which
satisfies the ticket-lock requirement. Thus, unify the arch_spinlock_t
into qspinlock_types.h. This is the preparation for the next combo
spinlock.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-riscv/CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com/
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 include/asm-generic/spinlock.h       | 14 +++++++-------
 include/asm-generic/spinlock_types.h | 12 ++----------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index 90803a826ba0..4773334ee638 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -32,7 +32,7 @@
 
 static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
 {
-	u32 val = atomic_fetch_add(1<<16, lock);
+	u32 val = atomic_fetch_add(1<<16, &lock->val);
 	u16 ticket = val >> 16;
 
 	if (ticket == (u16)val)
@@ -46,31 +46,31 @@ static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
 	 * have no outstanding writes due to the atomic_fetch_add() the extra
 	 * orderings are free.
 	 */
-	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
+	atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);
 	smp_mb();
 }
 
 static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
 {
-	u32 old = atomic_read(lock);
+	u32 old = atomic_read(&lock->val);
 
 	if ((old >> 16) != (old & 0xffff))
 		return false;
 
-	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
+	return atomic_try_cmpxchg(&lock->val, &old, old + (1<<16)); /* SC, for RCsc */
 }
 
 static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
 {
 	u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
-	u32 val = atomic_read(lock);
+	u32 val = atomic_read(&lock->val);
 
 	smp_store_release(ptr, (u16)val + 1);
 }
 
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
-	u32 val = lock.counter;
+	u32 val = lock.val.counter;
 
 	return ((val >> 16) == (val & 0xffff));
 }
@@ -84,7 +84,7 @@ static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
 
 static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
 {
-	u32 val = atomic_read(lock);
+	u32 val = atomic_read(&lock->val);
 
 	return (s16)((val >> 16) - (val & 0xffff)) > 1;
 }
diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
index 8962bb730945..f534aa5de394 100644
--- a/include/asm-generic/spinlock_types.h
+++ b/include/asm-generic/spinlock_types.h
@@ -3,15 +3,7 @@
 #ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
 #define __ASM_GENERIC_SPINLOCK_TYPES_H
 
-#include <linux/types.h>
-typedef atomic_t arch_spinlock_t;
-
-/*
- * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
- * include.
- */
-#include <asm/qrwlock_types.h>
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qrwlock_types.h>
 
 #endif /* __ASM_GENERIC_SPINLOCK_TYPES_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
