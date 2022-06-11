Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8238FC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkDOPA2hPlf08St6b0REhW7umxUGe/4USPefKMGELUs=; b=uPQ2T3iDj855uk
	fgVnMYAcgbqUPwv/Ee/0U6XwNraHzakt10mRS/Yfm9z96U14epAUBRJ3aMOiYCk5QwnQcwfNySAhZ
	jGy8lHWVc8aH1IfXXds2fPJnGTewOv6WI28LqG5iDS+WplGHly/5MRQgVKiab5KB3INWRvyX1hnI6
	suq8knu/pJDW7JunsKQK61OR2jrR5JsSUGi8oWHM8+SNO//p8SnMlh/1M1SFOxORLpwkNbLp2X9G+
	V3pEZZaC5q8wRUmzhOosMM8NVUCZ7UX68nxBwVPRcQw0rZ2u7m1b0II7R2TcgfrBfuEnV9WdAY6Oh
	pq3C8ADCPBam+AlIr4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o00Vf-00CyVY-10; Sat, 11 Jun 2022 12:46:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o00Vb-00CyUS-G4
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 12:46:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25EBA60EF1
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 12:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C89C3411B
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654951588;
	bh=iqVEl3lDz7Aik8k0rRWhEtxS7hX7Ntm2dEeB0o4ENEg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GiKkEDrh2+2vmr1s2MKLZTKE2ZyAywvnwrRNZMhv3uXPGJG3kJdnwqaHPMQBU6tbk
	 pxlpQ1mvNzllMeh1UHeMNIrvrsTjTMeCATwSmdugrW+zy7WWAj6nUjPGDOoldy5SE0
	 dwfzKwIZ/KnJDsDJiUBR8qQsNIA6Rl6dIUqePB7Uqv445UJZYDbp4JVuSmFj3JehXG
	 Em0Ow4461MfNlPg4lRcmVVx1/z16uFrUW731bCYvepNf/pqbLt4C78SJb8uqk/nZmc
	 JqG8jValX0dIfOUvxi7UIktcVo8DXbYfzu9r8OjOjTHvmQfvWbSO89k7HHOPPM9cEB
	 mIj/N01oLuqDg==
Received: by mail-vk1-f169.google.com with SMTP id u188so674091vku.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 05:46:28 -0700 (PDT)
X-Gm-Message-State: AOAM531kp/LzlKJUp79De088KUC6edpFBHjrCTk7BQAFQiGenKIBOGSN
	WHzhmYmlvsbOyjhlkBPDqQ6ch17xX3bFVrinAVA=
X-Google-Smtp-Source: ABdhPJwGgSAQT1YqWC6MK0Q8Trfb1OOAfwMkVdtATMNTry+gRdI1r3BgTEPqlYe3HUuyqR+ZX+7sl0esbZcc1WXZRFs=
X-Received: by 2002:a1f:1245:0:b0:35d:7991:7385 with SMTP id
 66-20020a1f1245000000b0035d79917385mr17971321vks.2.1654951587451; Sat, 11 Jun
 2022 05:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTTJApuPatenUVgEWWsGOkiwGNQ72nMjFmDQj5PRdpNtwQ@mail.gmail.com>
 <20220611092638.216756-1-falcon@tinylab.org>
In-Reply-To: <20220611092638.216756-1-falcon@tinylab.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Jun 2022 20:46:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS+MZuEY6U6SqvXW_cEAbdurCiD-LJTpLv39Qbos7oBUg@mail.gmail.com>
Message-ID: <CAJF2gTS+MZuEY6U6SqvXW_cEAbdurCiD-LJTpLv39Qbos7oBUg@mail.gmail.com>
Subject: Re: Re: [RFC] riscv: restore the irq save/restore logic for nosync
 code patching
To: Wu Zhangjin <falcon@tinylab.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_054631_657797_2D9BC53A 
X-CRM114-Status: GOOD (  41.75  )
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

On Sat, Jun 11, 2022 at 5:27 PM Wu Zhangjin <falcon@tinylab.org> wrote:
>
> Hi, Ren
>
> Thanks very much for your review.
>
> >
> >
> > Sorry, I misunderstood your patch, here is the new review feedback.
> >
> > On Sat, Jun 11, 2022 at 10:31 AM Wu Zhangjin <falcon@tinylab.org> wrote:
> > >
> > > The commit '0ff7c3b331276f584bde3ae9a16bacd8fa3d01e6' removed the
> > > old patch_lock together with the irq save/restore logic.
> > >
> > > But the patching interface: patch_text_nosync() has new users like
> > > Jump Label, which doesn't use stop_machine(), here restores the irq
> > > save/restore logic for such users, just as the other architectures do.
> > Let's give protection out of patch_text_nosync.
> >
> >         mutex_lock(&text_mutex);
> >         patch_text_nosync(addr, &insn, sizeof(insn));
> >         mutex_unlock(&text_mutex);
> >
> > Why mutex isn't enough for patch_text?
>
> The interrupt may come during code modification or between code modification
> and icache flush.
>
> Just recheck the jump label code in arch/riscv/kernel/jump_labe.c, both of the
> nop and jal instructions are 4 bytes, so, the interrupt may not be possible to
> come just in the code modification procedure and therefore impossible to
> execute only part of the instructions, but may be possible to come in just
> after code modification and before icache flush. is this a risk? If not, this
> irq save/restore part can be simply ignored.
The irq save/restore couldn't affect other harts and software should
use text_mutex to prevent race contention.

