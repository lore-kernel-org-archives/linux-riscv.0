Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C07C369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlzfLbyGNWWfuJfNHedcfSYKHv2b/xXFu8HSHY0/myc=; b=hJURj5av5XUE/Q
	pWPCkdB+8G4yIXWtI1tPA0lUxwunBCL3rrROdpybx+TLvRF1lt8b9ElNvBwSYlI1UyXC7ytDpCtNH
	KZl4OMqkFiuK71GTW5pCE/Fgik4sTEg5H83/c2mfoS+rK2K+XZgiRyH/RYV1vC9Mnz0zrIKEK++0C
	y2PYxH6XCWNVD9+KXQ3IInqoQkCCVpuirdwji02ThQx7LYhwhuJfYuzNF44LfWNZ3hfDXvApyepWC
	sjSfxhrSzZ2EqcNwWXM2029X+2SqTQz2W4zYnmpTV6cdmbDXZPur4zysPcM3ZxO5jmHZswEWCwS1o
	lFYBamO4+ZBpPbm3yJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgr-0000000BWrm-0Cw3;
	Thu, 10 Apr 2025 18:31:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wPz-0000000BUot-3G7l
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 18:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 035BD40C1C;
	Thu, 10 Apr 2025 18:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F7CC4CEDD;
	Thu, 10 Apr 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308866;
	bh=wn3mPPR27RYVkuHWJkv09h07bHWGcncI5FZuMl88yoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEwQefQHMvoaGAPG5Jq1tyUxVrHdrtUKIqxCAYJU99HmpQSU677N0ZPBiJXv3NIyf
	 VGb9OtOZXSVbihGsbbvNzX8WPzcPPx36xbK8MWa6P8r25IJzavqyF7efUwnJxi0pRY
	 H46RO/VR4zQF36e10Juec6x5qb/Cv+lfCOUKG9/0Sj+Cl0kqBGuB9oWXCJ8I29Q0QW
	 IpCCdbf2X/j1vNCXC4HwCWg54ojPhXBbzE/vsRWtqUEz4jJ7n9HFVi0RCqdlQKWEIG
	 ibbxP5/bF7AOobnmz1uJiR0J5jQNEQcUuicn8gx5vOLd1Q+K47znTeUUX9/HGfH5Tr
	 tmSt0AkwI3nvA==
Date: Thu, 10 Apr 2025 11:14:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250410181422.GA3431770@ax162>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408213131.GA2872426@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_111427_852400_7920B52B 
X-CRM114-Status: GOOD (  28.42  )
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

Hi Andrew,

Can you please fold the diff at the end of my message into
syscallh-add-syscall_set_arguments.patch? It sounds like Palmer will
apply the same diff to syscall_get_arguments():
https://lore.kernel.org/mhng-cf999eb1-59c4-4784-8c01-44b1e2482a50@palmer-ri-x1c9a/

Thanks!
Nathan

On Tue, Apr 08, 2025 at 02:31:31PM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> [dropping majority of folks since this seems irrelevant to them]
> 
> On Mon, Mar 03, 2025 at 01:20:09PM +0200, Dmitry V. Levin wrote:
> > This function is going to be needed on all HAVE_ARCH_TRACEHOOK
> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
> > 
> > This partially reverts commit 7962c2eddbfe ("arch: remove unused
> > function syscall_set_arguments()") by reusing some of old
> > syscall_set_arguments() implementations.
> > 
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > Acked-by: Helge Deller <deller@gmx.de> # parisc
> > Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk> # mips
> ...
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index 121fff429dce..8d389ba995c8 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> >  }
> >  
> > +static inline void syscall_set_arguments(struct task_struct *task,
> > +					 struct pt_regs *regs,
> > +					 const unsigned long *args)
> > +{
> > +	regs->orig_a0 = args[0];
> > +	args++;
> > +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > +}
> 
> This upsets the compiletime fortify checks, as I see a warning after
> syscall_set_arguments() starts being used in kernel/ptrace.c later in
> the series.
> 
>   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- allmodconfig kernel/ptrace.o
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_set_arguments.isra' at arch/riscv/include/asm/syscall.h:82:2:
>   include/linux/fortify-string.h:571:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     571 |                         __write_overflow_field(p_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> The compiler knows the size of the destination and the size to be copied
> so it knows there will be an (intentional) overwrite here.
> struct_group() would normally work but I think this structure already
> has a struct_group() around some of the members that would be needed. I
> build tested eliminating the memcpy() altogether, which would appear to
> work, but I am not sure if there is a better solution, hence just the
> report.
> 
> Cheers,
> Nathan
> 
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index a5281cdf2b10..70ec19dc8506 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -78,8 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
>                                          const unsigned long *args)
>  {
>         regs->orig_a0 = args[0];
> -       args++;
> -       memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +       regs->a1 = args[1];
> +       regs->a2 = args[2];
> +       regs->a3 = args[3];
> +       regs->a4 = args[4];
> +       regs->a5 = args[5];
>  }
> 
>  static inline int syscall_get_arch(struct task_struct *task)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
