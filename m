Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00218C54EBE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4WvQrvyzWr2S7L5BbHLSn0ipZB1a1R0TXlbh5YEUts=; b=g6jspEQ1F6H8S1
	4FOD8XsXaRs+eQq2uouuMjqWDZCw1ouItxw05SibQWN54jRqbWIwRrke9l7RtLCP7dG9O+uvmHkO7
	nD0gl41IHxmP4ORaju2VpPRtEphsgPbgJlujC0O6QGAJp0gFcq6cdtIaRMsPDwA03DTXtF/wg2I1Y
	aJ7+VKZ/FFZewHJeYOJfyHDhpVQr+urjdUZ68cllYgDSogH5kmemPUXiY/3GA7oSPtup72pQUiy5F
	cglEthHgBYSBH06KqmAQxkVkcz+zI+ZgDTiOAeRvBNbhXdR5qtQQ+zUmnb1q/mx0AsYNwNu7TNmAS
	td2594+cc8b09g0VVU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWOe-00AL33-O3; Wed, 11 Jan 2023 08:23:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWOb-00AL1g-La
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 08:23:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F15D61AAD
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 08:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65E7C433F0
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673425419;
	bh=vYClw1nBfnvksGxzNm9Sirm21Qd0CVm/YxCjF5jLLvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OnfG78PGFsjS4CfC+s6zzheISL12xNzgxizSz1wuoWGqIwU27Ba3Iov9EHN41cu6m
	 jYkadzbLNs+crGong5kk5gx/TfRtgyoQHVLnNMikZvH2r2G9uZhwlN4zl1r4MJ62+P
	 V1lIPtpSJAbwQoFR+N8i0xsL8UIiSepYtHRgOpa8MLMIL3Qxz77JB1fepWu8JpHSEJ
	 dfDqaXjSRmTnX959nmYqoeMO5IuDQPqW4teHNfOpTi8XUf+FT0+AvK5QqL7OQDNjm2
	 L0eQyFn6qTu9ElM4k0eL6lP80RtQq5gmSGnDEgKRzrAGca1mOW9Zdo2tAtv+sNiy6n
	 EVNV+DXpo/GHQ==
Received: by mail-ej1-f42.google.com with SMTP id gh17so34957088ejb.6
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 00:23:39 -0800 (PST)
X-Gm-Message-State: AFqh2kpeUfMscOGvTVeyscfQ8YzWwLSYcfY9UGLVZa4KEgRrkuB4Xl3Y
	Si6K4p1OPD086TFmL0qUcJAV/l0Bye1neLUxQWo=
X-Google-Smtp-Source: AMrXdXsJ/WRUcA24icWGF/Ec2NFsquRMXVQY+QviL8d8KSRRwhHV5FyeVdas5dkOHkjgHpGX/JVfXn1De7U/UKeeW1E=
X-Received: by 2002:a17:906:66d8:b0:7c4:efcf:3bc8 with SMTP id
 k24-20020a17090666d800b007c4efcf3bc8mr9059542ejp.702.1673425418007; Wed, 11
 Jan 2023 00:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20230107133549.4192639-1-guoren@kernel.org> <20230107133549.4192639-6-guoren@kernel.org>
 <a6ce4a5e-bec7-bb0e-9765-c2d39f2f4e64@yadro.com>
In-Reply-To: <a6ce4a5e-bec7-bb0e-9765-c2d39f2f4e64@yadro.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 11 Jan 2023 16:23:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSTx_ZymEQdO_5dNmB-C2GgT1CN2mYoKLa-KsFw4AFzAw@mail.gmail.com>
Message-ID: <CAJF2gTSTx_ZymEQdO_5dNmB-C2GgT1CN2mYoKLa-KsFw4AFzAw@mail.gmail.com>
Subject: Re: [PATCH -next V6 5/7] riscv: ftrace: Make ftrace_caller call ftrace_graph_func
To: Evgenii Shatokhin <e.shatokhin@yadro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, linux@yadro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_002341_822903_B657039F 
X-CRM114-Status: GOOD (  34.09  )
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

