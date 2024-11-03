Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFC0D11100
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5n1CE5RLr0yYJGTWgH8fp+XxA04Fy1MBeGqBqCJMa8=; b=eAZRIMl8MAI5jN
	lDAJV0eGDhjPb2iJGaK1pGktiVcClcl6ho08Lanb6etwBabn6FyNQM1PLvkCsjeKiHk45mI64k9aF
	rkUBg3bQK6e9BS0fwI0G4yI63Sz/JRxQEGgA4a1erV4igCS+KdQZfdQoDs5MMXx94JDJcBi41onIQ
	hXV4IttsgMJkcoOCf1n6faLCTCypbO+We6HUR/hQzLC5+dASxd+2GHcFMsveKZNp0UhNqUZwyfa45
	D2xMlsh/pQUR4suWWm+EPifYG38H+6KEryYdCPQWYFR+phUFA2jhy2byvBYTwi9xbwHEjBTfnwfdB
	L2NUW0UW4qZfcETeABBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c6L-0000000BaZw-0I2M;
	Sun, 03 Nov 2024 15:01:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c6H-0000000BaYq-2nXu
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 15:01:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so26280805e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730646068; x=1731250868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s2g6PiZXcRkI3A8BFgYC9wzyXLIo5JanvDPO+lSWQk=;
        b=xycMlEB2t7OusjlukEZ7qivk3u4r2OnvhLEpmDsLNmYIxYWpOk51SzjdLFYGy3h6xi
         r4mNRn+68FFOh/FRBYmEskIAArzk5lE5zgZ6vT/H8AJmYE86uVNzCM5otkRSTJ7j9BH6
         XRuUtU/RS1g4RItf+n/q3fORnlUMUvfcWlXnbazv3ocBDXOcitd0MB6Dm4bw7GWCRjsU
         N3Vr9Qzjzep6sxqUEMjzhYUoErx8/MT5ECaT3Ak1x60QJKQxhKqLF33FaOsxNuTKdQF+
         79hc15WXcRIPZUid4CMO4A6Ial6qJOQERzJZm33v+TvJv84V9Z1jj5DKh7sn35YUvFAl
         PT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646068; x=1731250868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2s2g6PiZXcRkI3A8BFgYC9wzyXLIo5JanvDPO+lSWQk=;
        b=Crf45e79BCXl2mRXxLDPsZdqnujDrZu3h7WMwlJoz9nMHCyX4RLkxWeCMRO0BDe70J
         HntcMH5m0hhL4tDX3t38hRjDN5//c8T3jBKEjxhiGq9zTKRp0xDaU5AyGnuSvRD1ThY3
         tt1YhikftBdCao+a6BTixNMg3hc93CJUjyDRUE4JHwyHGvoS5dehnQsn4gZtxIaFRy21
         ogG1VaYssGh7lsB6dUYuSSxHO3KMsN2LIbj1BE7HLb6+LAokNLoYYEzdtX6+2KoHumh/
         K2XJDFc2ONm7fff0gQ10A9ST8EmiJ/5kPLlL/oRhwsRuQlucJpV4GJ/tnhlLX/TTJD1t
         qS5A==
X-Forwarded-Encrypted: i=1; AJvYcCWM+IwfkaZIxO0vPXzIR6KM+yHwupCZvbbx4iqE5Ehazl0LRE3rQ9I9sp7hJsU4czdtj9vBqNKdeHFSQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsxBknJFdUuL8QGL2EFzlKy/5Jp6QfcrtZ/X+BZACZGx9yVbml
	kACM8YfRGRryizOKQ4PhgBWNcBOCIklGsGOXfpCMjfBx4b6NsfIpWSq1OUyHFkM=
X-Google-Smtp-Source: AGHT+IHT05faWmtqnYuiNBzL9haD0/7Dkr0QGrJhaTkS4osZpzeT6/FO8hvYgpCC2wE7TfnKCk1UVw==
X-Received: by 2002:a05:600c:4215:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-431bb9e6031mr145075625e9.33.1730646067731;
        Sun, 03 Nov 2024 07:01:07 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm125977405e9.34.2024.11.03.07.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:01:07 -0800 (PST)
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
Date: Sun,  3 Nov 2024 15:51:49 +0100
Message-Id: <20241103145153.105097-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_070109_740072_08938F73 
X-CRM114-Status: GOOD (  12.64  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
