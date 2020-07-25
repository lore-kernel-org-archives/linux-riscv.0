Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE481C43445
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0D0206F6
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsjSMQpV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ktmEEWGp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0D0206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=AV7H4CU8KKlSWMN6C1Pa6Ah6twDNJGmbUG+vPVDdKh4=; b=dsjSMQpVmxCINJtz7W3byFS6J
	VMPm18Cg9pLz1RCmiN9UGMG+Yp3KqmL2dDWLubtvk1whaefbdsFuZUdhKRljKSBAozgQZ62KWfAvk
	vUZPM+xBU4ewXiadR4a5ksEtt9wnoO5g/cI+/uyX/8oBj1qrlk26DoUm8RUuXVp/eoNvbRw7xma9A
	UNMut4/PUQxR3yr0IJBRwco3JSwtla8FMMVT8DVNQqnOBQnDsOb+5O/3DQI9IzTAjPDLjasE3CGUQ
	UdEjpO5jwqZ5xZabeCCLaAJJU3dpIrrnbZf4/nlo3ruhhzYrKQVRkoH3cN8inkG48/nJWJMF7+9qq
	V6LInupWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCUI-0005Dk-JO; Sat, 25 Jul 2020 05:12:46 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCUF-0005C5-DX
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:12:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id t11so6354441pfq.11
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PcyXn/F49Fqhz4TOynaWt+U5OFlKuzg22AoeOH0QnA0=;
 b=ktmEEWGpMHiP+vgSZ4fYLmAS+aXx6GO1YWFpZX15mUTDxKR3uOTnlQKCjHxyM3wOfM
 Hx+FneH6aBrYNZjL5ZNRYudAWvoyKMzRKK4CZG2UESygEPoEEVHdVeKyet0fOI2povme
 WYZDkntiKH+LoMKj37839Qj08Eyy2si3v9E6G6VhEQOUpriwsUEKxz/9IpSIRPQUEo8X
 s0G0YrBpRxjb7y0HRa5hO/cEku7U3ssAYSzqoqb7sISfkIGBjl8Eja/zugaQI0f/S/SI
 rX5jqD65eKosX/9hJY1Miep0uQ4yTsdMox7T4XAzeooWv8/3YJUM1ru9/haBBdSiSl1I
 h+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PcyXn/F49Fqhz4TOynaWt+U5OFlKuzg22AoeOH0QnA0=;
 b=B6QlK9eaRlssIwf161DwfeNQaxwCFX4x1k8xQmEMBzLxBYFXv0h766KyjTQDUFX+Ud
 o2WfCqHsrXHIPYmPUhyZPcFrGeZ6aX+5EtgxkVpEHo5+ZQQrOx9JXKJlph2nWKZEty9Z
 TAq2afElm7szWakkS4KdBTyjrEYAzhzup7sPuq866rA/auQuRxnvH6CUWyqVJeynkiFU
 x2UVOBlV80kTe6CvHfaKQLfKYwnVp76Aors4aAl9/oP06efuFOvWBkuOC0jXMx9/Ay/c
 BIgk8/+1NYL+g5Ph0hxEMzXyHHlGP4NtHlwwsPa04PIGlfzEeWT4CFjxRbWw39+d0AzN
 cHAQ==
X-Gm-Message-State: AOAM530uxwbM+Q8oCUxmpt32kaQElYcsOgUziCEPjTav8hWVmXMzmyGx
 vWm1ed6vIzZFm9LTCMo0FnfyOw==
X-Google-Smtp-Source: ABdhPJxkaiVy/YeIQXdACLL0DGaA+9WA17ylQocN96rHcnrOuZmk8/7frgv7Swmg5udIZJ/k/gRq0A==
X-Received: by 2002:a62:3684:: with SMTP id d126mr509500pfa.234.1595653959099; 
 Fri, 24 Jul 2020 22:12:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b22sm7107670pju.26.2020.07.24.22.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 22:12:38 -0700 (PDT)
Date: Fri, 24 Jul 2020 22:12:38 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Jul 2020 18:49:48 PDT (-0700)
Subject: Re: [PATCH 1/4] RISC-V: Setup exception vector early
In-Reply-To: <20200715233009.27183-2-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-8ce8d920-4b65-432c-8b51-8d81f55936c0@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_011243_475639_3EA06AE4 
X-CRM114-Status: GOOD (  22.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, vincent.chen@sifive.com,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com, Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 16:30:06 PDT (-0700), Atish Patra wrote:
> The trap vector is set only in trap_init which may be too late in some
> cases. Early ioremap/efi spits many warning messages which may be useful.
>
> Setup the trap vector early so that any warning/bug can be handled before
> generic code invokes trap_init.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/head.S    | 10 ++++++++--
>  arch/riscv/kernel/smpboot.c |  1 -
>  arch/riscv/kernel/traps.c   |  8 +-------
>  3 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 7ed1b22950fd..d0c5c316e9bb 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -77,10 +77,16 @@ relocate:
>  	csrw CSR_SATP, a0
>  .align 2
>  1:
> -	/* Set trap vector to spin forever to help debug */
> -	la a0, .Lsecondary_park
> +	/* Set trap vector to exception handler */
> +	la a0, handle_exception
>  	csrw CSR_TVEC, a0
>
> +	/*
> +	 * Set sup0 scratch register to 0, indicating to exception vector that
> +	 * we are presently executing in kernel.
> +	 */
> +	csrw CSR_SCRATCH, zero
> +
>  	/* Reload the global pointer */
>  .option push
>  .option norelax
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 4e9922790f6e..5a9c127a380e 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -154,7 +154,6 @@ asmlinkage __visible void smp_callin(void)
>  	mmgrab(mm);
>  	current->active_mm = mm;
>
> -	trap_init();
>  	notify_cpu_starting(smp_processor_id());
>  	update_siblings_masks(smp_processor_id());
>  	set_cpu_online(smp_processor_id(), 1);
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 7d95cce5e47c..ad14f4466d92 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -174,13 +174,7 @@ int is_valid_bugaddr(unsigned long pc)
>  }
>  #endif /* CONFIG_GENERIC_BUG */
>
> +/* stvec & scratch is already set from head.S */
>  void trap_init(void)
>  {
> -	/*
> -	 * Set sup0 scratch register to 0, indicating to exception vector
> -	 * that we are presently executing in the kernel
> -	 */
> -	csr_write(CSR_SCRATCH, 0);
> -	/* Set the exception vector address */
> -	csr_write(CSR_TVEC, &handle_exception);
>  }

While I think these are all actual fixes, it's pretty late in the cycle here so
I'm going to a bit on the careful side and only take the patches that actually
manifest as bugs in the current port.  Assuming this doesn't manifest until
early_ioremap is enabled (and we don't do that yet), I've put it on for-next.

LMK if I'm wrong about this, or the following ones.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
