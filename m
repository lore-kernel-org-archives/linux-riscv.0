Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20140C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 07:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b2duZGZ4Ztf4C/ShlE/DgyCU3wWZYrWuZ9LiunI39pk=; b=JfGg+lBPo+ULaS
	ROYiscDNSvAvnd0jKSwEo8CIdc852SL9KgE+xEBcHpa1YI6F24n6WWR/04ng+dL6i3j3eDC6h4pR+
	4D3hHTkjwzM5ZWroa7y8XjZbeZXFwBf0Ts+eOQyJrW8/UpG82wQlqHvO00DufxBhqtNgjhepB71Uh
	iMDPKIH20iLzP0XTpIL5Dj7Bk4jtZqmeUAOCY4EX/8b93Sf2vFgsqs5Dk2jKiJujPI2EebHnNsxqP
	h3CgztrdRyBd+x/VaZhxCH+Nl76FPoOkaDSXdb0q6aAhl/L2is3xp2m6aDbYbwNHh/W0Is5hUuMny
	+CQiDkMAAslYdCYsDs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1AS-0061Ai-2w;
	Wed, 19 Jul 2023 07:00:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1AQ-00619U-1V
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 07:00:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7119F611DC;
	Wed, 19 Jul 2023 07:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93359C433C7;
	Wed, 19 Jul 2023 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689750008;
	bh=HDeq1/IS5rQ4pnF29vgg6/9UWwbJAWwzrpsSqnIsDaw=;
	h=From:To:Cc:Subject:Date:From;
	b=BlcMRpZXnKySXsRU/BLq7GNtkEcIqOSpQtkb9tE+IHnV5dfCtpRdy8Vot8NgHZKEP
	 5icYatEmT1Aeu0O4/z2ZhmvRY5EgFlT6p3jxOlyN+gCF8vtHejFG7QaBqMOZaRjBr5
	 hqrDu9imKG4cshkQ0M33xGa+SEspuW5tYh4BSy562wAcV2CAlsgDziRsbcWcnHz1t1
	 An8hZxwQ24hbu7bfU+NbBXcNxbf9sxSvTcQWrlM7H0NI+6fcaRXGG4nwEEo3EL2d6N
	 ZSFNO42cUZMlt9PtQjmqMU4BDQ2dcYRxqdryZnYIsKeKzbVFt7GawtHarwukr6Dy3m
	 paPXR9B6ffsBQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	David.Laight@ACULAB.COM,
	will@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	longman@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] asm-generic: ticket-lock: Optimize arch_spin_value_unlocked
Date: Wed, 19 Jul 2023 03:00:01 -0400
Message-Id: <20230719070001.795010-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_000010_565197_9564D5BC 
X-CRM114-Status: GOOD (  10.45  )
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

Using arch_spinlock_is_locked would cause another unnecessary memory
access to the contended value. Although it won't cause a significant
performance gap in most architectures, the arch_spin_value_unlocked
argument contains enough information. Thus, remove unnecessary
atomic_read in arch_spin_value_unlocked().

Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: David Laight <David.Laight@ACULAB.COM>
Cc: Peter Zijlstra <peterz@infradead.org>
---
Changelog:
This patch is separate from:
https://lore.kernel.org/linux-riscv/20220808071318.3335746-1-guoren@kernel.org/

Peter & David have commented on it:
https://lore.kernel.org/linux-riscv/YsK4Z9w0tFtgkni8@hirez.programming.kicks-ass.net/
---
 include/asm-generic/spinlock.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index fdfebcb050f4..90803a826ba0 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -68,11 +68,18 @@ static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
 	smp_store_release(ptr, (u16)val + 1);
 }
 
+static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	u32 val = lock.counter;
+
+	return ((val >> 16) == (val & 0xffff));
+}
+
 static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
 {
-	u32 val = atomic_read(lock);
+	arch_spinlock_t val = READ_ONCE(*lock);
 
-	return ((val >> 16) != (val & 0xffff));
+	return !arch_spin_value_unlocked(val);
 }
 
 static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
@@ -82,11 +89,6 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
 	return (s16)((val >> 16) - (val & 0xffff)) > 1;
 }
 
-static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-{
-	return !arch_spin_is_locked(&lock);
-}
-
 #include <asm/qrwlock.h>
 
 #endif /* __ASM_GENERIC_SPINLOCK_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
