Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A27AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHKKvOVl/jTiLBy6pW5Eaoj5yF1d+2lkRP2p37WHS1E=; b=ND8o2dYbsfbiTU
	M7ZYJixTazY1kMkGyqGHhqq2TVAeXXkNsUyfPrdsfLlbgnEqMFUFh4dbYio9vh4wj9ZkHzJnEkCt6
	EXWjBijc3JIYemoUCQAAAJ5bK4oSbHg8s+mQPUyJmgFOwjtPJvqaHzd/UvXAVI2QE4sKYSap1z806
	w8aAAzkrj2LU/vSxaFoASH2VJyz+6iznqUxrEiUDlW++n4OUj5YFYB+ODJp4dt3I9HPEqqXpa9auV
	CbWwvkI4WxoEjNIyioYYGgGf+etAioEUdFlKF1SHD1aFq7UEpAmYmXGZfFynQm9wvLgcy7s4nppP6
	c8eB8mHLLM6xdUeSvolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRItu-001M39-Ru; Mon, 07 Mar 2022 19:20:10 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRItj-001Lxx-FR
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 19:20:01 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MysBI-1oLzys3De6-00vypy for <linux-riscv@lists.infradead.org>; Mon, 07
 Mar 2022 20:19:52 +0100
Received: by mail-wr1-f51.google.com with SMTP id j26so14574158wrb.1
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 11:19:52 -0800 (PST)
X-Gm-Message-State: AOAM532iSyqNyRgXpvoaaUtYuBMz5IeVeim57+iBctZg+vo9sEXTRAKU
 TQH17IuApvYZV4vv33jeGxEnuzmCh3ZCsKI64eA=
X-Google-Smtp-Source: ABdhPJzugW3wqq7bgZleIsw6WIjwPuqv53jTQLFcNaq6BqgwsHEjfMrkyX4v0qxF4jXII18ANWrsX5DUh0KlJJ9XJac=
X-Received: by 2002:adf:e181:0:b0:1f7:7d5e:c3bb with SMTP id
 az1-20020adfe181000000b001f77d5ec3bbmr2691351wrb.12.1646680791862; Mon, 07
 Mar 2022 11:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20220307140804.1400-1-jszhang@kernel.org>
In-Reply-To: <20220307140804.1400-1-jszhang@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Mar 2022 20:19:35 +0100
X-Gmail-Original-Message-ID: <CAK8P3a33aPwi0hBAyFREqM-BKVJwin=O9cOR4NzWPtr1j2pLiA@mail.gmail.com>
Message-ID: <CAK8P3a33aPwi0hBAyFREqM-BKVJwin=O9cOR4NzWPtr1j2pLiA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add irq stack support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:lxqTXW05I9DHhAZ00bd5J7CjyhhVxCfu76FOl3CvfJ2OMscXw/s
 51eog03aqvA8OH/0Ro8buNqeuiU3kn8/K1CYZeu9wxdSNUnJZPkpdxG/401Q4SmwZ4qNepj
 EeRwcmlVkkdTUXywHIKjs1izvp8AP87AcTbRvFpcn9snegTGXQvCBSr8tlvHDKAy1mKcsJf
 9mFE4s51bT3y1O4FZ49Cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XFglmFe8hnU=:BrDPKpD2ZxJfcexTtTWa2D
 fyUkcZkg31VMhANxVJ2ij9hFR31IlSb7vesRs89tbuBWCuWQo4Lhz4ERQIcB5MF1VUf1dO3fP
 2MPQ6uwL4ho9eAlXVJtu67a0lK12XTjYCXa6B4RT8j50CxygmeG5P2OgrP99Uyr66cqAdqJ/V
 9WIytPMkTAB2tEEQugECTmgTI4kp2/JgWh9eQDAgw26OyVJVSvnIxnv9JkUBtU//tzjXlUF9A
 djUtq825gVxqcBloyyEA+5RbIOFwsxcMsMUE3evT5yBrmP92uWHoGdFcqNW7pQGP48ETzAoZZ
 4nbWUFTSy13k7gEKuTMpCogSNQpOaWgCHTvzn96lMcSXcxO6o++TCcuyxEY8xQ0cCsXga+7ze
 SnnqzFhn30a7fCB1JstLMbvyyQwqpAZygzie4jMf+vUtXeACR/y60+Cr79VJdYmt1qnJGH/Wy
 CTPC9q9ANnHyzTkinzVIgN65BEfQrtufxa+SHug1kBbv6qZWj52LNNM8EazSSeUdXbqaCclQa
 KOIxqXWw7XFtA5Jg7xUwLSmUyTXSIp3/7h3ApTSpy2mYvAxexZ9j3qZjmSW3mD9CSlPIFs6qB
 o7wkm2HkxCAF/2knTCmN/AJnXj/3eS04IjVM3fTA8zFIP9QO18e5wsd5W9yMUkL+JR6L/k/MA
 hnyjarWNngYjPKiYctMpGatRAF95HxUQPPtyLIo9+arbnMg+3oSAbEEGr3aYy4s/sQCQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_111959_853597_8B941209 
