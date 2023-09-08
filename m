Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC12EE8013
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ua1rbO1qVQaIB5HvasLliVqGr3CLXPPAI+4yajsq7hI=; b=aKE2TxGz4OHABT
	RExylEMixPcri61xQrMqMawium+0DADCtphGxq7kssLmKyyC86YOdLo0gIPXjGC2EKOtTowLOgJOP
	ndWsbIQUEegvmkeqq7Q7yWMgpY+AVV21F4FA4i7YX7q+RbJJunP55lYXu/nM37NwO9uiFfOo3QQkw
	MKXDQ3kzEmA4ZQvpro6erzaImDZpApmUdr/wYgtfmiYM+ome4c8L/zDxVAAFz1e0Ztw5mAloG1x5Z
	609hWn1KUW8sIuMZPNkgPENBaUm+03h8MPWIELNqsmVs7IME0F+1pcGENFlh4HM+BS5oxFEy+OfG5
	1lilSpmtGzTFBVMnNM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedeH-00E1Zh-0h;
	Fri, 08 Sep 2023 15:43:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedeB-00E1YZ-2W
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 15:43:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2051261502;
	Fri,  8 Sep 2023 15:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F46C433C9;
	Fri,  8 Sep 2023 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694187830;
	bh=nvtvLaa0FoHyowq+s+FNMuvJVWJKzmwnQCxC99FMXow=;
	h=From:To:Cc:Subject:Date:From;
	b=taR3O9MNcKUhRi9Ue07COaSLrdRP7Bwc2UjsV2YdJabPs79M5xh0VL8nlBps3QU+g
	 byQzj9RXhIGd7LS4AF0A8W7mTY6sMDL8YCg1wLN9MYueIVFiAwbI77YWVX1ZpEJDYP
	 r/wC3TZyyer76nRla5GLZxG7KQLbvZVwkkr/bPsx7oUlldrV5JXeqsS46WIuzCtFsE
	 csbmxrSLSWULw2SJcgPdfU035pVRDa9g1vx2DTpGh6eHn80DXo+0xm7+mMFEde8+Fv
	 icCwd8P9HyqCBKQhEUme310+4zqQ+PMeyyhfIUb79PkpGCV1e5ppOBvtqPoizZUIz5
	 4JyW3XdFN4Ivg==
From: guoren@kernel.org
To: guoren@kernel.org,
	David.Laight@ACULAB.COM,
	will@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	longman@redhat.com,
	maobibo@loongson.cn,
	mjguzik@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3] asm-generic: ticket-lock: Optimize arch_spin_value_unlocked
Date: Fri,  8 Sep 2023 11:43:39 -0400
Message-Id: <20230908154339.3250567-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_084351_899103_C72E0B89 
X-CRM114-Status: GOOD (  11.37  )
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

The arch_spin_value_unlocked of ticket-lock would cause the compiler to
generate inefficient asm code in riscv architecture because of
unnecessary memory access to the contended value.

Before the patch:
------
void lockref_get(struct lockref *lockref)
{
  78:   fd010113                add     sp,sp,-48
  7c:   02813023                sd      s0,32(sp)
  80:   02113423                sd      ra,40(sp)
  84:   03010413                add     s0,sp,48

0000000000000088 <.LBB296>:
        CMPXCHG_LOOP(
  88:   00053783                ld      a5,0(a0)
------

After the patch:
------
void lockref_get(struct lockref *lockref)
{
        CMPXCHG_LOOP(
  78:   00053783                ld      a5,0(a0)
------

After the patch, the lockref_get could get in a fast path instead of the
function's prologue. This is because ticket lock complex logic would
limit compiler optimization for the spinlock fast path, and qspinlock
won't.

The caller of arch_spin_value_unlocked() could benefit from this
change. Currently, the only caller is lockref.

Acked-by: Waiman Long <longman@redhat.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
Changelog
V3:
 - Add Acked-by tags
 - Optimize commit log

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
