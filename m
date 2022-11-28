Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6170C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyXRZH8LmI98BSMqBVqtTkYxLQsfLUgUuurRBmECHW0=; b=VSVtl2vgD8YhLW
	7R0dLRoghFHyjx3RFKt0gNKdU4vwGzaMc2AmIgLHnGeWu/fUz+EukGftouTNt9q6AL2vjFNQnO602
	9sUIjPXoY3VxNn2ihzZMMKyEyDLWmwsjh4YRa/DiXrR1ZM/fW/aEzOPeA/CE+JkBU4jB/mNrpHS2V
	OOszG/IRvgSOT/Wefj4yKa6YxtzUOjtZSxet4cz9bExcFfIIijRkS/dtBtvDpUHegkiLF96pnnh2X
	Wg8SVZH3ie+7T/R/twUKWAqdXJxTG6Nad6Aapakewm0PcvypH3aL1R9IUiCCiLo2CTGGgVnjOqnrp
	/ouJA2Vjv18WHpDWMg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbGP-00107g-61; Mon, 28 Nov 2022 10:21:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbGM-00105u-At
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:21:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A4E2CB80CA9
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 10:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8C8C433D6
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669630879;
	bh=YCfS3w8TB91EvzTqEcHgJL7Y7tpu2nn3z+j7xTTEJA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z2KEtmQg5l5jRY5l/FnYawRyBtD3aOLIfkxJVICHKyutphRgqJzgdvopIcvEVs8Gh
	 VJ7zgir1lVshdzJcNWQPpH31kPCqbDLmenNmejNKWmbXdzSq9EyRTObr9c1jld2TRC
	 /3WXc/HssFBQjguWCPr3+I+ojjB5EctYEsb6UWasAzFgHN2Kw9Ucux18oHUE8gynCT
	 mu3zpi+c0H8z6PfgBjN43Aq/d+cqwgFOH0BjQa8WXngHxCNTyiUDRfb0gtBhEBpwdm
	 dG/uh3Ji/ZNUO0pwpZxG5aor4Ay9GEdt7u8VL3rR7bydhIzh8vwkX59+/LlleSyl/h
	 9Jenzlr0WhDeQ==
Received: by mail-ed1-f45.google.com with SMTP id e13so14743631edj.7
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 02:21:19 -0800 (PST)
X-Gm-Message-State: ANoB5pkRJSIhs4ZSfTev4fJFPRO5btvGmPcVp5j3Rp73qBf5bCy48SYa
	oA+9MMCraoGXqPzCulZHre+Rc4SyBelb7e9lUkw=
X-Google-Smtp-Source: AA0mqf6jSIDEBDivT7wc+vz6hgTuUovGcwvT2z6KpLXWXjKLTVvbeG/uvWIZR1FeXKtq1ps5KG7tRhglrLnO2suJpQ4=
X-Received: by 2002:aa7:d551:0:b0:468:fb2c:6c8c with SMTP id
 u17-20020aa7d551000000b00468fb2c6c8cmr44959423edr.340.1669630877545; Mon, 28
 Nov 2022 02:21:17 -0800 (PST)
MIME-Version: 1.0
References: <CAAYs2=hNAwDk7=F077ityNykZJCCvGVyXsxRzZO3s7rKwOPpUg@mail.gmail.com>
 <20221128101201.4144527-1-guoren@kernel.org> <20221128101201.4144527-2-guoren@kernel.org>
In-Reply-To: <20221128101201.4144527-2-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Nov 2022 18:21:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRc8RiP6b9zcinT-OvRon9_c7L0wm58-9KDoJGns9hiPQ@mail.gmail.com>
Message-ID: <CAJF2gTRc8RiP6b9zcinT-OvRon9_c7L0wm58-9KDoJGns9hiPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] samples: ftrace: Add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]
To: suagrfillet@gmail.com, guoren@kernel.org
Cc: aou@eecs.berkeley.edu, bp@suse.de, jolsa@redhat.com, jpoimboe@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mark.rutland@arm.com, mhiramat@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, rostedt@goodmis.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_022122_728673_1FD04B47 
X-CRM114-Status: GOOD (  18.57  )
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

