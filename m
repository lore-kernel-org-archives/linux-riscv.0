Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DE5C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B382054F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1oUolE3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WKa0Rrlm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B382054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=aLsl5HXfgu5B+rdoniuNpb1UjTCPpyH3fLTQYN7+JzE=; b=k1oUolE3Ove5xWt5YuXnLK8v+
	66qu5Css3J4EIjqbfePkURWqnMLMImA3S5K7QUuVKXtmiQCojGOWMgmRkOwoehFqj0cLSoObsW2JD
	f0EjP9hA7kz+peliLzdesSLcAak4NiCRRjA6IFakcNunSVaBTz40QSFO/+uZ7O5Txh0orWRfrEfLZ
	boTSx1b25yFXjS1sblOQA4c+XzXFGYs2eA3DLQv0hndsSf5QojuGLU9Viru3kncmve0HbcrmiSaZj
	dp9VjebRjlvi56mQTVlubgD8vy/5Nq/tXYfB4jfAzPGnaPzF7MiNUk/EVcx8VNZ48ufKBN6MzN8ns
	LEXeHaM7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVJUG-000527-EV; Fri, 07 Dec 2018 17:00:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVJUD-000504-UQ
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 17:00:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id 17so1986063pgg.1
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oANJ8NTgVfhgBlhgezfxcRi6A0Prx2iNsZ6jeemAImA=;
 b=WKa0RrlmuDD7lG3nKa9hyk5NK0fRzXszOl00nnVvnmiDHB3/wgXlc3utLohtSutJvq
 Njq3QmkB2B0HW8e6kumWBeby22hg6xlfkTcc5nLyY7hZJkLYb7bGnyjOj4RXGvjn/YtB
 3OjPz1JujpZVuFuZJxpUM1a4f1cLhhWkfJwz0keZ3yNY1H+dwkeKghTz3efFL0lSWOK4
 2MBoi6Wp3HkWGTuvPYqUK56aXJELiVfOSuLXhkCmc99fIQbatyugLWrgCK3J3XhZBmgP
 RIFvefo0HfvEA4kS5GMTaU2Dg+utxiFp6UZQtDWQNA5baaUhTiUrwWRJvyuHkURIk5Qd
 hk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oANJ8NTgVfhgBlhgezfxcRi6A0Prx2iNsZ6jeemAImA=;
 b=jIvyDahOKrliXxKvVb8DYR2TzYSVcgHlOaL55JiJzFsiX13BdmuTK2zC9dN+SpF+S4
 /Q4jaCG/+TrFPjhArEYgXOVK/7DlaG8CkQlPL51QR3yVZSXwcjWrbuRpoiEQzPq9+0+T
 SRNelkiOCCJ9Oslm367+/m2MF8+bbR2b7SZDSf1FixQts6LKQWtIum4gBMFghzXF2t1Y
 rMZv8sIHo6uk0JR8RHK8ueAvpPWRpJpQJfXxNHD9tT6y3DeEKgNPZeGUkfM2WNcLlUvS
 Z8HsghqMW83VpvaKhk+gFW23OkFSSj2y0xipx1IcP2AHjOoGZwJrKNQsKC6X25cyR1jK
 JJUQ==
X-Gm-Message-State: AA+aEWbZfEhr5/d8DLjRohvwgihzCfydHGfKhAOxrhq6omV/6ce6+K9P
 ePIWaFRKxMawXW/1bd25r0R/qw==
X-Google-Smtp-Source: AFSGD/WzvQKc79ImRu1XX5C2cwE2umJQ+JvexswvZTpBQxY3W0YrbtEtF3dLar4MRku0gF6dcpeuaw==
X-Received: by 2002:a65:64c8:: with SMTP id t8mr2603360pgv.31.1544202011254;
 Fri, 07 Dec 2018 09:00:11 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id l3sm9396202pga.92.2018.12.07.09.00.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 09:00:10 -0800 (PST)
Date: Fri, 07 Dec 2018 09:00:10 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 08:59:36 PST (-0800)
Subject: Re: [PATCH 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
In-Reply-To: <1543870651-16669-5-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-4a071ea7-ddf5-4204-8343-790f9bbb3a09@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_090021_978032_02ACAC67 
X-CRM114-Status: GOOD (  17.19  )
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

On Mon, 03 Dec 2018 12:57:31 PST (-0800), atish.patra@wdc.com wrote:
> Currently, clocksource registration happens for an invalid cpu
> for non-smp kernels. This lead to kernel panic as cpu hotplug
> registration will fail for those cpus.
>
> Do not proceed if hartid is invalid. Take this opprtunity to
> print appropriate error strings for different failure cases.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/clocksource/riscv_timer.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> index 39de6e49..4af4af47 100644
> --- a/drivers/clocksource/riscv_timer.c
> +++ b/drivers/clocksource/riscv_timer.c
> @@ -108,6 +108,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  	int cpuid, hartid, error;
>
>  	hartid = riscv_of_processor_hartid(n);
> +	if (hartid < 0)
> +		return hartid;

This seems like it's just hiding a bug somewhere else.  We should at least put 
out a WARN here, as I'm not sure the error will propagate anywhere useful.

>  	cpuid = riscv_hartid_to_cpuid(hartid);
>
>  	if (cpuid != smp_processor_id())
> @@ -115,14 +117,19 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>
>  	/* This should be called only for boot cpu */
>  	riscv_timebase = riscv_timebase_frequency(n);
> -	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
> +	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>
> +	if (error) {
> +		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> +		       error, cpuid);
> +		return error;
> +	}
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>  	if (error)
> -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> -		       error, cpuid);
> +		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
> +		       error);
>  	return error;
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
