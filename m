Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E5CC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOcmWg/ePAIyMtKjFiKF2Jihr6b/NNXEWGutbP/P2Pg=; b=hYI8ZbJsIlvbjs
	zNBQdN+0JerFFaV8m3PXmhc3JkFHiCYGLE89Tnwd2aE+EPGU7GVczJuPtUcasaNmcwOC3YTwLtsC7
	1mPE2JiDL3nrQY/IfQfnLpDEhtKDCc6OWZvqGLoYrqaglNQNpa7pZyvIHli9CV5XaSGb8ZX5EcWmV
	YbFA/ycs2SlHRspIyMWmU5PIPhv1osKbC1YGTlnXFC547dimqQCJMXwKVp7OETzijr5pDp7JUp62l
	pvoRKroE1sVImVvVgTfYKjpFPVpZEwNiFbEFx6EQQLAVMeIry1+aJn0MOEh7Es01kqL2Wb910CsAv
	DPTvL1Z7Yf0Ju+FSyx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcRVS-00DW9W-0R;
	Wed, 15 Mar 2023 13:49:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcRVP-00DW8M-0F;
	Wed, 15 Mar 2023 13:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g3mBlB5VPpZ+aaA/RhHEMTqxNoHNebohyy3XehgP994=; b=e4Ov7gaphgtp90s1//nLy6o1l3
	7CoEwOwzcFWI8zLbI7BWjWDkVrK69mTVmHctWfu6FMWh+G4lSiN+SmNrn5DyaXM2LuKvoeGV74s0f
	VK5W8WhRygwx9ZlDQIANn+NlMOTgAuQ51iJMCWcQgNwP9fodPavp30uVcd4DVqUTE//S1rPh49/w1
	Le6blNOKugRIkltXk6rhsN6S4RccMaihfrz7Z+9j8uIvS/7wHl4GPNdenh/pwHEWmgWGDpAl2/9c4
	5FbBXXE1G8PZh8DcTjg4HGtitNnLQLotygclBOugunPiwRwCZ8AdOX+nLoTJUfnimxM5wlR0eeKoG
	IS8ENW2A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcRVC-00Dscm-RK; Wed, 15 Mar 2023 13:49:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0980F300293;
	Wed, 15 Mar 2023 14:49:11 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D308820FF20AB; Wed, 15 Mar 2023 14:49:11 +0100 (CET)
Date: Wed, 15 Mar 2023 14:49:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
	xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230315134911.GD2006103@hirez.programming.kicks-ass.net>
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
 <20230315133911.958741-2-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315133911.958741-2-pengdonglin@sangfor.com.cn>
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

On Wed, Mar 15, 2023 at 06:39:10AM -0700, Donglin Peng wrote:
> diff --git a/arch/x86/kernel/ftrace_32.S b/arch/x86/kernel/ftrace_32.S
> index a0ed0e4a2c0c..44a773d9de82 100644
> --- a/arch/x86/kernel/ftrace_32.S
> +++ b/arch/x86/kernel/ftrace_32.S
> @@ -184,6 +184,10 @@ SYM_CODE_END(ftrace_graph_caller)
>  return_to_handler:
>  	pushl	%eax
>  	pushl	%edx
> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> +	/* Pass the function return value to ftrace_return_to_handler*/
> +	movl	%eax, %edx
> +#endif
>  	movl	$0, %eax
>  	call	ftrace_return_to_handler
>  	movl	%eax, %ecx
> diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
> index 1265ad519249..35ac9c58dc77 100644
> --- a/arch/x86/kernel/ftrace_64.S
> +++ b/arch/x86/kernel/ftrace_64.S
> @@ -348,6 +348,10 @@ SYM_CODE_START(return_to_handler)
>  	movq %rax, (%rsp)
>  	movq %rdx, 8(%rsp)
>  	movq %rbp, %rdi
> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> +	/* Pass the function return value to ftrace_return_to_handler */
> +	movq %rax, %rsi
> +#endif
>  
>  	call ftrace_return_to_handler

What about the case of double register return values (when the value
is returned in the A,D pair) ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
