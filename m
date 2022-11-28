Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE26CC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaQnRGoBu/MezmPf4Qj/IpkwhkEhD7yVeFoltWs25Do=; b=FKVCuSygoW+an6
	ZJZp6RYilV/osvgU2VW2IogFniy/Mgwe4eY808bD8Y0bvJvNDWRNc5xTwyTn1HLU+aOPCEtf9lXq8
	ajTXPKY3Jf2Socp5XAcj6ntwLnEYpeWO/I0ADCLPDm57scyVrDfjc36RTF3/+SyY7kAXz2Yhc9f2a
	IctJHLy9ncij+Sn26q/f29m2GxGZlED2FcIgzZHp3rjV9LxBJw/IQTcfz/HlG/zoxm0rSQtoOttRj
	JN0P9yfG5sQYAOZAWagaSmnshHKOr2OcqWtCoKQHtFlctHxrdRxHIZKswGGkeaGJiTMICysCG3Xwy
	NywyXoPwXbKfhOACzyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdf1-001ga6-Fm; Mon, 28 Nov 2022 12:54:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdey-001gYR-46
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 12:54:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8F7861179
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 12:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CE5C43470
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669640095;
	bh=NhTLaXEkdYgcJsMx6yEP6NGvTkuPNf2uOMNYgKPmU9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aofybGdprp+SWCs5FEfdG1ILsXNhOumf+6MdEE2mvlbPONSVSHf8UhymxDvo2h4yC
	 1DVNQpVEaFJu+6Vm38cejudOrs+VTmXCagbPxD5KpLcCTtpPQCvVjQ3zKXX5FPdbuA
	 H9rJmIw+AQHnGR41KogBDZuc1Opn2CuoXTztMxw7tVc2SaW+mgxbBnZBOlIVntjQEc
	 DYsd4xVLRejPeGsgDBiwn/ZT8Y5gjSQZbghqRknQhPOz4stHNI6qsFxxqNeYJKF2EX
	 5p3bTCjZJiAGE81EtK4KBgeU9g7PHuflbqbrFciTGqvOMm2NcWknzaa+qqbbzROdtK
	 peWbLhe0iqXyw==
Received: by mail-ej1-f44.google.com with SMTP id ml11so628814ejb.6
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 04:54:55 -0800 (PST)
X-Gm-Message-State: ANoB5pnrjK/0FrWAf5d2kd6vwIJw+1epwPbv+OoQopaNDn3FnHqCMhCf
	2ymvnc4gQkPqc5nJJHoTdhZgKX1et0lwTEJ+qR0=
X-Google-Smtp-Source: AA0mqf6sXDpJjurrIuddM/a2ZbRE2PEk8Ef2Y+2IOd6apwZ7sg/HsraMSzi3JwjLzieYKVgJxNj9cTIeW6Xd5dE0l64=
X-Received: by 2002:a17:906:ee2:b0:78d:3f96:b7aa with SMTP id
 x2-20020a1709060ee200b0078d3f96b7aamr29134490eji.74.1669640093273; Mon, 28
 Nov 2022 04:54:53 -0800 (PST)
MIME-Version: 1.0
References: <CAAYs2=hNAwDk7=F077ityNykZJCCvGVyXsxRzZO3s7rKwOPpUg@mail.gmail.com>
 <20221128101201.4144527-1-guoren@kernel.org>
In-Reply-To: <20221128101201.4144527-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Nov 2022 20:54:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTrJCGj19EzRpd_iQ54hAj_bQZQ+xJx7j9FzDSNFwMCLg@mail.gmail.com>
Message-ID: <CAJF2gTTrJCGj19EzRpd_iQ54hAj_bQZQ+xJx7j9FzDSNFwMCLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: suagrfillet@gmail.com, guoren@kernel.org
Cc: aou@eecs.berkeley.edu, bp@suse.de, jolsa@redhat.com, jpoimboe@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mark.rutland@arm.com, mhiramat@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, rostedt@goodmis.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_045456_268465_CD1496F9 
X-CRM114-Status: GOOD (  23.52  )
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

Abandoned

On Mon, Nov 28, 2022 at 6:12 PM <guoren@kernel.org> wrote:
>
> From: Song Shuai <suagrfillet@gmail.com>
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
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  Remove modification of mcount-dyn.S. (Guo Ren)
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/ftrace.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d0e5838b11b..2828537abfcd 100644
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
> index 84f856a3286e..d2c159cdfa5c 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -114,6 +114,32 @@ struct ftrace_regs;
>  void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
>                        struct ftrace_ops *op, struct ftrace_regs *fregs);
>  #define ftrace_graph_func ftrace_graph_func
> +
> +static inline void arch_ftrace_set_direct_caller(struct pt_regs *regs, unsigned long addr)
> +{
> +               /*
> +                * Backup origin detour target (t0) in t1, and set t0 with addr.
> +                *
> +                * Here is the sample code for riscv direct_caller:
> +                *
> +                * addi sp,sp,-16
> +                * move t0,t1
> +                * ^^^^^^^^^^
> +                * sd   t0,0(sp)
> +                * sd   ra,8(sp)
> +                * call my_direct_func1
> +                * ld   t0,0(sp)
> +                * ld   ra,8(sp)
> +                * addi sp,sp,16
> +                * jr t0
> +                *
> +                * (Set t0 with t1 for continuous detour, because t1 contains origin detour
> +                *  target)
> +                */
> +               regs->t1 = regs->t0;
> +               regs->t0 = addr;
> +}
> +
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
>
>  #endif /* __ASSEMBLY__ */
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
