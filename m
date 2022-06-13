Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0056BC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WDx6sZa2T+nJ6xcjO4jayfYISrpKX0lWwoN1UKj6yM=; b=QLOwowh1/yGg97
	wxbRYCjKnBTrD/gA5hIXUpL1vptEzSJe7L6TxEFlcv/FX1atNdW6RVCTjuu8A2tSKP4Y1Qon9Ba3S
	9/8iJPceJOqpewC1F+U78r6ECDBv5RcCbhaU+3wJg8XW3CGU+5mrq5Se9F5WQ6H70+2nA2mo/Dq4N
	nbhDvQXNyNmRQ/J+eYYx67FEY/k2+XLGXlmXpjmWW96eihyCtFSeyw9KMSseqkiJksU/72Ir8tfIt
	rU+FOy6Fog0zaVK1sPUtp4vL21gcuXfFl40h3xgamHkFN9fsIf0jBMM16p7gLiCjjp3tthkPnSwwE
	hn0nYTBhJPTy83rwyO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0grZ-002jOc-Lr; Mon, 13 Jun 2022 10:00:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0grW-002jMJ-Fc
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 10:00:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id u8so6401040wrm.13
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jun 2022 02:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UmfLVMrsn0WGwubEU9B512VvZRZn5oxu7wSDZVtbht0=;
        b=LhZfBXrvzYqI3m+WOUh4DDqPjfPfwZPsqmNNJVMNh7XYs9heKwO/IPxsk57tFUWucd
         Zv6BaDUdcvpVMuRseJV823A6bUqwBLM/ErvVhMli9qCYvcMv3EDVok6Hw5zR/Lk1A7f7
         YDYDeqVLMVaT975XLHb3o0dDdbgbhPnfyk5U5SilxzCkVewvWxgU9ZYIV0tjRrFHEPqp
         UaPGF5flFUtToEIyyo3cB7DP2DXyluPY7ZBscQ/IgI0Y1AdUjbs69JrN6nUxHnRrX0Ys
         uJRq/GzfjN64AWitEhKqIRYtl3Wg2+qaFXED+ezHW03GsDZILI4lTcp8foIuTWyYnlg/
         ZmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UmfLVMrsn0WGwubEU9B512VvZRZn5oxu7wSDZVtbht0=;
        b=3qEMvdu6cTwYSDM80g9Tak1YjIL259XeXUHO69y1i6mynMSKfxxZTZYW2OYtRdgVLd
         KGbfy6QmhIZmzEi5TXALbON8aymbSlqeo20NqW8cMQxoj3a4ozOgz2zfUtifXW8jDJnX
         oBp51vFS6m+vlbfYMEvnp6khRJ4laBly+VBqJRh0+wUr/C80BFCnBFQfVArIeLUilXyC
         TVC9DCMmmgm1o3K1u6TGWmkCYidyZ1bB0ROvcL3Vew7gJEuac08ZyeqMYnl3u1jPq6wV
         n7dObTkIG3NNTcfXgBKmAHazRpiTzZH9HqqyHIr4BWoj62CdoDu3ThavNlXPyjicccPi
         5BWw==
X-Gm-Message-State: AOAM532tVGCuTecCCLaxRFSA8AVdXN3OLYwSANkXu4b/uQ1UIwyn3KTx
	K4feshUZLSFABUVMGHg3fuf21HfDsZN4XPVhkkGr9A==
X-Google-Smtp-Source: ABdhPJzxNuCEvmYzaj5KbxDO78aB8w+JhFuCEdlruGFDryxRsTs1bXjV4eGZNPl3H7NY9NxC4va02GY5gR3R6YabY7U=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr57053464wrz.690.1655114396705; Mon, 13
 Jun 2022 02:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220610050555.288251-1-apatel@ventanamicro.com>
 <20220610050555.288251-3-apatel@ventanamicro.com> <20220612153113.GA52224@liuzhao-OptiPlex-7080>
In-Reply-To: <20220612153113.GA52224@liuzhao-OptiPlex-7080>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jun 2022 15:29:13 +0530
Message-ID: <CAAhSdy2GXCujSkJgrWC==nTbeT7soY57K_DKP-vs57E=iN-YkQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: KVM: Add extensible system instruction
 emulation framework
To: Liu Zhao <zhao1.liu@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Zhenyu Wang <zhenyuw@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_025958_613879_000F5541 
X-CRM114-Status: GOOD (  30.41  )
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

