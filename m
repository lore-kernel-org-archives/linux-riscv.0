Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EAFC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcX0vN3vpMRYBcum6+zt8/stQTf3GMuS70cpnaxHN/o=; b=4ptEl+Kb9mRBa5
	7ZJbsK+g7VJO7FDZ6Id5FmKHVKpciBOdJIuA/hSSYpeO5/pSbAuVR7Z+7SoQ3vGBMvmgvlnxNndTj
	WNOf2r3FL4lCKg4PzdmBCz3VMAPMS+xxUB3Ns6QPLsdgugCub+SsnZgOAy48h7WWY8j9TnaRxxNM4
	aYg3H1fS0tugmpXKP0tNgWGkOj4WB8NvnLR8oSYqixMQHuor+mgCwb/w1OZVjYdQ0+rCLKmQ+y7Ie
	frsS3XIIwHiKF8BdfkAk+WXWItYissKcXEft2lz/NRrqk6KZ0j4qx3eaX1V/nDK636mUPCjUEicee
	tZHMMxLwzniIDaML8zVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Kpy-00CvBw-11;
	Mon, 13 Nov 2023 00:29:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Kpu-00CvBC-1r
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699835393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8MbV+ldUGJXtFXnad6b8yZArDRg/WTGKo84KPGxrMw=;
	b=OnUnWxgNzvhAbmReTtDLNiqz5O263sgsHcUy+Zt4sBkbr3DlR5TUsP/dt1SBhIb6sBdS4P
	qDcSKrGqfrJPiH9mcwhfBtqFo4IDLv0qp1JJQEObBltLbVxxv0JwyJxU69BQdc5MFnug2H
	HQ8/hiWGPwE5evo0/4MveNKe8W5TJmk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-rqpkZV_KOruA5tOn7G6uEQ-1; Sun, 12 Nov 2023 19:29:52 -0500
X-MC-Unique: rqpkZV_KOruA5tOn7G6uEQ-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5b9a1494e65so3618705a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699835391; x=1700440191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8MbV+ldUGJXtFXnad6b8yZArDRg/WTGKo84KPGxrMw=;
        b=gHY3DZhAvp6XRzF6IC0LGIlk4NYF9NyMiG8wDEOJot8s5fyZxX9Gnbw7njW0u2T9zW
         QFKI4zbiSQ79fKhl6sYK+8nCSd/8nkC5Q5gEqFe2SfyWMIvnT2SHvyB7nUej17HvRRgh
         qujeumj0ha1hxyz1uXNyAt/28PncdzJ1Nzh+2Bw9Ep4JLbhvQUcapQ349KbfFHeBHpC8
         fl7HQdKomPRY8oCjtLWkPos/iSDrPbgVtjxILjOtuC93fKhkoNfAcoxkxuj9q4PqB5Ph
         IUQQrE4Q3vxyZpvBOvqK7R5Iy93y1uDkZbJkRMWhunhOxHV08RHRjDzyGrSgabInBuM/
         yb5A==
X-Gm-Message-State: AOJu0YyWsBRWuY2EMCKbNz+MKgFPzGWVjhQv0Z9ffA8JfEefk/3DEQED
	bdXqJg57Y3onW5Elged612NwPMwtzErJgNfMJlBx5HpVd7htxZLXFIUUzKSY88Qm4CW4lLxOJlS
	4pfwP/jfx6OdhWl4/dtoJoMiN4DPE
X-Received: by 2002:a05:6a20:430b:b0:186:bb41:180 with SMTP id h11-20020a056a20430b00b00186bb410180mr63919pzk.33.1699835390950;
        Sun, 12 Nov 2023 16:29:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfd4yfzq0YXl5QdnKYzie2VCc6U5S9RTqxoEsGgDflqzH9st3ur7RFmEwEZUtvxIYzQtb9pw==
X-Received: by 2002:a05:6a20:430b:b0:186:bb41:180 with SMTP id h11-20020a056a20430b00b00186bb410180mr63892pzk.33.1699835390683;
        Sun, 12 Nov 2023 16:29:50 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001c62d63b817sm3035620plf.179.2023.11.12.16.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:29:50 -0800 (PST)
