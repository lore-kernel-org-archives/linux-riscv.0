Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20B4C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06E22082D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKnWRmwr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="R8Jpelen"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06E22082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NJeNDXQdYpRlmOXfxZ15Q1nVELOU92K1LsfVFpNQVc8=; b=EKnWRmwrGIixer6nYstCmkQkZ
	LbnDSmW9XMNZYt/F8cokVTdpbOtaORLvuUY30dOBWo2SkVD+js3iBWS2l/oPq8NxtDl3dnxsZSgEq
	AVwM7uOKikxByBl1Zc4VY/dwLdLIttHWN8ssM7S3U68o8HmlIbT17rA4NdJq4iTM4SnhiFTiMFtGr
	WbwhvzwCzNTBQybErISjllSQj1JmtyaOXh0ZvyRpfpnhiJU6sHGI5iO0aL6ZcKmFF9Lha0I2lomxM
	2XLq+2h/5jnb4MtoOqcy4gOox0Whm5XwcZDWga1VhXeHpcc2ECc7rrG52bTmYkVWqpig9Ag8BvFqH
	IOf/rI+MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKP9-0004dV-Q0; Fri, 07 Dec 2018 17:59:11 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKP6-0004bw-Pn
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 17:59:10 +0000
Received: by mail-pf1-x441.google.com with SMTP id 64so2282860pfr.9
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 09:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=A7O+8UhdX6omDOFY0XLZhv+eaCAxPxhbfqQJ8TGsiCo=;
 b=R8JpelenRlbRKmrd41K0aiUWnHuUcHcMfxFAIw8n9rtEIvl7JoANB3W0u3IXSLdq/B
 dqZU76vaG59eynuUeT6af5araUkrjRQ8uUrmIe2uTMJa7tkvSfjN33K2eayD00EERH0/
 2hjgaiyqRFAA9qkYSVj1xd9K7C3JmNPDUXOKS3ltxdt4BAMpNha95vX4TS94nIoMpqWE
 syrH8IWd//bBJ+Mclkb3aHPAHEoop8yrfebazb2uQr/PgTMsZkPROnpxWb/Ar790vaXH
 0k+u7BcNvk3lXUNAATL/Ryw6U9AMsrESpUUlMoO3NWwzIBuu0dZ1FPXcZ4Cpcm72LKqh
 T5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=A7O+8UhdX6omDOFY0XLZhv+eaCAxPxhbfqQJ8TGsiCo=;
 b=HrDvniNRnw0L37q98pF2PjHkzAmeiE09NZZqYwt3umDyH0LbWJBPaL2UQ48Iwvamzr
 aTvDvAm3/0uVEVp2hzsJDDKU8/G1+hgWhA09Alrrfe8YT5Dd1gpyHwmTWGPIYKNU08qD
 lqchvOf0q6v6Y/P4TD7CFTYizmfbV7VLCz91Xle2dCzjibXWXN0sdvOVfot1D5rnbbaY
 lLMGGFQmtlCT4NJx9Kt14oiR+7STdG3CQnU8T8r/avqooVjd7AVirFxC4UBPY3DaBoE3
 EfBcPHqjQW1lvJYPO+x1Kc8rQErSsAcDuoYfiEv1apDK09xPEXrE4q2/yWi6Pp8Pj41J
 AnXQ==
X-Gm-Message-State: AA+aEWYHn4Spf8VR3n6EaXwmZ9JAKfSNoLQhyPcRANnDwe3MCi+xXHkJ
 pkzy1jihnLmkPzi4Vgl/Pb08sPCgSc0=
X-Google-Smtp-Source: AFSGD/UvUr6eHOVVNoCXD5NDhhmI5/TiXeQvRUzimKhg477Ui9bk4LnzDwc0phQHaY75lnIGWdygww==
X-Received: by 2002:a63:31d0:: with SMTP id x199mr2798749pgx.10.1544205538165; 
 Fri, 07 Dec 2018 09:58:58 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id 69sm4707846pgg.86.2018.12.07.09.58.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 09:58:57 -0800 (PST)
Date: Fri, 07 Dec 2018 09:58:57 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 09:58:25 PST (-0800)
Subject: Re: [PATCH v2 2/2] clocksource: riscv_timer: Provide sched_clock
In-Reply-To: <20181204102952.21297-3-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-bc852f88-ce32-4f21-a9fa-d67d50f24f2d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_095908_837434_3283A547 
X-CRM114-Status: GOOD (  17.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 02:29:52 PST (-0800), anup@brainfault.org wrote:
> Currently, we don't have a sched_clock registered for RISC-V systems.
> This means Linux time keeping will use jiffies (running at HZ) as the
> default sched_clock.
>
> To avoid this, we explicity provide sched_clock using RISC-V rdtime
> instruction (similar to riscv_timer clocksource).
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  drivers/clocksource/Kconfig       | 2 +-
>  drivers/clocksource/riscv_timer.c | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 55c77e44bb2d..19649abd7c75 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -611,7 +611,7 @@ config ATCPIT100_TIMER
>
>  config RISCV_TIMER
>  	bool "Timer for the RISC-V platform"
> -	depends on RISCV
> +	depends on GENERIC_SCHED_CLOCK && RISCV
>  	default y
>  	select TIMER_PROBE
>  	select TIMER_OF
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> index 084e97dc10ed..431892200a08 100644
> --- a/drivers/clocksource/riscv_timer.c
> +++ b/drivers/clocksource/riscv_timer.c
> @@ -8,6 +8,7 @@
>  #include <linux/cpu.h>
>  #include <linux/delay.h>
>  #include <linux/irq.h>
> +#include <linux/sched_clock.h>
>  #include <asm/smp.h>
>  #include <asm/sbi.h>
>
> @@ -49,6 +50,11 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
>  	return get_cycles64();
>  }
>
> +static u64 riscv_sched_clock(void)
> +{
> +	return get_cycles64();
> +}
> +
>  static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
>  	.name		= "riscv_clocksource",
>  	.rating		= 300,
> @@ -97,6 +103,9 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>  	clocksource_register_hz(cs, riscv_timebase);
>
> +	sched_clock_register(riscv_sched_clock,
> +			BITS_PER_LONG, riscv_timebase);
> +
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
