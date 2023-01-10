Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05165C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaOR9dOCew2ponBbckLg/crEfoKonXV/EnmwUZM+CEE=; b=sI/CwkDcVUMbna
	C9wfyTBpAeBSX41eG0QW8T8GmI4b5C0KYT5pVy1mTs9/XxdFwv4NyRn9obbrMNDGKJausvJtNzagE
	PNl6qyJ2IvBY15m0O0bXPlCKnx59zGYRDZxjbPSUtGtFfhH7xXMZ/B/EaLyrxmOtFxge8Stl8ZZju
	fW5V0aWf17YZeI5VR3vjT/HkBhIXnqDIVGJNeLdxIu9k151PV2BLypaAOuhjSS2IOOnMe3DvFd8UN
	zu2F3q1fuLaMyZjzWff5Xbm/m+KkzVz19HkNHKs0601sk1goatq10G/43f+FVGH/JtpSRHhY/d2ut
	2hfP1u+4TFWmtaj9+www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFIEr-007wQs-Dw; Tue, 10 Jan 2023 17:16:41 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFIEn-007wGT-Sh
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 17:16:40 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 514D734192D;
	Tue, 10 Jan 2023 20:16:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=u38bkopYCABOQQMld0
	fsTvGWfjgN43w21eXoZMwdjkM=; b=hT1vkwCujVp3CQXHZa7YMwJsdWcqk4Ej5Z
	UXT+cGHfYCJSE1XU4gE34iWh+eSgKewhfVqziDmPE7aHuhYrvQXlK0rBY4WLX0Ch
	dcrd+Ura7j2U0r3X8DKRQoW6TCNUxi8JRRbQxOW/kg198aM+dI8xAxiLlNXJsV+4
	8Pn9mjhtA=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 4427F34191B;
	Tue, 10 Jan 2023 20:16:36 +0300 (MSK)
Received: from [10.199.21.212] (10.199.21.212) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 10 Jan
 2023 20:16:35 +0300
Message-ID: <a6ce4a5e-bec7-bb0e-9765-c2d39f2f4e64@yadro.com>
Date: Tue, 10 Jan 2023 20:16:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next V6 5/7] riscv: ftrace: Make ftrace_caller call
 ftrace_graph_func
Content-Language: en-US
To: <guoren@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<anup@brainfault.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <heiko@sntech.de>, <rostedt@goodmis.org>,
	<mhiramat@kernel.org>, <jolsa@redhat.com>, <bp@suse.de>,
	<jpoimboe@kernel.org>, <suagrfillet@gmail.com>, <andy.chiu@sifive.com>,
	<linux@yadro.com>
