Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1956FC52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbsxV22WuluSG2D5qmTTGZPXT7B7VeNOXpZs3rTejvk=; b=Wda1v3dyh+bArx
	enJrDmSRlYMYIY5g+Nxw9tpK5yc/VwU0O+kg6LH2fsRSyY3ZqzO8bf15Ib8H9+u7KqdrW2k1wZD3C
	envMAvv512M+iJAdVlC/CpRhUpRm70/06jH9innwchTkMhXE4if0UrI9FxE76VhKdjge5doWA0rGd
	zmbIhpQhRgpX7BnPukARoZ9jZWa+NbxjIaE6gYzXLDNS2zce0CuMPvaUDIQ/f1L8SmaN5nHy4Ho5R
	0hOxabB+hrwoQ6vFSc1J6+moXIHEHfHlnGXjeqqbQ+mhCjBnKbI9YnZV0NFSDZiqZ/W5bzgKjoA9p
	xcf+lcMnaO7SbXF8NA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZeu-0000000GEUy-2HXs;
	Sun, 18 Aug 2024 06:45:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZer-0000000GEU8-3aNB
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:44:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso34770085e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963496; x=1724568296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFL/O3acOIAnvUQyUxNex19UAi4aS/YbFByq84YgWQ0=;
        b=GV2BIG/5ohnKWXUqXIo74lXoncs/1iK7UF9XU5n0IhmFpeZU05XBRqkXS8wuJ8bIRY
         7+Ij+OUzMmatrvOvT4Xqp7oTYrZuAcOtLNgng92rG6SQYisPEkoWzBNOugdPOWoVQPB+
         KgappgvCbJ+2nnT9pbtnkxJZ6XBLANcp9Y8PDpz/xzg+dn09Aqz2Z4wFZDMwTunmEM1c
         IKvBmZLUMq6rUyqtSSKMh7fcfUbHrvAy+4j9j3joXK1ECtrp4JMxaMBVXjUQqL+ReYVQ
         YstB5M8t676npCXUklUshQaMASo3RLGI2yZkz1wzNKx6kVq/8girALPMKDqYt1FhY7R/
         YjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963496; x=1724568296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFL/O3acOIAnvUQyUxNex19UAi4aS/YbFByq84YgWQ0=;
        b=OmqT2CESgwObLwdhz6nXcmz6O1pRqhN9ksLQ5mEKebP2T/KzCeh2S73FJ3KPvV2thb
         0X6vlNb6pLtZuA7vDnlWO+wyWEVpMJeDpvNPEiUK0cznCUlCncIHXDwNBYREKYB3Fy0H
         lRTHRwgCNkLUQ3ale7OOyZzPdo7GNwK6sh/l+DKsvcKSH+YLsMjwwdkKIYPjiZOyyHvH
         u0ebV5bRWMdhyjxS74eA3HVO8dcx5zAhS2m5/hvNtmJoARhTt4uZHAoSZmDuUCKnijyB
         un3PtWyaVCV2eTwKaxYwqR//rsp4XhYmhnoWF8pjtlexxOx1aBac11aE6Sj6fr4RWmRJ
         6/jg==
X-Forwarded-Encrypted: i=1; AJvYcCU9UAWbuGQaN7aS+VH/E4qjz21PlStWHgHA3i+A3zOvZB7q2eTX2UCVmW/ZsN3Nlc9aj/FAYDNXvDs52OgItt/UwErKUYuTPF+H5dbaK6T+
X-Gm-Message-State: AOJu0Yxf2+3UfRBW0D091ZHFa1guaf8G44QN7UE7SuT9rnjzwfrWO5mA
	a3p1LlVd2h+8oSHLl5jNqxjWZlBL5bvrJxsz2O61ylxHvd6/BXnTvPjqlMvZlMM=
X-Google-Smtp-Source: AGHT+IFPBW1mn5KeYnZcFZpLT4fLpEaOfFIUvQMa/GHHDd1nNhnkQYgHstBKdHhKt1mlaNsMcxCEDw==
X-Received: by 2002:a05:600c:4ed2:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-429ed79568amr68241915e9.10.1723963495566;
        Sat, 17 Aug 2024 23:44:55 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded180dcsm120623885e9.4.2024.08.17.23.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:44:55 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v5 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
Date: Sun, 18 Aug 2024 08:35:34 +0200
Message-Id: <20240818063538.6651-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_234457_927876_D72B8052 
X-CRM114-Status: GOOD (  12.85  )
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
