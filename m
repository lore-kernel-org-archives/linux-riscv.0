Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36A6CCF2D4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 01:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCcbC8XF7RvrB2/sXMdFjMwG1+7cXmzSKD6padA3iac=; b=YZfGmPhJwFZAnK
	uHiC0viF8T8T6Mnv4QU+eQWiMFf7u+OOAjid87oft0SBsiynBw8g5ra8uqWFyAtGsrDM2iUXqnVws
	K4P98Ttx7i8cORsSO4XTyIUlH5vjdIAX0hE38bq5N1/ClBtmmfFLaXh/sadeRYb6XR1AeIQuK1ALg
	E+OIg3cdqZ54oj4z9nn47eBiRQ65F78pkC7KdNKvlcpdNWLHr2GdCZDveFh0IgOoaswcbDmKDooqk
	r2UTdJlYvPD2GZj7OoGu6WWUK5Bdo1UmjfDbslfsoe66myaVper6DAZRPijDUVg3VDNunMJ7gDs3v
	qlV+arW2TqR9fPmtXdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcHO-00000006Ohx-19Tk;
	Mon, 19 Oct 2026 01:35:10 +0000
Received: from seashell.cherry.relay.mailchannels.net ([23.83.223.162])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcHL-00000006OhX-2ATR
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 01:35:09 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 92563461F9B;
	Mon, 19 Oct 2026 01:35:06 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (100-96-7-166.trex-nlb.outbound.svc.cluster.local [100.96.7.166])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2BFA2461E98;
	Mon, 19 Oct 2026 01:35:02 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Exultant-Well-Made: 527d0515463621f7_1792373706455_3594791401
X-MC-Loop-Signature: 1792373706455:4251318137
X-MC-Ingress-Time: 1792373706455
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.7.166 (trex/8.0.2);
	Mon, 19 Oct 2026 01:35:06 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4j7J513j12zPK;
	Sun, 18 Oct 2026 18:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792373702;
	bh=1yFSlPhXf+ABAGiQCmcQHVBU3wg4SKS/vtsXYTbxkJE=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=p8rGh+puOj8/luOGdZJjR++9KIJadf4MK26ALO0jhZOEwt0zzqrzHJIBfKzO95jEM
	 YY7gco2uGnQWvR2j2NKebHdjhFim4jherr9SHPoCGlBe8DnrndQVnI8td8uUmxjb+/
	 zDNHOI8QH37XhQcB16VP/+ZhJUM8ZN/alt1KdV4RA4OATM285mqrUhVTEV+iJMjGOH
	 hMzhOt0jPQM+Y8VP/cooBS0LjsrgYnmv14hOHR6d5WNJjigqEzHSzMSTjwRrsEkE27
	 LVtCIN48O1H/O7aC7SSwlbKUz7hKgguDFYGY8wnlQ9eIdHJ5QVNhYJRgCye5LJ5bFT
	 oT4xLZMDlmI+w==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	parri.andrea@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: Avoid smp_mb__after_spinlock() fences on non-SMP
Date: Sun, 18 Oct 2026 18:34:56 -0700
Message-Id: <20261019013456.1898839-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_183508_592383_F7D27959 
X-CRM114-Status: GOOD (  13.08  )
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

smp_mb__after_spinlock() is defined in asm/barrier.h, which
linux/spinlock.h includes unconditionally, so non-SMP kernels get
RISCV_FENCE(iorw, iorw) as well and emit a full fence.

The other architectures that override it, arm64, csky, powerpc and
xtensa, define it in asm/spinlock.h, which linux/spinlock.h only
includes for CONFIG_SMP, so their non-SMP builds get the generic
kcsan_mb() fallback. Move the riscv definition, the SMP fence is
unchanged.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/barrier.h  | 27 ---------------------------
 arch/riscv/include/asm/spinlock.h | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 700ba3f922cb..2284473844d8 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -24,33 +24,6 @@
 #define __smp_rmb()	RISCV_FENCE(r, r)
 #define __smp_wmb()	RISCV_FENCE(w, w)
 
-/*
- * This is a very specific barrier: it's currently only used in two places in
- * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
- * orderings it guarantees, but the "critical section is RCsc" guarantee
- * mandates a barrier on RISC-V.  The sequence looks like:
- *
- *    lr.aq lock
- *    sc    lock <= LOCKED
- *    smp_mb__after_spinlock()
- *    // critical section
- *    lr    lock
- *    sc.rl lock <= UNLOCKED
- *
- * The AQ/RL pair provides a RCpc critical section, but there's not really any
- * way we can take advantage of that here because the ordering is only enforced
- * on that one lock.  Thus, we're just doing a full fence.
- *
- * Since we allow writeX to be called from preemptive regions we need at least
- * an "o" in the predecessor set to ensure device writes are visible before the
- * task is marked as available for scheduling on a new hart.  While I don't see
- * any concrete reason we need a full IO fence, it seems safer to just upgrade
- * this in order to avoid any IO crossing a scheduling boundary.  In both
- * instances the scheduler pairs this with an mb(), so nothing is necessary on
- * the new hart.
- */
-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
-
 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 52f11bfd0079..54bd8db8eb4f 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -3,6 +3,33 @@
 #ifndef __ASM_RISCV_SPINLOCK_H
 #define __ASM_RISCV_SPINLOCK_H
 
+#include <asm/fence.h>
+
+/*
+ * This is a very specific barrier.  See include/linux/spinlock.h for the two
+ * orderings it guarantees, but the "critical section is RCsc" guarantee
+ * mandates a barrier on RISC-V.  The sequence looks like:
+ *
+ *    lr.aq lock
+ *    sc    lock <= LOCKED
+ *    smp_mb__after_spinlock()
+ *    // critical section
+ *    lr    lock
+ *    sc.rl lock <= UNLOCKED
+ *
+ * The AQ/RL pair provides a RCpc critical section, but there's not really any
+ * way we can take advantage of that here because the ordering is only enforced
+ * on that one lock.  Thus, we're just doing a full fence.
+ *
+ * Since we allow writeX to be called from preemptive regions we need at least
+ * an "o" in the predecessor set to ensure device writes are visible before the
+ * task is marked as available for scheduling on a new hart.  While I don't see
+ * any concrete reason we need a full IO fence, it seems safer to just upgrade
+ * this in order to avoid any IO crossing a scheduling boundary.  The
+ * scheduler pairs this with an mb(), so nothing is necessary on the new hart.
+ */
+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
+
 #ifdef CONFIG_QUEUED_SPINLOCKS
 #define _Q_PENDING_LOOPS	(1 << 9)
 #endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
