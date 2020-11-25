Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD75AC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:16:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1185D206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="be2dr3H9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t2+hx07d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1185D206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NCczgPbWQU0NI5lBumpq33T/vqQQ+/cbDBA/Zt35iJU=; b=be2dr3H9mgx7CPvnSYZH+vIzk
	4SMJcbYTugVTpAh1xqG8N+Kghs29Y2TQPoM4X/KYDUtCaoPB6IKjC6/BtJJiGyuWF0GtMyVQNEIIX
	1f5Xj927xQzW4/Zz+CvaIBHr38gS/LPC6ksDl0kxn9BEtJXfbywz6LRjckJbn8RcgJl1Q1Rc/p/BA
	yWuA4NckBF6QNvGtQkGQXeb75swp/TvIAUInqtoYmlN+BYnaWehyuylc/4cRry0IWh6/Du4bmZPYz
	0EkSSzhMXA1ZJOkzsBXHhdr7XohFEQYhz3rgDWl0+lw1KyCfxnIkB/7kuMbtRMPgcNytUJ+pdkP2W
	9oKCITDHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khvbG-0003Kp-VW; Wed, 25 Nov 2020 14:16:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvbF-0003KZ-4T
 for linux-riscv@merlin.infradead.org; Wed, 25 Nov 2020 14:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bkWlv6t4WmjLGS6BqQLJ1YdqQ5r2KJGPeyZd9P+/K3I=; b=t2+hx07dz3fM5ILEquHQ3WSlOG
 zx4bO8nA6nNTtmzt6RzF7fmj59fl7Bjce5sFilgM/DnvUvrh57JHoMFbYSxDYQAMXORQHqF6eVCGJ
 1zmGCE+0sWqI1Eitk3POVdh9UOueg+DA8X27py/kvkvszY7Hszr64BbV8nthZF7NfFLPPB5W6DOcc
 gd2x4atBTFql+DFqlennoZ5dCetw1DwtBzsnh9QzvmMecz8uWSCg5jNVe2RfQWg30p0ox3M6p7SON
 UWWojAzcQKj9YKThyaDdpV0CnNPJc4Gcn+epiaAPy3G1iBbF1b62ehofFhFJ3B4DpIVi0UiNCPkUA
 xZgli/5A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvbC-0001jV-Qa; Wed, 25 Nov 2020 14:16:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A40C6306E0C;
 Wed, 25 Nov 2020 15:16:45 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6E33D20D6FE66; Wed, 25 Nov 2020 15:16:45 +0100 (CET)
Date: Wed, 25 Nov 2020 15:16:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
Message-ID: <20201125141645.GB2414@hirez.programming.kicks-ass.net>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
 <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 04:00:14PM +0100, Arnd Bergmann wrote:
> On Tue, Nov 24, 2020 at 3:39 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Tue, Nov 24, 2020 at 01:43:54PM +0000, guoren@kernel.org wrote:
> > > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> 
> > > +             if (align) {                                            \
> > > +             __asm__ __volatile__ (                                  \
> > > +                     "0:     lr.w %0, 0(%z4)\n"                      \
> > > +                     "       move %1, %0\n"                          \
> > > +                     "       slli %1, %1, 16\n"                      \
> > > +                     "       srli %1, %1, 16\n"                      \
> > > +                     "       move %2, %z3\n"                         \
> > > +                     "       slli %2, %2, 16\n"                      \
> > > +                     "       or   %1, %2, %1\n"                      \
> > > +                     "       sc.w %2, %1, 0(%z4)\n"                  \
> > > +                     "       bnez %2, 0b\n"                          \
> > > +                     "       srli %0, %0, 16\n"                      \
> > > +                     : "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)      \
> > > +                     : "rJ" (__new), "rJ"(addr)                      \
> > > +                     : "memory");                                    \
> >
> > I'm pretty sure there's a handfull of implementations like this out
> > there... if only we could share.
> 
> Isn't this effectively the same as the "_Q_PENDING_BITS != 8"
> version of xchg_tail()?

Pretty much I suppose.

> If nothing else needs xchg() on a 16-bit value, maybe
> changing the #ifdef in the qspinlock code is enough.

Like the below? I think the native LL/SC variant is slightly better than
the cmpxchg loop. The problem is that cmpxchg() is ll/sc and then we
loop that, instead of only having the ll/sc loop.

> Only around half the architectures actually implement 8-bit
> and 16-bit cmpxchg() and xchg(), it might even be worth trying
> to eventually change the interface to not do it at all, but
> instead have explicit cmpxchg8() and cmpxchg16() helpers
> for the few files that do use them.

Yeah, many RISCs don't have sub-word atomics. Not sure how many other
users there are. qspinlock certainly is the most popular I suppose.

---


diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index cbff6ba53d56..7049fb2af0b2 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -163,26 +163,6 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
 	WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
 }
 
-/*
- * xchg_tail - Put in the new queue tail code word & retrieve previous one
- * @lock : Pointer to queued spinlock structure
- * @tail : The new queue tail code word
- * Return: The previous queue tail code word
- *
- * xchg(lock, tail), which heads an address dependency
- *
- * p,*,* -> n,*,* ; prev = xchg(lock, node)
- */
-static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
-{
-	/*
-	 * We can use relaxed semantics since the caller ensures that the
-	 * MCS node is properly initialized before updating the tail.
-	 */
-	return (u32)xchg_relaxed(&lock->tail,
-				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
-}
-
 #else /* _Q_PENDING_BITS == 8 */
 
 /**
@@ -207,6 +187,32 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
 	atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
 }
 
+#endif /* _Q_PENDING_BITS == 8 */
+
+#if _Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16
+
+/*
+ * xchg_tail - Put in the new queue tail code word & retrieve previous one
+ * @lock : Pointer to queued spinlock structure
+ * @tail : The new queue tail code word
+ * Return: The previous queue tail code word
+ *
+ * xchg(lock, tail), which heads an address dependency
+ *
+ * p,*,* -> n,*,* ; prev = xchg(lock, node)
+ */
+static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
+{
+	/*
+	 * We can use relaxed semantics since the caller ensures that the
+	 * MCS node is properly initialized before updating the tail.
+	 */
+	return (u32)xchg_relaxed(&lock->tail,
+				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
+}
+
+#else /* !(_Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16) */
+
 /**
  * xchg_tail - Put in the new queue tail code word & retrieve previous one
  * @lock : Pointer to queued spinlock structure
@@ -236,7 +242,8 @@ static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
 	}
 	return old;
 }
-#endif /* _Q_PENDING_BITS == 8 */
+
+#endif /* _Q_PENDING_BITS == 8 && ARCH_HAS_XCHG16 */
 
 /**
  * queued_fetch_set_pending_acquire - fetch the whole lock value and set pending

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
