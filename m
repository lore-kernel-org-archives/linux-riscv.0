Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE80C36010
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 00:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YW0CHTKsNWCoMsWxvCtbkZC7P+LaXN02W5wTb2f/yj8=; b=2DOcCYHN/TvU/1
	m9QtC48qL8ac1f0ksk7qXYlXm0HlyIIVqaalOe12eOSRVVJI2BoM1VZXAgIpHK//DuJmz4Hs0epKI
	MB5R+ODM5pdXc80i2ebkjNAu5mQ12wpySEkCNtsIcoeR3TVYMVQJjZCGyE/nRAvh3Gn+7ko6gMYxN
	ECOdKtr7p3BJG9ml/1UNFYc89vzkBUwYYrYHjl5/dXC7NAPXKN/mNf2XnnUrmiuQn7haVCVdZmBcP
	Dj+l+etakAgnoSrZp1Ybr49VH2NKSrHXxa63GAKYePOvHHe8cCy/u00r+esZcmVB6/M2sEApcYPQs
	iL4VedSyiwmNI5TdeaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2JSF-00000005moz-3ypg;
	Wed, 09 Apr 2025 00:38:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2JSC-00000005moV-2iBb
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 00:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33161A49727;
	Wed,  9 Apr 2025 00:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA67C4CEE5;
	Wed,  9 Apr 2025 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744159087;
	bh=xYXo/AkChMu0jY7VwOHqjMJgNLi95yqKZnjfXu+TjI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyYEsca2QsW5BZ7I/2QUhDe9vcNdBLehZn41qrW58OQP2bEGNPHJTW38L3GKiqgZW
	 z+qk3wDdSaIiXx1F3S/+zG8oYbLxVkECjb7+Ak6PcvL42F3b40xCX97dEojcs5IvkP
	 EOWRbPurudVfeITi9YrI0ytLnJVOnt+XGcT40WDBPEY6hweeAkzVGVNxZnBw1EiGRH
	 RPg7gxIrHz3xcf+mxXJ/NXCsfMrrDEajzw+/43bKrM8/eiguKT5FeoTz3E4amqCnoF
	 o6pSq/OcG/mDYRzdGeMIYtuzjjlYnr23FBRjyulFoChEar1RM0CYaiHe+bDOoZTh6F
	 b7TqiWU1hPvhA==
Date: Tue, 8 Apr 2025 17:38:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409003803.GA2876360@ax162>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408223611.GA26876@strace.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_173808_814338_E207A513 
X-CRM114-Status: GOOD (  25.83  )
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

On Wed, Apr 09, 2025 at 01:36:11AM +0300, Dmitry V. Levin wrote:
> On Tue, Apr 08, 2025 at 02:31:31PM -0700, Nathan Chancellor wrote:
> > On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> > > +static inline void syscall_set_arguments(struct task_struct *task,
> > > +					 struct pt_regs *regs,
> > > +					 const unsigned long *args)
> > > +{
> > > +	regs->orig_a0 = args[0];
> > > +	args++;
> > > +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > +}
> > 
> > This upsets the compiletime fortify checks, as I see a warning after
> > syscall_set_arguments() starts being used in kernel/ptrace.c later in
> > the series.
> > 
> >   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
> >   In file included from include/linux/string.h:392,
> >                    from include/linux/bitmap.h:13,
> >                    from include/linux/cpumask.h:12,
> >                    from arch/riscv/include/asm/processor.h:55,
> >                    from include/linux/sched.h:13,
> >                    from kernel/ptrace.c:13:
> >   In function 'fortify_memcpy_chk',
> >       inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
> >   include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >     571 |                         __write_overflow_field(p_size_field, size);
> >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   cc1: all warnings being treated as errors
> 
> I certainly tested the series on riscv64, but somehow I haven't seen this
> compiler diagnostics before.

Maybe CONFIG_FORTIFY_SOURCE was not enabled? This comes from the
kernel's fortified memcpy checking function, fortify_memcpy_chk(), not
necessarily the compiler itself.

> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index a5281cdf2b10..70ec19dc8506 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >                                          const unsigned long *args)
> >  {
> >         regs->orig_a0 = args[0];
> > -       args++;
> > -       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > +       regs->a1 = args[1];
> > +       regs->a2 = args[2];
> > +       regs->a3 = args[3];
> > +       regs->a4 = args[4];
> > +       regs->a5 = args[5];
> >  }
> 
> I don't mind eliminating the memcpy() altogether, but
> I'd like to note that syscall_set_arguments() is an exact mirror
> of syscall_get_arguments(), so if the intentional overwrite in
> syscall_set_arguments() is not acceptable, then the intentional
> overread in syscall_get_arguments() shouldn't be acceptable either.

Yes, I noticed the symmetry too but I was only looking at it from the
overwrite perspective, not the overread one. That reminded me to double
check what fortify_memcpy_chk() actually checks for and I remembered
that the overread version of this warning is hidden under W=1 (I guess
because it happens more frequently).

  $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- W=1 allmodconfig kernel/ptrace.o
  In file included from include/linux/string.h:392,
                   from include/linux/bitmap.h:13,
                   from include/linux/cpumask.h:12,
                   from arch/riscv/include/asm/processor.h:55,
                   from include/linux/sched.h:13,
                   from kernel/ptrace.c:13:
  In function 'fortify_memcpy_chk',
      inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:73:2:
  include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
    580 |                         __read_overflow2_field(q_size_field, size);
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

So memcpy() should indeed be eliminated from both, which obviously
clears up the warnings.

Cheers,
Nathan

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index a5281cdf2b10..34313387f977 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 unsigned long *args)
 {
 	args[0] = regs->orig_a0;
-	args++;
-	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
+	args[1] = regs->a1;
+	args[2] = regs->a2;
+	args[3] = regs->a3;
+	args[4] = regs->a4;
+	args[5] = regs->a5;
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
@@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
 					 const unsigned long *args)
 {
 	regs->orig_a0 = args[0];
-	args++;
-	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
+	regs->a1 = args[1];
+	regs->a2 = args[2];
+	regs->a3 = args[3];
+	regs->a4 = args[4];
+	regs->a5 = args[5];
 }
 
 static inline int syscall_get_arch(struct task_struct *task)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
