Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B1C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 16:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF84E2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 16:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CL34n3Wh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ng+pLLfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF84E2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0bqP0Vta3BXWYl+o3USC6cnIeFV8bP3KUQmf61YoKnc=; b=CL34n3WhhDnzS1On7BRbeKOfV
	zl5mmQXZXmIXXiQ1e+oQpslSzTBcp15XnlFTCW1FM+8o37rC3Tkn2+J9lQwsCLEuPFR2pHmYPQph1
	mQZjvvMx5fX/JdenD+8TRpRVuPiQxht8JDHTbh1nno59JKsHJFiUrPTXWAEj7wLlumT0P4R12uOg2
	nqLWM4KqLb69lu50tpfy7CVApJ/6VWKBS0E+nBpjUzS4+HHuQ/mf61Ai6DQB23G51KOTPiAIXw94T
	CpOLmNOkjX/z91Il7sq/sA4KJBodujsAhD0Q1A2MdIF2vnW8Jdgu5ZCGkYCEiweGIjAJp/SQI51lZ
	jRtFy/10Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVJDB-0004bN-Uz; Fri, 07 Dec 2018 16:42:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVJD8-0004as-4x
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 16:42:43 +0000
Received: by mail-pf1-x444.google.com with SMTP id z9so2204644pfi.2
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 08:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=X5gv29cw/jua0qOKLhYdOHAw86A0bWuonl9yHT8iJZk=;
 b=Ng+pLLflO6Jka5NOPi/y3P+cHuAcXeKQatJZkCgE823OlDEUy/RQ9gawBRAPDk/ec4
 Cq+M13fOicQkNa0fljAph5T7p7Y6d2sby0rFi39MUcbusbBlv8uwF5X/Xw/+gR0rXvlz
 XuqO+38avgA6v3J52u4TX0DvixQqHY0Dlc7OEdb4uW8xB/ISU/+irO2FiK51ZPrDUAcY
 ddM/nbObTfvwxVq830pdNXZMiqqkFiB7VD6vrC4wpowoAuvFX2LsS0E+j//J87+VdW/B
 AdiZKvUU+bSKX8Dsmkaip12Evh5jziLGOUj7XOwqIYkYr4J/UrgM+Xu9CjzWAK9PFNVX
 ADfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=X5gv29cw/jua0qOKLhYdOHAw86A0bWuonl9yHT8iJZk=;
 b=NALEgPrsJFT3FplldwBCyimLBrBN7QsHZwAjeJ90I+514ozsmqei5uG+dEwaPkoXfQ
 tLTWKwm9vGa+BxvojfyKbRXivXq0RrD/n7hOA5P4zo6lC3TAaWfKePsatnp5e1+sD2TS
 Vdqm/gOLm4JqZ/7e3vxt0Tc2ZDhQfqDr+IyIyzz+9LoQmSd3ANei1p67pl+qUmWSRQJX
 EyMynvOUcXmKZDDaW9yExfySduyczzJQ5LJ8V/kWqevbrUBcPiviBq47Y0RgdGWpp8Q9
 lpNwg7YjJx62b1wS+wkoy0bpFji6IKgay+l8TYZ4xmWeO+Ulii9vpN7IqAUdQ9jHYRGo
 LkJA==
X-Gm-Message-State: AA+aEWZfFqqf7MiX+9p4unIUZG8xD2Ie8bXXwfNn9TVFuwH2Y+2EFKqP
 yXdQ38e/SZZ5cph6xkFk810Vdg==
X-Google-Smtp-Source: AFSGD/W4LRXLJ1eTVRgzgmhs+O8evoxzKUGEUzmcaPnhaGqkthgmhsP1bY80x0+Kt0LR9uk3wtankg==
X-Received: by 2002:a63:f444:: with SMTP id p4mr2569422pgk.124.1544200951086; 
 Fri, 07 Dec 2018 08:42:31 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id r83sm6995312pfc.115.2018.12.07.08.42.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 08:42:30 -0800 (PST)
Date: Fri, 07 Dec 2018 08:42:30 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 08:42:19 PST (-0800)
Subject: Re: [PATCH 2/4] RISC-V: Support per-hart timebase-frequency
In-Reply-To: <1543870651-16669-3-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-531f9ae3-9ab2-48cb-9f1f-4e6814498753@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_084242_257599_947FF46A 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 aou@eecs.berkeley.edu, dmitriy@oss-tech.org, anup@brainfault.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 robh+dt@kernel.org, linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 03 Dec 2018 12:57:29 PST (-0800), atish.patra@wdc.com wrote:
> Follow the updated DT specs and read the timebase-frequency
> from the boot cpu. Keep the old DT reading as well for backward
> compatibility. This patch is rework of old patch from Palmer.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/time.c          |  9 +--------
>  drivers/clocksource/riscv_timer.c | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 1911c8f6..225fe743 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -20,14 +20,7 @@ unsigned long riscv_timebase;
>
>  void __init time_init(void)
>  {
> -	struct device_node *cpu;
> -	u32 prop;
> -
> -	cpu = of_find_node_by_path("/cpus");
> -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> -	riscv_timebase = prop;
> +	timer_probe();
>
>  	lpj_fine = riscv_timebase / HZ;
> -	timer_probe();
>  }
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> index 084e97dc..96af7058 100644
> --- a/drivers/clocksource/riscv_timer.c
> +++ b/drivers/clocksource/riscv_timer.c
> @@ -83,6 +83,26 @@ void riscv_timer_interrupt(void)
>  	evdev->event_handler(evdev);
>  }
>
> +static long __init riscv_timebase_frequency(struct device_node *node)
> +{
> +	u32 timebase;
> +
> +	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
> +		return timebase;
> +
> +	/*
> +	 * As per the DT specification, timebase-frequency should be present
> +	 * under individual cpu node. Unfortunately, there are already available
> +	 * HiFive Unleashed devices where the timebase-frequency entry is under
> +	 * CPUs. check under parent "cpus" node to cover those devices.
> +	 */
> +	if (!of_property_read_u32(node->parent, "timebase-frequency",
> +				  &timebase))
> +		return timebase;
> +
> +	panic("RISC-V system with no 'timebase-frequency' in DTS\n");
> +}
> +
>  static int __init riscv_timer_init_dt(struct device_node *n)
>  {
>  	int cpuid, hartid, error;
> @@ -94,6 +114,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  	if (cpuid != smp_processor_id())
>  		return 0;
>
> +	/* This should be called only for boot cpu */
> +	riscv_timebase = riscv_timebase_frequency(n);
>  	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>  	clocksource_register_hz(cs, riscv_timebase);

We need to check to make sure the timebase-frequency of each hart is the same.  
This is mandated by the RISC-V ISA specification but should be checked in the 
code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
