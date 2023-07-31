Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3D2EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 02:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nup0wJmZmK6EOvo0r7OCmgUIW87VaZQKCyY+UVVfOVI=; b=cSr0OSneSbLK3B
	YUMLFKG0Fc5GzVOoPJ1eb1tO2qA0+yFjfxYp4PtDffa+opw5mQLO1hmToZWPReoOi//tUvrqrtoex
	dEkqMe21BnFg5eqwnMPrqqvOBz+XV5bfq2EqHjOJvMr0wByw7PtwsATdMgcy/OW/S+vme2qP+t7ff
	PXOKuqa9u0YSwyrO1QXl2b2ZtOSaVow7PewL+OQBEhZLbPYc5UmQLG6AqaND38/xsM4vzcwhLaRjp
	jURe+AD/FXIvv3w3IvgbFmQJfWT6OYUHn8POKf0yL4j5fO7WnZ0WC8+s7Cqd14G5f02eXgVGVJ51a
	ji+YQnWkS9bt1aj5HDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQIir-00DWmJ-1B;
	Mon, 31 Jul 2023 02:33:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQIio-00DWlO-0o
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 02:33:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7ED5E60DF9;
	Mon, 31 Jul 2023 02:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6D6C433C8;
	Mon, 31 Jul 2023 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690770800;
	bh=0gAtJOQpVMD8BwO73WEaaztsqkDnNRkgEfGHbRe8E4w=;
	h=From:To:Cc:Subject:Date:From;
	b=G6PYP+nCCFGX5k/Hi5Jr75omCG6AH0IALpAYUKDAbmdOdLbSoz/oEoCh2GaopoYJA
	 b4So3ErnwWMVWBWd/RtKCT2QAL5tjhLvwXpmwIKWtbXOm778YrJtOxLUDPLM8wyrY9
	 LY37LeLPQFbJrspWfmGzgLb5qKB3z2/OvFHOe5kzJGll3iu+mMAS0tZr4Pwc3WYWy4
	 X/Yk1+kNU/5RC3BLEVkhgYmXdPMd8jvH/hgJzD6JLQi0EE5TcqOdwEx/tMBua3PB92
	 WOJvUGpzDAiv0fc4Hri9UdC+z1JAs75/diQ1JRd/fnElYCXG3XqJmtF0WdpeYpsb1w
	 RdFH53r+vERNA==
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
Subject: [PATCH V2] asm-generic: ticket-lock: Optimize arch_spin_value_unlocked
Date: Sun, 30 Jul 2023 22:33:08 -0400
Message-Id: <20230731023308.3748432-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_193322_350764_33AA7F1F 
X-CRM114-Status: GOOD (  11.30  )
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

The arch_spin_value_unlocked would cause an unnecessary memory
access to the contended value. Although it won't cause a significant
performance gap in most architectures, the arch_spin_value_unlocked
argument contains enough information. Thus, remove unnecessary
atomic_read in arch_spin_value_unlocked().

The caller of arch_spin_value_unlocked() could benefit from this
change. Currently, the only caller is lockref.

Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: David Laight <David.Laight@ACULAB.COM>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
Changelog
V2:
 - Fixup commit log with Waiman advice.
 - Add Waiman comment in the commit msg.
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
