Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9711DC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlTd9I0AkYKiTWChULFfQHNWUl4ps85ZdZq9ziEzcH4=; b=XyG+WBpV4+/niAd/nAW+jvL5yd
	a1QnV1065fKi2s0AHyd+O+3YqBXvwdktqUGoUrKM3r037R6OKz/PUzU8m2Y3lIL+MnYyvzYBwA2wC
	JTuCL92RKZRvTjhH8/Ivn0pRAzrad4a/mnjxjhheRbxeW0F9lkgQzEUFwp/S37v9016fV5GlBUww1
	OMOyqinGFDjVPvYyBXACB3388d4VbKIiaigv0m4DGLOuTTyhptndyzOo4mVC7hh/PTuDuaZTGOot/
	5ZXt7j6Bax3Diwx0JdxezqmkUVfB2fm+hXROx+So25Ys4UXrfK5eo5R7yOIVbD79LOd1TztdgqKCl
	u1PB0aTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosi9-00000002BDW-2d6v;
	Mon, 25 Mar 2024 22:22:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosi6-00000002BCQ-0GGH
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 22:22:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e0edd0340fso154525ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 15:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711405344; x=1712010144; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txLs5NtImA2VWZlBubPwip9xSO6gMvbeKarQ47jfmgc=;
        b=mW8PK8yStXgHkrzO7suP3DrbTGJfmXDugAYqS+6+kyAi4L52FT0GCkDHGR8Y3dGMji
         SlY/oBxV/EwxrN/XDJdce8XwhL/KadcCqlCrN2ziP/pnXI5H4RGJIO2A/jrZys9kZR8W
         mhGYlEElc6gkpNjAKQRHgTJrSqafgIaNFPVlbhgz5MzuqCDgrk+ePF9DLG1N4j+xFbvZ
         EOJB6F0r/pPenWfHGiplks00zB6GyzdABzrKAxcRtv30ZMrMVXzyWWbx9zt9IxXEz19Q
         /FFcnPRZImW2G4Ynif09sABIpupzEWu8qRRUueNFp+XJ+LA2zcxApua80159xuX3x4Lb
         /kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711405344; x=1712010144;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txLs5NtImA2VWZlBubPwip9xSO6gMvbeKarQ47jfmgc=;
        b=POLFW+X35d9L2NhDekblJCMq0n8kITU1pDMi2dxN9CM0fE1xC0UVME2CVFq70E0yQ/
         GiRevKggVg4L6w5tIG2swQxvcVmWu2unHoTPQVPa2kLlLtPcFJx80LecF9PGvNkD+v3G
         WusJHnWZxZiyC4dglQV1YKjf0AApaa7a4heZihB7FU15OXv5ueYPyuwLlPlxCCO2AJ8Q
         5rvs6NpVMlX195hH+axc5BJtu8tOqADXcVdmv32P5jvrfN8x7eNs+0tqddb1JtUBv5Sd
         vICZPNvmXVh99QjZBSBhWmjuKw18LxM3jb1RcGRZBs08owQQQYtMoeZMOD8OtbohNXlX
         hJuQ==
X-Gm-Message-State: AOJu0YzbTax9Fux3eNw3ngq7HL8imjogILrGBmGUUhjim4r5WutMQGTe
	9D/4MqxqQZ74TMYrYmgyhPfZtKl0eEDjJQdAk64UxooV/JQwVytp
X-Google-Smtp-Source: AGHT+IGXh5MDhzVnvBPuf+JgibFces6iZpq1uyXY9Jf9I5RUf7oMVvK7FiCeSP1XrC9SZEzJ5qR4rw==
X-Received: by 2002:a17:902:d344:b0:1e0:d0b:25a2 with SMTP id l4-20020a170902d34400b001e00d0b25a2mr9752931plk.41.1711405343855;
        Mon, 25 Mar 2024 15:22:23 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090341c600b001dddaa7d046sm5247951ple.29.2024.03.25.15.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 15:22:23 -0700 (PDT)
Subject: Re: [PATCH 5/5] clocksource/drivers/timer-clint: Add T-Head C9xx
 clint support
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-6-jszhang@kernel.org>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <72eac56e-61d4-e42f-cfbd-8bcc35ed7bb6@gmail.com>
Date: Mon, 25 Mar 2024 15:22:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240325164021.3229-6-jszhang@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_152230_164317_86EF09F7 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/25/24 9:40 AM, Jisheng Zhang wrote:
> The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> implement such support.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/clocksource/timer-clint.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 4537c77e623c..71188732e8a3 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -34,6 +34,7 @@ static unsigned int clint_ipi_irq;
>   static u64 __iomem *clint_timer_cmp;
>   static unsigned long clint_timer_freq;
>   static unsigned int clint_timer_irq;
> +static bool is_c900_clint;
>   
>   #ifdef CONFIG_SMP
>   static void clint_send_ipi(unsigned int cpu)
> @@ -88,6 +89,19 @@ static int clint_clock_next_event(unsigned long delta,
>   	return 0;
>   }
>   
> +static int c900_clint_clock_next_event(unsigned long delta,
> +				       struct clock_event_device *ce)
> +{
> +	void __iomem *r = clint_timer_cmp +
> +			  cpuid_to_hartid_map(smp_processor_id());
> +	u64 val = clint_get_cycles64() + delta;
> +
> +	csr_set(CSR_IE, IE_TIE);
Perhaps you should do a writel_relaxed(-1, r) here. just like openSBI, because the update
to mtimecmp is now split into 2 parts.
https://github.com/riscv-software-src/opensbi/blob/v1.4/lib/utils/timer/aclint_mtimer.c#L54

> +	writel_relaxed(val, r);
> +	writel_relaxed(val >> 32, r + 4);
> +	return 0;
> +}
> +>   static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
>   	.name		= "clint_clockevent",
>   	.features	= CLOCK_EVT_FEAT_ONESHOT,
> @@ -99,6 +113,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
>   {
>   	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
>   
> +	if (is_c900_clint)
> +		ce->set_next_event = c900_clint_clock_next_event;
> +
>   	ce->cpumask = cpumask_of(cpu);
>   	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
>   
> @@ -233,5 +250,12 @@ static int __init clint_timer_init_dt(struct device_node *np)
>   	return rc;
>   }
>   
> +static int __init c900_clint_timer_init_dt(struct device_node *np)
> +{
> +	is_c900_clint = true;
> +	return clint_timer_init_dt(np);
> +}
> +
>   TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
>   TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> +TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", clint_timer_init_dt);
> 
Better use a more generic term to describe the fact that mtimecmp doesn't support
64-bit mmio, just like what openSBI is currently doing, instead of making it c900 specific:

https://github.com/riscv-software-src/opensbi/blob/v1.4/lib/utils/timer/fdt_timer_mtimer.c#L152

Then your `is_c900_clint` becomes something like `timecmp_64bit_mmio`.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
