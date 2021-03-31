Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2998DC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B1560FF0
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B1560FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag3acVKK5bL8Qzux/8+4US/llLPUYErbAoFijoWEn7I=; b=D3lnaT+enfK0oMgCKp/V15/0fF
	qbQYw6WoTs4o8YImbxuizcNkYRHQoKkSEavKKtWBl+/B5weUZAsiKTfAQyvIghp+GAlg7LNKzTv54
	raqd+rb+4mcjLOpnfnKnXX4UYPfEXlZfnY0WsfswQCmppCdyP/KRuxgBGd4Bu1a8NGPanliqywDNp
	gvkIddV/nQiz+jxm6dZ6nwqMX38T1UX/SLwuumdsrLOLD5uiKeVXgiki+nKVI1GhMpa7UOXh9zFvS
	qru0oYwR2Y5DIpyxXqGYagdtNLk/YQ7D4/Ww1QTp4AFUjV/I2SHvwxnJmeZlb0YAFz2IscmtZVOxX
	NyFLExjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbtP-006oU4-CN; Wed, 31 Mar 2021 14:32:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbtM-006oSv-B6
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:32:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F176760FF1;
 Wed, 31 Mar 2021 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201139;
 bh=ET6mHFYyqB1SBq1ewQ1GZzs5w6YT4Vz0URxeLviz9rs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dy4lrqNV7m0Yy2r05bp8XCPUAC8z34FNeWbsZGbTVJ+lgmHiGOSKMdqGkne7CRoBG
 h0aP6WRVV3BKhLHvmSQDrzflE0xWl0GYT7L60PDBgOBiqmYcbTKt2Bu9uZKJRZaUsC
 JLg3lic8aznTBUZTOQL+OKg8JNXlyE4WjU8cBh3xHk++jJEXBQtzEiQLzHnfiNCq/B
 g0HKpMzU6FVFUg006DAIrSZXocPI/6dxOd8xDDjfBpSviR9gXQWC7FD1n/kNq2jEoY
 ZMcJKFPvCAztLJ9A87rOz+Mc+atT+903XzdCNzQmHX5+m1XwlVwCQPi/iackWOsnMS
 W85nWlUX/+dvg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v6 4/9] csky: locks: Optimize coding convention
Date: Wed, 31 Mar 2021 14:30:35 +0000
Message-Id: <1617201040-83905-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_153220_628132_422949E0 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

 - Using smp_cond_load_acquire in arch_spin_lock by Peter's
   advice.
 - Using __smp_acquire_fence in arch_spin_trylock
 - Using smp_store_release in arch_spin_unlock

All above are just coding conventions and won't affect the
function.

TODO in smp_cond_load_acquire for architecture:
 - current csky only has:
   lr.w val, <p0>
   sc.w <p0>. val2
   (Any other stores to p0 will let sc.w failed)

 - But smp_cond_load_acquire need:
   lr.w val, <p0>
   wfe
   (Any stores to p0 will send the event to let wfe retired)

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/linux-riscv/CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com/T/#m13adac285b7f51f4f879a5d6b65753ecb1a7524e
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/include/asm/spinlock.h | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
index 69f5aa249c5f..69677167977a 100644
--- a/arch/csky/include/asm/spinlock.h
+++ b/arch/csky/include/asm/spinlock.h
@@ -26,10 +26,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 		: "r"(p), "r"(ticket_next)
 		: "cc");
 
-	while (lockval.tickets.next != lockval.tickets.owner)
-		lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
-
-	smp_mb();
+	smp_cond_load_acquire(&lock->tickets.owner,
+					VAL == lockval.tickets.next);
 }
 
 static inline int arch_spin_trylock(arch_spinlock_t *lock)
@@ -55,15 +53,14 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 	} while (!res);
 
 	if (!contended)
-		smp_mb();
+		__smp_acquire_fence();
 
 	return !contended;
 }
 
 static inline void arch_spin_unlock(arch_spinlock_t *lock)
 {
-	smp_mb();
-	WRITE_ONCE(lock->tickets.owner, lock->tickets.owner + 1);
+	smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
 }
 
 static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