X-CRM114-Status: GOOD (  29.94  )
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

On Mon, Mar 7, 2022 at 3:08 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, IRQs are still handled on the kernel stack of the current
> task on riscv platforms. If the task has a deep call stack at the time
> of interrupt, and handling the interrupt also requires a deep stack,
> it's possible to see stack overflow.
>
> Before this patch, the stack_max_size of a v5.17-rc1 kernel running on
> a lichee RV board gave:
> ~ # cat /sys/kernel/debug/tracing/stack_max_size
> 3736
>
> After this patch,
> ~ # cat /sys/kernel/debug/tracing/stack_max_size
> 3176
>
> We reduce the max kernel stack usage by 560 bytes!
>
> From another side, after this patch, it's possible to reduce the
> THREAD_SIZE to 8KB for RV64 platforms. This is especially useful for
> those systems with small memory size, e.g the Allwinner D1S platform
> which is RV64 but only has 64MB DDR.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Very nice!

> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index ed29e9c8f660..57c9b64e16a5 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -126,12 +126,39 @@ skip_context_tracking:
>          */
>         bge s4, zero, 1f
>
> -       la ra, ret_from_exception
> +       /* preserve the sp */
> +       move s0, sp
>
> -       /* Handle interrupts */
>         move a0, sp /* pt_regs */
> +
> +       /*
> +        * Compare sp with the base of the task stack.
> +        * If the top ~(THREAD_SIZE - 1) bits match, we are on a task stack,
> +        * and should switch to the irq stack.
> +        */
> +       REG_L t0, TASK_STACK(tp)
> +       xor t0, t0, s0
> +       li t1, ~(THREAD_SIZE - 1)
> +       and t0, t0, t1
> +       bnez t0, 2f
> +
> +       la t1, irq_stack
> +       REG_L t2, TASK_TI_CPU(tp)
> +       slli t2, t2, RISCV_LGPTR
> +       add t1, t1, t2
> +       REG_L t2, 0(t1)
> +       li t1, IRQ_STACK_SIZE
> +       /* switch to the irq stack */
> +       add sp, t2, t1
> +
> +2:

What is the benefit of doing this in assembler? Is it measurably faster?

I see that arm64 does the same thing in C code, and it would be best to
have a common implementation for doing this, in terms of maintainability.

> +
> +       for_each_possible_cpu(cpu) {
> +#ifdef CONFIG_VMAP_STACK
> +               void *s = __vmalloc_node(IRQ_STACK_SIZE, THREAD_ALIGN,
> +                                        THREADINFO_GFP, cpu_to_node(cpu),
> +                                        __builtin_return_address(0));
> +#else
> +               void *s = (void *)__get_free_pages(GFP_KERNEL, get_order(IRQ_STACK_SIZE));
> +#endif

On a related topic: is there a reason to still keep the non-VMAP_STACK
code path around? I see that it currently is optional for 64-bit with MMU,
but not available otherwise. The benefits should still outweigh the downside
(virtual address space usage mainly) on 32-bit, especially when this allows
a common implementation. Not sure about NOMMU, but I would guess
that it's not a big issue to use the same code there as well, since nommu
vmalloc just turns into a kmalloc as well.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
