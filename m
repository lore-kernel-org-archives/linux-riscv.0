Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314D3C5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:09:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD3762076B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+9xEsgx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+Hz6J02"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD3762076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NqT+7+c/b1zeTHfwXCj5nKOR6x9PBpDbpi/sltDOoMM=; b=e+9xEsgxMYOYBdxp+catZ3ao0
	81MkI9/CcijYf8GjgrjYi7O21eIQqVJ93BSDNWLvVyWr/g2FJaZh8f5nohkfBHcI9qbCikTHKw88u
	wuwzSeQgs89XtukAoDkeNteK1bs5GUVkIwIhNHN4SqkrLcnR46r2UOZc/7sSYs0h6wT4a+4tzg+VG
	5osdfTcHDQ+WUnNtQMRBrT81b3AiU06h3DnXsS72r8aP0QU8YrUMDlaCkG4nYeXdbTAPZZAsW394v
	DIRsJheR/njx5yjLW/zeUqczq5hMLE1cWJlIadAUt+Ds70kAIGCHS5kP7J0pXPXHzBR2aHpfTqvBr
	KQyFv03Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khvUO-0002b2-06; Wed, 25 Nov 2020 14:09:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvUL-0002aG-E6
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 14:09:42 +0000
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B30A2076B
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313380;
 bh=yrOjx1H0BOl7yqO9YN4z/PIF02I6g+lpmxV/KJQECTs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X+Hz6J02dmJiTCqC1LtylAV0E8sIZQR8qXZIyS2rYijCBCK3OdhRn2UXvk6WQdoVt
 h7B7URV1sMI4tK3zeJl8U94EZBbKLtkcCqBzIaBRo0LXqp7m0r8TIdioUZdzWskPy9
 2CzgBqKStENmNU+066s1Non2l7kR0N/CAKepSZJQ=
Received: by mail-lj1-f174.google.com with SMTP id 142so2401900ljj.10
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 06:09:40 -0800 (PST)
X-Gm-Message-State: AOAM533ehnEX8AU5wfUvCRIm9F1umC8KEElGha6pggGbJeX4DHbYMn+i
 31cRhjjD3VfwZeo3sgnYbYNLmvRqhIq2BSgkpr8=
X-Google-Smtp-Source: ABdhPJzE2tKNM/HUqwllZoE0zX54dUjodWRa76hsIf5p2+6KmS+voJMh729PHrBQeWPYcFftbjgcW+xcjzc5kseyoLs=
X-Received: by 2002:a2e:8e6c:: with SMTP id t12mr1441948ljk.441.1606313378438; 
 Wed, 25 Nov 2020 06:09:38 -0800 (PST)
MIME-Version: 1.0
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
 <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1ykYmpXtjVbeAjLPY0AtfQTpL9jJ8e6SokiTb=J9UhnQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Nov 2020 22:09:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQzDMwCALuZ05OAUdU7xZEijyHpOFpStiBQin3Y5RUDVg@mail.gmail.com>
Message-ID: <CAJF2gTQzDMwCALuZ05OAUdU7xZEijyHpOFpStiBQin3Y5RUDVg@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_090941_648334_0497CA5C 
X-CRM114-Status: GOOD (  21.27  )
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
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 11:00 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
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

This can be concluded as the different effectiveness between cmpxchg
and xchg. For the arch which only has lr/sc instructions, the cmpxchg
& xchg are similar.

#if _Q_PENDING_BITS == 8

static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
{
        /*
         * We can use relaxed semantics since the caller ensures that the
         * MCS node is properly initialized before updating the tail.
         */
        return (u32)xchg_relaxed(&lock->tail,
                                 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
}

#else /* _Q_PENDING_BITS == 8 */

static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
{
        u32 old, new, val = atomic_read(&lock->val);

        for (;;) {
                new = (val & _Q_LOCKED_PENDING_MASK) | tail;
                /*
                 * We can use relaxed semantics since the caller ensures that
                 * the MCS node is properly initialized before updating the
                 * tail.
                 */
                old = atomic_cmpxchg_relaxed(&lock->val, val, new);
                if (old == val)
                        break;

                val = old;
        }
        return old;
}
#endif /* _Q_PENDING_BITS == 8 */


>
> If nothing else needs xchg() on a 16-bit value, maybe
> changing the #ifdef in the qspinlock code is enough.
>
> Only around half the architectures actually implement 8-bit
> and 16-bit cmpxchg() and xchg(), it might even be worth trying
> to eventually change the interface to not do it at all, but
> instead have explicit cmpxchg8() and cmpxchg16() helpers
> for the few files that do use them.
>
>      Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
