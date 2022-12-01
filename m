Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E5AC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uifZFAjv+MiUIu73umgQkGngbUAmtgASx1LpZYA0hiA=; b=BMJhL7lj5hKgn/
	1zJK9klToXb0MP36HGenMXG4O08F9CwLdG1Sg1VUutMWrXWIsPSqCkXXuJ4mY/EsULqqrDew2pg/7
	blFJ5AK0q8ueWG69I8+NZPJ/koXD6dx98obEHDRtRAzJTM9/XZudhFW0NKm0bFbtxLWYcFrPbILAd
	difs6KTIFuFn7Pn6oQwLW3lToZig6tbvYVS76wkzFNrY7AvUHisqP0xQ7i53vT/V6i7S3h+FMXubC
	7rNw9Pkf1tVa02JcgwD8zRyv1Si8twup6aUCeczHKqcPr4rLqCoYFIwZ79UrgNoknwsCwPThrT0fa
	W6wO1hbCvPzxYkTigdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jRf-007eT5-52; Thu, 01 Dec 2022 13:17:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jRb-007eR7-B0
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 153C0B81F1D
	for <linux-riscv@lists.infradead.org>; Thu,  1 Dec 2022 13:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E2CC433D6
	for <linux-riscv@lists.infradead.org>; Thu,  1 Dec 2022 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669900655;
	bh=UjKLLEsIwR07HcG33HnbQVlpUJCO7pqDak6jWKKW6IE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MVGr9tzOx7orMLDymZc+/k0D1jXfB1JrmVjNHLdzcgjmsFgxG0YuwnuBo1jDmiTR0
	 VJ4HLUKcWioo3ZjlyIG8T+gApHsIIO5z4VTkVxDPC4pfu9VcTge060dKJprBfeKkMW
	 tViGnRJM8S2ozBj7typhEi5kBdkBFa20tApyyMGFCZPZcmhmE8MABNwd73x1uUETaS
	 pGccITwJ2QyvlA3aj7IdaKSwM4NzpaOpTQkIK+SNUq/88v5qRUg6SB+gkom1sOPkq5
	 +bSK5y8/Efk1VC6EPCS3O+IMLOPEsgAtu4LJcDMUr9v10XSIZyNGDO95yjoTtgKsmq
	 AW3zAbOhYbiFg==
Received: by mail-ej1-f53.google.com with SMTP id ud5so4145542ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:17:35 -0800 (PST)
X-Gm-Message-State: ANoB5pn4Hy3FeoXpmaBouUzuxTxUTfQg3o+dAhzdv3Aw5jL6zWxN4YG9
	ULgi5BphuDQ+XydTJdKX3a/pbakv3C2DhD/utMA=
X-Google-Smtp-Source: AA0mqf4kyO5hcP35ZuA9HU7kZNC7BjGnYjUnpkgAIT8BA+YaJi4wPl89S+iUN/ZQmwZI/X5JzT7vDVHIT8ugHL5V6v4=
X-Received: by 2002:a17:906:ee2:b0:78d:3f96:b7aa with SMTP id
 x2-20020a1709060ee200b0078d3f96b7aamr41475089eji.74.1669900654008; Thu, 01
 Dec 2022 05:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20221130023515.20217-1-palmer@rivosinc.com> <20221130023515.20217-2-palmer@rivosinc.com>
In-Reply-To: <20221130023515.20217-2-palmer@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Dec 2022 21:17:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS2A=C0Epf5NqgpE8ZWX-EXHLt5SwD0HmB3kzoLj1N3Bw@mail.gmail.com>
Message-ID: <CAJF2gTS2A=C0Epf5NqgpE8ZWX-EXHLt5SwD0HmB3kzoLj1N3Bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add some comments about the shadow and
 overflow stacks
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: jszhang@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_051739_715504_44BE344A 
X-CRM114-Status: GOOD (  22.93  )
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

On Wed, Nov 30, 2022 at 10:35 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> It took me a while to page all this back in when trying to review the
> recent spin_shadow_stack, so I figured I'd just write up some comments.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/traps.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index acdfcacd7e57..336d4aadadb1 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -200,18 +200,18 @@ void __init trap_init(void)
>  }
>
>  #ifdef CONFIG_VMAP_STACK
> +/*
> + * Extra stack space that allows us to provide panic messages when the kernel
> + * has overflowed its stack.
> + */
>  static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>                 overflow_stack)__aligned(16);
>  /*
> - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> - * to get per-cpu overflow stack(get_overflow_stack).
> + * A temporary stack for use by handle_kernel_stack_overflow.  This is used so
> + * we can call into C code to get the per-hart overflow stack.  Usage of this
> + * stack must be protected by spin_shadow_stack.
Reviewed-by: Guo Ren <guoren@kernel.org>

>   */
>  long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
> -asmlinkage unsigned long get_overflow_stack(void)
> -{
> -       return (unsigned long)this_cpu_ptr(overflow_stack) +
> -               OVERFLOW_STACK_SIZE;
> -}
>
>  /*
>   * A pseudo spinlock to protect the shadow stack from being used by multiple
> @@ -222,6 +222,12 @@ asmlinkage unsigned long get_overflow_stack(void)
>   */
>  unsigned long spin_shadow_stack;
>
> +asmlinkage unsigned long get_overflow_stack(void)
> +{
> +       return (unsigned long)this_cpu_ptr(overflow_stack) +
> +               OVERFLOW_STACK_SIZE;
> +}
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>         unsigned long tsk_stk = (unsigned long)current->stack;
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
