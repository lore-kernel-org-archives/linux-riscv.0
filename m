Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017F6C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKcPYcOM5XRKG1vTR5zjrI/EeD/LLCudmI5JNMnOjqU=; b=FdOxEgTo4ZwZdX
	QuuMmot6R7QZ0n0njEw4Unhvao+iq+RCR8E1bV7fkjhF/Fl1lfoxTSF+0c5mrNZLp86IePtFaVPn9
	o/QbQ8gg7BIGXhg3h7HofSgvwKbxSmdXnDu5J1464d41QlE7ZUCH5J1twmplev88K0cbediQeE3oh
	wfOJSBNv/nJVwMCuV6na5RD8Z4fRrlLjfPUWTkjexGiCaqMlq3efvJF63MK7fLc/S/8HA/Nl8MfH6
	Z1Hhpo8hwJQAkIBw9iXK/aNlEyf/qPMH0fpTBk0iTiV9vRoZ0qYR3QxxvNax2wGxnFH20usYSunhE
	qkAwV1RAwIT5AOHWypYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxPC-00CGpy-Hc; Sat, 11 Jun 2022 09:27:42 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxP5-00CGkV-5t
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 09:27:40 +0000
X-QQ-mid: bizesmtp66t1654939609t47fj7ql
Received: from localhost.localdomain ( [119.123.130.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Jun 2022 17:26:42 +0800 (CST)
X-QQ-SSF: 01200000002000B0L000000A0000000
X-QQ-FEAT: C8aukyxTExgui1V5J2AIoAqHpkPH1zedGWCvFsMz8sjPzj9S/6LZlMMydqzS9
	Zt2bfQPpcMkZMcYi4qPmMQOhwlxPjBpt1C7UvY1d1JKkbnybSHI0DrJaZgwoEFrBxKyH50v
	Gtkl6J/e915+3mb3fhq72JKBhbv1v70m7oVlaeXoXto0kgPnAgKjkXDOMeiDBjKlVUqmO5w
	E1bVa/tcuRcIaUTdFbgPae9Ad5FKUrzLYwZnDqySOUXKOkBp9Of3BS4Cvnp7eqjpjVJ/taR
	HnawGa8QcPvt/GR7wQdT9xD/o9hO9eTia0DK2kkV8weSzfbQ94uCOxqHYiLGq9zNY1fR4pp
	mW+Dotok2jke6NulJ1GQM6XcK3YAQ==
X-QQ-GoodBg: 0
From: Wu Zhangjin <falcon@tinylab.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Zong Li <zong.li@sifive.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Wu Zhangjin <falcon@tinylab.org>
Subject: Re: Re: [RFC] riscv: restore the irq save/restore logic for nosync code patching
Date: Sat, 11 Jun 2022 17:26:38 +0800
Message-Id: <20220611092638.216756-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <CAJF2gTTJApuPatenUVgEWWsGOkiwGNQ72nMjFmDQj5PRdpNtwQ@mail.gmail.com>
References: <CAJF2gTTJApuPatenUVgEWWsGOkiwGNQ72nMjFmDQj5PRdpNtwQ@mail.gmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_022735_620330_91D08470 
X-CRM114-Status: GOOD (  33.07  )
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

Hi, Ren

Thanks very much for your review.

>
>
> Sorry, I misunderstood your patch, here is the new review feedback.
>
> On Sat, Jun 11, 2022 at 10:31 AM Wu Zhangjin <falcon@tinylab.org> wrote:
> >
> > The commit '0ff7c3b331276f584bde3ae9a16bacd8fa3d01e6' removed the
> > old patch_lock together with the irq save/restore logic.
> >
> > But the patching interface: patch_text_nosync() has new users like
> > Jump Label, which doesn't use stop_machine(), here restores the irq
> > save/restore logic for such users, just as the other architectures do.
> Let's give protection out of patch_text_nosync.
>
>         mutex_lock(&text_mutex);
>         patch_text_nosync(addr, &insn, sizeof(insn));
>         mutex_unlock(&text_mutex);
>
> Why mutex isn't enough for patch_text?

The interrupt may come during code modification or between code modification
and icache flush.

Just recheck the jump label code in arch/riscv/kernel/jump_labe.c, both of the
nop and jal instructions are 4 bytes, so, the interrupt may not be possible to
come just in the code modification procedure and therefore impossible to
execute only part of the instructions, but may be possible to come in just
after code modification and before icache flush. is this a risk? If not, this
irq save/restore part can be simply ignored.

>
> > Move lockdep assert to the required path too, the current stop_machine()
> > based ftrace implementation should use the new added patch_text_noirq()
> > without this lockdep assert, it has its own mutex, but not named as
> > text_mutex.
> Do you mean we should use irq_save&restore instead of text_mutex?
>

Sorry (and to zong li), since 'grep text_mutex kernel/trace/ftrace.c' returns
nothing and my kernel image built with lockdep configured failed to boot on
qemu and I just missed that the old added global functions:
ftrace_arch_code_modify_prepare() and ftrace_arch_code_modify_post_process()
have added text_mutex and they have overrided the weak ones defined in
kernel/trace/ftrace.c, so, this code update path (even with the new
implementation without stop_machine) have been protected with text_mutex too,
lockdep assert here is therefore perfectly ok, we can not move it away.

BR,
Falcon

>
> >
> > As the latest maillist shows, a new ftrace support without
> > stop_machine() is in review, which requires the nosync version with this
> > irq save/restore logic or the new added noirq version (as we can see it
> > also calls patch_insn_write) with explicit text_mutex and irq
> > save/restore logic.
> >
> > Signed-off-by: Wu Zhangjin <falcon@tinylab.org>
> > ---
> >  arch/riscv/kernel/patch.c | 32 +++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > index 765004b60513..03f03832e077 100644
> > --- a/arch/riscv/kernel/patch.c
> > +++ b/arch/riscv/kernel/patch.c
> > @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
> >         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> >         int ret;
> >
> > -       /*
> > -        * Before reaching here, it was expected to lock the text_mutex
> > -        * already, so we don't need to give another lock here and could
> > -        * ensure that it was safe between each cores.
> > -        */
> > -       lockdep_assert_held(&text_mutex);
> > -
> >         if (across_pages)
> >                 patch_map(addr + len, FIX_TEXT_POKE1);
> >
> > @@ -85,7 +78,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
> >  NOKPROBE_SYMBOL(patch_insn_write);
> >  #endif /* CONFIG_MMU */
> >
> > -int patch_text_nosync(void *addr, const void *insns, size_t len)
> > +/* For stop_machine() or the other cases which have already disabled irq and have locked among cpu cores */
> > +int patch_text_noirq(void *addr, const void *insns, size_t len)
> >  {
> >         u32 *tp = addr;
> >         int ret;
> > @@ -97,6 +91,26 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
> >
> >         return ret;
> >  }
> > +NOKPROBE_SYMBOL(patch_text_noirq);
> > +
> > +int patch_text_nosync(void *addr, const void *insns, size_t len)
> > +{
> > +       int ret;
> > +       unsigned long flags;
> > +
> > +       /*
> > +        * Before reaching here, it was expected to lock the text_mutex
> > +        * already, so we don't need to give another lock here and could
> > +        * ensure that it was safe between each cores.
> > +        */
> > +       lockdep_assert_held(&text_mutex);
> > +
> > +       local_irq_save(flags);
> > +       ret = patch_text_noirq(addr, insns, len);
> > +       local_irq_restore(flags);
> > +
> > +       return ret;
> > +}
> >  NOKPROBE_SYMBOL(patch_text_nosync);
> >
> >  static int patch_text_cb(void *data)
> > @@ -106,7 +120,7 @@ static int patch_text_cb(void *data)
> >
> >         if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
> >                 ret =
> > -                   patch_text_nosync(patch->addr, &patch->insn,
> > +                   patch_text_noirq(patch->addr, &patch->insn,
> >                                             GET_INSN_LENGTH(patch->insn));
> >                 atomic_inc(&patch->cpu_count);
> >         } else {
> > --
> > 2.35.1
> >
>
>
> --
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
