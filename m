Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6D7C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 06:28:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA1E61883
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 06:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA1E61883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iMpMwodnNxb1io9cgRcuHMqH5jZLaIGfhLV8ocyOU3g=; b=ey62srT08gthoOIsAt2iIIp4g
	UDLswEPi0mhaKxPZoLa/JE/UJa9JD+JzIF7tYw7z26U1y5GTkVYxtiuL2fW89yq5Q3jng6mGUWFv7
	basLcnBkTF9Fl0G6cQCvwnGcyJDXn/tLoA3jdiU5o//QX40K2s53V7UE4Bq94i3s2jJiJ5MH6D390
	7agt1+qP6QbBvQ9lgULz/Mi0RvSTsOguoXPDdXtANjSF+EmuQutCY9Gjx1TncNMl0+dWNNq3++PKo
	zndW5kOQMk1nYBgZcISson/h9naoRRTz7OPkvkNhhQdQF0CKRxTzSs+NlWPlBw51QAQfUbmP6wI1H
	0YNL2PfMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7rH-002pwL-43; Tue, 30 Mar 2021 06:28:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7rB-002pvg-EV
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 06:28:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EF8561969
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617085684;
 bh=nayM5SKcKbHhEUcOm1Bpv22PdU7DGZfI45+sXYoCtTE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IMv2XD/wEsVjpGtT55oa1LNc8j8RhbdTKjnNQ5KxitgKHLKqBILXoWrnh+x6ttIrA
 q1J2ephhR/I+5tbpOWeMuB3USIbVJVtaYngvXciiXFf9EoW5AJMfUlYa/upofTvij7
 92BAKbaWUOLgdgyBp9vx8sTXcXC0m/FMahnH8oTzjzNcv1QNpGPFX9wB24ghUbUrxV
 uJNCGihskGr9rgMAHL/U1Ix6m5+kb2J5EeEygcWzA+S9GwRcZlNAr1DH4PD2CXYBx1
 wW2pFlV8bEtbCUoixFLJ4Wcl7LC7ClMjMpphge7lJj98NFp7lmQEnUO+ukZ6tRkNZJ
 NT3E+9qpRLMIg==
Received: by mail-lf1-f46.google.com with SMTP id 12so11679333lfq.13
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 23:28:03 -0700 (PDT)
X-Gm-Message-State: AOAM533J736vYL1GWQexKQb+E1Nze/97s5YSL3hHBPK9shRtAE53CEwW
 AMJ++QFe+69vOhKbAn8/KTun+shCYLmsM3PvHgs=
X-Google-Smtp-Source: ABdhPJzWJhIlP8ARSkCvemMJ/FDg5buGQEms6F/qyqWvpnvopcR6D0UAUgTZIBVE9j5JQUWiWacZQWv2FbJpDMaNh5s=
X-Received: by 2002:a05:6512:3709:: with SMTP id
 z9mr18100548lfr.557.1617085681939; 
 Mon, 29 Mar 2021 23:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <DM6PR04MB62011884B58F1F4BD5909D308D7D9@DM6PR04MB6201.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB62011884B58F1F4BD5909D308D7D9@DM6PR04MB6201.namprd04.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Mar 2021 14:27:50 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT5_RnAsYuO-Co1TeURPDAvwgKZb2hRfxdxbnd0ZZL9hw@mail.gmail.com>
Message-ID: <CAJF2gTT5_RnAsYuO-Co1TeURPDAvwgKZb2hRfxdxbnd0ZZL9hw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_072805_969138_08E45B96 
X-CRM114-Status: GOOD (  25.18  )
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

On Tue, Mar 30, 2021 at 12:54 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Guo Ren <guoren@kernel.org>
> > Sent: 30 March 2021 08:44
> > To: Peter Zijlstra <peterz@infradead.org>
> > Cc: linux-riscv <linux-riscv@lists.infradead.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; linux-csky@vger.kernel.org; linux-arch
> > <linux-arch@vger.kernel.org>; Guo Ren <guoren@linux.alibaba.com>; Will
> > Deacon <will@kernel.org>; Ingo Molnar <mingo@redhat.com>; Waiman
> > Long <longman@redhat.com>; Arnd Bergmann <arnd@arndb.de>; Anup
> > Patel <anup@brainfault.org>
> > Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
> > ARCH_USE_QUEUED_SPINLOCKS_XCHG32
> >
> > On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org>
> > wrote:
> > >
> > > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > > u32 a = 0x55aa66bb;
> > > > u16 *ptr = &a;
> > > >
> > > > CPU0                       CPU1
> > > > =========             =========
> > > > xchg16(ptr, new)     while(1)
> > > >                                     WRITE_ONCE(*(ptr + 1), x);
> > > >
> > > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> > >
> > > Then I think your LL/SC is broken.
> > >
> > > That also means you really don't want to build super complex locking
> > > primitives on top, because that live-lock will percolate through.
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
> >
> >
> > >
> > > Step 1 would be to get your architecute fixed such that it can provide
> > > fwd progress guarantees for LL/SC. Otherwise there's absolutely no
> > > point in building complex systems with it.
> >
> > Quote Waiman's comment [1] on xchg16 optimization:
> >
> > "This optimization is needed to make the qspinlock achieve performance
> > parity with ticket spinlock at light load."
> >
> > [1] https://lore.kernel.org/kvm/1429901803-29771-6-git-send-email-
> > Waiman.Long@hp.com/
> >
> > So for a non-xhg16 machine:
> >  - ticket-lock for small numbers of CPUs
> >  - qspinlock for large numbers of CPUs
> >
> > Okay, I'll put all of them into the next patch
>
> I would suggest to have separate Kconfig opitons for ticket spinlock
> in Linux RISC-V which will be disabled by default. This means Linux
> RISC-V will use qspinlock by default and use ticket spinlock only when
> ticket spinlock kconfig is enabled.
OK

>
> Regards,
> Anup



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