On Sun, Jun 12, 2022 at 8:57 PM Liu Zhao <zhao1.liu@linux.intel.com> wrote:
>
> On Fri, Jun 10, 2022 at 10:35:54AM +0530, Anup Patel wrote:
> > Date: Fri, 10 Jun 2022 10:35:54 +0530
> > From: Anup Patel <apatel@ventanamicro.com>
> > Subject: [PATCH 2/3] RISC-V: KVM: Add extensible system instruction
> >  emulation framework
> > X-Mailer: git-send-email 2.34.1
> >
> > We will be emulating more system instructions in near future with
> > upcoming AIA, PMU, Nested and other virtualization features.
> >
> > To accommodate above, we add an extensible system instruction emulation
> > framework in vcpu_insn.c.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_insn.h |  9 +++
> >  arch/riscv/kvm/vcpu_insn.c             | 82 +++++++++++++++++++++++---
> >  2 files changed, 82 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
> > index 4e3ba4e84d0f..3351eb61a251 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_insn.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
> > @@ -18,6 +18,15 @@ struct kvm_mmio_decode {
> >       int return_handled;
> >  };
> >
> > +/* Return values used by function emulating a particular instruction */
> > +enum kvm_insn_return {
> > +     KVM_INSN_EXIT_TO_USER_SPACE = 0,
> > +     KVM_INSN_CONTINUE_NEXT_SEPC,
> > +     KVM_INSN_CONTINUE_SAME_SEPC,
> > +     KVM_INSN_ILLEGAL_TRAP,
> > +     KVM_INSN_VIRTUAL_TRAP
> > +};
> > +
> >  void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
> >  int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                               struct kvm_cpu_trap *trap);
> > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > index be756879c2ee..75ca62a7fba5 100644
> > --- a/arch/riscv/kvm/vcpu_insn.c
> > +++ b/arch/riscv/kvm/vcpu_insn.c
> > @@ -118,8 +118,24 @@
> >                                (s32)(((insn) >> 7) & 0x1f))
> >  #define MASK_FUNCT3          0x7000
> >
> > -static int truly_illegal_insn(struct kvm_vcpu *vcpu,
> > -                           struct kvm_run *run,
> > +struct insn_func {
> > +     unsigned long mask;
> > +     unsigned long match;
> > +     /*
> > +      * Possible return values are as follows:
> > +      * 1) Returns < 0 for error case
> > +      * 2) Returns 0 for exit to user-space
> > +      * 3) Returns 1 to continue with next sepc
> > +      * 4) Returns 2 to continue with same sepc
> > +      * 5) Returns 3 to inject illegal instruction trap and continue
> > +      * 6) Returns 4 to inject virtual instruction trap and continue
> > +      *
> > +      * Use enum kvm_insn_return for return values
> > +      */
> > +     int (*func)(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn);
> > +};
> > +
> > +static int truly_illegal_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                             ulong insn)
> >  {
> >       struct kvm_cpu_trap utrap = { 0 };
> > @@ -128,6 +144,24 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu,
> >       utrap.sepc = vcpu->arch.guest_context.sepc;
> >       utrap.scause = EXC_INST_ILLEGAL;
> >       utrap.stval = insn;
> > +     utrap.htval = 0;
> > +     utrap.htinst = 0;
> > +     kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> > +
> > +     return 1;
> > +}
> > +
> > +static int truly_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > +                           ulong insn)
> > +{
> > +     struct kvm_cpu_trap utrap = { 0 };
> > +
> > +     /* Redirect trap to Guest VCPU */
> > +     utrap.sepc = vcpu->arch.guest_context.sepc;
> > +     utrap.scause = EXC_VIRTUAL_INST_FAULT;
> > +     utrap.stval = insn;
> > +     utrap.htval = 0;
> > +     utrap.htinst = 0;
> >       kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> >
> >       return 1;
> > @@ -148,18 +182,48 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
> >       }
> >  }
> >
> > -static int system_opcode_insn(struct kvm_vcpu *vcpu,
> > -                           struct kvm_run *run,
> > +static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
> > +{
> > +     vcpu->stat.wfi_exit_stat++;
> > +     kvm_riscv_vcpu_wfi(vcpu);
> > +     return KVM_INSN_CONTINUE_NEXT_SEPC;
> > +}
> > +
> > +static const struct insn_func system_opcode_funcs[] = {
> > +     {
> > +             .mask  = INSN_MASK_WFI,
> > +             .match = INSN_MATCH_WFI,
> > +             .func  = wfi_insn,
> > +     },
> > +};
> > +
> > +static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >                             ulong insn)
> >  {
> > -     if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
> > -             vcpu->stat.wfi_exit_stat++;
> > -             kvm_riscv_vcpu_wfi(vcpu);
> > +     int i, rc = KVM_INSN_ILLEGAL_TRAP;
> > +     const struct insn_func *ifn;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
> > +             ifn = &system_opcode_funcs[i];
> > +             if ((insn & ifn->mask) == ifn->match) {
> > +                     rc = ifn->func(vcpu, run, insn);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     switch (rc) {
> > +     case KVM_INSN_ILLEGAL_TRAP:
> > +             return truly_illegal_insn(vcpu, run, insn);
> > +     case KVM_INSN_VIRTUAL_TRAP:
> > +             return truly_virtual_insn(vcpu, run, insn);
> > +     case KVM_INSN_CONTINUE_NEXT_SEPC:
> >               vcpu->arch.guest_context.sepc += INSN_LEN(insn);
> > -             return 1;
> > +             break;
>
> Hi Anup,
> What about adding KVM_INSN_CONTINUE_SAME_SEPC and KVM_INSN_EXIT_TO_USER_SPACE
> cases here and set rc to 1?

For KVM_INSN_CONTINUE_SAME_SEPC (and any rc >= 1) we should return 1
whereas for KVM_INSN_EXIT_TO_USER_SPACE we should return 0.

> This is the explicit indication that both cases are handled.

The KVM_INSN_EXIT_TO_USER_SPACE is always 0 whereas
KVM_INSN_CONTINUE_SAME_SEPC is always 1 so the statement
"return (rc <= 0) ? rc : 1;" handles both these cases.

Regards,
Anup

>
> > +     default:
> > +             break;
> >       }
> >
> > -     return truly_illegal_insn(vcpu, run, insn);
> > +     return (rc <= 0) ? rc : 1;
> >  }
> >
> >  /**
> > --
> > 2.34.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
