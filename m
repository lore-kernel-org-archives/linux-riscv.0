Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC52C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l10Y5UjmA4gULa1v3S2I9gRY8ppXBc9WstrWqZyyF+g=; b=a68+I31soro1cr
	o1RJXMMrCBImXIKeVzPpMdzc4SFGGa0DVdBO5iDciWgxJvZzKQvy/3euuft2bAicVYGGI6KrZ6Cms
	R5F8kCskp3yMRMQ3fvK7KaywEEYWYXhyVRoHOY0tiR+18COw7J2n6GKfRILNjPbG2f1SUYeNnHVK2
	hbfkybsfSH34fA6j0itL6G9rCnUU6eihgeb0sUSJRmUE1XmH9nSCHd1m8yzuzRShozNFe1+JnLHvp
	ZtImLxd9Lexb2HzfCdSjTQJM6yTQPIbymonWjYppzmuojfnB6aXfwSmOuRD9raKgWlzVWLs1hrJh2
	CzF8sup1z1XL5lP4kpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjf9-0000000BYKI-43cZ;
	Thu, 13 Mar 2025 14:35:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiTH-0000000BMs2-35Ue
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:19:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2ed007aacso195501766b.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741871974; x=1742476774; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLwI9+XgDvx6y1QmCRm2s349AXzMPGhMLML8/FN0xLk=;
        b=Q+CF92D7OdQX3/6lSyjcafKY9Huv11qRV5u966vihoZKTT0o1nypPcVN/PzCbRT6H+
         odOo9yHZkmoYBzUfqkBc/j1Gj4BmaBuwW/j0hvCdWzI5XXPJ0dE8V5gFzAc4CHuNQhCI
         03GhPVSsyGWDNOLKwS04Oq7KTKNVOGZTAst/s7SN2Px9FZ9E4YJUFHxYRYQqkicEcAzW
         WFODR2YWYiSIBJAqegW84v0qTJdMDGmPfphynEuhzf/oc3AhBxyhUdRBgNtrY3DdrHMi
         +A1FG+ENvLayxIlDIfj67UPnsMI++ZurwjehdJx3bxVpiuPuFEhcjStk8VJrWXXXm10N
         yGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871974; x=1742476774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLwI9+XgDvx6y1QmCRm2s349AXzMPGhMLML8/FN0xLk=;
        b=YgdCPlLQlIkQN+enFObAqmKIg1uws98YH2BIirqbj/y3GzuWvXC91k2G5Ic9jT9DYY
         XoULeXSz2aAKY91YoViYvR8KaQoRK/Uud1Ii0YUrX5xEABK3e6J9sr7jx1gQpwsW+p6t
         RKVDRKPslFvCiyYv5qYOy+GM6qZzH95chM7ht60hBUe2iajj06RydTwnfOpMJUQCHvH/
         u3N9CfkMqvQ/A0Cp8YaEN2vwJsYqHuzWKsW2Ox8Uhe8AlNOrWiHcutORdlKBxBZG22Zb
         oUNvG65EEfCVpd2PdctVcigipQEaT3i5JiJnh6U5c7vf16OxYJ2InBc5E2wBZ8RyJf9l
         5iwA==
X-Forwarded-Encrypted: i=1; AJvYcCXZltjhie4PiqbEimS5hK5naTVnNeADdMO1CtJBw0XH/qBeFGK0RaxvSUsjxEQxKNtXS/t3PRIAr/ufNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUXVeFwPknmQJdL+/2ttsuq8nHOCBNgZWwIaNmmzfjxwpNAm+e
	es8UBYTJMlb9IANpx4yjq0JA3MaPyA6LWpI6iYeaOf0VHqSfPQdb6SaNfmYQN5g=
X-Gm-Gg: ASbGncs/0YuucXI7YhfXrrp5wLE68kKsYkyIjxT5wjbh3B71c+KNkXsdVnWjPLwckwy
	B9sIHGMZkigElTDMRAA8IABXnHVQ4ZKkmoV/P62C2p/sse7txeRHYrhAYOlHL7Dt0UKp+BQ77OR
	QTwG//BRkBtcoX2mnm8hq1KsVNAlSiMHI4rIP4CMLe6Cyi/5sDjELerb0kJ3P++MO65N2eyvxn1
	fJRE8COUuT6oZviNG+tgPCLP0RwvtkxohtbAcVNF2LVLIkKACF/PRTr3K6Og9xFK5HWthMxDQ8m
	pRBbrjJ6jWBU/M2aEIQI1v96akog0mhV
X-Google-Smtp-Source: AGHT+IF3RjvN3caMGccSNmH1eaKCAyeC0UKLdIujqC0Ubvi5/eGttJVhWRGqhwIRTen+UtV+e2lwpQ==
X-Received: by 2002:a17:907:7da8:b0:ac1:dd6f:f26c with SMTP id a640c23a62f3a-ac2b9ede2f5mr1499361666b.46.1741871973986;
        Thu, 13 Mar 2025 06:19:33 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ead1dsm81138266b.58.2025.03.13.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:19:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:19:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 08/17] riscv: misaligned: add a function to check
 misalign trap delegability
Message-ID: <20250313-4bea400c5770a5a5d3d70b38@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061935_822117_373E4687 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 10, 2025 at 04:12:15PM +0100, Cl=E9ment L=E9ger wrote:
> Checking for the delegability of the misaligned access trap is needed
> for the KVM FWFT extension implementation. Add a function to get the
> delegability of the misaligned trap exception.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h  |  5 +++++
>  arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index ad7d26788e6a..8b97cba99fc3 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -69,12 +69,17 @@ int cpu_online_unaligned_access_init(unsigned int cpu=
);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
> +bool misaligned_traps_can_delegate(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
>  	return false;
>  }
> +static inline bool misaligned_traps_can_delegate(void)
> +{
> +	return false;
> +}
>  #endif
>  =

>  bool check_vector_unaligned_access_emulated_all_cpus(void);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index db31966a834e..a67a6e709a06 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -716,10 +716,10 @@ static int cpu_online_check_unaligned_access_emulat=
ed(unsigned int cpu)
>  }
>  #endif
>  =

> -#ifdef CONFIG_RISCV_SBI
> -
>  static bool misaligned_traps_delegated;
>  =

> +#ifdef CONFIG_RISCV_SBI
> +
>  static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
>  {
>  	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
> @@ -761,6 +761,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned in=
t cpu __always_unused)
>  {
>  	return 0;
>  }
> +
>  #endif
>  =

>  int cpu_online_unaligned_access_init(unsigned int cpu)
> @@ -773,3 +774,15 @@ int cpu_online_unaligned_access_init(unsigned int cp=
u)
>  =

>  	return cpu_online_check_unaligned_access_emulated(cpu);
>  }
> +
> +bool misaligned_traps_can_delegate(void)
> +{
> +	/*
> +	 * Either we successfully requested misaligned traps delegation for all
> +	 * CPUS or the SBI does not implemented FWFT extension but delegated the
> +	 * exception by default.
> +	 */
> +	return misaligned_traps_delegated ||
> +	       all_cpus_unaligned_scalar_access_emulated();
> +}
> +EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
> \ No newline at end of file

Check your editor settings.

> -- =

> 2.47.2

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
