Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2C1C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frfkAFkZ1pmrghK5aI3aekD9bi/eaZEi71kFcDcezlE=; b=Bg/30WVPMcr42C
	qzfeDcnH6im77ky+ISqm8zQ0lPwJp7K00Kv+m5I0VtcZGYQljpRnlSfZTeDsY3gegqhz7fltLZsz9
	iQmPlYIgfg14DDSafiKbNc22Hl3EsVgEgG7AkGl9RTPSce7wn+5D4+4YO4CVKCuXd5eoHOKaZr3PQ
	A/dbuxjaSJV5S6f2bks89J4mJ6p9W4ETrtYAyIIKZ5U/7La5x7zN5HjCgvKqNkGfjixsqMBKCT5Wv
	tUP6DAoikkB9sqoTAvo+770nVsAfctIufLot9fbef4qisUsBznFbxfXw60seoWuGtcVGgx2mxiWM3
	v/Q7mLv12cRjSeQu3UZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAa4g-0089P1-01;
	Tue, 05 Dec 2023 18:23:14 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAa4d-0089Ms-0T
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:23:12 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1faf152a1dbso3366737fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701800589; x=1702405389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNbW17bHmaNx6Lg1rcHI25+aK6tLUsRsZx/WGd0BN28=;
        b=hA4XcYKV7Obsi9LG6qRX6xUqQioYYRHn2tnyMb4vw6tio4speKmPey+bhqWvw8tdd0
         bYMhuf2RdRw/j4boHam/DpT0mdcIbKLNpSGWNX6KmgbjiyOU5+xbB8o4eQ2PnOQdrC2F
         n5HI9kJyWC2naNG+Sl5t2OZyH+h6VeKmSKIVWU73hkLM4f3v1zFFe//BiFX3OmTwVtPo
         u0Yt8/pRQUl7BLo+sbQ9SODmRyZVIQ8Ilaky36D/KVoaqD/r19zCogYRAnUa/+r3E8j6
         Ce9Ona/xDmFjuUMEfCmuXOT1nXVV+H6jwdrnBMn8kB53/hs6WsXyssFRYqT1en2pTVFi
         MKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701800589; x=1702405389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNbW17bHmaNx6Lg1rcHI25+aK6tLUsRsZx/WGd0BN28=;
        b=T9aPAqZ30bmdkg+J0Q2hzVl5EZ0E1BixGz7IEZrtwEBM9LBsr40ALnHqUEFdW8vqg7
         J/XV0iM/Y301XtcD27dKh9fIpvM2dyzpKQ4K18nw/FynumUxxeccqTzheAxvhHr5IGtj
         hkOUSablvsG19tlsb3mULvhzVptb74oq/i7NZgUjMptXAOU/66LMwwm4YUKeFTsQB9TI
         mzz2D85CFAHrb+ahT2aagOnmD1IHy1EhjZcrw6tuNPObKvJwuze4F53a1WlJEdXj484n
         UI/OjYG9GA57Lb/21hVu3g59Bq08o5Lm9jYCevfqjH72GVMdwTyIz2YuuVkYvTpwhTH/
         ixww==
X-Gm-Message-State: AOJu0Ywmg45JPi4DYAbPEtxervgQyrRmQUSjtZLBSAvgWoS7chyO4P0Z
	yJP8BFIhDiAQxLTk27hF88+7wg==
X-Google-Smtp-Source: AGHT+IHqDhwn6wMJ8SwTn8o3u6Yi7NY9mFK3RuZ4UJ7QSZCkV8OYuFbMDMddUlaUMGFu/ogtjOHPhA==
X-Received: by 2002:a05:6870:be8d:b0:1fa:f404:b94e with SMTP id nx13-20020a056870be8d00b001faf404b94emr7511068oab.40.1701800589385;
        Tue, 05 Dec 2023 10:23:09 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:398c:ee80:5ec5:b590? ([2600:1700:2000:b002:398c:ee80:5ec5:b590])
        by smtp.gmail.com with ESMTPSA id i12-20020a0cab4c000000b0067a2c103711sm2018353qvb.25.2023.12.05.10.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 10:23:08 -0800 (PST)
Message-ID: <88905b42-206b-4888-aece-6664cee70e68@sifive.com>
Date: Tue, 5 Dec 2023 12:23:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] riscv: sbi: Introduce system suspend support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
 conor.dooley@microchip.com, apatel@ventanamicro.com
