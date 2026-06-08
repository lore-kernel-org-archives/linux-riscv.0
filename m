Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95364CD8C92
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G02GOKVFOchriKf2yJYGPSEvq9yLrJ7qo//zI9kyPJ8=; b=N07BVEsUL2t5Jg
	5f/dVx4bTfGXh+EQbGc68LjlsPx8swVgkRF8l45kloJ5sx0fuLTgeyl1HicV7ox+zkFsllmv0yOTb
	9G138OwwZyK4mViIDIXcMccpe6lY4OIbHgQo7/dq0F3D1S7Mj64J3NcB9+nzrp4NYgVe3pmeZIdV4
	eLiYtvwm1J7TyeRjIbboQXgptVLwJtI1yacOyJEx0SYpy3F+KTxEI+uoLS+nGk04g5xTGc9I9IdPK
	4GleXl+jb5cdTXHhVPhwtwBRgO/IBsBieH8QTl3fywQjIuJL3UQMLG3/29ZImRce6xD2bpf2TCkJb
	OU3qVvwG1D9TNhLwkm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRM-00000003f8i-1lWb;
	Mon, 08 Jun 2026 13:54:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRJ-00000003f8B-2d4L
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 13:54:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so28560425e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780926891; x=1781531691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2wxWcBtJYCZllM8lxdVqgg8UpH53FNTQzrsHXzAUg1E=;
        b=ay/nCrto+9xyZEOUEHZwXOWF4juwK5LEGepBTbc2rf0Yng/VR3zSsGL1pVJ2kix8bD
         ixklNgnKaKXL44q887Lo+KX2NVn69Wfrjg46I9CKgGOjsLc+LzItVcoccTQ+HmJWrN/w
         xBaAfqLKzQ+kcpeUdLRTyEBm7owExesmhnOIQK+7mPrBGppBMGBk/u0UQLDx9EnoEDIU
         eLfnv1de327+PB2SktP0Ulqng7wh+YxNwRHPIov5Dr6nkwaoLVgxrsfri99ZmA80bq3d
         QdoDbsiIDRVJ8r9STS2z+XXm8eC8e4nGzd6e88Ei2CziTo7In2/XxWGKfs6iyu3D8A5D
         skJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926891; x=1781531691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wxWcBtJYCZllM8lxdVqgg8UpH53FNTQzrsHXzAUg1E=;
        b=cYQH/Gx+4fSbgvbTIj5Ftz6/lxnn3/9GiWhv5lNBtjxwhaAdv9g4utgUBc3CPhSU2x
         hKkFbYrvvI3Z5z/d/V2+ihQ69mI7f2KcHU9LLYUa8mS+BxS7n9i97q7SckmnjmmynWBj
         5Mc5uIxIpSNk7Xo8CDUCgXO76s7RWGjVuPoFQ/G9DFUhlto0e6/dVsMlaIgF+uRx9aM2
         oLvem1IKNhcb67tO45SGNyd5W0HM0ae2OHrwuI/bKMeD/fdMmCujsaQBAN9w91ha458j
         XRxxFQn/XuTl/nPKh1WcNKO2zWnJaOUTxDKpz1u4fdP8If21HbdO3EVWoHuGC3+Octny
         geLQ==
X-Gm-Message-State: AOJu0YzRpFr5k7z2SaR/rLAzQsFYsqTABP3E71D6hkJTbw5v8171cWoM
	LafjTUtuXcjWIcjbxUJhhTgzML7f0JriAMkMQ/2VeJFh51FeDjwszIcD
