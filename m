Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D9C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVuO32oW0TqEUyM1USP7oHf0k8eZheoIV2aulEIqebY=; b=WxOSEeh/HAjqOx
	XDDzSPLVnY6DYr10RzcYJaIJC9mV30XYDC0U4syvp921Dxio06Fu3U9SJYTVjkRejV3Pp4jWDU+i9
	q4RiYYSZhq4CZsunkMOuvfR+fkgffzjEOHX9NKlzZktNssOeLQHtwCEPdN1jMevVQn6XvPZHanche
	NhdEAhbJ4tgWjpv2LfcL2ile9dfMxW/ktIhd6D1bFFIHHDnq9Nf+icq6VOnXRg2ub8MBFcj4uk+vV
	Gv/YA5OhaYl76gy8FYl80B3yK5BRydKIDhx4YvkeEkWQitCFOmmY5vwUslmd+kb3OPhNCWzZABbiF
	6Ks85an7WKBW2ZHK1CiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0DU-00000002pNH-28Zy;
	Fri, 16 Feb 2024 15:33:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0DQ-00000002pKo-066s;
	Fri, 16 Feb 2024 15:33:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708097604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2MaYtjttL6XKBNL0rdPOP7iP2+uK1fvBkLYnfKG/rM=;
	b=0qn3js0c+PxthhaToXev+IfwlGXqyVL+/2Ng4/kF4L9yOBlfcYjF+3J31ouudWdpim0mF5
	M8TXP40JWWfQ2WGZa33Y4cjVM7s0SrwYwb36dSY/TPAmMYmOxT68r636xK6dsXZ03e/XKw
	zOxzOcS1+VHVDBUCUdYuOd9kfYPYJD9mDUEAiZRMf/sjwafmglDv9w+oIFXecCsOfoNc9d
	oOkwKpj+GCfn4UBe5QxTB82YtjygcYejyBhnu+4BMvbVxnqtlUjeg5Smq2Oi1/+lKQA2ja
	kC9OocVn1stvdgl//7mcSNjQkeUqMgpZTrhUFZVdMSjHmuzOge4tL6VvmJhIDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708097604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2MaYtjttL6XKBNL0rdPOP7iP2+uK1fvBkLYnfKG/rM=;
	b=3jG1bRA09z9Yz6hS8ZMKbnr4SudqqedyjpDGks+fqNkrunvpm9xBTYCTBJHfPWjIbNOvQH
	/Tndz8JCl0Y1q4BA==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v12 14/25] irqchip/sifive-plic: Convert PLIC driver into
 a platform driver
In-Reply-To: <20240127161753.114685-15-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-15-apatel@ventanamicro.com>
Date: Fri, 16 Feb 2024 16:33:23 +0100
Message-ID: <87jzn4ctks.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_073328_222262_03FC2275 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 27 2024 at 21:47, Anup Patel wrote:
> +	priv->irqdomain = irq_domain_create_linear(dev->fwnode, nr_irqs + 1,
> +						   &plic_irqdomain_ops, priv);
> +	if (WARN_ON(!priv->irqdomain))
> +		return -ENOMEM;

While some of the stuff is cleaned up by devm, the error handling in
this code looks pretty fragile as it leaves initialized contexts,
hardware state, chained handlers etc. around.

The question is whether the system can actually boot or work at all if
any of this fails.

> +
>  	/*
>  	 * We can have multiple PLIC instances so setup cpuhp state
> -	 * and register syscore operations only when context handler
> -	 * for current/boot CPU is present.
> +	 * and register syscore operations only after context handlers
> +	 * of all online CPUs are initialized.
>  	 */
> -	handler = this_cpu_ptr(&plic_handlers);
> -	if (handler->present && !plic_cpuhp_setup_done) {
> +	cpuhp_setup = true;
> +	for_each_online_cpu(cpu) {
> +		handler = per_cpu_ptr(&plic_handlers, cpu);
> +		if (!handler->present) {
> +			cpuhp_setup = false;
> +			break;
> +		}
> +	}
> +	if (cpuhp_setup) {
>  		cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>  				  "irqchip/sifive/plic:starting",
>  				  plic_starting_cpu, plic_dying_cpu);
>  		register_syscore_ops(&plic_irq_syscore_ops);
> -		plic_cpuhp_setup_done = true;

I don't think that removing the setup protection is correct.

Assume you have maxcpus=N on the kernel command line, then the above
for_each_online_cpu() loop would result in cpuhp_setup == true when the
instances for the not onlined CPUs are set up, no?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
