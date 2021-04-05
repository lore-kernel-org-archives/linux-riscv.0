Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADD1C43460
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:47:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02EB8613B3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02EB8613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NkW/0Ux5Hw24HKPhsQE8MMMmyxamjLGQxTHc+CxyQTo=; b=K0tuUJ+PQOYxJeAUDqhjETqA+
	CJCrkvWaRXY7pL/99rEk9Mg+RCBaw/Tkp+g7Rt8BAJyWQwxr/YZgTg4ATVWm3LCrKuthNvSEi/20N
	m/zYyFQCUrVfNPBYRZJzFJdfdoRjSj/uhbnwMHWNhVpr0evj6JE61JJDPUOkxZxPFjMul57Ce6z6O
	YBENvtG6OX0h8V/TAVSll+pFaUIefdUBIkUAfjAcxA40SCgXBkoMz1xiOwJAhVPhysNvF2+mXHM4P
	q+Z3OxXksq0oxPlspqNIcPi5VjoJQl84g62EyyMuS8LgNiGWMyAGm8Ri2zW6kiXDvMTnM0mOVC7JP
	SwgtaR/xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTSOC-000AM1-5x; Mon, 05 Apr 2021 16:47:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTSMf-0009WI-S7
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 16:46:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99863613B3
 for <linux-riscv@lists.infradead.org>; Mon,  5 Apr 2021 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617641171;
 bh=nvXi4hYjQxujRN4W9KX3qS1fYgktkx9tedrpn6VjnDc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RlQ968+XZPkxh4H4fUz40bass2S4a1/vvr7ZiRUENSQ/lZZvcsCPaF8x04S4dzAhY
 NRj1KwLDMv9NJaoqZluvZXvNjZCslGhiWX/xuBcuhT0nNQQd/PL2pOf9XKgWGdClR9
 UZKUdzf8miHfubM6/dgnqGNCkJqyr8iLr0BcwWyK4ZrMAcMRdNJUG1ZmcH6BtyGpB5
 Oh0CrE7HqxSemnA7sRe+RaeQOSyArV0rG5/KlMcsRlfCT+pvoK04a5zlNEQK3M1QZ9
 k33knWxLblGn8GQp+lMolxGEwuQQnW4YsEzM+MOk2AKSu9WRU8NMJMxyDhcIElNU8t
 eRwTkjKC7qQZQ==
Received: by mail-lj1-f175.google.com with SMTP id u9so13291131ljd.11
 for <linux-riscv@lists.infradead.org>; Mon, 05 Apr 2021 09:46:11 -0700 (PDT)
X-Gm-Message-State: AOAM533mNhU9gPTkNPu9/YHboNzGTha1mhBJPMJAgELLG7+ML5m9+xnS
 nH5qknqdgSapy5Vy8/xshZePXnPhjeJTTLEhliA=
X-Google-Smtp-Source: ABdhPJw0FTyLwg6e/Tk15+o6HkD8pB40TY7P5ksg6HGPRcBX1Fy6riyYpCNQKZz84He3ZLobLKsH9V3hAX6HoOnLlIA=
X-Received: by 2002:a2e:a7d4:: with SMTP id x20mr16378736ljp.285.1617641169881; 
 Mon, 05 Apr 2021 09:46:09 -0700 (PDT)
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
Date: Tue, 6 Apr 2021 00:45:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRN2FLUbJzwsgitMg2j3sMRcq5a1Gm5dTQivuiakmAdOQ@mail.gmail.com>
Message-ID: <CAJF2gTRN2FLUbJzwsgitMg2j3sMRcq5a1Gm5dTQivuiakmAdOQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210405_174614_338587_E74323A9 
X-CRM114-Status: GOOD (  26.56  )
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
Yes, I think is ok for LR/SC in riscv, becasue

CPU0 LR
CPU1 LR
CPU0 SC //success
CPU1 SC //fail

or

CPU0 LR
CPU1 LR
CPU1 SC //success
CPU0 SC //fail

So always one store condition would success. I think it's OK.

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
I Agree

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