On Mon, Nov 28, 2022 at 6:12 PM <guoren@kernel.org> wrote:
>
> From: Song Shuai <suagrfillet@gmail.com>
>
> select HAVE_SAMPLE_FTRACE_DIRECT and HAVE_SAMPLE_FTRACE_DIRECT_MULTI
> for ARCH_RV64I in arch/riscv/Kconfig. And add riscv asm code for
> the ftrace-direct*.c files in samples/ftrace/.
>
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
> Below is modified by Guo Ren:
>
> diff --git a/samples/ftrace/ftrace-direct-modify.c
> b/samples/ftrace/ftrace-direct-modify.c
> index 5582d000d803..d970b46ecc4e 100644
> --- a/samples/ftrace/ftrace-direct-modify.c
> +++ b/samples/ftrace/ftrace-direct-modify.c
> @@ -29,6 +29,7 @@ asm ("        .pushsection    .text, \"ax\",
> @progbits\n"
>  "      .globl          my_tramp1\n"
>  "   my_tramp1:\n"
>  "      addi sp,sp,-16\n"
> +"      move t0,t1\n"
>  "      sd   t0,0(sp)\n"
>  "      sd   ra,8(sp)\n"
>  "      call my_direct_func1\n"
> diff --git a/samples/ftrace/ftrace-direct-multi-modify.c
> b/samples/ftrace/ftrace-direct-multi-modify.c
> index 43e02d39c652..9534e18fa6ed 100644
> --- a/samples/ftrace/ftrace-direct-multi-modify.c
> +++ b/samples/ftrace/ftrace-direct-multi-modify.c
> @@ -28,6 +28,7 @@ asm ("        .pushsection    .text, \"ax\",
> @progbits\n"
>  "   my_tramp1:\n"
>  "       addi sp,sp,-24\n"
>  "       sd   a0,0(sp)\n"
> +"       move t0,t1\n"
>  "       sd   t0,8(sp)\n"
>  "       sd   ra,16(sp)\n"
>  "       call my_direct_func1\n"
> diff --git a/samples/ftrace/ftrace-direct-multi.c
> b/samples/ftrace/ftrace-direct-multi.c
> index df91339d3095..2111478b0463 100644
> --- a/samples/ftrace/ftrace-direct-multi.c
> +++ b/samples/ftrace/ftrace-direct-multi.c
> @@ -23,6 +23,7 @@ asm ("       .pushsection    .text, \"ax\",
> @progbits\n"
>  "   my_tramp:\n"
>  "       addi sp,sp,-24\n"
>  "       sd   a0,0(sp)\n"
> +"       move t0,t1\n"
>  "       sd   t0,8(sp)\n"
>  "       sd   ra,16(sp)\n"
>  "       call my_direct_func\n"
> diff --git a/samples/ftrace/ftrace-direct-too.c
> b/samples/ftrace/ftrace-direct-too.c
> index fe3b8c4f3336..e80981d3dc0a 100644
> --- a/samples/ftrace/ftrace-direct-too.c
> +++ b/samples/ftrace/ftrace-direct-too.c
> @@ -27,6 +27,7 @@ asm ("       .pushsection    .text, \"ax\",
> @progbits\n"
>  "       sd   a0,0(sp)\n"
>  "       sd   a1,8(sp)\n"
>  "       sd   a2,16(sp)\n"
> +"       move t0,t1\n"
>  "       sd   t0,24(sp)\n"
>  "       sd   ra,32(sp)\n"
>  "       call my_direct_func\n"
> diff --git a/samples/ftrace/ftrace-direct.c
> b/samples/ftrace/ftrace-direct.c
> index 0784024b6653..b6cae1b5cb66 100644
> --- a/samples/ftrace/ftrace-direct.c
> +++ b/samples/ftrace/ftrace-direct.c
> @@ -22,6 +22,7 @@ asm ("       .pushsection    .text, \"ax\",
> @progbits\n"
>  "   my_tramp:\n"
>  "       addi sp,sp,-24\n"
>  "       sd   a0,0(sp)\n"
> +"       move t0,t1\n"
>  "       sd   t0,8(sp)\n"
>  "       sd   ra,16(sp)\n"
>  "       call my_direct_func\n"
> ---
>  arch/riscv/Kconfig                          |  2 ++
>  samples/ftrace/ftrace-direct-modify.c       | 34 ++++++++++++++++++
>  samples/ftrace/ftrace-direct-multi-modify.c | 38 +++++++++++++++++++++
>  samples/ftrace/ftrace-direct-multi.c        | 23 +++++++++++++
>  samples/ftrace/ftrace-direct-too.c          | 27 +++++++++++++++
>  samples/ftrace/ftrace-direct.c              | 23 +++++++++++++
>  6 files changed, 147 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 2828537abfcd..0a1da03e88c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -279,6 +279,8 @@ config ARCH_RV64I
>         select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>         select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> +       select HAVE_SAMPLE_FTRACE_DIRECT
> +       select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>         select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>         select HAVE_FUNCTION_GRAPH_TRACER
>         select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
> index 39146fa83e20..6a633ff4cf6d 100644
> --- a/samples/ftrace/ftrace-direct-modify.c
> +++ b/samples/ftrace/ftrace-direct-modify.c
> @@ -22,6 +22,40 @@ extern void my_tramp2(void *);
>
>  static unsigned long my_ip = (unsigned long)schedule;
>
> +#ifdef CONFIG_RISCV
> +
> +asm (" .pushsection    .text, \"ax\", @progbits\n"
> +"      .type           my_tramp1, @function\n"
> +"      .globl          my_tramp1\n"
> +"   my_tramp1:\n"
> +"      addi sp,sp,-16\n"
> +"      move t0,t1\n"
> +"      sd   t0,0(sp)\n"
> +"      sd   ra,8(sp)\n"
> +"      call my_direct_func1\n"
> +"      ld   t0,0(sp)\n"
> +"      ld   ra,8(sp)\n"
> +"      addi sp,sp,16\n"
> +"      jr t0\n"
> +"      .size           my_tramp1, .-my_tramp1\n"
> +
> +"      .type           my_tramp2, @function\n"
> +"      .globl          my_tramp2\n"
> +"   my_tramp2:\n"
> +"      addi sp,sp,-16\n"
> +"      sd   t0,0(sp)\n"
> +"      sd   ra,8(sp)\n"
> +"      call my_direct_func2\n"
> +"      ld   t0,0(sp)\n"
> +"      ld   ra,8(sp)\n"
> +"      addi sp,sp,16\n"
> +"      jr t0\n"
> +"      .size           my_tramp2, .-my_tramp2\n"
> +"      .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>  #ifdef CONFIG_X86_64
>
>  #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
> index 65aa94d96f4e..9534e18fa6ed 100644
> --- a/samples/ftrace/ftrace-direct-multi-modify.c
> +++ b/samples/ftrace/ftrace-direct-multi-modify.c
> @@ -20,6 +20,44 @@ void my_direct_func2(unsigned long ip)
>  extern void my_tramp1(void *);
>  extern void my_tramp2(void *);
>
> +#ifdef CONFIG_RISCV
> +
> +asm (" .pushsection    .text, \"ax\", @progbits\n"
> +"      .type           my_tramp1, @function\n"
> +"      .globl          my_tramp1\n"
> +"   my_tramp1:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       move t0,t1\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func1\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"      jr t0\n"
> +"      .size           my_tramp1, .-my_tramp1\n"
> +
> +"      .type           my_tramp2, @function\n"
> +"      .globl          my_tramp2\n"
> +"   my_tramp2:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
Be care, and I missed one.
+"       move t0,t1\n"

> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func2\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"      jr t0\n"
> +"      .size           my_tramp2, .-my_tramp2\n"
> +"      .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>  #ifdef CONFIG_X86_64
>
>  #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
> index 41ded7c615c7..2111478b0463 100644
> --- a/samples/ftrace/ftrace-direct-multi.c
> +++ b/samples/ftrace/ftrace-direct-multi.c
> @@ -15,6 +15,29 @@ void my_direct_func(unsigned long ip)
>
>  extern void my_tramp(void *);
>
> +#ifdef CONFIG_RISCV
> +
> +asm ("       .pushsection    .text, \"ax\", @progbits\n"
> +"       .type           my_tramp, @function\n"
> +"       .globl          my_tramp\n"
> +"   my_tramp:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       move t0,t1\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"       jr t0\n"
> +"       .size           my_tramp, .-my_tramp\n"
> +"       .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>  #ifdef CONFIG_X86_64
>
>  #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
> index 6690468c5cc2..e80981d3dc0a 100644
> --- a/samples/ftrace/ftrace-direct-too.c
> +++ b/samples/ftrace/ftrace-direct-too.c
> @@ -17,6 +17,33 @@ void my_direct_func(struct vm_area_struct *vma,
>
>  extern void my_tramp(void *);
>
> +#ifdef CONFIG_RISCV
> +
> +asm ("       .pushsection    .text, \"ax\", @progbits\n"
> +"       .type           my_tramp, @function\n"
> +"       .globl          my_tramp\n"
> +"   my_tramp:\n"
> +"       addi sp,sp,-40\n"
> +"       sd   a0,0(sp)\n"
> +"       sd   a1,8(sp)\n"
> +"       sd   a2,16(sp)\n"
> +"       move t0,t1\n"
> +"       sd   t0,24(sp)\n"
> +"       sd   ra,32(sp)\n"
> +"       call my_direct_func\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   a1,8(sp)\n"
> +"       ld   a2,16(sp)\n"
> +"       ld   t0,24(sp)\n"
> +"       ld   ra,32(sp)\n"
> +"       addi sp,sp,40\n"
> +"       jr t0\n"
> +"       .size           my_tramp, .-my_tramp\n"
> +"       .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>  #ifdef CONFIG_X86_64
>
>  #include <asm/ibt.h>
> diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
> index e8f1e440b9b8..b6cae1b5cb66 100644
> --- a/samples/ftrace/ftrace-direct.c
> +++ b/samples/ftrace/ftrace-direct.c
> @@ -14,6 +14,29 @@ void my_direct_func(struct task_struct *p)
>
>  extern void my_tramp(void *);
>
> +#ifdef CONFIG_RISCV
> +
> +asm ("       .pushsection    .text, \"ax\", @progbits\n"
> +"       .type           my_tramp, @function\n"
> +"       .globl          my_tramp\n"
> +"   my_tramp:\n"
> +"       addi sp,sp,-24\n"
> +"       sd   a0,0(sp)\n"
> +"       move t0,t1\n"
> +"       sd   t0,8(sp)\n"
> +"       sd   ra,16(sp)\n"
> +"       call my_direct_func\n"
> +"       ld   a0,0(sp)\n"
> +"       ld   t0,8(sp)\n"
> +"       ld   ra,16(sp)\n"
> +"       addi sp,sp,24\n"
> +"       jr t0\n"
> +"       .size           my_tramp, .-my_tramp\n"
> +"       .popsection\n"
> +);
> +
> +#endif /* CONFIG_RISCV */
> +
>  #ifdef CONFIG_X86_64
>
>  #include <asm/ibt.h>
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