References: <20231129113414.41661-3-ajones@ventanamicro.com>
 <20231129113414.41661-4-ajones@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231129113414.41661-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_102311_196757_39E012A0 
X-CRM114-Status: GOOD (  22.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On 2023-11-29 5:34 AM, Andrew Jones wrote:
> When the SUSP SBI extension is present it implies that the standard
> "suspend to RAM" type is available. Wire it up to the generic
> platform suspend support, also applying the already present support
> for non-retentive CPU suspend. When the kernel is built with
> CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> Resumption will occur when a platform-specific wake-up event arrives.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  arch/riscv/Kconfig           |  6 ++++-
>  arch/riscv/include/asm/sbi.h |  9 ++++++++
>  arch/riscv/kernel/suspend.c  | 44 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..385fcad45c47 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -65,7 +65,7 @@ config RISCV
>  	select CLINT_TIMER if !MMU
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
> -	select CPU_PM if CPU_IDLE || HIBERNATION
> +	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>  	select EDAC_SUPPORT
>  	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
>  	select GENERIC_ARCH_TOPOLOGY
> @@ -918,9 +918,13 @@ config PORTABLE
>  	select MMU
>  	select OF
>  
> +
>  config ARCH_PROC_KCORE_TEXT
>  	def_bool y
>  
> +config ARCH_SUSPEND_POSSIBLE
> +	def_bool RISCV_SBI
> +

This option was already added by commit c1f048a6bd7d ("riscv: Enable
ARCH_SUSPEND_POSSIBLE for s2idle"), so this hunk is a duplicate.

Regards,
Samuel

>  menu "Power management options"
>  
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..f09356e187df 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -29,6 +29,7 @@ enum sbi_ext_id {
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
> +	SBI_EXT_SUSP = 0x53555350,
>  	SBI_EXT_PMU = 0x504D55,
>  	SBI_EXT_DBCN = 0x4442434E,
>  
> @@ -114,6 +115,14 @@ enum sbi_srst_reset_reason {
>  	SBI_SRST_RESET_REASON_SYS_FAILURE,
>  };
>  
> +enum sbi_ext_susp_fid {
> +	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
> +};
> +
> +enum sbi_ext_susp_sleep_type {
> +	SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM = 0,
> +};
> +
>  enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_NUM_COUNTERS = 0,
>  	SBI_EXT_PMU_COUNTER_GET_INFO,
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 3c89b8ec69c4..239509367e42 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -4,8 +4,12 @@
>   * Copyright (c) 2022 Ventana Micro Systems Inc.
>   */
>  
> +#define pr_fmt(fmt) "suspend: " fmt
> +
>  #include <linux/ftrace.h>
> +#include <linux/suspend.h>
>  #include <asm/csr.h>
> +#include <asm/sbi.h>
>  #include <asm/suspend.h>
>  
>  void suspend_save_csrs(struct suspend_context *context)
> @@ -85,3 +89,43 @@ int cpu_suspend(unsigned long arg,
>  
>  	return rc;
>  }
> +
> +#ifdef CONFIG_RISCV_SBI
> +static int sbi_system_suspend(unsigned long sleep_type,
> +			      unsigned long resume_addr,
> +			      unsigned long opaque)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
> +			sleep_type, resume_addr, opaque, 0, 0, 0);
> +	if (ret.error)
> +		return sbi_err_map_linux_errno(ret.error);
> +
> +	return ret.value;
> +}
> +
> +static int sbi_system_suspend_enter(suspend_state_t state)
> +{
> +	return cpu_suspend(SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM, sbi_system_suspend);
> +}
> +
> +static const struct platform_suspend_ops sbi_system_suspend_ops = {
> +	.valid = suspend_valid_only_mem,
> +	.enter = sbi_system_suspend_enter,
> +};
> +
> +static int __init sbi_system_suspend_init(void)
> +{
> +	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
> +	    sbi_probe_extension(SBI_EXT_SUSP) > 0) {
> +		pr_info("SBI SUSP extension detected\n");
> +		if (IS_ENABLED(CONFIG_SUSPEND))
> +			suspend_set_ops(&sbi_system_suspend_ops);
> +	}
> +
> +	return 0;
> +}
> +
> +arch_initcall(sbi_system_suspend_init);
> +#endif /* CONFIG_RISCV_SBI */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
