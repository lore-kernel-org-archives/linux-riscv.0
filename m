Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2F8C3ABBC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 05:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Vo0mw7GKqI117KH5xoH71ahOKt6pniE/jH3uCkbcT0=; b=26dxrxWSFWEle4
	FlllNDk50OSl7hr4qOmQlzvHGyUJhKv5hetkhtLaRM7Y8QxU06YYvB89iDeAPs6Qc/MpvsmsDWnXF
	N6tfwMrS3bmvRn1ebS3Ygq3BTlne7JDKOehuL8WId/hBwpwGlse4AP2dsp2DtKHguzKrjMWiSBfKX
	N94GYyIuz4sQlmHamrRf/ZJL027FPI0Y1qNnoHVE8J3GoAt+9Ibcg35DpJioC4rFhQ7wJJzCwSf5i
	Qpgm31ROKwXJLsRXd17rkO+WkG9TMWHZ55SAS7OwZKLvksoly6wh4631MfME7IUYEB3fhxxXH36rP
	0w4696TyhR47Rp+41CFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAf1-0000000AOVP-165E;
	Tue, 06 May 2025 05:16:07 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7bk-00000009dvp-1y6O
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 02:00:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b0c68092so4460226b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 19:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746496831; x=1747101631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQByGO6N0rnX/TuW9q2WHCZc5Qs2xvL6Ul/xODxMQm8=;
        b=NAf5ww7vWE8jxPJIl3NKnmACRmta9ynJzum+qcUhf9Q7WQuvgM0mLDXHgfm3L9BA8q
         pUu752zcC5WK1QHGi/85iAk/3GobS6DGbFZ5qaLNTmN9Dm3L9MEwe4iDcivxCqj7q9eQ
         Mbg6lA4mtjmgT9vOd0iQFytbiXH8j2/zQRmMry/Nk5mriqNzvEMdxgKCVx7UcWYVyGFX
         8ArtuP6IcCA8eZpVcxW2i3z24DOLmwnRC3Wrd51CNCBGocJOEV5lHhCyxTy7DCHD5elc
         cPoGIv30ARZ/5VtoCYpqEJGKUwE76+Y6nvm0tG1lCWyPrUVEyftzsZe4K9VwJ6kf0OWQ
         85kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746496831; x=1747101631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQByGO6N0rnX/TuW9q2WHCZc5Qs2xvL6Ul/xODxMQm8=;
        b=m8/+PjMifLy4knsqiGDN1hM3LMhRlSk5AQte3HbYVxmapNs7vstejIC9tmepXHnV9h
         xE0nTpqFjm7j5AE2x8ghAnFuRl0Hpx1a0SkKLognjmG3+A7qXi2qgR4xEmVGnoHtinbU
         jcteBDA6MQVvXUH7l8C/Lhxt0k2ss2ahrU38484VJE2exC5RUKVAh5GGOtLikB97J5aF
         G+qxTX3rWveqFTGzng0yC4up6riV/g43echpv6a440oxN+mKYuJXQtAQe1KVQD0iLjB6
         Vv9Ec6GJLoFDzuD5GEMZ4Gqytzf7ZWQqPhMBMHhoJv5iZvXXYGzthOSkX/MAMOOW21lG
         L+3g==
X-Gm-Message-State: AOJu0YzyZjLHgM4Hayh1NZDfH7wQlaAq8+ix3DFoFxqz9oCwVcCGBf/Q
	KdPRE/64IoOIQyncwF1ISfS4/EgD8sPf6yVn/g47U/4r6yKQv+Lg8uejUE+qPDw=