X-Gm-Gg: Acq92OE3nH4946mzcbEQ75yz98zT+b98uNKN8awLqzugFbpipiseOgWCOtqyHawWu/g
	T4qVXvzX2AJeXr/ltYy6AMX29aLB7aUlXYBXvluMbKYrilYFprDpKugYs311zqvI9Vjr/Ar2y7S
	hGpG/rFPELeNrVaZhiuSJPlX508r3hEmZJ2qTAq9UH7zhQiiu5Ejk4TyeXC1U9EW6mlS1xgCbLE
	t+lFffTwIAj0xNdfODtPWPmsU16Kp4hlL3Rrrvo27krjX5jVD25HQzoHE0pusppy0tKcsrLNzUk
	0wwTOIVbn1S/BNXLQSMehLKj+wZ8SP5oC7RUZ6XI1kpRzKBkuHrjD0xKtQNYLMRvHQUK9MMS0SO
	qFL3ILl2icurGC2ePvomOQtw+aqfuxx7hhLdfPnLYaLquftAQgOYK7k+DYAfe6o5wSmJ38MsAb1
	6jc2LmNtufEvdiATFG/qXiUfZc+L2ZeE5ODG6W
X-Received: by 2002:a05:600c:19d0:b0:490:a964:14f8 with SMTP id 5b1f17b1804b1-490c25ab04fmr251045875e9.8.1780926891166;
        Mon, 08 Jun 2026 06:54:51 -0700 (PDT)
