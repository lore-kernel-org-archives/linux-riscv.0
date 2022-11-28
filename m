Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05A1C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPXVPo01ETwcVJnPYdzHHaU3GDWsCxL2bnOLmdiQb4Y=; b=YyFzzuH74UUwxR
	1uvQgwTrVS3Qs91Fxa1tVylRl/OlpHrTZ/tUzNqUno02g6VOT1gtwDeReA5F95yXPyKpxO/mVXspe
	frIhCuNSrTgjWiIeqUWY47Xq6Q9X0Pv1axOVFtLJLbTlbMD7/C/uRFtSoRBmrPx/K4mCHN64Zubls
	Z7S21vClskBEnk4qBET47+DyLMMi2OpQENBiBzm6a/ONfJgFTXnYJXE6f5wiF3wurVqag30TokABk
	FcHMUvIMAQkcTC9Qzk6z5Xaci+bPcPE1+k9BJy4o5YBFRnQ/lXIMfCitGZnJpQI1Wp/iBv+nwpLV8
	TmG+dtfis5eTe2lLxoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oze0Z-001l7G-N5; Mon, 28 Nov 2022 13:17:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oze0W-001l6X-4L
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 13:17:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B90E6117A
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EC8C433B5
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669641430;
	bh=pdjKPY5Vwqu/CAsrLfzJyZMpBhMzVI/GQU7fhz39+/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uKtihpIJGPHpu8vKdT5F9j8gtk94PPDN3uC4JLKnbBjT9znkcNTxaZhBPbRJ2KfCC
	 t0giI5F0vjsTWvgh2gK/IUdjlrKlk+RaOQ99WORYyKtLsRbhc1XnyktxTXHEHCh7AL
	 WA4ue/yf4/qAmXxuA1aJj6g8taUspe+EY/9REk76Jtvk3p0OJvDycKX+Egje+8a1YT
	 OURLu7MesWbVEfmDTju8mRG1qw23AsIBwKYrJoPcsZcV70iPWrcJMt4StYH4tlNDcg
	 Ynsm/IwvFntjriwCN0fLJe2yEyeIKZToa+WRFIzrZgeBO83mxKkzDdNkECafycehS3
	 zstprPTuLo6uA==
Received: by mail-ed1-f47.google.com with SMTP id z18so15340166edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 05:17:10 -0800 (PST)
X-Gm-Message-State: ANoB5pnWChyVC1rLs8Dr3w0TMalEUZO/Boln+yYK4vq5b/spyDfGlDoW
	9fExx2c8RSAcqGR5DmaLDFKAtPtUpyh8MB9fBTM=
X-Google-Smtp-Source: AA0mqf79LR06QFhiVEmF2iL7F5EjIQqSlNkibB6++4nyjYylUeni5ntphRqVKawb/z56EA++ZVk9VtgLvgO2nQD815Q=
X-Received: by 2002:aa7:c511:0:b0:469:7731:5b29 with SMTP id
 o17-20020aa7c511000000b0046977315b29mr37242376edq.419.1669641429146; Mon, 28
 Nov 2022 05:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com> <20221123142025.1504030-2-suagrfillet@gmail.com>
In-Reply-To: <20221123142025.1504030-2-suagrfillet@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Nov 2022 21:16:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSbyfwdCDdUu7S3JpdFpspxVEi+t_8r6SQhaLogE1O7wg@mail.gmail.com>
Message-ID: <CAJF2gTSbyfwdCDdUu7S3JpdFpspxVEi+t_8r6SQhaLogE1O7wg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_051712_271119_97BD4B24 
X-CRM114-Status: GOOD (  24.22  )
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
ENTRY(ftrace_regs_caller)
+    move t1, zero
      SAVE_ABI_REGS 1
      PREPARE_ARGS

Shall we use a move here, instead?

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
