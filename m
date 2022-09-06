Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7938ECAAD3
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g55XCqwv1SeM8iMVXxXU2LtdNOaTvk49Uhhrt/vr39o=; b=ziMlLOcfD4lZnm
	+6Rd1/UxWwZ2MY8ftISge990PXdIH9MEFSZNo6505hTuLu6ZSVK3O7TMRVWjIhL6oWOAya5g17mMS
	qo6rjaPvzvbl6bNK20kFSi0kEA8QKGfYI5XlyzRit76g/SHQvQi/m9VAGobxpCGA3yu85kQjpowOw
	Jf65gvf2rwGAMWs44FKwOD60VdhJcI7ufxynkkHQG4HopHBeeByeA5GQhhUYP9EdadCeZ27QMTS5B
	1Xi1jDv28iS823V5JD3oTNqgHIIR75vo3wx7vx9Z9jQBwL1eWa3yjd8PcmY9ykxucEd7T8JK1ISzV
	JyeOrKkE2jUQLQBxHBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNom-001Vk5-IP; Tue, 06 Sep 2022 01:56:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNoZ-001VfQ-Aw
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:55:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95507B815CE
	for <linux-riscv@lists.infradead.org>; Tue,  6 Sep 2022 01:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5734EC43145
	for <linux-riscv@lists.infradead.org>; Tue,  6 Sep 2022 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662429343;
	bh=pfS9CNoNEvfoyh2//nxqJD7uVg2c1QLB5aCtER50Z68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=loW/9YLv0rlmMEisudZVQNOFn1n6b22KNurVwZJY2+3OBiucKcZmNwklJUdkYGpQ6
	 WJdaxBb2Z+A2Zh0WRY5pZA57oUPw5K81bx1BQ8tKj00cHB94sa4qe5msnzBY1LtVkT
	 S51UUNMUOw0qDOdJ37JDmiNhsuxw+sY+Id2r1uFqfi028kLd31FORnYLfUL90x+KN5
	 KbJWTwNsBBHF21RQ3qWP8kheVIfcbrOsFRhVKhsVVWoqvi8BbnZbVzK/EPoaCENT/B
	 9q/LLsRJK3ZxBN7glmWf9O7WKIbsRQdLvP+2SSZBBxSMzfGN2l/Ad0X+uGkdQhhkbS
	 P9DYMVM3K1cZA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-11f34610d4aso24968700fac.9
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:55:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo2b6C+UKIKl+UBQ/PxcUyl8v6sL4GmA+QiczvWpK/zyBBtjRDXd
	e7Ln/510EfFvpw9fzdapQqpL5rlB2ZflY7eFyKE=
X-Google-Smtp-Source: AA6agR7+5Qkc1US3xZc6AzhwYNjNc26fVd4ocphyutdMyyGHQ7xzYM2uClin5e5pQtitt6PZnV/fiLM2jxFlHInyKGc=
X-Received: by 2002:a05:6870:7092:b0:11e:ff3a:d984 with SMTP id
 v18-20020a056870709200b0011eff3ad984mr10071831oae.19.1662429342398; Mon, 05
 Sep 2022 18:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220904072637.8619-1-guoren@kernel.org> <YxX3CZQEe86u052D@xhacker>
In-Reply-To: <YxX3CZQEe86u052D@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Sep 2022 09:55:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTYgKPMTUaHZn1n7qPmW3cPkxmx5xPurdGSg1h4tMqNqQ@mail.gmail.com>
Message-ID: <CAJF2gTTYgKPMTUaHZn1n7qPmW3cPkxmx5xPurdGSg1h4tMqNqQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] riscv: Add GENERIC_ENTRY, IRQ_STACKS support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_185548_270471_29BC60F7 
X-CRM114-Status: GOOD (  23.08  )
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

On Mon, Sep 5, 2022 at 9:27 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Sun, Sep 04, 2022 at 03:26:31AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The patches convert riscv to use the generic entry infrastructure from
> > kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to
>
> Amazing! You read my mind. I planed to do similar series this week, as
I'm happy you liked it.

> can be seen, I didn't RESEND the riscv irqstack patch, I planed to add
> irqstack after generic entry. Thanks for this series.
>
> Will read and test your patches soon. A minor comments below.
Thx, any tests and reviews are helpful.

>
> > prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
> > feature for the IRQ_STACKS config. You can try it directly with [1].
> >
> > [1] https://github.com/guoren83/linux/tree/generic_entry_v2
> >
> > Changes in V2:
> >  - Fixup compile error by include "riscv: ptrace: Remove duplicate
> >    operation"
> >    https://lore.kernel.org/linux-riscv/20220903162328.1952477-2-guoren@kernel.org/T/#u
> >  - Fixup compile warning
> >    Reported-by: kernel test robot <lkp@intel.com>
> >  - Add test repo link in cover letter
> >
> > Guo Ren (6):
> >   riscv: ptrace: Remove duplicate operation
> >   riscv: convert to generic entry
> >   riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
> >   riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
> >   riscv: elf_kexec: Fixup compile warning
> >   riscv: compat_syscall_table: Fixup compile warning
>
> It's better to move these two patches ahead of patch2.
Okay.

>
> >
> >  arch/riscv/Kconfig                    |  10 +
> >  arch/riscv/include/asm/csr.h          |   1 -
> >  arch/riscv/include/asm/entry-common.h |   8 +
> >  arch/riscv/include/asm/irq.h          |   3 +
> >  arch/riscv/include/asm/ptrace.h       |  10 +-
> >  arch/riscv/include/asm/stacktrace.h   |   5 +
> >  arch/riscv/include/asm/syscall.h      |   6 +
> >  arch/riscv/include/asm/thread_info.h  |  15 +-
> >  arch/riscv/include/asm/vmap_stack.h   |  28 +++
> >  arch/riscv/kernel/Makefile            |   1 +
> >  arch/riscv/kernel/elf_kexec.c         |   4 +
> >  arch/riscv/kernel/entry.S             | 255 +++++---------------------
> >  arch/riscv/kernel/irq.c               |  75 ++++++++
> >  arch/riscv/kernel/ptrace.c            |  41 -----
> >  arch/riscv/kernel/signal.c            |  21 +--
> >  arch/riscv/kernel/sys_riscv.c         |  26 +++
> >  arch/riscv/kernel/traps.c             |  11 ++
> >  arch/riscv/mm/fault.c                 |  12 +-
> >  18 files changed, 250 insertions(+), 282 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/entry-common.h
> >  create mode 100644 arch/riscv/include/asm/vmap_stack.h
> >
> > --
> > 2.36.1
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
