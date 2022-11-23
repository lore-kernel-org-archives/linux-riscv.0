Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35184C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3gnZUkXqArew4qd04UbIobz7KTUwvKg6nsfxOw/sTM=; b=21mq8eD8fTQ+r7
	SSwWHhyne/TEL4ahIT48DQ99hkVjftle2BQQNv2pH6DvqcBCFYxYqyQ++Ww+O1VhmsMyROp93Butf
	+PBjvcKfHe4T9eKl14nvLjriRuQdXt3EtM+dhwtmRbW15BFMbTm8nxgkQcLECZNbzgIvTU4TLM6Vn
	FwkupGfk964u2rxa9gdP2D+Hjh/bAV6U8crFGP4b31unm1jciTkcW6wKcCKt7Cy9F5sPgIG22IfCO
	mxDRYqM9IvJGKxJcTWxLXLWtqOALtTSsysSNmjDJMknM8e55fQlsA1rnWuKjWwP80BpCSnQegsufa
	gZv3ZG8z5RCrvTsWlucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrTQ-000Lpk-RV; Wed, 23 Nov 2022 15:15:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrTN-000LoG-QW
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:15:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33ED961D69
	for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 15:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D05C43144
	for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669216536;
	bh=GR9bHY+jajn1gtX3/1zdtKI8frk2y/zZodVBef+xowk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AA5qqIbR06H8EmEugBtOOQTR6qgLnXv8u0CfFOq3Yyet/b6UDONTHFX2jHI10k4Md
	 aTgcLByB0nduUS/ko762fsxm3z5m28myC2ilJme40/zNttfB3E66XS5gH5YVSQFV9G
	 TdmyBQmXgGbUI2si/KsyW5usqMZ/I7VVvLGjs3TMBqm//HNPbGqAxZiKE6HVol8/ec
	 GGIPTHieJqKKLydEE2tU12XWqmpgeIp7U60Z+L6h0dnB22kM0GwkwdpBsq1o9qBij4
	 hk4nVCVa9dRKjbsV4ghTwX0Npb1crYy1S3HKviM3j0kbowRPJb52EgW8pD+4utPm+G
	 U8lar7N4fg0zQ==
Received: by mail-ej1-f53.google.com with SMTP id kt23so43454407ejc.7
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 07:15:35 -0800 (PST)
X-Gm-Message-State: ANoB5plMDzGoJdfiaz3LAySqGMnCpAsB36cgaOCNhEB09+YRU+kwfYw8
	93zNaDKuANsLMxKtUtpGL3apfa14W4MR+8ncdfA=
X-Google-Smtp-Source: AA0mqf4eOt+vWRdK1Kh9qQEDKh2YIBaWB+U8pqc5/Wk0197YVUHT/JwPgTBgHyLBx33A7HxdtPpEcdUXhZKDSwV7mrI=
X-Received: by 2002:a17:906:19d7:b0:7b2:b782:e1df with SMTP id
 h23-20020a17090619d700b007b2b782e1dfmr20002921ejd.308.1669216534214; Wed, 23
 Nov 2022 07:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com> <20221123142025.1504030-2-suagrfillet@gmail.com>
In-Reply-To: <20221123142025.1504030-2-suagrfillet@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Nov 2022 23:15:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRf4TmJp_D4jhft2h6TGKubhXJTm3zxO5+s1bqT0dtQ7w@mail.gmail.com>
Message-ID: <CAJF2gTRf4TmJp_D4jhft2h6TGKubhXJTm3zxO5+s1bqT0dtQ7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_071537_948072_145CA087 
X-CRM114-Status: GOOD (  24.05  )
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

Hi Song,

On Wed, Nov 23, 2022 at 10:20 PM Song Shuai <suagrfillet@gmail.com> wrote:
>
> This patch adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for RISC-V.
>
> select the DYNAMIC_FTRACE_WITH_DIRECT_CALLS to provide the
> register_ftrace_direct[_multi] interfaces allowing users to register
> the customed trampoline (direct_caller) as the mcount for one or
> more target functions. And modify_ftrace_direct[_multi] are also
> provided for modifying direct_caller.
>
> To make the direct_caller and the other ftrace hooks (eg. function/fgraph
> tracer, k[ret]probes) co-exist, a temporary register is nominated to
> store the address of direct_caller in ftrace_regs_caller. After the
> setting of the address direct_caller by direct_ops->func and the
> RESTORE_REGS in ftrace_regs_caller, direct_caller will be jumped to
> by the `jr` inst.
>
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/Kconfig              | 1 +
>  arch/riscv/include/asm/ftrace.h | 6 ++++++
>  arch/riscv/kernel/mcount-dyn.S  | 4 ++++
>  3 files changed, 11 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 39ec8d628cf6..d083ec08d0b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -278,6 +278,7 @@ config ARCH_RV64I
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> +       select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>         select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>         select HAVE_FUNCTION_GRAPH_TRACER
>         select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 01bebb28eabe..be4d57566139 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -114,6 +114,12 @@ struct ftrace_regs;
>  void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
>                        struct ftrace_ops *op, struct ftrace_regs *fregs);
>  #define ftrace_graph_func ftrace_graph_func
> +
> +static inline void arch_ftrace_set_direct_caller(struct pt_regs *regs, unsigned long addr)
> +{
> +               regs->t1 = addr;
How about regs->t0 = addr; ?
And delete all mcount-dyn.S modification.
> +}
> +
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
>
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index 466c6ef217b1..b89c85a58569 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -233,6 +233,7 @@ ENDPROC(ftrace_caller)
>  #else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
>  ENTRY(ftrace_regs_caller)
>         SAVE_ABI_REGS 1
> +       REG_S   x0, PT_T1(sp)
>         PREPARE_ARGS
>
>  ftrace_regs_call:
> @@ -241,7 +242,10 @@ ftrace_regs_call:
>
>
>         RESTORE_ABI_REGS 1
> +       bnez    t1,.Ldirect
>         jr t0
> +.Ldirect:
> +       jr t1
>  ENDPROC(ftrace_regs_caller)
>
>  ENTRY(ftrace_caller)
> --
> 2.20.1
>


--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
