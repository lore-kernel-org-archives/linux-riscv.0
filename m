Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25595C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 23:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7zQ2AwOScWuG5sQIBko7A3I1Mm5GMPqU9nRYgZDths=; b=hRp4qtlL+2TrjB
	3sZyUu4d2TKDyxgsL2mdQQCvpl8XQVGtUl6Lval1UBbK49EMMTBov+nr4h2mNyHXs+vLtCpveVqxy
	ItxikqMZ9fjBdGx8vqBgyxeqD72/Tv7KdBcHRF5ACcPA9ItwDGa+pNinsIrojO8a1qIkwdxRSp6iD
	3HOQoBznYv6WJAR54Xwzpqws2pYIvCFUAdmZxMIQ2ESFVEQ33Gb5pTUMGKUsFr+fFnVYUCgIvwEql
	puYs9uBBqOU7m9f7QMN7y13ZZtjpkWx6WT0B6bP9OWOP4Iq0ZnQApPTA1crn/Jwf1UWYyp1DRPLFh
	+eJ3bnYIyxOLl8b+H+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUd4H-00EUDo-RJ; Wed, 16 Mar 2022 23:28:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUd4A-00EU8d-7f
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 23:28:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so3950599pju.2
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=QjUbWpYW3rVnM/AEVOfQY7Hb1962iPWLkT7GwNacZrs=;
 b=OPswRH2lRihBIfhRfn+/3FQDyS4CIDrFb0a6W/SFptnXwSb197U4E15ipwXAHAI0Ta
 TNyvuSpdp0Dl7Udy9D2GfQMyBJv1EAU0uSev1KuzOjG/5dK0WBhl8Mbqd7ahL1zjtniM
 Y1SqPUOdGayiPKAU6YQE0nUK5pJvsw2r8oicK3P3V5ZhK6gt2WLY4clS8KYMvMnsh/qH
 t1+CgGbeMH5nQ/NzMh338/CKlZC6QrLpB6Ol4xXtu3THVc5XuN017XXitVKtMXD9lQqc
 x1VUjFX+iePIisj0C7WmE0/fu1p8BI2Bk3rrSnzxy2JNeg8GQP2Fx2KEuKzIbkX7wL9d
 r1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QjUbWpYW3rVnM/AEVOfQY7Hb1962iPWLkT7GwNacZrs=;
 b=U79jEICau+FNOgkpeVzOVUrKSO7X8nfJzk4IDoia1AuRJqIXQMnidCMyZkGKI32iHX
 sAtuWKiJDm/unw5m1RSdZdhgO+ObCCLTnE4ZthbM0m5plPP6RpC8dLMjoBQBiWCMSKf+
 69gidJOa5HO0/gO5TZBMZI5i8oG5beeK8kcOYMuKBD4FQGvpWlKuTNnvcqjBcnwVYly7
 QrN9UDC06gOYSV3vIJCBmsrxStazyQvzMgZtGL8LDMYrGUeXH38umTQqrgL9QEM8vvPL
 PvhHXycMO5n2XGjnzEy5UQzjNBCosWHny0evR0IzJr1ThHiUmNOeSqn+RsIeuLEaPSBB
 O1QA==
X-Gm-Message-State: AOAM531OeDXFc53K6tT06JH1cZqFG0OR7dOpcRfFgQ49P3Ewc8wE3y6o
 7wWBvn1cRsK+nLAqQNlpdcD16A==
X-Google-Smtp-Source: ABdhPJx15zZafntzrXc+qFtN7TCKqNirxAH51x/OX1Z7DAEkhf7MHHxu+PKBTGIRQSByMNHXy1V3iA==
X-Received: by 2002:a17:903:1206:b0:151:7d67:2924 with SMTP id
 l6-20020a170903120600b001517d672924mr1783497plh.45.1647473309449; 
 Wed, 16 Mar 2022 16:28:29 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 pj13-20020a17090b4f4d00b001bf2ff56430sm8078615pjb.30.2022.03.16.16.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:29 -0700 (PDT)
Subject: [PATCH 4/5] RISC-V: Move to ticket-spinlocks
Date: Wed, 16 Mar 2022 16:25:59 -0700
Message-Id: <20220316232600.20419-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_162830_306580_1B136270 
X-CRM114-Status: GOOD (  11.89  )
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/Kbuild           |  2 ++
 arch/riscv/include/asm/spinlock.h       | 41 +------------------------
 arch/riscv/include/asm/spinlock_types.h |  6 +---
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 57b86fd9916c..42b1961af1a6 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -2,5 +2,7 @@
 generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += ticket-lock.h
+generic-y += ticket-lock-types.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index f4f7fa1b7ca8..38089cbdea92 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -10,46 +10,7 @@
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
+#include <asm-generic/ticket-lock.h>
 
 static inline void arch_read_lock(arch_rwlock_t *lock)
 {
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index 5a35a49505da..431ee08e26c4 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -10,11 +10,7 @@
 # error "please don't include this file directly"
 #endif
 
-typedef struct {
-	volatile unsigned int lock;
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
+#include <asm-generic/ticket-lock-types.h>
 
 typedef struct {
 	volatile unsigned int lock;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
