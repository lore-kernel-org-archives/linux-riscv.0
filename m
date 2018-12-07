Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B66CC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10A92082D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjhyT88m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BYwU1Xbd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10A92082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JuangKXfIC6Oi6AqfZlsXxt+GxHv8PecxnOCRbs9qNM=; b=UjhyT88m81jAVSKqkppn76+5e
	FmNYLjshdcOZivkzqW/OBTsRP+DP6Y1RwQme+zltyWCk/pOHKnjW15eu/nmXD5Y2z1novqjzgRmdR
	Vlh9dbt9I/iIu2jsQCG6feCSF0gZMsbGxCi97CSdiCZQZX8hEejGoVxoDf68uQEjAt6xSwnGlQTsN
	bQWdJtk1/ueVWunmGfuKvGXMgCl3dwha0NTgh8SFfksM/gxlvySsQc5aJmsEhFlxJiMyfcD/HrgCy
	sVJwIJqrZMr0969+xNqDolX6Er5Xcr0ZBnksgAehdy6lYtc528wiQXfVtLXNBgeoWvu3YkqyYkORV
	IOOszt+UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVJUJ-00053S-1L; Fri, 07 Dec 2018 17:00:27 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVJUB-0004em-KC
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 17:00:25 +0000
Received: by mail-pl1-x644.google.com with SMTP id k8so2079708pls.11
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 09:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EFeBTriw3WtWApru9lpzGXgxuzTUuNPf+UmnstYWyfo=;
 b=BYwU1Xbdvx6Q+0Bwj5O0fkF1gdaXKBYs1Gdgxpg/1EFnVof2s9zFEIWDRIIVeDIdoD
 AauX9wMFSaErn7ezTncsU5a1AEfBeMlPL50W7UaNh8pzg6tvLuhh6V6Vxhyv9+INOmWH
 vWRylC3oSDFZD4ifHmnmrMNZ7gQ9BcOeLPvrgzUgLJ/Rid4w1IKl4BbeTreJGKR2eAvp
 Hy7H/AW1NrfMPqArAfEIO3MBtiTxlkmjXExDNKt6baOqsSi4hChcUxPsNoWeGWUvuDUy
 pioPhFAhWqCO9nc0MBotg7KnAyarrLjSjMjumwa2VyX/gKOaPasPAmIlj8Nxvd0g+j0O
 2qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EFeBTriw3WtWApru9lpzGXgxuzTUuNPf+UmnstYWyfo=;
 b=gUUT9XQWpKf/rJ9JWGwpe7am4DIQpiZVh3G6gTi1OZxC2nB2wWxHDzRhWLo9F5AGaN
 vA7EK6RY0CoVEjpTjNTB725UeWIwB2eqTgmqC35baRU/AilY1jzTJOJoJONV/6E+6Mtp
 GUHv/FfJi6k5RgZ0LY9mO5mXGbmzzjjZ141AG8O9LwvKBYnCAONBqljFm4teYDHyKemz
 beYNWrnEYS+yQleBcPd7VVyBP5DkUSDvioOU+LMFelwCi9ZDtv6cA7JfImjU0EBkEh1f
 5pzQwHJT0AUqD2gWhbskpqOdLgr3z7ja4DZx30W1K+1Fum0enEyunFm1QsTzCmZyq1ns
 q1yA==
X-Gm-Message-State: AA+aEWYZctkvxVhCylZ+qGjAJ3roW8YD8IPef52hDv27kF1fwf87Mmdk
 cThoKXz3/YVmJ1bb2uvEqOz6FQ==
X-Google-Smtp-Source: AFSGD/VN6fxcWaaug+LymN0uEElGhbOPQYiZ01ZDtWT+BJ2pEbIfTyUrhdQrzPUza3sSpPKzqbHljw==
X-Received: by 2002:a17:902:714c:: with SMTP id
 u12mr2818163plm.234.1544202008731; 
 Fri, 07 Dec 2018 09:00:08 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id 125sm8733897pfd.124.2018.12.07.09.00.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 09:00:07 -0800 (PST)
Date: Fri, 07 Dec 2018 09:00:07 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 08:46:10 PST (-0800)
Subject: Re: [PATCH 3/4] RISC-V: Remove per cpu clocksource
In-Reply-To: <1543870651-16669-4-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-a0437cab-9a27-45a5-aabe-0dee2c1d96db@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_090019_667885_1D5FB0BC 
X-CRM114-Status: GOOD (  14.85  )
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

On Mon, 03 Dec 2018 12:57:30 PST (-0800), atish.patra@wdc.com wrote:
> There is only one clocksource in RISC-V. The boot cpu initializes
> that clocksource. No need to keep a percpu data structure.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/clocksource/riscv_timer.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> index 96af7058..39de6e49 100644
> --- a/drivers/clocksource/riscv_timer.c
> +++ b/drivers/clocksource/riscv_timer.c
> @@ -49,7 +49,7 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
>  	return get_cycles64();
>  }
>
> -static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
> +static struct clocksource riscv_clocksource = {
>  	.name		= "riscv_clocksource",
>  	.rating		= 300,
>  	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
> @@ -106,7 +106,6 @@ static long __init riscv_timebase_frequency(struct device_node *node)
>  static int __init riscv_timer_init_dt(struct device_node *n)
>  {
>  	int cpuid, hartid, error;
> -	struct clocksource *cs;
>
>  	hartid = riscv_of_processor_hartid(n);
>  	cpuid = riscv_hartid_to_cpuid(hartid);
> @@ -116,8 +115,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>
>  	/* This should be called only for boot cpu */
>  	riscv_timebase = riscv_timebase_frequency(n);
> -	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
> -	clocksource_register_hz(cs, riscv_timebase);
> +	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
