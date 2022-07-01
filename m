Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DFEC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEvi3744SPsJXcQkbVUN/3emO1XTUEZia3kNt0M1f+I=; b=vZqfMAybE8CVaR
	gCJk3ridWPPi28/wrelv46MI2TVAg2sB6/ElW9GzCebXi87YKxT6JY7o5u0vTEeQOu3v3Lxe1Up74
	jyF5mQcxmWvA65qsDA25FCcre9zSuLvmcX+DQN7R1QU2EYkwoxZvXGQA0rgK+sX0JR46ixSJ3kZwC
	bceq+lo6PcVxHLspXzFp0tFRzNH3Ks/frLQozuwq5EWUD8UJZwDIWh4AZBDnHP4wYY1cpIklfokP8
	VyREX3NR+i08rkRfXthujqwAEweGdI1LIwi37q7v2Rv9nXkPkNHWmjt9T8Ja6Kstb6mqJY64SydKq
	XCTPWTx/1h5YZTojS9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7IPu-005cUa-O5; Fri, 01 Jul 2022 15:18:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7IPo-005cR3-B4
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 15:18:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9115C623EC
	for <linux-riscv@lists.infradead.org>; Fri,  1 Jul 2022 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B60C341CA
	for <linux-riscv@lists.infradead.org>; Fri,  1 Jul 2022 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656688718;
	bh=XT19J7tfEXlwiUinDfQaGsUAqM2Jh+CfB0vp/2kuJP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PmO0KbcapyN0IF797m1MeyFs2D36zNUM4PWE2tXHGsno8vroSpAu8WJOdR+LqACgD
	 qsgxFI3SsTwegRgvL/4Gzqv2MWyiqaCGNP4uGhFoiXXEcIYmNmYFw7r9b6btJ7ysIw
	 I0ZyaX1UgsQKV8BpeRJIiCvau/TKfPGl9NpLwSH1M3+uAhTgAVpEv8sr5Hw1zuiVrW
	 DIRABCoSFU7EiGAwxu5T68FeHDMo2ezlVZgmB0Ymg7+cu6UAZtuDXHwmE4Js04/p8o
	 oLCjVYfkEIa+uuDbrjGdYofuawBP7a6xT3nwVI7EJcjJYJHmGCEMj2wMDIN1cF3NGQ
	 Fg3ccan+5REaQ==
Received: by mail-ua1-f45.google.com with SMTP id p19so945820uam.4
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 08:18:37 -0700 (PDT)
X-Gm-Message-State: AJIora+UjpDF4yqtqFegS1j7oAoxRl/UvLBoTDhaZYASzm6c6DQh9zQU
	rvolCH+6Lr4EBxS/VJMoYTLOIIggL7fIIVhgeRM=
X-Google-Smtp-Source: AGRyM1su4bh/Qc4VULUJCugaye8aZYrrc3pSCAd5DT+9mUsito0CtDyo7cy8TkPrir1gknw2h5ic++3eTmFbXpc9OeA=
X-Received: by 2002:ab0:4384:0:b0:37f:1bac:b425 with SMTP id
 l4-20020ab04384000000b0037f1bacb425mr8408793ual.12.1656688716940; Fri, 01 Jul
 2022 08:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-2-guoren@kernel.org>
 <8eaf85d4e4d9401ea187366de12e7269@AcuMS.aculab.com>
In-Reply-To: <8eaf85d4e4d9401ea187366de12e7269@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 1 Jul 2022 23:18:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTWO-HxQNME=YN4pvEeFD5fT0dUx9pQhLujMk1V008U5A@mail.gmail.com>
Message-ID: <CAJF2gTTWO-HxQNME=YN4pvEeFD5fT0dUx9pQhLujMk1V008U5A@mail.gmail.com>
Subject: Re: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary atomic_read
To: David Laight <David.Laight@aculab.com>
Cc: "palmer@rivosinc.com" <palmer@rivosinc.com>, "arnd@arndb.de" <arnd@arndb.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "will@kernel.org" <will@kernel.org>, 
	"longman@redhat.com" <longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_081840_508097_2BA54AF9 
X-CRM114-Status: GOOD (  19.03  )
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

On Wed, Jun 29, 2022 at 4:27 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: guoren@kernel.org
> > Sent: 28 June 2022 09:17
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
> > because the value has been in lock. This patch could prevent
> > arch_spin_value_unlocked contend spin_lock data again.
>
> I'm confused (as usual).
> Isn't atomic_read() pretty much free?
When a cache line is shared with multi-harts, not as free as you think.
Preventing touching contended data is the basic principle.

atomic_read in alpha is heavy, It could be a potential user of ticket-lock.

>
> ..
> > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> > index fdfebcb050f4..f1e4fa100f5a 100644
> > --- a/include/asm-generic/spinlock.h
> > +++ b/include/asm-generic/spinlock.h
> > @@ -84,7 +84,9 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> >
> >  static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> >  {
> > -     return !arch_spin_is_locked(&lock);
> > +     u32 val = lock.counter;
> > +
> > +     return ((val >> 16) == (val & 0xffff));
>
> That almost certainly needs a READ_ONCE().
>
> The result is also inherently stale.
> So the uses must be pretty limited.
The previous read_once could get 64bit, use the API to check the 32bit
atomic data part.

>
>         David
>
> >  }
> >
> >  #include <asm/qrwlock.h>
> > --
> > 2.36.1
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
