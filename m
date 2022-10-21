Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90722C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 03:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DO2jDVbux74uuDu6EJeIKsqkZYzke7MLMkw0bl6DeMo=; b=zXIPf4DgdMWx1Q
	AnagRsLLpme9rOqn9hEuguWfc9pyDJF6Q75RkzNbY3WkgxS/YIIpIkAcEvi5Koav52Hj0XYEl/KRc
	DQyNcstpM2wd4F6wf7elvbWwDHJzIwl3nepfUF7nn2lirOSmeGawOaOSIgtYLVEVPL//GoOZm1gw0
	1bcrtKQFdu7bIOb7HytsoHOzlcteX7Yxo+YtX9sQvW9sRa211Fnh5kZ+447G2So4iik6GZ64mfqeU
	Mb7jJsVwTLgxCwSKGmK+shgKpsxJ2inwUTnRVx/ldXJm95mC4xEQzyonuc+c8G2pLRFI/RvCurdET
	ALg42XALaumXPdpE1yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oliMi-004f6p-4P; Fri, 21 Oct 2022 03:06:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oliMe-004f61-Uw
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 03:06:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5835561D89
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 03:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8944C43470
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666321586;
	bh=nnTz6BbYm16k0pymxCXW1qmPXNG1V5s2aBk/OjUH7BY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UJ6sb8WV0xREV3cW37N/YPanGFWLWII4Keozt6NE5BFxA5pIbczICwED/D6cbxzZb
	 Kb2NFf5mZS32sbOZoJgf3udRyg0igD4xvqfYZS7tYf3lCU3qO3uBl6lVuM4HoCppWo
	 1XCNouWrAwY/RHHOOOseBclciVWuFUrlgDjXqEbdSlUV66PwSPJu0/f+XI6abjul37
	 MrWgoJZ9b8efNtdMvgwcIG2/0rgxSauwnwaz065fQ6uxjOlkYOp6uzZU9EeC4BuWHD
	 8MiHdmUqDR7st3VAdkSlSa6hfwOb1luHeYH1TAL+yOCpZPHR5xruRnDL1gxA5kuF1z
	 vw0sa72x8sMPQ==
Received: by mail-ot1-f51.google.com with SMTP id f4-20020a9d0384000000b0066208c73094so1090731otf.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 20:06:26 -0700 (PDT)
X-Gm-Message-State: ACrzQf0zaYCm+W/h6hFAu99FwUL0UI9aWrKspkJU0CTZJVPJY34NMnQ/
	zAtPrldmKdzuobbH0jvmWPWCQjZIdsjQAkO3rTg=
X-Google-Smtp-Source: AMsMyM7ORoMBIMno6AdJgmO8am2C+XtwrCTgg8wGdEDBszktYCFqgSUmm5ITEUqn6IVJ0grQWuCwXB7GOht0Qcv3/8c=
X-Received: by 2002:a9d:3634:0:b0:661:a991:7c57 with SMTP id
 w49-20020a9d3634000000b00661a9917c57mr8230356otb.308.1666321585880; Thu, 20
 Oct 2022 20:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221020143329.3276-1-jszhang@kernel.org>
In-Reply-To: <20221020143329.3276-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Oct 2022 11:06:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTZX48_psz31gJCi9h9ayUV1tfWYr32Br8CmLLrCZPpPg@mail.gmail.com>
Message-ID: <CAJF2gTTZX48_psz31gJCi9h9ayUV1tfWYr32Br8CmLLrCZPpPg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: fix race when vmap stack overflow
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_200629_116284_E343D81E 
X-CRM114-Status: GOOD (  20.34  )
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

On Thu, Oct 20, 2022 at 10:43 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
>
> To solve this race, we introduce spin_shadow_stack atomic var, which
> will be swap between its own address and 0 in atomic way, when the
> var is set, it means the shadow_stack is being used; when the var
> is cleared, it means the shadow_stack isn't being used.
>
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Guo Ren <guoren@kernel.org>
> ---
> Since v1:
>  - use smp_store_release directly
>  - use unsigned int instead of atomic_t
>
>  arch/riscv/kernel/entry.S | 4 ++++
>  arch/riscv/kernel/traps.c | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..7b924b16792b 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>
>  #ifdef CONFIG_VMAP_STACK
>  handle_kernel_stack_overflow:
> +1:     la sp, spin_shadow_stack
> +       amoswap.w sp, sp, (sp)
Using ".w" is tricky for 64 BIT, I've hesitated. ';)
Let's move to REG_AMOSWAP, or you must make sure the address of
spin_shadow_stack won't be 4GB aligned.

> +       bnez sp, 1b
> +
>         la sp, shadow_stack
>         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f3e96d60a2ff..f1f57c1241b6 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
>                 OVERFLOW_STACK_SIZE;
>  }
>
> +unsigned int spin_shadow_stack;
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>         unsigned long tsk_stk = (unsigned long)current->stack;
>         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>
> +       smp_store_release(&spin_shadow_stack, 0);
> +
>         console_verbose();
>
>         pr_emerg("Insufficient stack space to handle exception!\n");
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
