Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061AEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUTv0Pi+o0zbSV9yhLEHadnJu0JEX9Pe2v9cXk39cZw=; b=rOHXeEJTdT+y1F
	Lk4+JHv+1Hfk93NlyD5F0Tc3CESC8ZHSYJAxOHYET7CVwGyZCDCgmmSqaozOXAOMM2XURBkpMRP1Q
	fz2rkktnEJqQi+4PjbSDLLf19qfE2dnNLlRi0XmbnkRorY59TWpCd1ORQarLvA8Ez2uRNTlvFwHbL
	JOX+AND6cvxCDoZdCtRVEBoELqrIcxqDKckwesWhPagrg6K3pL+gR8z4TN97Cl7e1emSWhexBAvqe
	qEGlmkK3fpgX3yPDUC8lKwKOyWFPALAEIwXbijq2bX+9daAAQDwo+XMsPzVi5KuScZxQWU+Rcjn3z
	NCGKXODN8JfoS2z+CePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttPh-00BjYG-VN; Wed, 25 May 2022 15:59:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttPb-00BjRm-Cz
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:59:05 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 409D13F5EE
	for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653494341;
	bh=ceTyIPuj0mdwf7qJM6JGPSBEklD8LtuaTMx0pA8AGQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=XfoJSqIZdov5QHGY/D4uU2Lwk8ZpZOGG3NWWi3JxYb2mlR8qMtQ8mrNEtRtVgHYD/
	 KPk+7DYI6tMKAnbWIBDQBq2I7vBX16isGsdA1AX8ry1IwNaVuivVEyyhpZNOb47iib
	 J0mPWe0apCmzGuEjWTMurNk/pDIMgPSlRRT+a5fef/UiLR0ZnXDtbPE6hMm4GIJLg4
	 YuCWVvn4vGTjjprBElh3ZKwAtKvKJ6ydkebwuMaakGYOqWGmCkUgQ7eDxlJUvX7tYh
	 VKOGzBTE6mnswQDBIar9NSnpdlcKTbJ/hiib4l9teRH2ptco56bjWiE96ZwSb8uJsM
	 /1Fcppbl0zVKg==
Received: by mail-ed1-f71.google.com with SMTP id f20-20020a50d554000000b0042abba35e60so15217137edj.15
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ceTyIPuj0mdwf7qJM6JGPSBEklD8LtuaTMx0pA8AGQY=;
        b=UIEfWR1zRqCiCIeffEu6GIV9U53xTrgwUC3pbqDA8ozPGWGqqI+3gTsLxk5aU/9W4I
         T4tYx7nYBB1QJ544UDqatXOoI8HHahBaFKEVIVQwKDLAwVj7+uDxSSqb1darcYzAQtKw
         YmdW3IX/sNy6FZdMc/iD2hot6q+zUVuFBRuVDhoIUJ3pQMlcYI5dhbfLJBjAmrp+jymG
         XVXvtF8DQhNWfQmjVMo9n/rbTb0bXSHScEeKQ/q8ryhvcArYBLvgHgsPXmjSfIRZrrGZ
         ErW+omBqt4OFR7bjRiopQxPc/GcAFlwk5xLGn1vJFnLHLj8ksWXmL2Nylo71z0PIBfPV
         eY9w==
X-Gm-Message-State: AOAM531mAZrIUQO7MA5fVquKCbYyAApd2T8arjGr+jLi7VaRGDcDv6Pg
	gFWfCOyj5tbFdzbuT2BrtjnJkk8y5DIJ2nBxkL5X5Gm7ci9sqXviG41DeiLK1NyIwbp4YBWKhQC
	vR54Pig2eYrxLwJN92xX6wpltXOXczLrg9neB0/IqpfdVpQ==
X-Received: by 2002:aa7:c615:0:b0:42b:cdcc:5844 with SMTP id h21-20020aa7c615000000b0042bcdcc5844mr2769937edq.312.1653494339816;
        Wed, 25 May 2022 08:58:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx94oaHZAUQqbKeS616bkQPP3+D2aG2FQiBBhy3mgd3CzCggc7oTgSKb95EHir2Xerc0gQJxg==
X-Received: by 2002:aa7:c615:0:b0:42b:cdcc:5844 with SMTP id h21-20020aa7c615000000b0042bcdcc5844mr2769909edq.312.1653494339621;
        Wed, 25 May 2022 08:58:59 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id my44-20020a1709065a6c00b006f3ef214de4sm7747900ejc.74.2022.05.25.08.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:58:59 -0700 (PDT)
Message-ID: <fff02688-e272-3462-d950-427ebe4ad862@canonical.com>
Date: Wed, 25 May 2022 17:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/5] riscv: smp: Support for 64bit hartid
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, Sunil V L <sunil.vl@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Ard Biesheuvel
 <ardb@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Marc Zyngier <maz@kernel.org>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-4-sunilvl@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220525151106.2176147-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_085903_794750_0A1B310C 
X-CRM114-Status: GOOD (  18.34  )
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

On 5/25/22 17:11, Sunil V L wrote:
> The hartid can be a 64bit value on RV64 platforms. This patch
> modifies the hartid parameter in riscv_hartid_to_cpuid() as
> unsigned long so that it can hold 64bit value on RV64 platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/include/asm/smp.h | 4 ++--
>   arch/riscv/kernel/smp.c      | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 23170c933d73..d3443be7eedc 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -42,7 +42,7 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
>   /* Hook for the generic smp_call_function_single() routine. */
>   void arch_send_call_function_single_ipi(int cpu);
>   
> -int riscv_hartid_to_cpuid(int hartid);
> +int riscv_hartid_to_cpuid(unsigned long hartid);
>   
>   /* Set custom IPI operations */
>   void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
> @@ -70,7 +70,7 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
>   {
>   }
>   
> -static inline int riscv_hartid_to_cpuid(int hartid)
> +static inline int riscv_hartid_to_cpuid(unsigned long hartid)
>   {
>   	if (hartid == boot_cpu_hartid)
>   		return 0;
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index b5d30ea92292..018e7dc45df6 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -47,7 +47,7 @@ static struct {
>   	unsigned long bits ____cacheline_aligned;
>   } ipi_data[NR_CPUS] __cacheline_aligned;
>   
> -int riscv_hartid_to_cpuid(int hartid)
> +int riscv_hartid_to_cpuid(unsigned long hartid)
>   {
>   	int i;
>   
> @@ -55,7 +55,7 @@ int riscv_hartid_to_cpuid(int hartid)
>   		if (cpuid_to_hartid_map(i) == hartid)
>   			return i;
>   
> -	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
> +	pr_err("Couldn't find cpu id for hartid [%lu]\n", hartid);
>   	return -ENOENT;
>   }
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
