Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE1606A31A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 02:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nexlHm4l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frPVn++X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DIt7s24yVPzwmjoJxmaDYVAvJmGwn8csX28hkuikEjI=; b=nexlHm4luZnfAifdr8ANpglorX
	xlKikaEld87YSGPckIT7jKmdXFTR/eoEGKVBeHroXjU6MMIFSDwCkEDSzaLkhcfamO6uRsetYrFUU
	xTS6TJlw4+aUqCx3BWFxRm7AZFnp4yUYLIWYOf0NLF7ht1DKQ6EHHnhlMm75WdHIpBuIk6UYViLj5
	SvnO6wkXo1YRETnkN9ruG9kddbNMaAWJR1DLd4V8Y5QD0lPV0wS1D65ep9TuCyUOJ3RQExC+DaymU
	DOLqo1AsbRXaj3CI9ITue65keFEyRF1vG5k4dwMyBU/eIPZqImWQUm2iFITLHoCqh9SJqHgspXckN
	viZ138Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsRR-0000000FbK8-2NoA;
	Sun, 08 Nov 2026 02:15:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsRP-0000000FbK0-40CV
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 02:15:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A83643BA4;
	Sun,  8 Nov 2026 02:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54961F0089F;
	Sun,  8 Nov 2026 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794104131;
	bh=oQEbe3DigURkbbZBKljnP0hlfAkUpqtqIvMCZNdUxiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=frPVn++X2TPro6F5ja2r6Amed4YVGwNsgDtwgGFkOlrdu5KdM44suvzp++cHqGi2m
	 irbKuG0FFG3EamocARcVdHSqH1HvycXKu2U6rLPRCuuduYSnYOU0vT+rqhQE0kUiXM
	 NJXPJKmiKVAWrCtGTPQM7UpY2FltTXCTAcQf2wrJcdq9iIoT/hWmICgJuMZ2GcMcgx
	 iKQNvB8h/C8v1eAeQxj5F2ley1UXvj9ZmKA255A7UPP9661c+mTn3OppsnutDPzFeJ
	 fprNzd2Qua9ophL9r1lnh10WtpR/Na8gu3uGFMHjYVyjLu3gfTIpXzXhaihrLbvYMZ
	 oyg/H6st3Xl5w==
Date: Sun, 8 Nov 2026 09:55:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: entry: Mark ret_from_fork_kernel() and
 ret_from_fork_user() noinstr
Message-ID: <au_WiGUxh1mROgKY@xhacker>
References: <20261107194931.69176-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261107194931.69176-1-kmehltretter@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 08:49:31PM +0100, Karl Mehltretter wrote:
> ret_from_fork_kernel() and ret_from_fork_user() are traceable and
> return after syscall_exit_to_user_mode() enters the RCU extended
> quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
> function_graph tracing is enabled with
> FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
> watching and triggers the ftrace_return_to_handler() warning.
> 
> Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr and bracket
> the kernel thread callback with instrumentation_begin() and
> instrumentation_end().
> 
> Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Assisted by an LLM.
> 
> Tested on v7.4-rc1 (d48723711bae) under QEMU riscv64 (-smp 4) with
> NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING, PROVE_LOCKING,
> nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line, and
> function_graph tracing during parallel fork bursts across CPUs 0-3.
> Without this patch, two consecutive runs trigger:
>   RCU not on for: ret_from_fork_user+0x4/0x368
>   WARNING: include/linux/trace_recursion.h:132 at ftrace_return_to_handler+0x2e0/0x2f0, CPU#2
> followed by an observed kernel paging request Oops in
> ftrace_graph_ret_addr() while unwinding the warning backtrace.
> With this patch, two consecutive runs complete without the
> ftrace_return_to_handler() warning or unwind fault.
> 
>  arch/riscv/kernel/process.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 34c1d498d1cad..10c1bee77145f 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -225,14 +225,17 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	return 0;
>  }
>  
> -asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
> +					     struct pt_regs *regs)
>  {
> +	instrumentation_begin();

since riscv has no objtool support, this can be removed.

>  	fn(fn_arg);
> +	instrumentation_end();
>  
>  	syscall_exit_to_user_mode(regs);
>  }
>  
> -asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
>  {
>  	syscall_exit_to_user_mode(regs);
>  }
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
> 
> -- 
> 2.39.5 (Apple Git-154)
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
