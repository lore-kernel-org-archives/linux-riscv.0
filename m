Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C072C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOChS4BwX7rL5eATgOrbi3rtONngTUGKgU4L0b+o+1Y=; b=0TK+aMT5ZvMZp8
	Pv474jp9zTknES6kX/hyfBt3RnPk2G8WgXoSVRPP4Ir4Pv7cQTHBXMFR41rJ9i2iELgUPUiKwoDmR
	6O9Vvzvu1fpb1ENT2Drx2MEE7+i8EXO3Ojt6o3glOwgva6+pWv+TWm6wGogtIfPTO84xh9QdRHMFf
	JhyfWN4IiDGMxsy7dpuTWKTUxTN2Bug534o5a7etU4KSxkEMMqexjArRwvL2yN/97P6p2ul9f/cdX
	C08eLci0CpDs+FHrdQSE5HLh65Xo7BY+Q8ePFUf7MoDL0Azm1nOVzYgrbdkq83yTCEuGXfpzpVCUI
	5yPUnyk3yIwFzDle+6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwH1k-00Fl4D-1b;
	Fri, 27 Oct 2023 07:13:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwH1g-00Fl2q-34;
	Fri, 27 Oct 2023 07:13:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698390779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=48pzFigEfE7Y5axy5bcPf8T1YrV6Mt9jdZdUUrCruyY=;
	b=XCkoYDbbxdX8izcFbwr8Eqjrpz/IiZy9OFMLMIUw7C3IcXXWldxRkgIF+qkBVvurs9azkC
	VRBfNjf3U2uU3Jr8NS35HosDFVl2KEJOdkmzgT9QALLmizg63zjmrVpQKRGlgpTY4frTm8
	tGyF8vIaxbs1mBQcAqrBDz1DsKqhfOd66TLWMZ6oamJ34XQm3KEY8iOPyKm4cS5VgSpi7A
	JOLEKuh3/xAr+LDy+DBDr/iitqpzDIOye3l2r0AWUbvyp9HkLKdOwyuM7rr9EeGLVwxoaM
	Qn2NGk7BqG3q0DvssdOQ+/CSlNLrYVOhnNTxhmYe6VpKA27BQW0zdYsOBVQ0/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698390779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=48pzFigEfE7Y5axy5bcPf8T1YrV6Mt9jdZdUUrCruyY=;
	b=0GPEJyc9w2S/lUYqu7AA2vKxe6BhOXt+9gTUXhCjKjqqzZFEPd3MBo+FLJYfoWdVvHFdQ4
	OUu9Wdk8ZnijuBDQ==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
 geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de,
 irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com,
 mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, peterlin@andestech.com,
 peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org,
 sunilvl@ventanamicro.com, tim609@andestech.com, uwu@icenowy.me,
 wens@csie.org, will@kernel.org, ycliang@andestech.com
Subject: Re: [RFC PATCH v3 RESEND 02/13] irqchip/riscv-intc: Allow large
 non-standard hwirq number
In-Reply-To: <20231023004100.2663486-3-peterlin@andestech.com>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-3-peterlin@andestech.com>
Date: Fri, 27 Oct 2023 09:12:59 +0200
Message-ID: <87a5s44jyc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_001301_134114_92C868A3 
X-CRM114-Status: GOOD (  12.87  )
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

On Mon, Oct 23 2023 at 08:40, Yu Chien Peter Lin wrote:
> Currently, the implementation of the RISC-V INTC driver uses the
> interrupt cause as hwirq and has a limitation of supporting a
> maximum of 64 hwirqs. However, according to the privileged spec,
> interrupt causes >= 16 are defined for platform use.
>
> This limitation prevents us from fully utilizing the available
> local interrupt sources. Additionally, the hwirqs used on RISC-V
> are sparse, with only interrupt numbers 1, 5 and 9 (plus Sscofpmf
> or T-Head's PMU irq) being currently used for supervisor mode.
>
> The patch switches to using irq_domain_create_tree() which

git grep "This patch" Documentation/process/

> creates the radix tree map, allowing us to handle a larger
> number of hwirqs.

Who is 'us'? We are not part of the chip and please write out 'hardware
interrupts'

> @@ -24,10 +24,8 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
>  {
>  	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
>  
> -	if (unlikely(cause >= BITS_PER_LONG))
> -		panic("unexpected interrupt cause");
> -
> -	generic_handle_domain_irq(intc_domain, cause);
> +	if (generic_handle_domain_irq(intc_domain, cause))
> +		pr_warn("Failed to handle interrupt (cause: %ld)\n", cause);

pr_warn_once() or at least pr_warn_ratelimited().

>  }
>  
>  /*
> @@ -117,8 +115,8 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
>  {
>  	int rc;
>  
> -	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> -					       &riscv_intc_domain_ops, NULL);
> +	intc_domain = irq_domain_create_tree(fn, &riscv_intc_domain_ops,
> +					     NULL);

Put it into one line. Linebreaking arguments is really only required
when the line length is exceedingly long. This one is not.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
