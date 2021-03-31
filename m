Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E42C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:48:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065D561007
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065D561007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=to1J51+NbWctQPEP6j2kK5gEhHNEFc+ac9k8SbCgtIU=; b=IZ3eh7hbVhBBnuIvbxUbcDG8Q
	B5jBkgZDOmHW8FMLKPBmstY8QHpn/Tk7HX4N6cRI3w7mp5JOAVrJAr/B0S+mQWpo2deRt3pIcHjXA
	0BBDHHKdr6SiQtTmqNrmkIuSKf42gGXA3bFjp9O6SOcM9k6OE2mcrsuFhj18jSw3Dr4njk+vQC63p
	BrgVUUQV6+FMXtzViJIgeY/bmttcFtMiqsZRtx77HKhqxtvOdnsTtBMzvQlD9f6WNp1gLpDalgxSw
	7ZcVg9DR/8W7GSDT0XcUGBbN2WGvGiD1hl/GJZ8bspHQoKrC8VW6I1+ZFjwNSAxqvrhwHYyRtTfCH
	tQ94OX7RQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRc8i-006pd0-Rx; Wed, 31 Mar 2021 14:48:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRc8e-006pc2-1d
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:48:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 705AF61019
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617202083;
 bh=dXpBkyPDmbez1Pv+mZa7eusgRzqDeW4JZXnYKhHzMk4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Re/nuxKj6QEYHf70+XHtUekdh0SgLtX2v0Dq4k/E/fjt30sf13znsjWRI0kjJM0Au
 n1YlstKhZlykOk+cnE6MvbEJSV7mx0zjGqRTI8VYNp6YFlRgSY8POv5d+N5lZlXh+9
 mwumfHkHrHUZWwbI6qMbkO5mGTY11xCmtyTg6qMQHWYIuO283M9fT2bkKV7qnVE4FJ
 A/0aSitADe9d7Mloan8wwpuLg76c4K5GMvu2c36Pwy1liSOzI4bafKwlbaZkZYzaXR
 Oun1TPpqQB5WRz161Npy3wLI569ki5fUnfLw4UaofWMv4hlLuLYbxBZqf+vXOttInp
 8oLRFyWt3sBhw==
Received: by mail-lf1-f50.google.com with SMTP id d13so8538462lfg.7
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 07:48:03 -0700 (PDT)
X-Gm-Message-State: AOAM530tsjvFlkInHLA78Ymae4YC/ON/elEL0ZVA7/c7pUlcF4YFgsfE
 dSPI1UmK6N6vkd+qSB14lqubfaNxEviLp2D1JVY=
X-Google-Smtp-Source: ABdhPJxV0SkyhL0J9EtcC6qc8ehvvfZdh5JPRdhm6ZIBPp9ZQqcovoazEDBeivA8bcGEP5e3bpkou1wZRXG+mH7U7hM=
X-Received: by 2002:a05:6512:ba2:: with SMTP id
 b34mr2434254lfv.24.1617202081736; 
 Wed, 31 Mar 2021 07:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <4d0dbaa0-1f96-470c-0ed0-04f6827ea384@redhat.com>
In-Reply-To: <4d0dbaa0-1f96-470c-0ed0-04f6827ea384@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 31 Mar 2021 22:47:50 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSavTCv2yyGvMyHWXapN2nWG17Z02catYJgC3s-hYco9g@mail.gmail.com>
Message-ID: <CAJF2gTSavTCv2yyGvMyHWXapN2nWG17Z02catYJgC3s-hYco9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_154809_324848_2CD6DC52 
X-CRM114-Status: GOOD (  27.05  )
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

On Tue, Mar 30, 2021 at 10:09 PM Waiman Long <longman@redhat.com> wrote:
>
> On 3/29/21 11:13 PM, Guo Ren wrote:
> > On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >> On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> >>> u32 a = 0x55aa66bb;
> >>> u16 *ptr = &a;
> >>>
> >>> CPU0                       CPU1
> >>> =========             =========
> >>> xchg16(ptr, new)     while(1)
> >>>                                      WRITE_ONCE(*(ptr + 1), x);
> >>>
> >>> When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> >> Then I think your LL/SC is broken.
> >>
> >> That also means you really don't want to build super complex locking
> >> primitives on top, because that live-lock will percolate through.
> > Do you mean the below implementation has live-lock risk?
> > +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > +{
> > +       u32 old, new, val = atomic_read(&lock->val);
> > +
> > +       for (;;) {
> > +               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
> > +               old = atomic_cmpxchg(&lock->val, val, new);
> > +               if (old == val)
> > +                       break;
> > +
> > +               val = old;
> > +       }
> > +       return old;
> > +}
> If there is a continuous stream of incoming spinlock takers, it is
> possible that some cpus may have to wait a long time to set the tail
> right. However, this should only happen on artificial workload. I doubt
> it will happen with real workload or with limit number of cpus.
Yes, I agree or it couldn't with NR_CPU > 16k.

So the implementation above is suitable for non-sub-word-xchg architecture.

> >
> >> Step 1 would be to get your architecute fixed such that it can provide
> >> fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
> >> in building complex systems with it.
> > Quote Waiman's comment [1] on xchg16 optimization:
> >
> > "This optimization is needed to make the qspinlock achieve performance
> > parity with ticket spinlock at light load."
> >
> > [1] https://lore.kernel.org/kvm/1429901803-29771-6-git-send-email-Waiman.Long@hp.com/
> >
> > So for a non-xhg16 machine:
> >   - ticket-lock for small numbers of CPUs
> >   - qspinlock for large numbers of CPUs
> >
> > Okay, I'll put all of them into the next patch :P
> >
> It is true that qspinlock may not offer much advantage when the number
> of cpus is small. It shines for systems with many cpus. You may use
> NR_CPUS to determine if the default should be ticket or qspinlock with
> user override. To determine the right NR_CPUS threshold, you may need to
> run on real SMP RISCV systems to find out.
We'd give the choice to the users, and they could select ticket-lock
or qspinlock in riscv.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