Received: from blinky ([46.255.81.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm461754105e9.2.2026.06.08.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:50 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:54:48 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 1/2] clocksource/drivers/timer-clint: Add ZICNTR
 support
Message-ID: <aibJqFKQjCe30ejT@blinky>
References: <20260525182124.19402-1-jtaubepe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525182124.19402-1-jtaubepe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065453_702155_2B21C00A 
X-CRM114-Status: GOOD (  36.96  )
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

On Mon, May 25, 2026 at 02:21:23PM -0400, Jesse Taube wrote:
> ZICNTR allows the CPU time to be read using CSRs, which used to be the
> default. If ZICNTR is supported prefer using CSRs over MMIO.
> This may also be faster as CSRs are not emulated in M-mode.

I think the rationale can be cleaned up a bit here. You say it "may" be
faster, if it's not guaranteed to be faster, why prefer it over mmio?

The patch d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
for M-mode systems") is the one that changed this behavior, can you
include a reference to that patch to point out when it was the default?

> 
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
> ---
> Treat this as a completely new patch, as it is mostly rewritten.
> Original:
> https://lore.kernel.org/all/20240410142347.964-3-jszhang@kernel.org/
> V3 -> V4:
>  - Add riscv,csr-clint
>  - Allow using of CSRs in S mode
>  - Change if return else return to if return return
>  - Change static_branch_likely to static_branch_unlikely
>  - Fix 32-bit clint_get_cycles64 csr_available check being inverted
>  - Fix is_c900_clint being uninitialized
> V4 -> V5:
>  - Remove riscv,csr-clint
>  - Remove riscv_csr_time_available
>  - Replace all static_branch_unlikely(&riscv_csr_time_available) with
>     riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR)
> V5 -> V6:
>  - Add csr_clock_next_event
>  - Add csr_get_cycles64 to sched_clock_register
>  - Break get_cycles64 into csr_get_cycles64 and clint_get_cycles64
>  - Change default behavior to use CSR time register
> V6 -> V7:
>  - Split csr and c900 parts into different commits
> 
> Posible future work:
>  - Check for SSTC support and use stimercmp
>  - SSTC depends on smode which cpufeature doesnt check for.
> ---
>  arch/riscv/include/asm/timex.h    | 12 ++++++-
>  drivers/clocksource/timer-clint.c | 57 ++++++++++++++++++++++++++++---
>  2 files changed, 64 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a06697846e69..d78075351bf4 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -17,17 +17,26 @@ typedef unsigned long cycles_t;
>  #ifdef CONFIG_64BIT
>  static inline cycles_t get_cycles(void)
>  {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
> +		return csr_read(CSR_TIME);
> +
>  	return readq_relaxed(clint_time_val);
>  }
>  #else /* !CONFIG_64BIT */
>  static inline u32 get_cycles(void)
>  {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
> +		return csr_read(CSR_TIME);
> +
>  	return readl_relaxed(((u32 *)clint_time_val));
>  }
>  #define get_cycles get_cycles
>  
>  static inline u32 get_cycles_hi(void)
>  {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
> +		return csr_read(CSR_TIMEH);
> +
>  	return readl_relaxed(((u32 *)clint_time_val) + 1);
>  }
>  #define get_cycles_hi get_cycles_hi
> @@ -40,7 +49,8 @@ static inline u32 get_cycles_hi(void)
>   */
>  static inline unsigned long random_get_entropy(void)
>  {
> -	if (unlikely(clint_time_val == NULL))
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR) &&
> +	   (unlikely(clint_time_val == NULL)))
>  		return random_get_entropy_fallback();
>  	return get_cycles();
>  }
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 0bdd9d7ec545..18f7bf7d26c6 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -81,6 +81,12 @@ static u64 notrace clint_get_cycles64(void)
>  {
>  	return clint_get_cycles();
>  }
> +
> +static u64 notrace csr_get_cycles64(void)
> +{
> +	return csr_read(CSR_TIME);
> +}
> +
>  #else /* CONFIG_64BIT */
>  static u64 notrace clint_get_cycles64(void)
>  {
> @@ -93,8 +99,26 @@ static u64 notrace clint_get_cycles64(void)
>  
>  	return ((u64)hi << 32) | lo;
>  }
> +
> +static u64 notrace csr_get_cycles64(void)
> +{
> +	u32 hi, lo;
> +
> +	do {
> +		hi = csr_read(CSR_TIMEH);
> +		lo = csr_read(CSR_TIME);
> +	} while (hi != csr_read(CSR_TIMEH));
> +
> +	return ((u64)hi << 32) | lo;
> +}
> +
>  #endif /* CONFIG_64BIT */
>  
> +static u64 csr_rdtime(struct clocksource *cs)
> +{
> +	return csr_get_cycles64();
> +}
> +
>  static u64 clint_rdtime(struct clocksource *cs)
>  {
>  	return clint_get_cycles64();
> @@ -105,9 +129,20 @@ static struct clocksource clint_clocksource = {
>  	.rating		= 300,
>  	.mask		= CLOCKSOURCE_MASK(64),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> -	.read		= clint_rdtime,
> +	.read		= csr_rdtime,
>  };
>  
> +static int csr_clock_next_event(unsigned long delta,
> +				   struct clock_event_device *ce)
> +{
> +	void __iomem *r = clint_timer_cmp +
> +			  cpuid_to_hartid_map(smp_processor_id());
> +
> +	csr_set(CSR_IE, IE_TIE);
> +	writeq_relaxed(csr_get_cycles64() + delta, r);
> +	return 0;
> +}
> +
>  static int clint_clock_next_event(unsigned long delta,
>  				   struct clock_event_device *ce)
>  {
> @@ -123,13 +158,16 @@ static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
>  	.name		= "clint_clockevent",
>  	.features	= CLOCK_EVT_FEAT_ONESHOT,
>  	.rating		= 100,
> -	.set_next_event	= clint_clock_next_event,
> +	.set_next_event	= csr_clock_next_event,
>  };
>  
>  static int clint_timer_starting_cpu(unsigned int cpu)
>  {
>  	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
>  
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
> +		ce->set_next_event = clint_clock_next_event;
> +
>  	ce->cpumask = cpumask_of(cpu);
>  	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
>  
> @@ -161,7 +199,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int __init clint_timer_init_dt(struct device_node *np)
> +static int __init clint_timer_init(struct device_node *np)
>  {
>  	int rc;
>  	u32 i, nr_irqs;
> @@ -227,13 +265,19 @@ static int __init clint_timer_init_dt(struct device_node *np)
>  
>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>  
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
> +		clint_clocksource.read = clint_rdtime;
> +
>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
>  	if (rc) {
>  		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
>  		goto fail_iounmap;
>  	}
>  
> -	sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
> +		sched_clock_register(csr_get_cycles64, 64, clint_timer_freq);
> +	else
> +		sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
>  
>  	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
>  				 "clint-timer", &clint_clock_event);
> @@ -273,5 +317,10 @@ static int __init clint_timer_init_dt(struct device_node *np)
>  	return rc;
>  }
>  
> +static int __init clint_timer_init_dt(struct device_node *np)
> +{
> +	return clint_timer_init(np);
> +}
> +
>  TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
>  TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> -- 
> 2.54.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
