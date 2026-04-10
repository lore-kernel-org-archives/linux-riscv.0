Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCB6F44873
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq5YSjkLPWwPW9XWl69QGE9fun8B6GWZkqbaZQLagkM=; b=08NvjwhQdW4ueNaahgRyugIYiM
	ygUFAr1TWT9gPCSR94tBfDHyi6SgYL7W5urei2xNFz+V2fBAfxxouc94t0UDZoRlKWjiDua/ddWX3
	66mUk8bcfSsLyYvVdYsTYGxSfbEyQ6Iu+mfpJXdIzK8RA9QL35kV6IX/zzdpYcIvNpPyYTa3KRT1m
	tnpfSm8mzEFO+VVIaztbjt8Gx5V41rZ7iFjlTcLC1JU4lu8XhG2hGV03NHcBtFpxNsIeZstjNd+De
	C6G22br1XLKEudzHFO/h2IQwtmV6hZG+vpokJFL/4PGObAcPugHFMvmc+uFhVh43sMwBcw4NqfLfI
	xuLKv4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCyw-0000000COMd-0bxH;
	Fri, 10 Apr 2026 14:37:14 +0000
Received: from forward500d.mail.yandex.net ([178.154.239.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCys-0000000COL7-0hhc
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 14:37:12 +0000
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id B84D080722;
	Fri, 10 Apr 2026 17:37:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xaIJALSSpmI0-8B4lnFkU;
	Fri, 10 Apr 2026 17:37:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cloudbear.ru;
	s=mail; t=1775831821;
	bh=n4MFA2ymVvZJxQC1AYrWW7iu+hLQf1/wBkOTpF6yNK8=;
	h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
	b=dRGzIU9QVV+QoMDd0zRBKe4zUr46KTRH4yLJSY7HW98ynOuwp7OHYoDkbt4xTzfGr
	 CTCTqqqlK6gKOyxAbowwFBzpQPCcfG5QAmoV7e6NRqqLVzbQEN8tq+NF+ot2ehdyNE
	 YYvO6IzEyhpmJ6MzU1yZHXPAdvwyyBoFY50sgL8Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@cloudbear.ru
Message-ID: <d3dab846-b868-49ef-948e-80f5c46ad260@cloudbear.ru>
Date: Fri, 10 Apr 2026 17:36:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: cpu_ops: Change return value type of
 cpu_is_stopped() to bool
To: Hui Wang <hui.wang@canonical.com>, linux-riscv@lists.infradead.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 ajones@ventanamicro.com, atish.patra@linux.dev
References: <20260409133247.76215-1-hui.wang@canonical.com>
Content-Language: ru
From: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>
In-Reply-To: <20260409133247.76215-1-hui.wang@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_073710_384130_0B7D4732 
X-CRM114-Status: GOOD (  22.79  )
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


> In the original sbi_cpu_is_stopped(), if rc doesn't equal to the
> SBI_HSM_STATE_STOPPED, it will return rc to the caller directly. But
> there is a hidden problem, the rc could be SBI_HSM_STATE_STARTED, if
> so, this function will report cpu stopped while the cpu isn't really
> stopped.
>
> Furthermore, from the name of cpu_is_stopped(), it gives a sense the
> return value is a bool type, true means the cpu is stopped, conversely
> false means the cpu is not stopped.
>
> Here change the return value type to bool and change the callers
> accordingly. This could fix the above two issues.
>
> Fixes: f1e58583b9c7c ("RISC-V: Support cpu hotplug")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   arch/riscv/include/asm/cpu_ops.h | 2 +-
>   arch/riscv/kernel/cpu-hotplug.c  | 2 +-
>   arch/riscv/kernel/cpu_ops_sbi.c  | 6 ++----
>   3 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
> index 176b570ef982..065811fca594 100644
> --- a/arch/riscv/include/asm/cpu_ops.h
> +++ b/arch/riscv/include/asm/cpu_ops.h
> @@ -24,7 +24,7 @@ struct cpu_operations {
>   				     struct task_struct *tidle);
>   #ifdef CONFIG_HOTPLUG_CPU
>   	void		(*cpu_stop)(void);
> -	int		(*cpu_is_stopped)(unsigned int cpu);
> +	bool		(*cpu_is_stopped)(unsigned int cpu);
>   #endif
>   };
>   
> diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
> index a0ee426f6d93..c240e9be9fba 100644
> --- a/arch/riscv/kernel/cpu-hotplug.c
> +++ b/arch/riscv/kernel/cpu-hotplug.c
> @@ -57,7 +57,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>   	/* Verify from the firmware if the cpu is really stopped*/
>   	if (cpu_ops->cpu_is_stopped)
>   		ret = cpu_ops->cpu_is_stopped(cpu);
> -	if (ret)
> +	if (!ret)
>   		pr_warn("CPU%u may not have stopped: %d\n", cpu, ret);
>   }
>   
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index 00aff669f5f2..a17b7576b77d 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -88,16 +88,14 @@ static void sbi_cpu_stop(void)
>   	pr_crit("Unable to stop the cpu %d (%d)\n", smp_processor_id(), ret);
>   }
>   
> -static int sbi_cpu_is_stopped(unsigned int cpuid)
> +static bool sbi_cpu_is_stopped(unsigned int cpuid)
>   {
>   	int rc;
>   	unsigned long hartid = cpuid_to_hartid_map(cpuid);
>   
>   	rc = sbi_hsm_hart_get_status(hartid);
>   
> -	if (rc == SBI_HSM_STATE_STOPPED)
> -		return 0;
> -	return rc;
> +	return (rc == SBI_HSM_STATE_STOPPED);
>   }
>   #endif
>   

Here is a some ambiguous behavior because pr_warn() in cpu-hotplug.c 
must send a cpu state number.
I would say it is needed to use sbi_hsm_hart_get_status(cpu) in pr_warn 
like this:

pr_warn("CPU%u may not have stopped: %d\n", cpu, 
sbi_hsm_hart_get_status(cpu))

so that we can define what is the current state of hart in case it is 
not SBI_HSM_STATE_STOPPED.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
