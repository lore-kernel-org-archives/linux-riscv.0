Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDABC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81l1vnndeH6RGQ7RI3IttTQT/Ue2c84FixhX6Y1lqPk=; b=2cyQdW4fxxCG+W
	F+IUMW9xg8Rc97EtPYhkVJe7xf26dRGxc28cq5eSyU8LKRpvMKvEHA+Vjo/0Gieg+DDF4bsp+Bv4i
	/kM7Bw3TQTRm7wagsBqe4lZwKMIWyLgQ07yeNVDdt3CGFvKeH8o7ztFfCNs4DwTLLwqJcn1aMVmZD
	LSSLVuYXO5K7b2yrX9VBVd6JUOh8crtKxCwp0Ox+rG8XA5b+cWHLMjoDvDKpjw8P+XKxIb52sBuWQ
	SUucm8OuVh3+rTfqOUwjLQ3tqw6PNSb21kMbNyUH8c50UftEUaahZJPMENjGU0fc8VS/eojrP8tOj
	Fe98V+1PBsuhGEN9xlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3pv-000000009G0-1pBi;
	Wed, 31 Jul 2024 07:33:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3pt-000000009Fc-1wtI
	for linux-riscv@bombadil.infradead.org;
	Wed, 31 Jul 2024 07:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=heAbIXv1oMx4SoDoWG1mJ8ALiEwmwn+mI3czPDKQjFY=; b=JT21GbOUqDK69Hd9t/zgge3TWd
	je2JkZweA2zs4jX+TYobPa9OGY5BzYR64wmE8/iHyf1qMvuuGg5x4uDVUxiw4vJeni/pb+eLteQox
	m8hI3ZvVhKxhhUTs4gwKIkxWFbxpnR5gm+JClXsAhvXSyfz1c48IFJ1aLrbeqw4rEPeNjF78RwjG9
	2D68KctmFSx0YL7tZvjw1lY4pPkU+egDAscrtIbD+gpkV6LtBtnAk+onLaOXr0oLdr0xPQIOt+YmB
	FB1irdXNZNsZdrAKQkAySYSEvAznHJ9L9D3pV3yZpdcdnUqF/gkeWR0coPGFWcC46RQ5Mmmw/bas+
	nJWoXZQg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3pp-00000005ADS-3eQV
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:33:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso34891675e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411199; x=1723015999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heAbIXv1oMx4SoDoWG1mJ8ALiEwmwn+mI3czPDKQjFY=;
        b=a0xoB/rkQiV9AjSuoI6WDeph+g+0zwW71+GoSStWcV4nXTOpqKrga90SftP9yPcckN
         GWjTfzhri+VsBRlSVZ9z1XMLeNTDnpzhexy08PcvMz/X6ixfKlLTlzYsGxwqlq96JPER
         cLoQFKhssl9gSuDBAXyekoVntGaVkitHGSRz5udoGAQ4ro3iZjCBlNUFz/OrgMP/6cPx
         EDfKcFvSu+dl4zziEe+Ys7/b+fFjOd5FU5vZTL9xqtQ6F0jdxp+p1hZzvrfKficXpA4g
         6ccEon2CGo2TyXlCrK60qABCmTtjVjdYt/sr/WVssyCkRA9dPKcpVwQMZqodO9nbPKyL
         x07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411199; x=1723015999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heAbIXv1oMx4SoDoWG1mJ8ALiEwmwn+mI3czPDKQjFY=;
        b=XkanqVbhLwIgrFGrViaBkllCC9duxzQ63nF7LxmKVkP56QZnooo4BoYh2kWHZMsTv3
         pY5yA6CvIa1NOU6MWPN5lgU7Ej2ymSM6Kb5QzftlA9ixhaxp+AeQKFlYD+GwToCTdpy1
         hQKA/vHTQQ64q60SiXEQdQnM42B7oDQq+vrQKdr9okgneHZoi/A1YRgOwqJnnw0swPfm
         rtIcMbGACCAcvGQLWk010RMagSbCnGpsZ4p8E5tpxpHFmStQ+9o3RODbadxLmfYma5+J
         pzHLed2B9spwaTAr8Dty7ib6ue46jUCgTEOmZHPG2yQY1Rbp3wfocksj/tVcRtjXoqvJ
         XxAw==
X-Forwarded-Encrypted: i=1; AJvYcCUGgNZathgymfJrRwYcalmNEsbLJsUZt9Wr63/Mb/U2koGGG2ZlTFYpv26Kd/k1ZKDOMly7iTZ/kyRY7PGjosS0CpuWTy/ttUBNzW6PEgf7
X-Gm-Message-State: AOJu0YxpGD7ISCVQ/gxN9mj7pDM88WxAlmR0hzrY24vzbD2bnTfUqge+
	4llfOQqxvncHbwu/i5pRZshnc4BpzVHBgp61lDtVAIPgRSa7nOudkH/EZdPkMEo=
X-Google-Smtp-Source: AGHT+IEcnY6AHoPV/M+h1TDSqxuXyVV5Hu7UR4S5fwQ9ffgAKn2jmSi+Y4GhJoM3ugRGgONDlr03/Q==
X-Received: by 2002:a5d:6d81:0:b0:368:4c38:a669 with SMTP id ffacd0b85a97d-36b5cee2e5fmr11880218f8f.10.1722411199233;
        Wed, 31 Jul 2024 00:33:19 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e51f0sm16335609f8f.46.2024.07.31.00.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:33:18 -0700 (PDT)
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
Subject: [PATCH v4 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
Date: Wed, 31 Jul 2024 09:24:01 +0200
Message-Id: <20240731072405.197046-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_083322_234812_DB781375 
X-CRM114-Status: GOOD (  13.42  )
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
