Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438B606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 04:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4LfAkEf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma6N62v9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O8XyLbU4GCms+ZORsKKEipdZtQrCNt/E0QPyDDwaHzc=; b=b4LfAkEfCNv6V/2+iu9NlY3SE/
	mjRyiZYASZsI0hBDN3osA7ww8q6l/NXQn5D1NW8Mm4SKRZvP+wztVpgg1TDhx9dJxRM/kLl6PaaUR
	Zsmx8hAcxLOgL9RIqPGH+Mq7vvRNP40AJWRkVy4huW4j8BeIw0TKEt1BhqlB1wFz5YvpQ5JPaoj7f
	6Ngcn+h6EOZpQVdxsGDfeGQXMFLHbOFk468fCobZUqjfVfhgux9ptNaudHAg9LQXswi4NIskRckZz
	uI4ad43bngSbrcHKCUalxM3/m0LUnb57F2hhV2IDAco0GvOlVu5qqD/1YUGCNH5NxZ8qdUkQxjaln
	Jdi4LGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQH7V-0000000HK9V-2YeX;
	Mon, 09 Nov 2026 04:36:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQH7U-0000000HK9O-298k
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 04:36:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAA4B41466;
	Mon,  9 Nov 2026 04:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA141F0089F;
	Mon,  9 Nov 2026 04:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794198995;
	bh=uTmIS9aKyym5dH1US1ljpTNJCXSvpIpBaRQvIEMaxHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ma6N62v9XBEMD4MKGpZQhtguYQqVYkJd+iTa7t/DpXBS8g0ZtUEwKBL+08sEzT78g
	 rtnDCxaD+fEJPEqdESt5wJyDWiAcH6Ia6eB7M/sjGJQUA0oJaVGgCwwhc7aHzDzCys
	 7CK2MaD9eXw8V9K0Pu4bqiGzY9QeDpL/RHfintzQmOv+DHyh7IqgxY9JrAsgTD3Oco
	 YVdKTgRskwuwXWIT2vCdzrxAMVx/LdfqEz4Cfh4JATemMcdSZkRHGoiitmA0kVrVLm
	 /Os2aalndyNDqSi5tJaiHqlHEXV3U4IRX0/7+FGRaNXel8aUv4FFnCRpXjqqUtpORu
	 B+OvYiT4ihCjQ==
Date: Mon, 9 Nov 2026 12:16:22 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: entry: Mark ret_from_fork_kernel() and
 ret_from_fork_user() noinstr
Message-ID: <avFJFlcVI1ycJzmJ@xhacker>
References: <20261109041845.33695-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261109041845.33695-1-kmehltretter@gmail.com>
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

On Mon, Nov 09, 2026 at 05:18:45AM +0100, Karl Mehltretter wrote:
> ret_from_fork_kernel() and ret_from_fork_user() are traceable and
> return after syscall_exit_to_user_mode() enters the RCU extended
> quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
> function_graph tracing is enabled with
> FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
> watching and triggers the ftrace_return_to_handler() warning.
> 
> Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr.
> 
> Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Assisted by an LLM.
> 
> v2:
>  - Drop instrumentation_begin()/instrumentation_end() around the kernel
>    thread callback. They only feed objtool's noinstr validation, which
>    riscv does not have (Jisheng Zhang). ret_from_fork_kernel() and
>    ret_from_fork_user() disassemble identically to v1 (Clang, defconfig
>    with NO_HZ_FULL and FUNCTION_GRAPH_TRACER).
> 
> v1: https://lore.kernel.org/r/20261107194931.69176-1-kmehltretter@gmail.com/
> 
> Tested with v1 on mainline d48723711bae (after v7.4-rc1) under QEMU
> riscv64 (-smp 4) with NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING,
> PROVE_LOCKING, nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line,
> and function_graph tracing during parallel fork bursts across CPUs 0-3.
> 
>  arch/riscv/kernel/process.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 34c1d498d1cad..6f2b46d1a8e98 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -225,14 +225,15 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	return 0;
>  }
>  
> -asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
> +					     struct pt_regs *regs)
>  {
>  	fn(fn_arg);
>  
>  	syscall_exit_to_user_mode(regs);
>  }
>  
> -asmlinkage void ret_from_fork_user(struct pt_regs *regs)
> +asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
>  {
>  	syscall_exit_to_user_mode(regs);
>  }
> 
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
> -- 
> 2.39.5 (Apple Git-154)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