On Wed, Jan 11, 2023 at 1:16 AM Evgenii Shatokhin <e.shatokhin@yadro.com> wrote:
>
> On 07.01.2023 16:35, guoren@kernel.org wrote:
> > From: Song Shuai <suagrfillet@gmail.com>
> >
> > In order to make the function graph use ftrace directly, ftrace_caller
> > should be adjusted to save the necessary regs against the pt_regs layout
> > so it can call ftrace_graph_func reasonably.
> >
> > SAVE_ALL now saves all the regs according to the pt_regs struct. Here
> > supersedes SAVE_ALL by SAVE_ABI_REGS which has an extra option to allow
> > saving only the necessary ABI-related regs for ftrace_caller.
> >
> > ftrace_caller and ftrace_regs_caller save their regs with the respective
> > option of SAVE_ABI_REGS, then call the tracing function, especially
> > graph_ops's ftrace_graph_func. So the ftrace_graph_[regs]_call labels
> > aren't needed anymore if FTRACE_WITH_REGS is defined.
> >
> > As the previous patch described, the ftrace_caller remains with its
> > ftrace_graph_call if FTRACE_WITH_REGS isn't defined,
> >
> > For convenience, the original argument setup for the tracing function in
> > ftrace_[regs]_caller is separated as PREPARE_ARGS.
> >
> > Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> > Tested-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >   arch/riscv/kernel/mcount-dyn.S | 142 ++++++++++++++++++++++++---------
> >   1 file changed, 104 insertions(+), 38 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> > index b75332ced757..d7d4d51b4bd7 100644
> > --- a/arch/riscv/kernel/mcount-dyn.S
> > +++ b/arch/riscv/kernel/mcount-dyn.S
> > @@ -57,19 +57,52 @@
> >          .endm
> >
> >   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> > -       .macro SAVE_ALL
> > +
> > +/**
> > +* SAVE_ABI_REGS - save regs against the pt_regs struct
> > +*
> > +* @all: tell if saving all the regs
> > +*
> > +* If all is set, all the regs will be saved, otherwise only ABI
> > +* related regs (a0-a7,epc,ra and optional s0) will be saved.
> > +*
> > +* After the stack is established,
> > +*
> > +* 0(sp) stores the PC of the traced function which can be accessed
> > +* by &(fregs)->regs->epc in tracing function. Note that the real
> > +* function entry address should be computed with -FENTRY_RA_OFFSET.
> > +*
> > +* 8(sp) stores the function return address (i.e. parent IP) that
> > +* can be accessed by &(fregs)->regs->ra in tracing function.
> > +*
> > +* The other regs are saved at the respective localtion and accessed
> > +* by the respective pt_regs member.
> > +*
> > +* Here is the layout of stack for your reference.
> > +*
> > +* PT_SIZE_ON_STACK  ->  +++++++++
> > +*                       + ..... +
> > +*                       + t3-t6 +
> > +*                       + s2-s11+
> > +*                       + a0-a7 + --++++-> ftrace_caller saved
> > +*                       + s1    +   +
> > +*                       + s0    + --+
> > +*                       + t0-t2 +   +
> > +*                       + tp    +   +
> > +*                       + gp    +   +
> > +*                       + sp    +   +
> > +*                       + ra    + --+ // parent IP
> > +*               sp  ->  + epc   + --+ // PC
> > +*                       +++++++++
> > +**/
> > +       .macro SAVE_ABI_REGS, all=0
> >          addi    sp, sp, -PT_SIZE_ON_STACK
> >
> >          REG_S t0,  PT_EPC(sp)
> >          REG_S x1,  PT_RA(sp)
> > -       REG_S x2,  PT_SP(sp)
> > -       REG_S x3,  PT_GP(sp)
> > -       REG_S x4,  PT_TP(sp)
> > -       REG_S x5,  PT_T0(sp)
> > -       REG_S x6,  PT_T1(sp)
> > -       REG_S x7,  PT_T2(sp)
> > -       REG_S x8,  PT_S0(sp)
> > -       REG_S x9,  PT_S1(sp)
> > +
> > +       // always save the ABI regs
> > +
> >          REG_S x10, PT_A0(sp)
> >          REG_S x11, PT_A1(sp)
> >          REG_S x12, PT_A2(sp)
> > @@ -78,6 +111,18 @@
> >          REG_S x15, PT_A5(sp)
> >          REG_S x16, PT_A6(sp)
> >          REG_S x17, PT_A7(sp)
> > +
> > +       // save the leftover regs
> > +
> > +       .if \all == 1
> > +       REG_S x2,  PT_SP(sp)
> > +       REG_S x3,  PT_GP(sp)
> > +       REG_S x4,  PT_TP(sp)
> > +       REG_S x5,  PT_T0(sp)
> > +       REG_S x6,  PT_T1(sp)
> > +       REG_S x7,  PT_T2(sp)
> > +       REG_S x8,  PT_S0(sp)
> > +       REG_S x9,  PT_S1(sp)
> >          REG_S x18, PT_S2(sp)
> >          REG_S x19, PT_S3(sp)
> >          REG_S x20, PT_S4(sp)
> > @@ -92,19 +137,19 @@
> >          REG_S x29, PT_T4(sp)
> >          REG_S x30, PT_T5(sp)
> >          REG_S x31, PT_T6(sp)
> > +
> > +       // save s0 if FP_TEST defined
> > +
> > +       .else
> > +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> > +       REG_S x8,  PT_S0(sp)
> > +#endif
> > +       .endif
> >          .endm
> >
> > -       .macro RESTORE_ALL
> > +       .macro RESTORE_ABI_REGS, all=0
> >          REG_L t0,  PT_EPC(sp)
> >          REG_L x1,  PT_RA(sp)
> > -       REG_L x2,  PT_SP(sp)
> > -       REG_L x3,  PT_GP(sp)
> > -       REG_L x4,  PT_TP(sp)
> > -       REG_L x5,  PT_T0(sp)
> > -       REG_L x6,  PT_T1(sp)
> > -       REG_L x7,  PT_T2(sp)
> > -       REG_L x8,  PT_S0(sp)
> > -       REG_L x9,  PT_S1(sp)
> >          REG_L x10, PT_A0(sp)
> >          REG_L x11, PT_A1(sp)
> >          REG_L x12, PT_A2(sp)
> > @@ -113,6 +158,16 @@
> >          REG_L x15, PT_A5(sp)
> >          REG_L x16, PT_A6(sp)
> >          REG_L x17, PT_A7(sp)
> > +
> > +       .if \all == 1
> > +       REG_L x2,  PT_SP(sp)
> > +       REG_L x3,  PT_GP(sp)
> > +       REG_L x4,  PT_TP(sp)
> > +       REG_L x5,  PT_T0(sp)
>
> Same as for the patch #3, please skip "REG_L x5,  PT_T0(sp)" here. The
> correct value of t0/x5 has already been read from PT_EPC(sp) at this point.
Oh, I don't want to do that here. It's a common macro. Because it's a
continuous load within the cacheline, I don't think it would cause a
performance gap.


