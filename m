Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A9EC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 20:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 758B120892
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 20:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PVsZWern";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="g20DTmjx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 758B120892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=oCUXvzg8aV4/lgvVNR/bgE2kTugSqnPq+iRerx9T/L0=; b=PVsZWernQ7vT4bWBxnRS42B/G
	MQOX9+tPR2MbDNRSlcWg638ps6OjoPdn/epOzAJfdTA37RaugXnFwvFt5HL3j+PeStdOod9O4W5eC
	eEx6s1tyZUg8QdiJ38tc9IAfp4P3mrtxomzZVmEtZP5DaAo2gj33MQS92sdkecaiDAh9ToX21Zz7/
	fqkLXgnaZMKElDpNj9938E7Ouad+I9k8xueUAv8nU9q/ddsP6ng90qe7xeKyITrCzDSUe9hKFlQVo
	zIkKZUYLfBCdzJlawCdCp4YTC9R4uWPpv/wZRqkP8+X6zvwe9MXXZ0ncfS72jkq8l408dNiYYdfvV
	5QoGgkNDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV0K7-0000Mn-UR; Thu, 06 Dec 2018 20:32:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV0K4-0000M5-JT
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 20:32:38 +0000
Received: by mail-ot1-x344.google.com with SMTP id v23so1685922otk.9
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 12:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Xp7Sg5IArtbrr2C++6GeTh72xBYnG/glIJgBLPLQB2U=;
 b=g20DTmjxKvwQa0klW5nooKf/iDQoykr8UT7FPPlWSkZZ7PIEKkMmf35RdZ9Ofrv2YN
 YaA1D7FJMobk+DJH5A0q+zRqKCqvRAqWXk53P34/y8J9Ij3RgYxSrAPvo+4obtbhjT48
 ZgCoS505lAIMcgc9VOyH22FdKGR3SLAuoPeefi57iJtj/fKtdqLpU+ocWUlYqUyQymcy
 iWtUQaRE6vbvM7kMKbE3elwuPUpMEqiii0o2QD/KeLvh9PRcuCjhKi0Tkk3jimmluZsG
 oQ4IAvr+nccl895691Y/Et5V2T2/wKipnNNLgaxA37rDFmZEWnlW0ywODLXnXPshVeMz
 d5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Xp7Sg5IArtbrr2C++6GeTh72xBYnG/glIJgBLPLQB2U=;
 b=ClyHijBY8L66/+rccXttGps4YUBwFtxEKWerM5aIbX5Nr7RqzxFAT+XUsbfDRdi2yI
 y6Eg68cyGwxuGkU/Dz0REMlHrpaS8A73MEgCJRmTsxnwtB5+4EwoVWZybqtCOWfHyzUq
 yeIIrUQzt1mSVg1QOrXA4155ISMqzWa4K2piR1d1lGYxs07hLwVKATsFj4nXfe8vzpbW
 6Y5ZR895PVZy/MZGW0cP76SKG1ns++4UkiqgCP77zBX99MmInqN/X34qGVPwRI++fWYA
 mRhe9JG3vo+z7l2WRxlPTsXVxQXsAKEAU9SkoDqJpGjG7uRm2zCXt0OTSdgvBkpChiDz
 decA==
X-Gm-Message-State: AA+aEWZUHK2E4ulsXhhJJhXJWoJ/TFWLu6k9YwZF9VRUZuoe0+CYt9Y6
 avpxXsa9cuLXhINJRWu2gu6LPQ==
X-Google-Smtp-Source: AFSGD/VbDnvLGJRUNVQDKNqTV3X/I6vwtYMPkdBvQPRdxgWaIN3cfl5pmdVg/aAZx0mmUp8K1WmXfQ==
X-Received: by 2002:a9d:6a1a:: with SMTP id g26mr8753185otn.172.1544128344761; 
 Thu, 06 Dec 2018 12:32:24 -0800 (PST)
Received: from localhost ([208.115.86.72])
 by smtp.gmail.com with ESMTPSA id f127sm671577oia.19.2018.12.06.12.32.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 12:32:23 -0800 (PST)
Date: Thu, 06 Dec 2018 12:32:23 -0800 (PST)
X-Google-Original-Date: Thu, 06 Dec 2018 12:27:17 PST (-0800)
Subject: Re: [PATCH] clocksource: riscv_timer: Provide sched_clock
In-Reply-To: <20181203123524.11778-1-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-41a72f59-6506-420f-a01e-b01c81ab6e33@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_123236_688627_02C86E46 
X-CRM114-Status: GOOD (  15.01  )
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

On Mon, 03 Dec 2018 04:35:24 PST (-0800), anup@brainfault.org wrote:
> Currently, we don't have a sched_clock registered for RISC-V systems.
> This means Linux time keeping will use jiffies (running at HZ) as the
> default sched_clock.
>
> To avoid this, we explicity provide sched_clock using RISC-V rdtime
> instruction (similar to riscv_timer clocksource).
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  drivers/clocksource/riscv_timer.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
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

Shouldn't this just be 64, not BITS_PER_LONG?  We have 64-bit counters on 
RV32I.

> +
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
