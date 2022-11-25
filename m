Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C64C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOYrBzsByY/I2ArTy89ikWSRMbS7fHIEeZTqMQdHAHc=; b=SqzDfNgj3iU25Y
	SWv4UT0+UB5h51nb17LmI1Tb2npUNbNzuEs/WTKwUYpiCNcYDV2jmyUGygxOlI+vJqUlRWDxi0YdK
	kQjPuaJ1Ipz/h58thYhvErRC9dqsb4TiIlYr1O3M792qimvJEAXf0tM0VdbErN4P2WblEBR+QcCEf
	YYvjV/kW40iSpX4CFVg8dlfHeu6G7HBIG+G8iT1Mt2p76r6VbH1ZPs2Sr6PMAftLlznr3qA0nTXOa
	950r2wcq97PnToQwyAj/WssXtxspapAuqH5qxbBS/p4CAVGH5fTa/A7OhwkArE3bcLZkZN1M8DyFs
	DXCA48Mq3ww4MaRWWNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYWP-00Gc7o-9A; Fri, 25 Nov 2022 13:13:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYWM-00Gc6Y-GE
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669382014; x=1700918014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=URMsbJgze28ts7TAuGW6Vykuoh3mCPWkBvj7qVYKBE0=;
  b=iAIMJoIwEgPi+D8zhzt2trEstEqY0PQBgcFrMlXUgmgjIrdFy5OpG3Ja
   b4czOBgTp675urwibUayQ9SK4cPErb1PiuYqWWvHqok1wfI8018w239ij
   kzOMbShgRiqZgBZgjv6Avzg4q4qiVuyAOEDV1EGm/8oxVyN3TjkKT7h+g
   yu7z2cpdvDhdkGLiEY5i2Ce5EBV59CJEf4wJrxNFWxZXGkdPIKpiFXaWH
   nzbrBqWn8s/OLh0ZxuPeQvO8eVfahJ3SCh0AzlBg0s86/h2Va23YySw+e
   HLnZoJ2HsUrDmEr+AAJyMZuc+5Rxg8cp5YcxPcqxsF9u05k+8qO7Yr6As
   g==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="188664077"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 06:13:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 06:13:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 06:13:22 -0700
Date: Fri, 25 Nov 2022 13:13:04 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew
 Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, Samuel
 Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
Message-ID: <Y4C/YOoHxX5dxwG3@wendy>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
 <20221125112105.427045-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125112105.427045-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_051334_629094_A9F8C87E 
X-CRM114-Status: GOOD (  20.57  )
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

On Fri, Nov 25, 2022 at 04:51:05PM +0530, Anup Patel wrote:
> We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> when riscv,timer-cant-wake-up DT property is present in the RISC-V
> timer DT node.
> 
> This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> based on RISC-V platform capabilities rather than having it set for
> all RISC-V platforms.

I need to go do some testing on what setting the C3STOP flag does on
platforms other than PolarFire SoC. I'm not sure that we should be
enabling this flag *at all* until we know that it does not break on
other platforms too.

Hopefully I'll get to it tonight or tomorrow..

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/clocksource/timer-riscv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index a0d66fabf073..0c8bdd168a45 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -28,6 +28,7 @@
>  #include <asm/timex.h>
>  
>  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> +static bool riscv_timer_cant_wake_cpu;
>  
>  static int riscv_clock_next_event(unsigned long delta,
>  		struct clock_event_device *ce)
> @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  
>  	ce->cpumask = cpumask_of(cpu);
>  	ce->irq = riscv_clock_event_irq;
> +	if (riscv_timer_cant_wake_cpu)
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
> +		riscv_timer_cant_wake_cpu = of_property_read_bool(child,
> +						"riscv,timer-cant-wake-cpu");
> +		of_node_put(child);
> +	}
> +
>  	domain = NULL;
>  	child = of_get_compatible_child(n, "riscv,cpu-intc");
>  	if (!child) {
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