>
> > +       REG_L x6,  PT_T1(sp)
> > +       REG_L x7,  PT_T2(sp)
> > +       REG_L x8,  PT_S0(sp)
> > +       REG_L x9,  PT_S1(sp)
> >          REG_L x18, PT_S2(sp)
> >          REG_L x19, PT_S3(sp)
> >          REG_L x20, PT_S4(sp)
> > @@ -128,10 +183,25 @@
> >          REG_L x30, PT_T5(sp)
> >          REG_L x31, PT_T6(sp)
> >
> > +       .else
> > +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> > +       REG_L x8,  PT_S0(sp)
> > +#endif
> > +       .endif
> >          addi    sp, sp, PT_SIZE_ON_STACK
> >          .endm
> > +
> > +       .macro PREPARE_ARGS
> > +       addi    a0, t0, -FENTRY_RA_OFFSET       // ip
> > +       la      a1, function_trace_op
> > +       REG_L   a2, 0(a1)                       // op
> > +       mv      a1, ra                          // parent_ip
> > +       mv      a3, sp                          // fregs
> > +       .endm
> > +
> >   #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> >
> > +#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> >   ENTRY(ftrace_caller)
> >          SAVE_ABI
> >
> > @@ -160,33 +230,29 @@ ftrace_graph_call:
> >          jr t0
> >   ENDPROC(ftrace_caller)
> >
> > -#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> > +#else /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> >   ENTRY(ftrace_regs_caller)
> > -       SAVE_ALL
> > -
> > -       addi    a0, t0, -FENTRY_RA_OFFSET
> > -       la      a1, function_trace_op
> > -       REG_L   a2, 0(a1)
> > -       mv      a1, ra
> > -       mv      a3, sp
> > +       SAVE_ABI_REGS 1
> > +       PREPARE_ARGS
> >
> >   ftrace_regs_call:
> >          .global ftrace_regs_call
> >          call    ftrace_stub
> >
> > -#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> > -       addi    a0, sp, PT_RA
> > -       REG_L   a1, PT_T0(sp)
> > -       addi    a1, a1, -FENTRY_RA_OFFSET
> > -#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> > -       mv      a2, s0
> > -#endif
> > -ftrace_graph_regs_call:
> > -       .global ftrace_graph_regs_call
> > -       call    ftrace_stub
> > -#endif
> >
> > -       RESTORE_ALL
> > +       RESTORE_ABI_REGS 1
> >          jr t0
> >   ENDPROC(ftrace_regs_caller)
> > +
> > +ENTRY(ftrace_caller)
> > +       SAVE_ABI_REGS 0
> > +       PREPARE_ARGS
> > +
> > +ftrace_call:
> > +       .global ftrace_call
> > +       call    ftrace_stub
> > +
> > +       RESTORE_ABI_REGS 0
> > +       jr t0
> > +ENDPROC(ftrace_caller)
> >   #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> > --
> > 2.36.1
> >
> >
> Regards,
> Evgenii
>
>


--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
