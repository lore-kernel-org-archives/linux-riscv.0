Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC4EC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eIfmCv4m4eJF+R8QLk+gCA7EDtgIYwTDS9oxejTstiM=; b=V7wgpK9jemZxEh4rsZN3NA4+wk
	ASzgUuTt4TXhDuChZsAYJOvL6ejCJE3ALrAH6cOgXdH0CfmuAT9WQK76wWN0pdPwvKjb0XHVYCMrv
	A7aRha/OqRzvlYB5X6H0hQyaHeDHXMm0eM4SWP4W9RmOyTGEAGtDGn8GhU8QLOj+OHm5STODSdONK
	LaoK5i8a89Hd6d3i1Mex2niLaq3Z2udObArdoH/aVlSF8jSlhgbR1ZMjvatNzpW/oWMaSxHvk1NmU
	A7b9g1hRNe/sT79hKFQjwsAb8YFr3cVKjS9ySgjzgQgBifJZchbYxvRp2jgja+pF9xL9C0Mxm/QHB
	Kik5WjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2Jh-00DgxZ-O1; Tue, 28 Feb 2023 15:55:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2Je-00Dgwb-O3
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:55:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id n6so9530130plf.5
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677599697;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma9umGMmLkd6pM2GuwZ8Hask3S1Bb3Q+ayEVnWwrDJM=;
        b=0ixpEa4//gbfOMjO2hxCVHz1MCVB68rj5LDBcLMF6K6K7+536UQ6FWzZdlNxjOrLsm
         mGOvvXP+6PeIRkV6MTNzqL+AWHaN5JxawM0sH6lHOf92S4G69lfO7VSl0pkVaxliZPn8
         SKPhvniJv6VZJnzgvnfHuf1uANSBPxFGfL0Sq5glX9EWM2cTu7Jyo218vZzzfV93epPy
         d1P46fqtVTgx1m8ZFdMDWE4pjStT+QT7cjJ6m6Ur6D37/+2Jh9YZZhwfDep6IR2at1C9
         Xr/p6yVeEQKA4cNOYCYFS+c5Gz3du4kSRvQsP8F+TFkzKt6tjjkXJnMwCkhKEuSqrSGL
         ZGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599697;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma9umGMmLkd6pM2GuwZ8Hask3S1Bb3Q+ayEVnWwrDJM=;
        b=lFx+qRBUlOH/NYBFclqcoU6xCfauYtWzyaMJ6P8n91o/sRfJmr6eQyIpDGK7LSD5NV
         qlWgGpgzBLwm8hL9eZqAIgYpDkm9gav72pu0Y1IGxlATBDG1njrCIU9W/nQ45iZGhOiW
         WfWG8G2/rKd418gt7duz60gi3jonnNOPQRC+xr62ysmoHUOUreOdfkudhCVzEu5pm/vf
         1hA+z+eKwJShpHnwpmI/UG2mtJkjtqeQmm10BdU6XiwN4DiPJqZiqGDiHrzyiJ9DewO7
         mhdBUPvNaNQJ2luXL2/GxznYsikwtrIFZ/uvfwX3ZRILyaWjPJ1SDDIBj6FJ9e57NFWC
         1Cqg==
X-Gm-Message-State: AO0yUKWOWauftjTQx+po4a/X5r9AMEddVJmLv+MWc2nZ9HqITudem18O
	EvAUs+FpBRlTTIbe196yMkijtdInqBona/fT
X-Google-Smtp-Source: AK7set/4avspWnTL2ykuXbb1ZVgKJ6tby/q27MpScTY9XUH+ymH40Kk6AyTIaRKz+uoHmBtTDXH0vA==
X-Received: by 2002:a17:902:b7c4:b0:19c:aa17:6660 with SMTP id v4-20020a170902b7c400b0019caa176660mr2784458plz.23.1677599696750;
        Tue, 28 Feb 2023 07:54:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jh20-20020a170903329400b0019ccded6a46sm6709096plb.228.2023.02.28.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:54:56 -0800 (PST)
Date: Tue, 28 Feb 2023 07:54:56 -0800 (PST)
X-Google-Original-Date: Tue, 28 Feb 2023 07:54:05 PST (-0800)
Subject: Re: [RFC v2 PATCH 1/1] riscv: sbi: Introduce system suspend support
In-Reply-To: <20230118180338.6484-2-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, leyfoon.tan@starfivetech.com,
  jeeheng.sia@starfivetech.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com, apatel@ventanamicro.com,
  Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-2b30e6d6-d8bf-4fae-a95c-f9e042ec90d0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_075458_802941_7A8F0FF9 
X-CRM114-Status: GOOD (  26.82  )
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

On Wed, 18 Jan 2023 10:03:38 PST (-0800), ajones@ventanamicro.com wrote:
> When the SUSP SBI extension is present it implies that the standard
> "suspend to RAM" type is available. Wire it up to the generic
> platform suspend support, also applying the already present support
> for non-retentive CPU suspend. When the kernel is built with
> CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> Resumption will occur when a platform-specific wake-up event arrives.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig           |  5 ++++-
>  arch/riscv/include/asm/sbi.h |  9 ++++++++
>  arch/riscv/kernel/suspend.c  | 43 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..28f182b611a7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -52,7 +52,7 @@ config RISCV
>  	select CLONE_BACKWARDS
>  	select CLINT_TIMER if !MMU
>  	select COMMON_CLK
> -	select CPU_PM if CPU_IDLE
> +	select CPU_PM if (SUSPEND || CPU_IDLE)
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_ATOMIC64 if !64BIT
> @@ -686,6 +686,9 @@ config PORTABLE
>  	select OF
>  	select MMU
>
> +config ARCH_SUSPEND_POSSIBLE
> +	def_bool RISCV_SBI
> +
>  menu "Power management options"
>
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4ca7fbacff42..1250321e4e6c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -29,6 +29,7 @@ enum sbi_ext_id {
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
> +	SBI_EXT_SUSP = 0x53555350,
>  	SBI_EXT_PMU = 0x504D55,
>
>  	/* Experimentals extensions must lie within this range */
> @@ -113,6 +114,14 @@ enum sbi_srst_reset_reason {
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
> index 9ba24fb8cc93..2109adeae594 100644
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
>  static void suspend_save_csrs(struct suspend_context *context)
> @@ -85,3 +89,42 @@ int cpu_suspend(unsigned long arg,
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
> +	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {
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

The code looks fine, but I can't find the SUSP extension anywhere.  
There's just hart suspend in 
<https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc>.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