Message-ID: <8e288692-7460-4aa4-86f3-500327256bc3@redhat.com>
Date: Mon, 13 Nov 2023 10:29:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/22] ACPI: Move ACPI_HOTPLUG_CPU to be disabled on
 arm64 and riscv
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JL6-00CTws-3z@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JL6-00CTws-3z@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_162954_730484_87D4A2CE 
X-CRM114-Status: GOOD (  25.62  )
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

On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Neither arm64 nor riscv support physical hotadd of CPUs that were not
> present at boot. For arm64 much of the platform description is in static
> tables which do not have update methods. arm64 does support HOTPLUG_CPU,
> which is backed by a firmware interface to turn CPUs on and off.
> 
> acpi_processor_hotadd_init() and acpi_processor_remove() are for adding
> and removing CPUs that were not present at boot. arm64 systems that do this
> are not supported as there is currently insufficient information in the
> platform description. (e.g. did the GICR get removed too?)
> 
> arm64 currently relies on the MADT enabled flag check in map_gicc_mpidr()
> to prevent CPUs that were not described as present at boot from being
> added to the system. Similarly, riscv relies on the same check in
> map_rintc_hartid(). Both architectures also rely on the weak 'always fails'
> definitions of acpi_map_cpu() and arch_register_cpu().
> 
> Subsequent changes will redefine ACPI_HOTPLUG_CPU as making possible
> CPUs present. Neither arm64 nor riscv support this.
> 
> Disable ACPI_HOTPLUG_CPU for arm64 and riscv by removing 'default y' and
> selecting it on the other three ACPI architectures. This allows the weak
> definitions of some symbols to be removed.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC:
>   * Expanded conditions to avoid ACPI_HOTPLUG_CPU being enabled when
>     HOTPLUG_CPU isn't.
> Changes since RFC v3:
>   * Dropped ia64 changes
> ---
>   arch/loongarch/Kconfig        |  1 +
>   arch/x86/Kconfig              |  1 +
>   drivers/acpi/Kconfig          |  1 -
>   drivers/acpi/acpi_processor.c | 18 ------------------
>   4 files changed, 2 insertions(+), 19 deletions(-)
> 

With the following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d889a0b97bc1..64620e90c12c 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -5,6 +5,7 @@ config LOONGARCH
>   	select ACPI
>   	select ACPI_GENERIC_GSI if ACPI
>   	select ACPI_MCFG if ACPI
> +	select ACPI_HOTPLUG_CPU if ACPI_PROCESSOR && HOTPLUG_CPU
>   	select ACPI_PPTT if ACPI
>   	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
>   	select ARCH_BINFMT_ELF_STATE
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 3762f41bb092..dbdcfc708369 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -59,6 +59,7 @@ config X86
>   	#
>   	select ACPI_LEGACY_TABLES_LOOKUP	if ACPI
>   	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
> +	select ACPI_HOTPLUG_CPU			if ACPI_PROCESSOR && HOTPLUG_CPU
>   	select ARCH_32BIT_OFF_T			if X86_32
>   	select ARCH_CLOCKSOURCE_INIT
>   	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index f819e760ff19..a3acfc750fce 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -310,7 +310,6 @@ config ACPI_HOTPLUG_CPU
>   	bool
>   	depends on ACPI_PROCESSOR && HOTPLUG_CPU
>   	select ACPI_CONTAINER
> -	default y
>   
>   config ACPI_PROCESSOR_AGGREGATOR
>   	tristate "Processor Aggregator"
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 0f5218e361df..4fe2ef54088c 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -184,24 +184,6 @@ static void __init acpi_pcc_cpufreq_init(void) {}
>   
>   /* Initialization */
>   #ifdef CONFIG_ACPI_HOTPLUG_CPU
> -int __weak acpi_map_cpu(acpi_handle handle,
> -		phys_cpuid_t physid, u32 acpi_id, int *pcpu)
> -{
> -	return -ENODEV;
> -}
> -
> -int __weak acpi_unmap_cpu(int cpu)
> -{
> -	return -ENODEV;
> -}
> -
> -int __weak arch_register_cpu(int cpu)
> -{
> -	return -ENODEV;
> -}
> -
> -void __weak arch_unregister_cpu(int cpu) {}
> -

Since we're here, EXPORT_SYMBOL() can be dropped for these functions on
x86 and loongarch because they're not called from a module?

>   static int acpi_processor_hotadd_init(struct acpi_processor *pr)
>   {
>   	unsigned long long sta;

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
