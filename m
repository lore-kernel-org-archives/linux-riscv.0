Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F56C87FD1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 12:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+76iE/r6f86L2WFZz/9wl3DebyWJzGF5afDlJ2WmXy0=; b=A4+D7xzr8b3ZJ3
	8CgIioyLcVh6ZpmR/aNX4PUThcXsCLZMKv8UYRYk4uAMe1cvY8iEM0cF3qEWJ4GtrorAWMt3HZbes
	+sBuGndu943Qgl9Q9cdSsBeUkcZU6/nvyNInbe59OxsqvDxupkvbCPNwAhMwkFAlLDZLRCFXyUoVn
	3Lq3+6aeFW1vHB0VOpy7yzQHdTqqsn+I7/+EULSfMab6XlGdgwg0TukeNWDrhbcYfihdGGab9tnWf
	U0wB9GQ0bssAweoScoex5DE43MbpKDTrJXIf3rkYCva5Mlv3sb4cCOCgWpJ5W2HdqePlCRLTtc2RM
	VXR9OQ2AIpwxYHQOE5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujd48-0000000F6nK-49wM;
	Wed, 06 Aug 2025 12:16:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujcwN-0000000F5sr-1iRJ
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 12:08:20 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754482097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nARV5rtz8CjMLkrWEZibNlw4GiyGVYsSYfJk4mKkeI8=;
	b=afPxRGHAR7qQFcaHkIbzx1MAXuMdkQukeMam8nN/tgcCJfM1mDDNt/e5gyKHFQwwIdDrJa
	HswZxyURvZrnZgEEpI7/9KNOJdlHv3lQgFQyQw1nw3xXJAtiFOeX9EVkrz5bP5r0jC/AJc
	I4xvbvEyaAiCM2wUi22l9y1ou+7/l58VUNHKs43tdqs+qUm2ukSSNAEQGrRDQaBTi+TaHd
	ddjFTIyRNCN80i3EBHZhqrzB6AYaGosC/MQlva6zvJg4XO0vR9CQUdPmO+U2Suvy6VrjM5
	fFXD7kWGCei9PWbYH86P0NIPxSARF3ihJPD89caJ0LfHG+ZbTukQxz8C9EdfIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754482097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nARV5rtz8CjMLkrWEZibNlw4GiyGVYsSYfJk4mKkeI8=;
	b=MXTLAyPLMxFpIK1fMcBTqx5v0+pFNi/6wNxA/li4uyxT6du576vBcfv56gP27D0OZnj3MT
	/2XUulBgrE97IlCQ==
To: Nick Hu <nick.hu@sifive.com>, anup@brainfault.org, Alexandre Ghiti
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
In-Reply-To: <20250806082726.8835-2-nick.hu@sifive.com>
References: <20250806082726.8835-1-nick.hu@sifive.com>
 <20250806082726.8835-2-nick.hu@sifive.com>
Date: Wed, 06 Aug 2025 14:08:16 +0200
Message-ID: <878qjwejpr.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_050819_588030_390563C9 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Aug 06 2025 at 16:27, Nick Hu wrote:

"Restore the IMSIC registers" does not tell me anything useful. When are
they restored?

> When the system woken up from the low power state, the IMSIC might be in

is woken up from a low power state

> the reset state.

The real important information is:

   When the system enters a low power state the IMSIC might be reset,
   but on exit nothing restores the registers, which prevents interrupt
   delivery.

Or something like that.

> Therefore adding the CPU PM callbacks to restore the IMSIC register
> when the cpu resume from the low power state.

This is not a valid sentence.

  Solve this by registering a CPU power management notifier, which
  restores the IMSIC on exit.

Or such.

See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

for further explanation.

> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
> index d9ae87808651..62bcbcae8bd4 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -7,6 +7,7 @@
>  #define pr_fmt(fmt) "riscv-imsic: " fmt
>  #include <linux/acpi.h>
>  #include <linux/cpu.h>
> +#include <linux/cpu_pm.h>
>  #include <linux/interrupt.h>

This does neither apply against Linus tree nor against tip 

> -static int imsic_starting_cpu(unsigned int cpu)
> +static void imsic_restore(void)

This function is used for both setup _and_ restore, so naming it
restore() is misleading at best.

>  {
> -	/* Mark per-CPU IMSIC state as online */
> -	imsic_state_online();
> -
> -	/* Enable per-CPU parent interrupt */
> -	enable_percpu_irq(imsic_parent_irq, irq_get_trigger_type(imsic_parent_irq));
> -
>  	/* Setup IPIs */
>  	imsic_ipi_starting_cpu();
>  
> @@ -128,6 +123,19 @@ static int imsic_starting_cpu(unsigned int cpu)
>  
>  	/* Enable local interrupt delivery */
>  	imsic_local_delivery(true);
> +}
> +
> +static int imsic_starting_cpu(unsigned int cpu)
> +{
> +	/* Mark per-CPU IMSIC state as online */
> +	imsic_state_online();
> +
> +	/* Enable per-CPU parent interrupt */
> +	enable_percpu_irq(imsic_parent_irq,
> +			  irq_get_trigger_type(imsic_parent_irq));

No line break required. You have 100 characters.

> +
> +	/* Restore the imsic reg */

One IMSIC register? Can you please write proper sentences and write
words out? This is not twitter. Also use IMSIC uppercase as the rest of
the code does in the comments.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