>
> >
> > > Move lockdep assert to the required path too, the current stop_machine()
> > > based ftrace implementation should use the new added patch_text_noirq()
> > > without this lockdep assert, it has its own mutex, but not named as
> > > text_mutex.
> > Do you mean we should use irq_save&restore instead of text_mutex?
> >
>
> Sorry (and to zong li), since 'grep text_mutex kernel/trace/ftrace.c' returns
> nothing and my kernel image built with lockdep configured failed to boot on
> qemu and I just missed that the old added global functions:
> ftrace_arch_code_modify_prepare() and ftrace_arch_code_modify_post_process()
> have added text_mutex and they have overrided the weak ones defined in
> kernel/trace/ftrace.c, so, this code update path (even with the new
#ifdef CONFIG_DYNAMIC_FTRACE
void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
{
        mutex_lock(&text_mutex);
}

void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
{
        mutex_unlock(&text_mutex);
}
arch/riscv/kernel/ftrace.c: * text_mutex, which triggers a lockdep
failure.  SMP isn't running so we could

When DYNAMIC_FTRACE=n, do you meet the warning during boot time?

Actually, for DYNAMIC_FTRACE=n seems nobody to test it for a long time, right?

> implementation without stop_machine) have been protected with text_mutex too,
> lockdep assert here is therefore perfectly ok, we can not move it away.
>
> BR,
> Falcon
>
> >
> > >
> > > As the latest maillist shows, a new ftrace support without
> > > stop_machine() is in review, which requires the nosync version with this
> > > irq save/restore logic or the new added noirq version (as we can see it
> > > also calls patch_insn_write) with explicit text_mutex and irq
> > > save/restore logic.
> > >
> > > Signed-off-by: Wu Zhangjin <falcon@tinylab.org>
> > > ---
> > >  arch/riscv/kernel/patch.c | 32 +++++++++++++++++++++++---------
> > >  1 file changed, 23 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > > index 765004b60513..03f03832e077 100644
> > > --- a/arch/riscv/kernel/patch.c
> > > +++ b/arch/riscv/kernel/patch.c
> > > @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
> > >         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> > >         int ret;
> > >
> > > -       /*
> > > -        * Before reaching here, it was expected to lock the text_mutex
> > > -        * already, so we don't need to give another lock here and could
> > > -        * ensure that it was safe between each cores.
> > > -        */
> > > -       lockdep_assert_held(&text_mutex);
> > > -
> > >         if (across_pages)
> > >                 patch_map(addr + len, FIX_TEXT_POKE1);
> > >
> > > @@ -85,7 +78,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
> > >  NOKPROBE_SYMBOL(patch_insn_write);
> > >  #endif /* CONFIG_MMU */
> > >
> > > -int patch_text_nosync(void *addr, const void *insns, size_t len)
> > > +/* For stop_machine() or the other cases which have already disabled irq and have locked among cpu cores */
> > > +int patch_text_noirq(void *addr, const void *insns, size_t len)
> > >  {
> > >         u32 *tp = addr;
> > >         int ret;
> > > @@ -97,6 +91,26 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
> > >
> > >         return ret;
> > >  }
> > > +NOKPROBE_SYMBOL(patch_text_noirq);
> > > +
> > > +int patch_text_nosync(void *addr, const void *insns, size_t len)
> > > +{
> > > +       int ret;
> > > +       unsigned long flags;
> > > +
> > > +       /*
> > > +        * Before reaching here, it was expected to lock the text_mutex
> > > +        * already, so we don't need to give another lock here and could
> > > +        * ensure that it was safe between each cores.
> > > +        */
> > > +       lockdep_assert_held(&text_mutex);
> > > +
> > > +       local_irq_save(flags);
> > > +       ret = patch_text_noirq(addr, insns, len);
> > > +       local_irq_restore(flags);
> > > +
> > > +       return ret;
> > > +}
> > >  NOKPROBE_SYMBOL(patch_text_nosync);
> > >
> > >  static int patch_text_cb(void *data)
> > > @@ -106,7 +120,7 @@ static int patch_text_cb(void *data)
> > >
> > >         if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
> > >                 ret =
> > > -                   patch_text_nosync(patch->addr, &patch->insn,
> > > +                   patch_text_noirq(patch->addr, &patch->insn,
> > >                                             GET_INSN_LENGTH(patch->insn));
> > >                 atomic_inc(&patch->cpu_count);
> > >         } else {
> > > --
> > > 2.35.1
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
