Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE919C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 05:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4p9GuoYCJdShHb+1hUcqPIDgfAodoTd7NYSpKy0aTfk=; b=VDlqZjTmcNuT00
	NoQ6gMSrTblK/8QWAArFhArCHlsXBl42fkqd8NkG+LbsTnbZWAQUGmZpEjHs6t7w+wHxZQ4rryoJu
	a+N/fC9Aj5h2QFkVFMOzQRzP/Y+TqXyKYVNWdycWsG0ayu/9BIv/EAivcXofy2C6ZzGZGJMXN+WG3
	80s2VRIZTTvAME5DWGVXzaLuDw83nklME+gbjSCjQnI8bztWLDHvhafd4Af8H+NlYo8BMAgcOgRLY
	78CCWMi6fDBXOMEsKUU2majrxP1bvZFVTGZ7c+Dri91Madn44i4TljD+/6ObrQqIcykWa6tybFbXF
	KDhh82WnlsfLBlTVJXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6fE-00ER8z-2K;
	Mon, 18 Sep 2023 05:19:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6fC-00ER89-1P
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 05:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695014352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+VmGOP6k6PklzaSQw+Wb8ACfwVkFKcepFidWWf6BMLc=;
	b=BKS6YjD2aXwzMRiQc4ldVrLAmhX+l89Why7wG9jJquZ6Cu36z2Jz3C9Qo1g1WWwxTs6Uzx
	EZcmUpUd21HUJIkkNVBmcZsbNkQve6pMXV4bLJLkEHYY8LidZu2YKTS/y3LRYflBC2xrTm
	pfjE5N9wXdneBreOdXFMxsKa00ft2uo=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-E5Pl8e9sPwuG2pDyep96bg-1; Mon, 18 Sep 2023 01:19:11 -0400
X-MC-Unique: E5Pl8e9sPwuG2pDyep96bg-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1d6659a4207so4402044fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 22:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695014350; x=1695619150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+VmGOP6k6PklzaSQw+Wb8ACfwVkFKcepFidWWf6BMLc=;
        b=AyRvl1qcxMG8FwmNT1QDPBn5vgjYf8qKrJxzWuM9iakdgXKWHvfmCC32hl4ETGp9LH
         wcIE01lHRaBFA/Z4jqyl0kX92p25Gms64PKNX53kqoX8Iz6mrWxnuUmgrNYjRxuSjdL0
         eRb112m7MimZlemnRagNKWUErZTztno3HLXP0JSQC8p2j6TfMBEhJdHb4ZwY6Jc5vfLL
         tmQX5+nCZcNbXJ0UFkq+8lXmwTyUTCi2zNvyvY2DJfuvjSQGi5eMOh+jKhHesJNcMrc7
         I/627vX00mtdlfOY0DJOWB9/QV6cbdHeuaI4bxjocgs2JmaTmsEnZKv8rBVZsCty/E6D
         Ntlw==
X-Gm-Message-State: AOJu0YynD4oRlTKVDqd6IgSFMLkFQBXvoxvn6O07JWkOUirp1o/cauO1
	sXZaBN1dG6PExcJ9ILcsDpZAv3yiMPjaTS+RbbmqgCoGe0YwLwJe9BlQTEYCRHJGCalne7qZTso
	xQ8Om2d1/f4kwDt0PSb84Npzt9/Hq
X-Received: by 2002:a05:6870:9191:b0:1d6:925:840d with SMTP id b17-20020a056870919100b001d60925840dmr9769147oaf.55.1695014350409;
        Sun, 17 Sep 2023 22:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgNPgTZtS/hsL5sJUv2LZbTkXkuBlyKD4NiO3GPGQyDZIhzwEA3s34zGbwVBHMpylSMNZ4ZQ==
X-Received: by 2002:a05:6870:9191:b0:1d6:925:840d with SMTP id b17-20020a056870919100b001d60925840dmr9769120oaf.55.1695014350060;
        Sun, 17 Sep 2023 22:19:10 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id mu13-20020a17090b388d00b0026596b8f33asm8145403pjb.40.2023.09.17.22.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:19:09 -0700 (PDT)
Message-ID: <2d0e2fd7-5a6e-04ef-578d-713d8e14c30c@redhat.com>
Date: Mon, 18 Sep 2023 15:19:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 17/35] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-18-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-18-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_221914_592430_AC067157 
X-CRM114-Status: GOOD (  25.45  )
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


On 9/14/23 02:38, James Morse wrote:
> To allow ACPI to skip the call to arch_register_cpu() when the _STA
> value indicates the CPU can't be brought online right now, move the
> arch_register_cpu() call into acpi_processor_get_info().
> 
> Systems can still be booted with 'acpi=off', or not include an
> ACPI description at all. For these, the CPUs continue to be
> registered by cpu_dev_register_generic().
> 
> This moves the CPU register logic back to a subsys_initcall(),
> while the memory nodes will have been registered earlier.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/acpi_processor.c | 13 +++++++++++++
>   drivers/base/cpu.c            |  2 +-
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 

With the following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index a01e315aa16a..867782bc50b0 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -313,6 +313,19 @@ static int acpi_processor_get_info(struct acpi_device *device)
>   			cpufreq_add_device("acpi-cpufreq");
>   	}
>   
> +	/*
> +	 * Register CPUs that are present.
> +	 * Use get_cpu_device() to skip duplicate CPU descriptions from
> +	 * firmware.
> +	 */
> +	if (!invalid_logical_cpuid(pr->id) && cpu_present(pr->id) &&
> +	    !get_cpu_device(pr->id)) {
> +		int ret = arch_register_cpu(pr->id);
> +
> +		if (ret)
> +			return ret;
> +	}
> +

The multiple lines of comments could be combined a bit:

	/*
	 * Register CPUs that are present. get_cpu_device() is used to
	 * skip duplicate CPU description from firmware.
          */

>   	/*
>   	 *  Extra Processor objects may be enumerated on MP systems with
>   	 *  less than the max # of CPUs. They should be ignored _iff
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index d31c936f0955..677f963e02ce 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -537,7 +537,7 @@ static void __init cpu_dev_register_generic(void)
>   {
>   	int i, ret;
>   
> -	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
> +	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES) || !acpi_disabled)
>   		return;
>   
>   	for_each_present_cpu(i) {

Some comments may be worthy, to explain why we need "!acpi_disabled" here.

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
