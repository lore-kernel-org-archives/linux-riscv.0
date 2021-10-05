Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD951C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 09:15:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9CD613D5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 09:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C9CD613D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kx/CdPtfDkHCcVEpaNfp4/1rAEz7AshcwZXIXksgvyU=; b=tjHOS4rbnUk3Xq
	Q+crwEp7LP6ARgllYJqJW4gzwxsmeL9UGJndnxCMjbqfwbKCYa+OVfxM4I5WbqqdVhZN4kEy+/uc1
	y54wvB0qLmzsBImOjbajYkFC3oMWfw9YeGJeJqYcVst7ffT4Xlg9IfCxLnwRj/KC7h598Igwft88B
	q8EJWOxFewJ5uWucl3E7KiA8b7llVuinWJ4JfuM+w6OTtDDy4CUmQfj2CZsZVtusber5fdr0p8Z+z
	gf8G55/qeFOpCMXxIWpd5v2Ay7VEQGghRDfDvXA2W/Vl/NqGgfk9tp6Ik8oQ8CGwNhnvJLhl9558t
	SqJ/vndhrqefyAIuEwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgXK-009id8-J4; Tue, 05 Oct 2021 09:14:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgXH-009ibt-N9
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 09:14:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EA48613D5;
 Tue,  5 Oct 2021 09:14:52 +0000 (UTC)
Date: Tue, 5 Oct 2021 11:14:50 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 christian@brauner.io, linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH] RISC-V: Include clone3() on rv32
Message-ID: <20211005091450.yltwsjlzq6y732nv@wittgenstein>
References: <20211004111758.rl2zq6l575hmcv22@wittgenstein>
 <mhng-73210076-6df9-44e7-8c1a-09ced50fe4c0@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-73210076-6df9-44e7-8c1a-09ced50fe4c0@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_021455_800556_0A9B37C1 
X-CRM114-Status: GOOD (  31.47  )
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

On Mon, Oct 04, 2021 at 05:35:40PM -0700, Palmer Dabbelt wrote:
> On Mon, 04 Oct 2021 04:17:58 PDT (-0700), christian.brauner@ubuntu.com wrote:
> > On Sun, Oct 03, 2021 at 05:30:24PM +0200, Arnd Bergmann wrote:
> > > On Sun, Oct 3, 2021 at 2:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > >
> > > > From: Palmer Dabbelt <palmerdabbelt@google.com>
> > > >
> > > > As far as I can tell this should be enabled on rv32 as well, I'm not
> > > > sure why it's rv64-only.  checksyscalls is complaining about our lack of
> > > > clone3() on rv32.
> > > >
> > > > Fixes: 56ac5e213933 ("riscv: enable sys_clone3 syscall for rv64")
> > > > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > > 
> > > We should probably reverse the polarity of this symbol and force
> > > architectures that don't implement it properly to say they don't
> > > have it, but for now, it definitely makes sense to treat this the same
> > > way on 32-bit and 64-bit risc-v.
> > 
> > I think we had that discussion back when I added it and I think I even
> > proposed that or you did but then we settled on __ARCH_WANT_SYS_CLONE3.
> > Most likely because it fell in line with the other
> > __ARCH_WANT_SYS_{CLONE,FORK}.
> > 
> > I think at this point its alpha, ia64, nios, sparc, and sh that don't
> > implement it. For some it looks trivial at first glance at least (Fwiw,
> > nios implements sys_clone() but doesn't select __ARCH_WANT_SYS_CLONE3):
> > 
> > diff --git a/arch/nios2/include/uapi/asm/unistd.h b/arch/nios2/include/uapi/asm/unistd.h
> > index 0b4bb1d41b28..6c4f45abd3ab 100644
> > --- a/arch/nios2/include/uapi/asm/unistd.h
> > +++ b/arch/nios2/include/uapi/asm/unistd.h
> > @@ -18,6 +18,7 @@
> > 
> >   #define sys_mmap2 sys_mmap_pgoff
> > 
> > +#define __ARCH_WANT_SYS_CLONE3
> >  #define __ARCH_WANT_RENAMEAT
> >  #define __ARCH_WANT_STAT64
> >  #define __ARCH_WANT_SET_GET_RLIMIT
> > diff --git a/arch/nios2/kernel/entry.S b/arch/nios2/kernel/entry.S
> > index 0794cd7803df..c1804bda8259 100644
> > --- a/arch/nios2/kernel/entry.S
> > +++ b/arch/nios2/kernel/entry.S
> > @@ -396,6 +396,15 @@ ENTRY(sys_clone)
> >         RESTORE_SWITCH_STACK
> >         ret
> > 
> > +/*
> > + * int clone3(struct clone_args __user *, uargs, size_t, size)
> > + */
> > +ENTRY(sys_clone3)
> > +       SAVE_SWITCH_STACK
> > +       call    sys_clone3
> > +       RESTORE_SWITCH_STACK
> > +       ret
> > +
> >  ENTRY(sys_rt_sigreturn)
> >         SAVE_SWITCH_STACK
> >         mov     r4, sp
> 
> Thanks.
> 
> I've put this on fixes, but if you're trying to do that refactoring I've
> merged it in as a single patch on top of 5.15-rc1.  That's on
> palmer/riscv-clone3, in case it helps someone avoid a conflict when doing
> that refactoring.  I'd usually offer to do the refactoring, but I'm super
> buried right now with all the RISC-V stuff ;)
> 
> I want to call this fix because it's breaking my builds, these checksyscall
> warnings have recently turned into errors.

Oh yeah, please just merge your fix here for this issue. I think
flipping the symbol isn't that pressing right now and fixing your builds
is more urgent! :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
