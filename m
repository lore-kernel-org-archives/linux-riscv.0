Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4F6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 02:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Us9hoJONdPYoe/lIXZ/co9nGtjymGS3v+zNyGewNmfY=; b=DJv6Vto6w6NZBn
	rzQvlv819dUppX9lHoADYnjeWgVbUGPEHsgGrETMcxqOe3RpaltsKpnm+Fa7hVICiM6gxzAGJRspN
	O6NsejpCfc8OPqL5N2Jw2/ryWD08PrF18mDRDdjhwcThd8tGZ6EOkyUpOGpz5iI48r4RUrKPAsenW
	uKqU2n7MNO72sLBaLG0J3VzUSa78P/zeEkZwdQJC2I0pS75MOrjSikwrpWrBNPUTXDeCRy9CQOC85
	tZ7ylAeeB6HXkqSlryjKYje4XzxZHoWsR+FK6B2IGIfR7CWksAylmDkZZ2tgQ8dAujpZoFWxrCrdL
	Pp7i9rjMCQYVVP4XWBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6NC1-0093gu-Vw; Wed, 29 Jun 2022 02:12:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6NBy-0093fj-VM
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 02:12:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74B3FB820D6
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 02:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC45C341D1
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656468751;
	bh=kBeb5Uw/j5cdFGYwRHmMmUlZSMwzxwbpxsSpXCSep3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LjRWHp6YutpgDlkEoNZbTlTjpLtq3ctkRx2/BPSkYoTyqPyf1vbeUkRYl7aVXaLFe
	 nkWK5TljCMJa6ImUJ1mG1/WmeUeaW/s/tRLT1FL5iYuedBygOX5fPBg+AzMAnBAG12
	 JVyQGg0Bvm+JvD4/sOfYmzZGdiUKi9JSh5eVPII9OKI9eLWFgVdfaFj3vuWsifYHy2
	 6vakrGMTWnYcu6Iv66KFV8qNGEpfG8OFb6v2iielwim9MEUxzmj2b5/hNEbuffPbOd
	 +KkqEsQWl+sa0AuPmlfnCyVtIIHoxeDZw5VqT44eybVBx0+t0OJ3NG+/kR1gIQ/J8C
	 Q0ySNX33MLQSw==
Received: by mail-vk1-f181.google.com with SMTP id 37so2965161vkl.7
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 19:12:31 -0700 (PDT)
X-Gm-Message-State: AJIora+H1Ycj6cKZ8ABYZqlvTbhCIGksQNagH1XOzG7QB2pPUbntlehH
	h6lmFIOFj7JS9alJKPoTA8yVwZZfcQWoyahx+Ls=
X-Google-Smtp-Source: AGRyM1sDRJWKc6dWVeHElvUlboqPwiwJz5m7zwHa5t+QSM5ZMx0nyhJAV632XFc2O2XkuEmomXUFDLniU28YR8W/XHg=
X-Received: by 2002:ac5:cdcc:0:b0:36c:547d:d9c4 with SMTP id
 u12-20020ac5cdcc000000b0036c547dd9c4mr3761818vkn.2.1656468750514; Tue, 28 Jun
 2022 19:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-2-guoren@kernel.org>
 <218522c9-97b9-7659-ce31-2dbc4b0c6a60@redhat.com>
In-Reply-To: <218522c9-97b9-7659-ce31-2dbc4b0c6a60@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 Jun 2022 10:12:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRBoAZzjWGJ0zAxv0eqBB-G=V3QHmp6+jXyznmuY6LhCQ@mail.gmail.com>
Message-ID: <CAJF2gTRBoAZzjWGJ0zAxv0eqBB-G=V3QHmp6+jXyznmuY6LhCQ@mail.gmail.com>
Subject: Re: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary atomic_read
To: Waiman Long <longman@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_191235_340648_C98456D1 
X-CRM114-Status: GOOD (  27.43  )
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

On Wed, Jun 29, 2022 at 2:06 AM Waiman Long <longman@redhat.com> wrote:
>
> On 6/28/22 04:17, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
> > because the value has been in lock. This patch could prevent
> > arch_spin_value_unlocked contend spin_lock data again.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >   include/asm-generic/spinlock.h | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> > index fdfebcb050f4..f1e4fa100f5a 100644
> > --- a/include/asm-generic/spinlock.h
> > +++ b/include/asm-generic/spinlock.h
> > @@ -84,7 +84,9 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> >
> >   static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> >   {
> > -     return !arch_spin_is_locked(&lock);
> > +     u32 val = lock.counter;
> > +
> > +     return ((val >> 16) == (val & 0xffff));
> >   }
> >
> >   #include <asm/qrwlock.h>
>
> lockref.c is the only current user of arch_spin_value_unlocked(). This
> change is probably OK with this particular use case. Do you have any
> performance data about the improvement due to this change?
I don't have performance data and I just check the asm code, previous
version has an additional unnecessary atomic_read.

About this point, we've talked before, but I & palmer missed that
point when we pick peter's patch again.
https://lore.kernel.org/linux-riscv/YHbmXXvuG442ZDfN@hirez.programming.kicks-ass.net/
----
> > +static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
> > +{
> > +       return !ticket_is_locked(&lock);
> Are you sure to let ticket_is_locked->atomic_read(lock) again, the
> lock has contained all information?
>
> return lock.tickets.owner == lock.tickets.next;

Yeah, I wrote then the wrong way around. Couldn't be bothered to go back
when I figured it out.
---
It's just a small typo.


>
> You may have to document that we have to revisit that if another use
> case shows up.
>
> Cheers,
> Longman
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
