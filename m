Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcCrXP5XQUj4oKtEqeVZqgN9oVOVdtHPy9tC5jnfV8I=; b=r3T3X9NbcUng1h
	73bK9jIci7pYDoWbhrs0ymwLbnEvFoX+sDzOI/lDQQeA9szsg9NC1b5HHxAxjkVQdQItY2vzNWhI2
	mc7flDUYTTAV17tdJK4X5QXTc+M++8jSDeIjKGU+wCcoU9OCQGPGG37QqQP9bfxbl2+HaJzRJ9h5g
	teVdaknKgVx8prEIV7u1nEju5SHzdG4FqvMtzM9nbrdA1zw5Rw3/l5qm1KOw3GY2ikcTbBMpEeKIB
	zsWM0UnBqmCQTYGWzSYPOZ7P0oP4hOjN3Ve0puMuWeQ5XdGpneZtnA/WYiKhfLUNRjIL+ZCnxCbP6
	7VqN1GBFnyKX3RaJpsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7an-007RNL-3a; Thu, 14 Apr 2022 22:05:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7ad-007RDy-TQ
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso10417938pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=vsFDZUB/84NzhX1Z1IP0W5vQn6O0PaUxSIdB0QjeUDc=;
 b=IP4oGKTy+Wg0eeVn1tkZNqxzgquzqic9WWTzGoLpN8dXjfyAqSQGgu8PRr9T6udYTF
 5fZKPv8j17r+U9Qaqhjpf3K0KdBkCeFJL4ANLfBJ4wxNzdkhiw+FEIEtyWged3OrkEeK
 O/ue1T+m3vgfwM1nGrP9iqTMKyWK0ZRIe6v+uXZ63Ecsv019nXDcM7EuupsWQDvf1udn
 wYtkzLqiCDPUVXc72nh9EMaLmRXwnwJPlV+3zrYp1Gkv2+8S4nq+fv7DJkmK+4Vvfjh8
 /n045mQmP7nJ/ZUZPwg6Ivd1ywaBswAIDEDEYgKqEuAAtAgCkpvQEfy9jRfFuuMJAyOs
 Dt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=vsFDZUB/84NzhX1Z1IP0W5vQn6O0PaUxSIdB0QjeUDc=;
 b=eXgxJxal88f1ECH9yjoL6c6huK8euY1gvwI/c30T3Ci+0blCaZOAz0UQuxYLccvGJ3
 UmdxzjxUILFYiR8/JZddPknuoMELu5IXrx9uxdtavG1R5BCfrZ/wViqywEzsQ3FDpyHB
 HMHuydqy2WiEAOWl/x+9WtvX6mv5WjOtSo8Rf1wGobMLa15BkoMMujaWqzRjfqrn3Jnz
 xvIEu5KQX7aKAw8MbU8VWGCG4bwBip/6j/7QiSlHuoATfBBUpTg1VWl1pHw2aM8406Ks
 74UI8sEVNOGusxewMHwB6uq18yJiPJf1zgYKYquSABNDqESUjNVN4taaxNBelAt+SrG5
 arFA==
X-Gm-Message-State: AOAM533edutBMm4r410hRZiPqQhoZGjoVqlMjPox/Ar+LFE4viWYbuk5
 mdTRIexbzXG7I4CV5GNwKHyLtA==
X-Google-Smtp-Source: ABdhPJy4A8/pox4dhxDr4yvuIr0aGfvJn7yO4mLZw9IKFjjNFu22lsbncs+sg8MOsAOHYZqRkccWhQ==
X-Received: by 2002:a17:902:b582:b0:14c:a63d:3df6 with SMTP id
 a2-20020a170902b58200b0014ca63d3df6mr49682729pls.51.1649973920782; 
 Thu, 14 Apr 2022 15:05:20 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 f19-20020a056a00229300b004fb157f136asm778947pfe.153.2022.04.14.15.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:20 -0700 (PDT)
Subject: [PATCH v3 5/7] RISC-V: Move to generic spinlocks
Date: Thu, 14 Apr 2022 15:02:12 -0700
Message-Id: <20220414220214.24556-6-palmer@rivosinc.com>
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
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150524_016308_5E523147 
X-CRM114-Status: GOOD (  14.65  )
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

Our existing spinlocks aren't fair and replacing them has been on the
TODO list for a long time.  This moves to the recently-introduced ticket
spinlocks, which are simple enough that they are likely to be correct
and fast on the vast majority of extant implementations.

This introduces a horrible hack that allows us to split out the spinlock
conversion from the rwlock conversion.  We have to do the spinlocks
first because qrwlock needs fair spinlocks, but we don't want to pollute
the asm-generic code to support the generic spinlocks without qrwlocks.
Thus we pollute the RISC-V code, but just until the next commit as it's
all going away.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/Kbuild           |  2 ++
 arch/riscv/include/asm/spinlock.h       | 44 +++----------------------
 arch/riscv/include/asm/spinlock_types.h |  9 +++--
 3 files changed, 10 insertions(+), 45 deletions(-)

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 5edf5b8587e7..c3f229ae8033 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -3,5 +3,7 @@ generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += parport.h
+generic-y += qrwlock.h
+generic-y += qrwlock_types.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index f4f7fa1b7ca8..88a4d5d0d98a 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -7,49 +7,13 @@
 #ifndef _ASM_RISCV_SPINLOCK_H
 #define _ASM_RISCV_SPINLOCK_H
 
+/* This is horible, but the whole file is going away in the next commit. */
+#define __ASM_GENERIC_QRWLOCK_H
+
 #include <linux/kernel.h>
 #include <asm/current.h>
 #include <asm/fence.h>
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
+#include <asm-generic/spinlock.h>
 
 static inline void arch_read_lock(arch_rwlock_t *lock)
 {
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index 5a35a49505da..f2f9b5d7120d 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -6,15 +6,14 @@
 #ifndef _ASM_RISCV_SPINLOCK_TYPES_H
 #define _ASM_RISCV_SPINLOCK_TYPES_H
 
+/* This is horible, but the whole file is going away in the next commit. */
+#define __ASM_GENERIC_QRWLOCK_TYPES_H
+
 #ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
 
-typedef struct {
-	volatile unsigned int lock;
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
+#include <asm-generic/spinlock_types.h>
 
 typedef struct {
 	volatile unsigned int lock;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