References: <20230107133549.4192639-1-guoren@kernel.org>
 <20230107133549.4192639-6-guoren@kernel.org>
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <20230107133549.4192639-6-guoren@kernel.org>
X-Originating-IP: [10.199.21.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_091638_347804_5F5434C0 
X-CRM114-Status: GOOD (  25.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 07.01.2023 16:35, guoren@kernel.org wrote:
> From: Song Shuai <suagrfillet@gmail.com>
> 
> In order to make the function graph use ftrace directly, ftrace_caller
> should be adjusted to save the necessary regs against the pt_regs layout
> so it can call ftrace_graph_func reasonably.
> 
> SAVE_ALL now saves all the regs according to the pt_regs struct. Here
> supersedes SAVE_ALL by SAVE_ABI_REGS which has an extra option to allow
> saving only the necessary ABI-related regs for ftrace_caller.
> 
> ftrace_caller and ftrace_regs_caller save their regs with the respective
> option of SAVE_ABI_REGS, then call the tracing function, especially
> graph_ops's ftrace_graph_func. So the ftrace_graph_[regs]_call labels
> aren't needed anymore if FTRACE_WITH_REGS is defined.
> 
> As the previous patch described, the ftrace_caller remains with its
> ftrace_graph_call if FTRACE_WITH_REGS isn't defined,
> 
> For convenience, the original argument setup for the tracing function in
> ftrace_[regs]_caller is separated as PREPARE_ARGS.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   arch/riscv/kernel/mcount-dyn.S | 142 ++++++++++++++++++++++++---------
>   1 file changed, 104 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index b75332ced757..d7d4d51b4bd7 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -57,19 +57,52 @@
>          .endm
> 
>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> -       .macro SAVE_ALL
> +
> +/**
> +* SAVE_ABI_REGS - save regs against the pt_regs struct
> +*
> +* @all: tell if saving all the regs
> +*
> +* If all is set, all the regs will be saved, otherwise only ABI
> +* related regs (a0-a7,epc,ra and optional s0) will be saved.
> +*
> +* After the stack is established,
> +*
> +* 0(sp) stores the PC of the traced function which can be accessed
> +* by &(fregs)->regs->epc in tracing function. Note that the real
> +* function entry address should be computed with -FENTRY_RA_OFFSET.
> +*
> +* 8(sp) stores the function return address (i.e. parent IP) that
> +* can be accessed by &(fregs)->regs->ra in tracing function.
> +*
> +* The other regs are saved at the respective localtion and accessed
> +* by the respective pt_regs member.
> +*
> +* Here is the layout of stack for your reference.
> +*
> +* PT_SIZE_ON_STACK  ->  +++++++++
> +*                       + ..... +
> +*                       + t3-t6 +
> +*                       + s2-s11+
> +*                       + a0-a7 + --++++-> ftrace_caller saved
> +*                       + s1    +   +
> +*                       + s0    + --+
> +*                       + t0-t2 +   +
> +*                       + tp    +   +
> +*                       + gp    +   +
> +*                       + sp    +   +
> +*                       + ra    + --+ // parent IP
> +*               sp  ->  + epc   + --+ // PC
> +*                       +++++++++
> +**/
> +       .macro SAVE_ABI_REGS, all=0
>          addi    sp, sp, -PT_SIZE_ON_STACK
> 
>          REG_S t0,  PT_EPC(sp)
>          REG_S x1,  PT_RA(sp)
> -       REG_S x2,  PT_SP(sp)
> -       REG_S x3,  PT_GP(sp)
> -       REG_S x4,  PT_TP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> +
> +       // always save the ABI regs
> +
>          REG_S x10, PT_A0(sp)
>          REG_S x11, PT_A1(sp)
>          REG_S x12, PT_A2(sp)
> @@ -78,6 +111,18 @@
>          REG_S x15, PT_A5(sp)
>          REG_S x16, PT_A6(sp)
>          REG_S x17, PT_A7(sp)
> +
> +       // save the leftover regs
> +
> +       .if \all == 1
> +       REG_S x2,  PT_SP(sp)
> +       REG_S x3,  PT_GP(sp)
> +       REG_S x4,  PT_TP(sp)
> +       REG_S x5,  PT_T0(sp)
> +       REG_S x6,  PT_T1(sp)
> +       REG_S x7,  PT_T2(sp)
> +       REG_S x8,  PT_S0(sp)
> +       REG_S x9,  PT_S1(sp)
>          REG_S x18, PT_S2(sp)
>          REG_S x19, PT_S3(sp)
>          REG_S x20, PT_S4(sp)
> @@ -92,19 +137,19 @@
>          REG_S x29, PT_T4(sp)
>          REG_S x30, PT_T5(sp)
>          REG_S x31, PT_T6(sp)
> +
> +       // save s0 if FP_TEST defined
> +
> +       .else
> +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> +       REG_S x8,  PT_S0(sp)
> +#endif
> +       .endif
>          .endm
> 
> -       .macro RESTORE_ALL
> +       .macro RESTORE_ABI_REGS, all=0
>          REG_L t0,  PT_EPC(sp)
>          REG_L x1,  PT_RA(sp)
> -       REG_L x2,  PT_SP(sp)
> -       REG_L x3,  PT_GP(sp)
> -       REG_L x4,  PT_TP(sp)
> -       REG_L x5,  PT_T0(sp)
> -       REG_L x6,  PT_T1(sp)
> -       REG_L x7,  PT_T2(sp)
> -       REG_L x8,  PT_S0(sp)
> -       REG_L x9,  PT_S1(sp)
>          REG_L x10, PT_A0(sp)
>          REG_L x11, PT_A1(sp)
>          REG_L x12, PT_A2(sp)
> @@ -113,6 +158,16 @@
>          REG_L x15, PT_A5(sp)
>          REG_L x16, PT_A6(sp)
>          REG_L x17, PT_A7(sp)
> +
> +       .if \all == 1
> +       REG_L x2,  PT_SP(sp)
> +       REG_L x3,  PT_GP(sp)
> +       REG_L x4,  PT_TP(sp)
> +       REG_L x5,  PT_T0(sp)

Same as for the patch #3, please skip "REG_L x5,  PT_T0(sp)" here. The 
correct value of t0/x5 has already been read from PT_EPC(sp) at this point.

> +       REG_L x6,  PT_T1(sp)
> +       REG_L x7,  PT_T2(sp)
> +       REG_L x8,  PT_S0(sp)
> +       REG_L x9,  PT_S1(sp)
>          REG_L x18, PT_S2(sp)
>          REG_L x19, PT_S3(sp)
>          REG_L x20, PT_S4(sp)
> @@ -128,10 +183,25 @@
>          REG_L x30, PT_T5(sp)
>          REG_L x31, PT_T6(sp)
> 
> +       .else
> +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> +       REG_L x8,  PT_S0(sp)
> +#endif
> +       .endif
>          addi    sp, sp, PT_SIZE_ON_STACK
>          .endm
> +
> +       .macro PREPARE_ARGS
> +       addi    a0, t0, -FENTRY_RA_OFFSET       // ip
> +       la      a1, function_trace_op
> +       REG_L   a2, 0(a1)                       // op
> +       mv      a1, ra                          // parent_ip
> +       mv      a3, sp                          // fregs
> +       .endm
> +
>   #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> 
> +#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>   ENTRY(ftrace_caller)
>          SAVE_ABI
> 
> @@ -160,33 +230,29 @@ ftrace_graph_call:
>          jr t0
>   ENDPROC(ftrace_caller)
> 
> -#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
>   ENTRY(ftrace_regs_caller)
> -       SAVE_ALL
> -
> -       addi    a0, t0, -FENTRY_RA_OFFSET
> -       la      a1, function_trace_op
> -       REG_L   a2, 0(a1)
> -       mv      a1, ra
> -       mv      a3, sp
> +       SAVE_ABI_REGS 1
> +       PREPARE_ARGS
> 
>   ftrace_regs_call:
>          .global ftrace_regs_call
>          call    ftrace_stub
> 
> -#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> -       addi    a0, sp, PT_RA
> -       REG_L   a1, PT_T0(sp)
> -       addi    a1, a1, -FENTRY_RA_OFFSET
> -#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> -       mv      a2, s0
> -#endif
> -ftrace_graph_regs_call:
> -       .global ftrace_graph_regs_call
> -       call    ftrace_stub
> -#endif
> 
> -       RESTORE_ALL
> +       RESTORE_ABI_REGS 1
>          jr t0
>   ENDPROC(ftrace_regs_caller)
> +
> +ENTRY(ftrace_caller)
> +       SAVE_ABI_REGS 0
> +       PREPARE_ARGS
> +
> +ftrace_call:
> +       .global ftrace_call
> +       call    ftrace_stub
> +
> +       RESTORE_ABI_REGS 0
> +       jr t0
> +ENDPROC(ftrace_caller)
>   #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> --
> 2.36.1
> 
> 
Regards,
Evgenii



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
