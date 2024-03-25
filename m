Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F4EC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gkGe857qLFhBwBGFIn7me4XnacxwMaCNdahxOKMwOk=; b=kzWrOKM0bCyuOY
	nEi+yFgOU1B4vt8kMSEyeU85VqwxyV0ANgnOBq28RaAlJdI8tdy1M2/7TU2LLnnMlho4GNZKM/oAB
	5Viv2oiWPDRKlsSkw8foLlSErIAVpJpjyTWjeM4/GnJ0SOJjht2drMb8pu3dqIzQalurwwVyTp9Qy
	QrVOt6gcyEpMO7BWKCMZ6NYhAy6C1qDec0oXJ1YtJMGZyJlqgS3hLeaPg+4S2kzDXMpBh3Cpqrmt9
	UH8eoqYggOstTdILCQooisQCZTvm6CdHM3yGbZ8q6r9fhqbv0lLNqtDJDakLEtAGZu95OrB4oWCuZ
	eU4jBE3MOG++MkM7JEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronje-00000000vpw-267U;
	Mon, 25 Mar 2024 17:03:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronjb-00000000vpO-3ZGz
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 17:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5451CE1BAA;
	Mon, 25 Mar 2024 17:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9590AC433F1;
	Mon, 25 Mar 2024 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711386221;
	bh=z/jh+93zuvKqVIQ98MxaG5F4d3axg0Y13zwiWvCIOg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibllFgBos5TkeQY0PYTM1ISTnrSacPHTnQzJ956kmpo5PD14ze3eBNhs4ozn9Rx5D
	 rvzt+0JS0lzQyPPLsL0k/BpjypqND0jxIEr2P/fDBujybNLLGZ4H9yrstHvLwm3tfE
	 oJaHw47t+yvIzTlg3EPJZ2Q0j2Q8Bx9Hudgm8mcRHIkT3kKn1vWP4zdIRHvnyl9PV7
	 OMwt7BEl44CdyBkmfs7apSOHJ8WDgNIHPq+QoezOzmO1XsXaAC8LGPkCcLJvSgdK+8
	 FxFJI+7f2GhK/KW+M+gQAw0Kr9j4a+mfHH0sB/S7A39SoCnypVlaeoAwL6dJ/YDVwd
	 t7TZay50Xoxog==
Date: Tue, 26 Mar 2024 00:50:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clocksource/drivers/timer-clint: Add T-Head C9xx
 clint support
Message-ID: <ZgGrRrH0mxoKl90n@xhacker>
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325164021.3229-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_100344_282717_B11D9EA9 
X-CRM114-Status: GOOD (  20.11  )
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

On Tue, Mar 26, 2024 at 12:40:21AM +0800, Jisheng Zhang wrote:
> The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> implement such support.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/clocksource/timer-clint.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 4537c77e623c..71188732e8a3 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -34,6 +34,7 @@ static unsigned int clint_ipi_irq;
>  static u64 __iomem *clint_timer_cmp;
>  static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
> +static bool is_c900_clint;
>  
>  #ifdef CONFIG_SMP
>  static void clint_send_ipi(unsigned int cpu)
> @@ -88,6 +89,19 @@ static int clint_clock_next_event(unsigned long delta,
>  	return 0;
>  }
>  
> +static int c900_clint_clock_next_event(unsigned long delta,
> +				       struct clock_event_device *ce)
> +{
> +	void __iomem *r = clint_timer_cmp +
> +			  cpuid_to_hartid_map(smp_processor_id());
> +	u64 val = clint_get_cycles64() + delta;
> +
> +	csr_set(CSR_IE, IE_TIE);
> +	writel_relaxed(val, r);
> +	writel_relaxed(val >> 32, r + 4);
> +	return 0;
> +}
> +
>  static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
>  	.name		= "clint_clockevent",
>  	.features	= CLOCK_EVT_FEAT_ONESHOT,
> @@ -99,6 +113,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
>  {
>  	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
>  
> +	if (is_c900_clint)
> +		ce->set_next_event = c900_clint_clock_next_event;
> +
>  	ce->cpumask = cpumask_of(cpu);
>  	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
>  
> @@ -233,5 +250,12 @@ static int __init clint_timer_init_dt(struct device_node *np)
>  	return rc;
>  }
>  
> +static int __init c900_clint_timer_init_dt(struct device_node *np)
> +{
> +	is_c900_clint = true;
> +	return clint_timer_init_dt(np);
> +}
> +
>  TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
>  TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> +TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", clint_timer_init_dt);

oops, this should be "c900_clint_timer_init_dt", will update in v2.

> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
