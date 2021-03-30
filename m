Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE94C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 16:09:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FC5E6191B
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 16:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FC5E6191B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CNrAWMWioU+d8D1iXwLF4I1h+4hVyVgysDnE/a4IESc=; b=SZVMhzX8Aze01agtVbnQsAj5q
	hbqMPpL3zTW3K2rPbKJc5cLCoZbunDcf2bI55TU9Fs3Zy9CRg9aFJe93JD5HqDNiSwuBod0F38CUs
	5ZwKGg3sgewU7ulZalj2W+5d069+zcV4ioYEzex3pI33mey73KL+e5VansEwMpMp7mdhid0ZSxHMf
	2S6iDhvw3q5h4IWb88MWXyBetp/p6ZkOlqdS1sGMEqYm0zDG4culTuAb2RX7mTBVzKIgHCF+v6bIT
	2S4nSEzgXBs5y9NE7RIiuqjQb/Kb12meUHDUnGGNv9mEbis7nb5X04SxLxeubdoNL3xpubgTH3OQ+
	xOosgSp0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGv9-004J4b-Ad; Tue, 30 Mar 2021 16:08:47 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGv3-004J3i-LK; Tue, 30 Mar 2021 16:08:41 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 392AA3010CF;
 Tue, 30 Mar 2021 18:08:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 266312B85BA0A; Tue, 30 Mar 2021 18:08:40 +0200 (CEST)
Date: Tue, 30 Mar 2021 18:08:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 11:13:55AM +0800, Guo Ren wrote:
> On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > u32 a = 0x55aa66bb;
> > > u16 *ptr = &a;
> > >
> > > CPU0                       CPU1
> > > =========             =========
> > > xchg16(ptr, new)     while(1)
> > >                                     WRITE_ONCE(*(ptr + 1), x);
> > >
> > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> >
> > Then I think your LL/SC is broken.
> >
> > That also means you really don't want to build super complex locking
> > primitives on top, because that live-lock will percolate through.

> Do you mean the below implementation has live-lock risk?
> +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> +{
> +       u32 old, new, val = atomic_read(&lock->val);
> +
> +       for (;;) {
> +               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
> +               old = atomic_cmpxchg(&lock->val, val, new);
> +               if (old == val)
> +                       break;
> +
> +               val = old;
> +       }
> +       return old;
> +}

That entirely depends on the architecture (and cmpxchg() impementation).

There are a number of cases:

 * architecture has cmpxchg() instruction (x86, s390, sparc, etc.).

  - architecture provides fwd progress (x86)
  - architecture requires backoff for progress (sparc)

 * architecture does not have cmpxchg, and implements it using LL/SC.

  and here things get *really* interesting, because while an
  architecture can have LL/SC fwd progress, that does not translate into
  cmpxchg() also having the same guarantees and all bets are off.

The real bummer is that C can do cmpxchg(), but there is no way it can
do LL/SC. And even if we'd teach C how to do LL/SC, it couldn't be
generic because architectures lacking it can't emulate it using
cmpxchg() (there's a fun class of bugs there).

So while the above code might be the best we can do in generic code,
it's really up to the architecture to make it work.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
