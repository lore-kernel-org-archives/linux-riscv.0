Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04479C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PfF8ETVCok+yfsl71z+B7okWt+IDfEnE0CVVmKFeJ4=; b=qPuJSI3yfzospj
	h5rhclWTOdHnv4v5gqCuvVfU4t/E7PKXRUiRqA/FvIzO9K7rnCrvtCI1q2oBN9eD2QRCmRWyKnGZZ
	deXlfILugs35HnpspKg98DEhtD8W4nNX7Iu8kP9/8iUwc9gO0TQMQyrbGL6x3pqfHJ3Oe7DjH4Go8
	QJQM3KadUOHR/IgtCiWOFmat7Rs+yr5tWNuys7sNaFunT/DBU5uCCGZW98fLRmMhwHhOVgCIhb0qv
	9fX+rEG+Wfd5v14Cnr/GNaE8JLPCoWkdi5WYyjDV98+wYpab1AEXhxV1FiLeMjJkjjZBusDU5Agb8
	iT0LOMFvu8Yhqy5zmxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJyP-005XEY-9l; Thu, 08 Sep 2022 16:01:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJyM-005XAo-43
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 16:01:47 +0000
Date: Thu, 8 Sep 2022 18:01:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662652901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yq5ZQcpZgpbBySLyDiNZZpodPZiaJP/0RYxixe2+d8Y=;
	b=e48N5fhr2y9PwwEu4uAAHEca8MQ1r9J0zvBqQ4mqQAv8TJiw4oXHTwLajcP8Ov9mUuTY2A
	NY7+gsgPYsD3qZ5oW4C6q0N0UYLaBf7V63qtTrDVVX59UtMUG9TbQGkeeKj5rZowcgD1rZ
	RpiA1SbHcPIcGodqhzQzB2cDtBNQ+KMH6kjTUs4lYStFI9jvb30FeYms3LqNX11neDKg6F
	V41X60sakn2aUL6Beatbop1XjlAI5+Ct62PB8ULQJ528p43sPgHsfG0iXPsSGcIn3Mc4OS
	gTsyEwC2qz/ZnMTeAo7Fx0TkKYpiQb3RrhNc9SOX7BLF0Suxe0eO0wGWopkKDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662652901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yq5ZQcpZgpbBySLyDiNZZpodPZiaJP/0RYxixe2+d8Y=;
	b=aMO74v0Iyk5F71GBnyRyg+lFUxAvArjrSitIstuy8jq+PoE6YxmdL1Ii01YRHsh5Y9xYd0
	+XKKoqZcfnhU+fBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 7/8] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
Message-ID: <YxoR5Fv6hOkzMSTg@linutronix.de>
References: <20220908022506.1275799-1-guoren@kernel.org>
 <20220908022506.1275799-8-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908022506.1275799-8-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_090146_349375_F79B1392 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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

On 2022-09-07 22:25:05 [-0400], guoren@kernel.org wrote:
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -11,6 +11,7 @@
>  #include <linux/seq_file.h>
>  #include <asm/smp.h>
>  #include <asm/vmap_stack.h>
> +#include <asm/softirq_stack.h>
>  
>  #ifdef CONFIG_IRQ_STACKS
>  static DEFINE_PER_CPU(ulong *, irq_stack_ptr);
> @@ -38,6 +39,21 @@ static void init_irq_stacks(void)
>  		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
>  }
>  #endif /* CONFIG_VMAP_STACK */
> +
> +#ifndef CONFIG_PREEMPT_RT

Could you please replace it with 
	#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK

instead? See
	https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=8cbb2b50ee2dcb082675237eaaa48fe8479f8aa5

> +static void do_riscv_softirq(struct pt_regs *regs)
> +{
> +	__do_softirq();
> +}
> +
> +void do_softirq_own_stack(void)
> +{
> +	ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id());
> +
> +	call_on_stack(NULL, sp, do_riscv_softirq, 0);
> +}
> +#endif /* CONFIG_PREEMPT_RT */
> +
>  #else
>  static void init_irq_stacks(void) {}
>  #endif /* CONFIG_IRQ_STACKS */

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
