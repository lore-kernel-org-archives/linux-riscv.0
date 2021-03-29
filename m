Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B604EC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:29:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CDF601FD
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CDF601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YzZgLf5gPnnN5bIZm2NUNuO1yZvtpHpRSwxN9NfkGZs=; b=m9KXFYRt1d7g1WJowb53KZ2/1
	oxUvDI3G+pU+HCuSDo5N0QK8RBpChLD6nDnqYHoMoDqI6gXY3AtJ/kXB5CpwZQmbuM/5fAOhTb37+
	tzWkwdG0MJAn1pEiCmnPuPHGbjLrYzi1ZSZvhi4Zp8UW9IDyZn5DkFkbdRpF9DaVsLPXIESb0AkZI
	Ffg+TcRh7vKDPxRLesniveqaRMV3TGCLWWfJz2Q8Wc/KuAWYXAHAEOAlajc4/LmyQigX8PsGdV+tS
	qgEstOYKyW1PxxbCBYR6LD2521aVJf0iCpCyLwjEQBB9hGwaXdmcfxwR2nV4sBmZpKeN9O/4T+wNu
	/oUG6JTjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxZG-001FX2-S6; Mon, 29 Mar 2021 19:28:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqai-000dEh-6c
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 12:01:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3153D6195C
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 12:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617019314;
 bh=UT+UrRIVgNhbmAkKeg6HsueNZaK8AB1/0MS5NZZ5NQU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MfOCEZUNUnR4dKPxmau5OQU9kxgxhGvwo8N3JR/s148VGWrMMAXEH9mfymMgQHnNI
 YhluAI+zInviPvrAzt7wGZUmUh24tq3e4VUhcVfmrQG16kSpgI34Eop4Epu9GViqs/
 IVmw0BZ5JkW63+MoqQ6G98fb6T2mfyqZ3IP+ltAjR0AILOFUyaO7MNL3hyVm/5bPws
 gCi9d/jWTSzGzH6MVMCsFqvbEQnKc5jTCLn7HLSVlr+Xmmw1KvMQXyicd6Uc2kzljR
 404UjwjSmNXVdzJce57PFhk1eGmE8j82NwIiXy6V+pb94GZGHpnIFXPED1fvDHqRUM
 VFkV5eigHQKew==
Received: by mail-lj1-f178.google.com with SMTP id 184so15576799ljf.9
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 05:01:54 -0700 (PDT)
X-Gm-Message-State: AOAM5324qeetln0Zu6B3KKNLEVvHEzhUwtz+1oHlUcIXRHJtB/dZGadS
 U+z5A62k5jzA7kMxhZgubT73IwOcD/sUfVqysmU=
X-Google-Smtp-Source: ABdhPJzaBfHptHYx2DLdzeLBCg5t7USdDIneRxDhGd2vvHRCAncwdw++SOaq3bmLo7VgUJwtyPywTZc5e3lJtCC4kNI=
X-Received: by 2002:a2e:9084:: with SMTP id l4mr17142105ljg.498.1617019312425; 
 Mon, 29 Mar 2021 05:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
In-Reply-To: <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Mar 2021 20:01:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
Message-ID: <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_130156_653400_689CD5C8 
X-CRM114-Status: GOOD (  21.37  )
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

On Mon, Mar 29, 2021 at 7:26 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Mar 29, 2021 at 07:19:29PM +0800, Guo Ren wrote:
> > On Mon, Mar 29, 2021 at 3:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Sat, Mar 27, 2021 at 06:06:38PM +0000, guoren@kernel.org wrote:
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > >
> > > > Some architectures don't have sub-word swap atomic instruction,
> > > > they only have the full word's one.
> > > >
> > > > The sub-word swap only improve the performance when:
> > > > NR_CPUS < 16K
> > > >  *  0- 7: locked byte
> > > >  *     8: pending
> > > >  *  9-15: not used
> > > >  * 16-17: tail index
> > > >  * 18-31: tail cpu (+1)
> > > >
> > > > The 9-15 bits are wasted to use xchg16 in xchg_tail.
> > > >
> > > > Please let architecture select xchg16/xchg32 to implement
> > > > xchg_tail.
> > >
> > > So I really don't like this, this pushes complexity into the generic
> > > code for something that's really not needed.
> > >
> > > Lots of RISC already implement sub-word atomics using word ll/sc.
> > > Obviously they're not sharing code like they should be :/ See for
> > > example arch/mips/kernel/cmpxchg.c.
> > I see, we've done two versions of this:
> >  - Using cmpxchg codes from MIPS by Michael
> >  - Re-write with assembly codes by Guo
> >
> > But using the full-word atomic xchg instructions implement xchg16 has
> > the semantic risk for atomic operations.
>
> What? -ENOPARSE

u32 a = 0x55aa66bb;
u16 *ptr = &a;

CPU0                       CPU1
=========             =========
xchg16(ptr, new)     while(1)
                                    WRITE_ONCE(*(ptr + 1), x);

When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.

>
> > > Also, I really do think doing ticket locks first is a far more sensible
> > > step.
> > NACK by Anup
>
> Who's he when he's not sending NAKs ?
We've talked before:
https://lore.kernel.org/linux-riscv/CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com/T/#t

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
