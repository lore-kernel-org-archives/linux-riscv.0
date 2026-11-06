Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBD606A338
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vWXYdmIh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=oBDK2PiW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m61e83ZmqiIoG+U3XpFDtgN7qSw0LpcA+bNRygL1zV0=; b=vWXYdmIh4QS5mfemwZvVrBmNVC
	4XWduOnoXZ8UUmkj7khFKp1dYSUW+bYn7PA0HDq6J+FJvOzXQp0YbGMR/10Dz3AlcjKVd4giQ67jH
	QGiN490ELbdk4hft8RlyFpS1Xj3RjnuITK7E9fbXGswbGXR8H8yFgtL+SBbgMBMjr52jmRfsuIZ2i
	8RgwD8GmTeZfoORfGWGnCQGsARtv5F6J2228ewAAuyM0oqXCEfGacRhLTtbQyTyaazzH14AjPopx2
	vnhg6Ki4ff2lML6YMCnhxQBgFEg23doYHR2N/j75UjcZyHfgcrDR08VQ8r7z0OcrTgBeB7OCc/s/e
	+DyHnM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKwK-0000000CfIa-11ki;
	Fri, 06 Nov 2026 14:29:12 +0000
Received: from heron.birch.relay.mailchannels.net ([23.83.209.82])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKwH-0000000CfHh-3qAq
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:29:11 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F0611942F13;
	Fri, 06 Nov 2026 14:29:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (trex-blue-0.trex.outbound.svc.cluster.local [100.99.198.86])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6BF86942F68;
	Fri, 06 Nov 2026 14:29:06 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Glossy-Industry: 36b28a1f41afe35d_1793975348804_345534686
X-MC-Loop-Signature: 1793975348804:3988946489
X-MC-Ingress-Time: 1793975348804
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.198.86 (trex/8.0.2);
	Fri, 06 Nov 2026 14:29:08 +0000
Received: from offworld (unknown [172.58.167.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4jLhPr3v9Fzymb;
	Fri,  6 Nov 2026 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1793975346;
	bh=ubtLilUuKAm7/ob2XlUVCx3tABcVwsQNjiV/URQNZI4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=oBDK2PiWYd9TnRuGNnVYtOh7QJP8qinw0SiQhj+dAlGWADCEANB7uOunGBSZ2OkAm
	 T+mqINpPuVj2M2ucF3rz3BDkkj7N4hG+zB07OE8enVLdFR3nhh0Z2UGEiaZLTBkwMw
	 JHNY25KYs42H87uurOxJ624W7DgpEwfVz8nL+eQCyANGHs1N0Ggt2Ny3f8C6bzEYys
	 asSeX2V4gxvvDFv1TE+wGNNfbnZpkTlcXVvtWLNBhUmtwzn8sec/z4hsQG2qksiYNE
	 dgs5s/tvqFTt3mbaenSZRSGqIm3vez5R2Es02qXHh9Al38lIUpFRFG0SySFIuFvRVW
	 3xSuQWS+V45gw==
Date: Fri, 6 Nov 2026 06:28:57 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, parri.andrea@gmail.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Avoid smp_mb__after_spinlock() fences on non-SMP
Message-ID: <20261106142857.g5lxebqy6mvv6rtc@offworld>
References: <20261019013456.1898839-1-dave@stgolabs.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019013456.1898839-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_062910_094949_0FFACF07 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: 1.9 (+)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ping?

On Sun, 18 Oct 2026, Davidlohr Bueso wrote:

>smp_mb__after_spinlock() is defined in asm/barrier.h, which
>linux/spinlock.h includes unconditionally, so non-SMP kernels get
>RISCV_FENCE(iorw, iorw) as well and emit a full fence.
>
>The other architectures that override it, arm64, csky, powerpc and
>xtensa, define it in asm/spinlock.h, which linux/spinlock.h only
>includes for CONFIG_SMP, so their non-SMP builds get the generic
>kcsan_mb() fallback. Move the riscv definition, the SMP fence is
>unchanged.
>
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
> arch/riscv/include/asm/barrier.h  | 27 ---------------------------
> arch/riscv/include/asm/spinlock.h | 27 +++++++++++++++++++++++++++
> 2 files changed, 27 insertions(+), 27 deletions(-)
>
>diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
>index 700ba3f922cb..2284473844d8 100644
>--- a/arch/riscv/include/asm/barrier.h
>+++ b/arch/riscv/include/asm/barrier.h
>@@ -24,33 +24,6 @@
> #define __smp_rmb()	RISCV_FENCE(r, r)
> #define __smp_wmb()	RISCV_FENCE(w, w)
>
>-/*
>- * This is a very specific barrier: it's currently only used in two places in
>- * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
>- * orderings it guarantees, but the "critical section is RCsc" guarantee
>- * mandates a barrier on RISC-V.  The sequence looks like:
>- *
>- *    lr.aq lock
>- *    sc    lock <= LOCKED
>- *    smp_mb__after_spinlock()
>- *    // critical section
>- *    lr    lock
>- *    sc.rl lock <= UNLOCKED
>- *
>- * The AQ/RL pair provides a RCpc critical section, but there's not really any
>- * way we can take advantage of that here because the ordering is only enforced
>- * on that one lock.  Thus, we're just doing a full fence.
>- *
>- * Since we allow writeX to be called from preemptive regions we need at least
>- * an "o" in the predecessor set to ensure device writes are visible before the
>- * task is marked as available for scheduling on a new hart.  While I don't see
>- * any concrete reason we need a full IO fence, it seems safer to just upgrade
>- * this in order to avoid any IO crossing a scheduling boundary.  In both
>- * instances the scheduler pairs this with an mb(), so nothing is necessary on
>- * the new hart.
>- */
>-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
>-
> #define __smp_store_release(p, v)					\
> do {									\
> 	compiletime_assert_atomic_type(*p);				\
>diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
>index 52f11bfd0079..54bd8db8eb4f 100644
>--- a/arch/riscv/include/asm/spinlock.h
>+++ b/arch/riscv/include/asm/spinlock.h
>@@ -3,6 +3,33 @@
> #ifndef __ASM_RISCV_SPINLOCK_H
> #define __ASM_RISCV_SPINLOCK_H
>
>+#include <asm/fence.h>
>+
>+/*
>+ * This is a very specific barrier.  See include/linux/spinlock.h for the two
>+ * orderings it guarantees, but the "critical section is RCsc" guarantee
>+ * mandates a barrier on RISC-V.  The sequence looks like:
>+ *
>+ *    lr.aq lock
>+ *    sc    lock <= LOCKED
>+ *    smp_mb__after_spinlock()
>+ *    // critical section
>+ *    lr    lock
>+ *    sc.rl lock <= UNLOCKED
>+ *
>+ * The AQ/RL pair provides a RCpc critical section, but there's not really any
>+ * way we can take advantage of that here because the ordering is only enforced
>+ * on that one lock.  Thus, we're just doing a full fence.
>+ *
>+ * Since we allow writeX to be called from preemptive regions we need at least
>+ * an "o" in the predecessor set to ensure device writes are visible before the
>+ * task is marked as available for scheduling on a new hart.  While I don't see
>+ * any concrete reason we need a full IO fence, it seems safer to just upgrade
>+ * this in order to avoid any IO crossing a scheduling boundary.  The
>+ * scheduler pairs this with an mb(), so nothing is necessary on the new hart.
>+ */
>+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
>+
> #ifdef CONFIG_QUEUED_SPINLOCKS
> #define _Q_PENDING_LOOPS	(1 << 9)
> #endif
>-- 
>2.39.5
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
