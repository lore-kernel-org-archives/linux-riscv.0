Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91543C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAmrLUy1hl/45AzkdzHvSoE2ZL2r4CuaQfgmCJUopcc=; b=3wWrryrOMFuaHh
	Z0kTxgB/N/Cek6mE/Oqr9Fg/Yz3DA+Q90LFxv44b8eSJzVYFTcLqro03tOqSDeCAZFjkK8wiTSZ10
	KjNWbe152BV8rhrmOOLEX8A+XAN+MXz3q6b13LrmsMjYYahSciIb9GJTC4Z5LRv9tnBKMUtdlUc2y
	Xalz6IgqC4RRlZ7KHk3IKjLFgGcOjyjFxp1Be9apyHgyWhq5wzqhTdJivfrH3w6TT1c/0JRZRrXwa
	bsJA3dhRjDpSBJ64TjMIxYoTuBgaBuQLRWz/nvYGdvLfbBAXkjszuKNPLX+2/eTNYjsI4crJS7fDt
	TidniF8J5SxJJOo9d++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tZB-00Bwfv-Sz; Fri, 02 Dec 2022 00:06:09 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tZ8-00BwfG-Mb
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 00:06:07 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1443a16b71cso515246fac.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 16:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkJj63AQ5n6QH7dnwOSIpJeyXYTYjMm/XE9Let7JGVs=;
        b=DmU22NtkUxiEQNB0q3VhK5AhMRqu2w1d+A95uOHOJc/SbNkRlkk/1p0k7RdClrvovX
         rqLe94EAqvHb5D75GtiSdoNEa6o6tUhoGAC/jIQ+ixUhnxhNvAgYiAi2Ezn2+lkwFbbr
         hewvvNlMfc7StjcgZVSZUt1+0i6eO22sFkeuggwdqXmeDWjad3kg+9MoZ0pItn7jCLTR
         rsahFnBjLf8BNPMN+RWRI6xxDFUtz16jc9Hg+AevThwK7REfmzDcEmSAWyLngjQQIhuH
         cJaOYiBNkoEdv0ZUpOV79FXU3tGldOHhP6VhpAPP8bn3EDptg/vQk2EHZSAhr3e/+FsR
         pvHw==
X-Gm-Message-State: ANoB5pkXOszc7i35Fud2j+4G/uFtdOAD+GNGwU39yK440zP/mnsnLuUy
	AFV4+nkbFJGM8s0mqG88MQ==
X-Google-Smtp-Source: AA0mqf4VIEUj6jNd9sHSBBaDfI/rBkBpivN4B3re+ALowYnCuyPWtggrj0DPpMOsTfKLvOuiEY0RSQ==
X-Received: by 2002:a05:6871:4684:b0:141:c076:de4c with SMTP id ni4-20020a056871468400b00141c076de4cmr42017933oab.248.1669939564797;
        Thu, 01 Dec 2022 16:06:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 76-20020a9d0852000000b0066e3cebb7a7sm2681131oty.78.2022.12.01.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 16:06:04 -0800 (PST)
Received: (nullmailer pid 1730725 invoked by uid 1000);
	Fri, 02 Dec 2022 00:06:03 -0000
Date: Thu, 1 Dec 2022 18:06:03 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v5 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
Message-ID: <20221202000603.GA1720201-robh@kernel.org>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201123954.1111603-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_160606_755198_4D6A05FA 
X-CRM114-Status: GOOD (  22.99  )
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

On Thu, Dec 01, 2022 at 06:09:54PM +0530, Anup Patel wrote:
> We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
> timer DT node.
> 
> This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> based on RISC-V platform capabilities rather than having it set for
> all RISC-V platforms.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 969a552da8d2..1b4b36df5484 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -28,6 +28,7 @@
>  #include <asm/timex.h>
>  
>  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> +static bool riscv_timer_cannot_wake_cpu;
>  
>  static int riscv_clock_next_event(unsigned long delta,
>  		struct clock_event_device *ce)
> @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  static unsigned int riscv_clock_event_irq;
>  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
>  	.name			= "riscv_timer_clockevent",
> -	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> +	.features		= CLOCK_EVT_FEAT_ONESHOT,

A platform that depended on CLOCK_EVT_FEAT_C3STOP being set will break 
with this change because its existing DT will not have the new property.

It needs to be the other way around which would effectively be the 
existing 'always-on' property. 

>  	.rating			= 100,
>  	.set_next_event		= riscv_clock_next_event,
>  };
> @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  
>  	ce->cpumask = cpumask_of(cpu);
>  	ce->irq = riscv_clock_event_irq;
> +	if (riscv_timer_cannot_wake_cpu)
> +		ce->features |= CLOCK_EVT_FEAT_C3STOP;
>  	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
>  
>  	enable_percpu_irq(riscv_clock_event_irq,
> @@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  	if (cpuid != smp_processor_id())
>  		return 0;
>  
> +	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> +	if (child) {
> +		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> +					"riscv,timer-cannot-wake-cpu");
> +		of_node_put(child);
> +	}
> +
>  	domain = NULL;
>  	child = of_get_compatible_child(n, "riscv,cpu-intc");
>  	if (!child) {
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
