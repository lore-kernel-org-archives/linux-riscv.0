Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8205C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18JObs8f6zDhVGzejZp1/oDGhrbkc8EpxHBtx87iQl4=; b=uT7HQIbX8QPlLV
	MHYobZDIenrK0KnezJO0a7b27+zKKmb1cgBxc1oAWxyCjoDFyiIZ7VAZ81uyF1x5vXwr/0XME1lPJ
	VuWzvsDSmCeKXN+iNVB1E02jqYNtnzENGoT8NQ/2I3N+uL0tR9vb/AF/BupycIYFckVeftSA//un+
	k5AUBkUTySsa9YTNloU37VxA4Th8v0mWlUAQ6kUAPBfpTI3KGnJ/tS6x15SjP13ELfxB6IkgBV+X5
	2spDzMAh1flxPm1vlnwwDnLYPTNJ6dI0SoIMOo7K5JqhadUgOyw8P7RTxCS0T7dKlosJmKi33+i2x
	75MyWgDfA3/QNvmpCVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwVE-00ExqT-M3; Thu, 12 Jan 2023 12:16:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwV7-00Exop-IQ
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 12:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C6541063;
	Thu, 12 Jan 2023 04:16:49 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.43.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09C7D3F67D;
	Thu, 12 Jan 2023 04:16:04 -0800 (PST)
Date: Thu, 12 Jan 2023 12:16:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	e.shatokhin@yadro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next V7 1/7] riscv: ftrace: Fixup panic by disabling
 preemption
Message-ID: <Y7/6AtX5X0+5qF6Y@FVFF77S0Q05N>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <20230112090603.1295340-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112090603.1295340-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_041612_102552_8EDD72B5 
X-CRM114-Status: GOOD (  23.60  )
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

Hi Guo,

On Thu, Jan 12, 2023 at 04:05:57AM -0500, guoren@kernel.org wrote:
> From: Andy Chiu <andy.chiu@sifive.com>
> 
> In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> forming a jump that jumps to an address over 4K. This may cause errors
> if we want to enable kernel preemption and remove dependency from
> patching code with stop_machine(). For example, if a task was switched
> out on auipc. And, if we changed the ftrace function before it was
> switched back, then it would jump to an address that has updated 11:0
> bits mixing with previous XLEN:12 part.
> 
> p: patched area performed by dynamic ftrace
> ftrace_prologue:
> p|      REG_S   ra, -SZREG(sp)
> p|      auipc   ra, 0x? ------------> preempted
> 					...
> 				change ftrace function
> 					...
> p|      jalr    -?(ra) <------------- switched back
> p|      REG_L   ra, -SZREG(sp)
> func:
> 	xxx
> 	ret

As mentioned on the last posting, I don't think this is sufficient to fix the
issue. I've replied with more detail there:

  https://lore.kernel.org/lkml/Y7%2F3hoFjS49yy52W@FVFF77S0Q05N/

Even in a non-preemptible SMP kernel, if one CPU can be in the middle of
executing the ftrace_prologue while another CPU is patching the
ftrace_prologue, you have the exact same issue.

For example, if CPU X is in the prologue fetches the old AUIPC and the new
JALR (because it races with CPU Y modifying those), CPU X will branch to the
wrong address. The race window is much smaller in the absence of preemption,
but it's still there (and will be exacerbated in virtual machines since the
hypervisor can preempt a vCPU at any time).

Note that the above is even assuming that instruction fetches are atomic, which
I'm not sure is the case; for example arm64 has special CMODX / "Concurrent
MODification and eXecutuion of instructions" rules which mean only certain
instructions can be patched atomically.

Either I'm missing something that provides mutual exclusion between the
patching and execution of the ftrace_prologue, or this patch is not sufficient.

Thanks,
Mark.

> Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..ee0d39b26794 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -138,7 +138,7 @@ config RISCV
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_GRAPH_TRACER
> -	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> +	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>  
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
