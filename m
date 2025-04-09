Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35C8C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zahFDvN3Ozbk4TH83R0xuNePso3+qBZ7PQ/zI0Q1TdQ=; b=GGo9Y5rY4EqWC4
	KSmbLhasfcmjf+7cQV7H4Xyu+J3DeVTvzEuoyVfxRtVndutimjrlo8DkfizQpMCimXQA/74GHpCcS
	J6qdUG7o7BF+ORgkiIfmfhrIARnA0psVYINI3zxUGgQm5RnMrBJ4G0FlDPOIeaiHOrQz/TZL4I5E6
	TB5Eqk5VMpmivHL8AZONLDVWxSmlBM1NeJTx0kMfcg/2U/lsi6JRCe4ALX+nNeJ6PWlAqN5oWfLEM
	Y2XKN6xWGu1XoszyIpZDWU1QJWBbJqUwtGzPCU8rcuoLfU3DrFwekjsqGKcAoHgbIDYAhMVLGQfSR
	sWhTpwM2WRo8PkcknUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PEq-00000006K6j-1paP;
	Wed, 09 Apr 2025 06:48:44 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2P6j-00000006Iid-2DqP
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 06:40:25 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 319C872C8CC;
	Wed,  9 Apr 2025 09:40:18 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0B9697CCB3A; Wed,  9 Apr 2025 09:40:18 +0300 (IDT)
Date: Wed, 9 Apr 2025 09:40:18 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409064017.GA30836@strace.io>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
 <20250409003803.GA2876360@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409003803.GA2876360@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234022_430650_258F56E4 
X-CRM114-Status: GOOD (  30.50  )
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

On Tue, Apr 08, 2025 at 05:38:03PM -0700, Nathan Chancellor wrote:
> On Wed, Apr 09, 2025 at 01:36:11AM +0300, Dmitry V. Levin wrote:
> > On Tue, Apr 08, 2025 at 02:31:31PM -0700, Nathan Chancellor wrote:
> > > On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> > > > +static inline void syscall_set_arguments(struct task_struct *task,
> > > > +					 struct pt_regs *regs,
> > > > +					 const unsigned long *args)
> > > > +{
> > > > +	regs->orig_a0 = args[0];
> > > > +	args++;
> > > > +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > > +}
> > > 
> > > This upsets the compiletime fortify checks, as I see a warning after
> > > syscall_set_arguments() starts being used in kernel/ptrace.c later in
> > > the series.
> > > 
> > >   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
> > >   In file included from include/linux/string.h:392,
> > >                    from include/linux/bitmap.h:13,
> > >                    from include/linux/cpumask.h:12,
> > >                    from arch/riscv/include/asm/processor.h:55,
> > >                    from include/linux/sched.h:13,
> > >                    from kernel/ptrace.c:13:
> > >   In function 'fortify_memcpy_chk',
> > >       inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
> > >   include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> > >     571 |                         __write_overflow_field(p_size_field, size);
> > >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   cc1: all warnings being treated as errors
> > 
> > I certainly tested the series on riscv64, but somehow I haven't seen this
> > compiler diagnostics before.
> 
> Maybe CONFIG_FORTIFY_SOURCE was not enabled? This comes from the
> kernel's fortified memcpy checking function, fortify_memcpy_chk(), not
> necessarily the compiler itself.
> 
> > > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > > index a5281cdf2b10..70ec19dc8506 100644
> > > --- a/arch/riscv/include/asm/syscall.h
> > > +++ b/arch/riscv/include/asm/syscall.h
> > > @@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> > >                                          const unsigned long *args)
> > >  {
> > >         regs->orig_a0 = args[0];
> > > -       args++;
> > > -       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > +       regs->a1 = args[1];
> > > +       regs->a2 = args[2];
> > > +       regs->a3 = args[3];
> > > +       regs->a4 = args[4];
> > > +       regs->a5 = args[5];
> > >  }
> > 
> > I don't mind eliminating the memcpy() altogether, but
> > I'd like to note that syscall_set_arguments() is an exact mirror
> > of syscall_get_arguments(), so if the intentional overwrite in
> > syscall_set_arguments() is not acceptable, then the intentional
> > overread in syscall_get_arguments() shouldn't be acceptable either.
> 
> Yes, I noticed the symmetry too but I was only looking at it from the
> overwrite perspective, not the overread one. That reminded me to double
> check what fortify_memcpy_chk() actually checks for and I remembered
> that the overread version of this warning is hidden under W=1 (I guess
> because it happens more frequently).
> 
>   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- W=1 allmodconfig kernel/ptrace.o
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:73:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> So memcpy() should indeed be eliminated from both, which obviously
> clears up the warnings.
> 
> Cheers,
> Nathan
> 
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index a5281cdf2b10..34313387f977 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>  }
>  
>  static inline void syscall_set_arguments(struct task_struct *task,
> @@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  					 const unsigned long *args)
>  {
>  	regs->orig_a0 = args[0];
> -	args++;
> -	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +	regs->a1 = args[1];
> +	regs->a2 = args[2];
> +	regs->a3 = args[3];
> +	regs->a4 = args[4];
> +	regs->a5 = args[5];
>  }
>  
>  static inline int syscall_get_arch(struct task_struct *task)

Looks good, thanks.  How do we proceed from this point?


-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
