Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ED9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dS5CUDR09+62u66Vn2H4LgQM86Dvk9D3ZT7xOy5K0k0=; b=pYShIAgqe2Y2JI
	PyVLbh3tznNHuiKYTfoWokNoq9MqyfXkhHXaUdCO5jdctBiRGMUNiCqxZLD7617ASQCJdgToR3hf9
	FVXlL3ppu4gwUnyqWF/7wnwhdYGeYVCZ256a71ff8d37HnDrbk5Ftt0iSAbL5AybJCOUihaIuQY8P
	JqgZil7abZDPRcp7zKBDzrLymtmotDvTrn9eSBAzB7JCDAPHD7ghrqq+eAAyjwMvAb1prBILhGMkR
	SMqLRvXKlMDwpvq7Fr6esWAAdwIE13nlSn464EdMgOxCDGQpKvS6Ff22//w4Zx9L9v3HRqyOkC0du
	dkq3Udo1KFnPtW8Y6hqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE0cg-00HTOk-BO; Wed, 20 Jul 2022 03:43:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE0cc-00HTNw-W4
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 03:43:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA20FB81C09
	for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 03:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAE7C385A2
	for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 03:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658288614;
	bh=1qSPmATSCmgxdAlUJBImCQyYfg9p9VC3g2ZMxqSgCwU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ifhtumxr2irmcUzcvrte1E12LeYg/tvgl8aBZwaXKq1VNucryMeULggdCBV9xzIdZ
	 Bm+KwO2DHZ7Qc1/0AV7o/ENVBY/S3yLfbO9ZaPkfHIXpPPmW416wq+KV2DabNReHNG
	 6umFcjtM4frnbTa2rgiKk820IjeAEXjzhT7Lff9ZJHBBOS/sbQ9+WiOY06iWMMhfP4
	 uhuwLoA5KnZwqv0hqIgTEAr3M71I+Cv25MOuNpIXFt+vYZwmK08DX55TwEYib2Njq/
	 DBl5UFcUcFzIHcejE09GjljAUW/6NfqXrrjvZZGw1QQSCWYBLy/DFXRn+6pYh+0PTJ
	 az5MG38IVCWZA==
Received: by mail-lf1-f46.google.com with SMTP id n18so28194332lfq.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 20:43:34 -0700 (PDT)
X-Gm-Message-State: AJIora9U+FxalnPkSiYi5kX+K/vNhW6NDtXfFLsgYmhQ00XhrFI+ESY3
	+59mC1kHSXm//769E1puFNo4gBjeMBSVOr6Fcps=
X-Google-Smtp-Source: AGRyM1tBO04BZcW3TEguzTQL0zKsJzUvygwJc3+ESWnek157cc/Z+6Q1R0XunWOwuIwZprloLAAEk6bOk2eIoR61uiU=
X-Received: by 2002:a05:6512:3e20:b0:48a:33c8:a3a2 with SMTP id
 i32-20020a0565123e2000b0048a33c8a3a2mr8972058lfv.420.1658288612399; Tue, 19
 Jul 2022 20:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220711024350.49611-1-zouyipeng@huawei.com>
In-Reply-To: <20220711024350.49611-1-zouyipeng@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Jul 2022 11:43:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBQrSVeF0aC5TKaH=CFo5QDuCE8noF7e2N5=4MK5bpmA@mail.gmail.com>
Message-ID: <CAJF2gTTBQrSVeF0aC5TKaH=CFo5QDuCE8noF7e2N5=4MK5bpmA@mail.gmail.com>
Subject: Re: [PATCH -next] riscv:uprobe remove set/clear SR_SPIE in arch_uprobe_pre/post/abort_xol
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_204339_333350_D5D45E35 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Jul 11, 2022 at 10:46 AM Yipeng Zou <zouyipeng@huawei.com> wrote:
>
> In riscv the process of uprobe going to clear spie before exec
> the origin insn,and set spie after that.But When access the page
> which origin insn has been placed a page fault may happen and
> irq was disabled in arch_uprobe_pre_xol function,It cause a WARN
> as follows.
> There is no need to clear/set spie in arch_uprobe_pre/post/abort_xol.
> We can just remove it.
Seems there is no side effect on an interrupt in xol. I also checked
arm64, x86, MIPS, and csky (also written by me), which are the same as
yours (No irq mask). I forgot why I mask irq for userspace xol.

>
> [   31.684157] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1488
> [   31.684677] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 76, name: work
> [   31.684929] preempt_count: 0, expected: 0
> [   31.685969] CPU: 2 PID: 76 Comm: work Tainted: G
> [   31.686542] Hardware name: riscv-virtio,qemu (DT)
> [   31.686797] Call Trace:
> [   31.687053] [<ffffffff80006442>] dump_backtrace+0x30/0x38
> [   31.687699] [<ffffffff80812118>] show_stack+0x40/0x4c
> [   31.688141] [<ffffffff8081817a>] dump_stack_lvl+0x44/0x5c
> [   31.688396] [<ffffffff808181aa>] dump_stack+0x18/0x20
> [   31.688653] [<ffffffff8003e454>] __might_resched+0x114/0x122
> [   31.688948] [<ffffffff8003e4b2>] __might_sleep+0x50/0x7a
> [   31.689435] [<ffffffff80822676>] down_read+0x30/0x130
> [   31.689728] [<ffffffff8000b650>] do_page_fault+0x166/x446
> [   31.689997] [<ffffffff80003c0c>] ret_from_exception+0x0/0xc
>
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
Please add the Fixes tag.

Then:

Reviewed-by: Guo Ren <guoren@kernel.org>

> ---
>  arch/riscv/kernel/probes/uprobes.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> index 7a057b5f0adc..c976a21cd4bd 100644
> --- a/arch/riscv/kernel/probes/uprobes.c
> +++ b/arch/riscv/kernel/probes/uprobes.c
> @@ -59,8 +59,6 @@ int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>
>         instruction_pointer_set(regs, utask->xol_vaddr);
>
> -       regs->status &= ~SR_SPIE;
> -
>         return 0;
>  }
>
> @@ -72,8 +70,6 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>
>         instruction_pointer_set(regs, utask->vaddr + auprobe->insn_size);
>
> -       regs->status |= SR_SPIE;
> -
>         return 0;
>  }
>
> @@ -111,8 +107,6 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>          * address.
>          */
>         instruction_pointer_set(regs, utask->vaddr);
> -
> -       regs->status &= ~SR_SPIE;
>  }
>
>  bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