X-Gm-Gg: ASbGncvTfAbbCdfD1L4Q4o+eyU23+HlFcDD0IJkq6NmJbY4FeZjv+E+xbLhAAwXF4i3
	ApV+bcrTUYIEDS5by+wem1lUe3mSaRC/sucnpITh0TkISAatbBgG6MmmzGD/fQ9cPfkaerXjgpj
	gaN0ir+94k5KssY4TZbj7TZ8Y5htZ/A67EpH4Ez/a9azTWAg8muQ3yJZKF7yT+1zD8iWHV01K4P
	lj7R771bTxgF6LYL+oEmJZ7L8MFGpTDPf6mhuYmpwjNL3riqX+4aFGEcUTyNIEP5KUJdxU9kk7I
	/wUrxAJyJgfJ2f7TUUrq1fCEdjiW0Izn+bCS
X-Google-Smtp-Source: AGHT+IEdlH1n0D+wkqN6hRoakc2to2f4rJ9K96RWI2O330Mu8H40SWlfPZyCMdCvXpGOn/xBhGlcuw==
X-Received: by 2002:a05:6a00:6ca1:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-740589050bdmr23874814b3a.3.1746496831312;
        Mon, 05 May 2025 19:00:31 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:4221:9525:e8d6:875f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405901e1f9sm7613285b3a.87.2025.05.05.19.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:00:30 -0700 (PDT)
Date: Mon, 5 May 2025 19:00:28 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aBltPLLrvUNKR857@ghost>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240222125059.13331-3-hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_190032_778363_180EE8C1 
X-CRM114-Status: GOOD (  26.91  )
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

On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
> RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
> SBI debug trigger extension to install/uninstall/update/enable/disable hardware
> triggers as specified in Sdtrig ISA extension.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                     |   1 +
>  arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
>  arch/riscv/include/asm/kdebug.h        |   3 +-
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
>  arch/riscv/kernel/traps.c              |   6 +
>  6 files changed, 996 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>  create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> 

...

> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> new file mode 100644
> index 000000000000..7787123c7180
> --- /dev/null
> +++ b/arch/riscv/kernel/hw_breakpoint.c
> +
> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> +static int __init arch_hw_breakpoint_init(void)
> +{
> +	unsigned int cpu;
> +	int rc = 0;
> +
> +	for_each_possible_cpu(cpu)
> +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> +
> +	if (!dbtr_init)
> +		init_sbi_dbtr();
> +
> +	if (dbtr_total_num) {
> +		pr_info("%s: total number of type %d triggers: %u\n",
> +			__func__, dbtr_type, dbtr_total_num);
> +	} else {
> +		pr_info("%s: No hardware triggers available\n", __func__);
> +		goto out;
> +	}
> +
> +	/* Allocate per-cpu shared memory */
> +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
> +					PAGE_SIZE);
> +
> +	if (!sbi_dbtr_shmem) {
> +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* Hotplug handler to register/unregister shared memory with SBI */
> +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,

When using this, only hart 0 is getting setup. I think instead we want
the following to have all harts get setup:

	for_each_online_cpu(cpu)
		arch_smp_setup_sbi_shmem(cpu);

	/* Hotplug handler to register/unregister shared memory with SBI */
	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,


However, I am testing against tip-of-tree opensbi and am hitting an
issue during the setup on all harts:

[    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
[    0.202794] CPU 0: HW Breakpoint shared memory registered.

Additionally, this seems like it should be a fatal error, but it
continues on to print that the shared memory is registered because there
is no check before printing this seemingly successful message.

I know I am reviving an old thread, but do you have any insight into
what might be happening?

- Charlie

> +			       "riscv/hw_breakpoint:prepare",
> +			       arch_smp_setup_sbi_shmem,
> +			       arch_smp_teardown_sbi_shmem);
> +
> +	if (rc < 0) {
> +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
> +		free_percpu(sbi_dbtr_shmem);
> +		return rc;
> +	}
> + out:
> +	return rc;
> +}
> +arch_initcall(arch_hw_breakpoint_init);
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index a1b9be3c4332..53e1dfe5746b 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
>  	if (probe_breakpoint_handler(regs))
>  		return;
>  
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
> +	    == NOTIFY_STOP)
> +		return;
> +#endif
> +
>  	current->thread.bad_cause = regs->cause;
>  
>  	if (user_mode(regs))
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
