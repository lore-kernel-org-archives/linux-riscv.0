Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A941C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEnUVzxVj98UQvTp54wPcKopwv+H0ai6YE7H9TGIJWk=; b=kNaeu9d4GNY6Yz
	lHWpXWUTSbyYzP6Ag77wQlTXh097Zcm78u/Rp1pujPxN5DaJx822qmUn14mN8eavElzREvk+lEZun
	aKGsV+JTpUmOrd4Rka/ynUmwV6j9bSdZOE7WANp4Tz1+K0+sdh+1iOfEKScXgofP3yCMLhTXHIjD+
	FWmfLzmYlFnS4hfjTEb9kFGD9JOAYfqYqvMDHjLOXaLx0Exdxc4tf8Y2KCvPVlwpKyhLeH+ToyaoW
	UroyvXlOLduuVlSCnNvYjsM2Bqtre1pqbNrJ5PbmXpXX2Ov9DXdurbLV9xX13us8XBlQYcGtkrZ+c
	r3tsaq9cHphdtTo+CvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpev-00000008l2l-3zDT;
	Tue, 13 Feb 2024 10:05:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpeq-00000008l0g-0T1x;
	Tue, 13 Feb 2024 10:04:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1707818693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1HrfL+SrlW2XWR5pU7cGgxYMFs+Qr2zZ76ZBVxutfE=;
	b=SE49GUQbwTclIrg8Ek0Z3VpThQD1o9FAH8SAfIXoKnzTV3UsTWw9PR3oootZv4e+BrIiEw
	mdQccGiNG42+Pm2ePTR4i97kp8932eaGmbf9YEyCPmZhmlW6DTxYRik/XdRPpaf/1d9Rj+
	iw237txMkf2vF9jD/1ZLzDd0rm8LrsgK/C2xIiSWgoOKHIUVHZ9nngnvzOVUFKnc6moxK7
	BpEj8jkWpHHDobcUxfUsyG+G/u9okIlxlJR4RBySpQ43POtEj6N7+cSAuQiP7GiM5XpWMC
	zt2UBKcuYOqCl9/NGww8Fi+s6sVfQA4TLjGzQeVeq9V65GziT/r7Yaga1vZYqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1707818693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1HrfL+SrlW2XWR5pU7cGgxYMFs+Qr2zZ76ZBVxutfE=;
	b=hwPVCOobELnpGmo9aIjJ/oKtSoM7jE5zNUcYVknaR65ECFvfFEULvht2Ghlz1V5bazoRzP
	gBUt4M68cX7NwTDg==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, evan@rivosinc.com, geert+renesas@glider.be,
 guoren@kernel.org, heiko@sntech.de, irogers@google.com,
 jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com,
 mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com,
 namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 peterlin@andestech.com, peterz@infradead.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org,
 robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com,
 tim609@andestech.com, uwu@icenowy.me, wens@csie.org, will@kernel.org,
 inochiama@outlook.com, unicorn_wang@outlook.com, wefu@redhat.com
Cc: Randolph <randolph@andestech.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v8 02/10] irqchip/riscv-intc: Allow large non-standard
 interrupt number
In-Reply-To: <20240129092553.2058043-3-peterlin@andestech.com>
References: <20240129092553.2058043-1-peterlin@andestech.com>
 <20240129092553.2058043-3-peterlin@andestech.com>
Date: Tue, 13 Feb 2024 11:04:53 +0100
Message-ID: <877cj8issa.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_020456_318874_C1EF66F9 
X-CRM114-Status: GOOD (  10.89  )
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

On Mon, Jan 29 2024 at 17:25, Yu Chien Peter Lin wrote:
>  static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
>  {
>  	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
>  
> -	if (unlikely(cause >= BITS_PER_LONG))
> -		panic("unexpected interrupt cause");
> -
> -	generic_handle_domain_irq(intc_domain, cause);
> +	if (generic_handle_domain_irq(intc_domain, cause))
> +		pr_warn_ratelimited("Failed to handle interrupt (cause: %ld)\n",
> +				    cause);

Either let the cause stick out or you need brackets. See:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

>  }
>  
>  /*
> @@ -93,6 +95,14 @@ static int riscv_intc_domain_alloc(struct irq_domain *domain,
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Only allow hwirq for which we have corresponding standard or
> +	 * custom interrupt enable register.
> +	 */
> +	if ((riscv_intc_nr_irqs <= hwirq && hwirq < riscv_intc_custom_base) ||
> +	    (riscv_intc_custom_base + riscv_intc_custom_nr_irqs) <= hwirq)
> +		return -EINVAL;

Duh. This mix of ordering required to read this 3 times. What's wrong
with writing this consistently:

	if ((hwirq >= riscv_intc_nr_irqs && hwirq < riscv_intc_custom_base) ||
	    (hwirq >= iscv_intc_custom_base + riscv_intc_custom_nr_irqs)
		return -EINVAL;

Hmm?

> -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +	pr_info("%d local interrupts mapped\n", riscv_intc_nr_irqs);
> +	if (riscv_intc_custom_nr_irqs)
> +		pr_info("%d custom local interrupts mapped\n",
> +			riscv_intc_custom_nr_irqs);

See bracket rules.
  
>  	return 0;
>  }
> @@ -166,6 +178,10 @@ static int __init riscv_intc_init(struct device_node *node,
>  		return 0;
>  	}
>  
> +	riscv_intc_nr_irqs = BITS_PER_LONG;
> +	riscv_intc_custom_base = riscv_intc_nr_irqs;

Why don't you initialize the static variables with constants right away?

> +	riscv_intc_custom_nr_irqs = 0;

It's already 0, no?

>  	return riscv_intc_init_common(of_node_to_fwnode(node));
>  }

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
