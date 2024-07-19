Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8257FC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7XFuwP6M/LPU7Vlj8KJ2n06ALr0m0kZeXGFyMUhMIw=; b=wDeyiCJJuTE1pX
	rM9/y6Upn3eZU2OojI4rWiL3m74MImwPBsdIUQGXKEUQ/iW00dJ9JZD0wUcy4Qtn+yjmF4YdTKwxd
	pBpMUXIiuGuzrO4jqN3bTSaDJCz9yM3dyXUAHo7wP1ctbSH1orcb3Ke3TvX3nDXdQca1vOZzLeW73
	sKWIvD6J7TvnSe3VzT+PvCV/natt8cIHhuScSoSTu6Fy28Oe8HCoTEl4PixtCJdDviZc+Q3CeTh7A
	CLYkMOnpCTaPI6USixcqI4TxqemtOy0SGizXgD30smesxOvIn8uBcgjZsUBCSvCP3cB/3wUeM6iwU
	GMmfFdA86T5Ofk35iUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpJR-000000033TN-2aYi;
	Fri, 19 Jul 2024 15:14:25 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpJP-000000033Sp-1mus
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 15:14:24 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-65f9708c50dso19970477b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721402061; x=1722006861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ep7USquIc8ObqQgurTx1eKeBf6SX6vM17VAQn9SQ8FQ=;
        b=VNXOt22j8/NDBRmHnPSSKqDt9/QAjOHGuJGAayF7M6qfTbMhp7yycmILUn09GoPZew
         97MLDpAGPEfoluopP9eVGDubIgBoF2Y8yY7grGD4gHOCKeXx4e7Ngw1vX982yDmtssz6
         LE/qkEsX1xRLmiX8/0t0bgJ0tNPvoq0mQ2O0CGSo12wyOB2ZXZrHaKcjlicI4MBhRtWX
         lFlYzzBSAxiqH3lObjaMfimC3xcLUf17FmVQ0FOV91JgEdXSM6bEsOpuYLYILz86q0zD
         uyazQ27vlscJi8QrZapTpwEEBgmg/9a+C5woAe5F30ixnw4PkWgdfWQaDv4ncOSFcCNh
         sphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721402061; x=1722006861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep7USquIc8ObqQgurTx1eKeBf6SX6vM17VAQn9SQ8FQ=;
        b=hbvM65nK2KD8ywwC7+T7CY2CbdxbXbQF8UJW/ke29P/IhRjl8CbjgRXK44zUzJRgnP
         IlV94okdAibB9Idd1uMkNmW87RNJWt5gInSF0D8pN34aLMHVshRxcBPN1pIZgXM5t1SX
         Ckvvrc/Q4ykpk9Z5xXXjnXrbeBTN3nCnaS3IEn3e62mmYBMM9H+VbvUkavSDw6434nqq
         rPNl+UWLrzAVTTyunKV3ghpsXEqUf4cnLShQvcMsA35lhecKXhBKCn2/o+h1gPJVVItv
         191qBShPudLyPMmoR3W7CwP1pMecCCofhv6W4kyknCFZmTyX1YGfwTdp6StUPQPLgOLn
         5YIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGvfOJH+i5qC04LL5uovovUkTa/ekhqJVzzWQh8kWhdIkSAcbo8XMiOvogyRlyXxaVbyB6ZCRa8V73U8NSdzJYnH9H2oaQeVukGGiAY+e4
X-Gm-Message-State: AOJu0YxczZm2VwdNjAOtxfIoCMABGs8DcNhNFTL06VJYy49kl/HpCKQ9
	1KA8xhDhvKxNKDvVxoJs3r3xI5GB1tvLlcCUfjoXNk28hT7L532puikJ5oMw5L4=
X-Google-Smtp-Source: AGHT+IG+4qcjwODC/mjEvyVMtdvYVHkfFCV6ubPYqh5WoweDatTqVpmhoXnXig8R9l1fsymD/hQgPQ==
X-Received: by 2002:a81:8804:0:b0:64a:791b:60ce with SMTP id 00721157ae682-66500574925mr85667487b3.30.1721402061512;
        Fri, 19 Jul 2024 08:14:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cd04062sm8510161cf.40.2024.07.19.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 08:14:21 -0700 (PDT)
Date: Fri, 19 Jul 2024 10:14:19 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	samuel.holland@sifive.com, conor.dooley@microchip.com, takakura@valinux.co.jp, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Implement kgdb_roundup_cpus() to enable IPI KGDB
 Roundup
Message-ID: <20240719-8841a9a99566e15c9bd1ff3d@orel>
References: <20240719081210.1457512-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719081210.1457512-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_081423_489274_2DAD200D 
X-CRM114-Status: GOOD (  27.75  )
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

On Fri, Jul 19, 2024 at 04:12:10PM GMT, Jinjie Ruan wrote:
> Until now, the generic weak kgdb_roundup_cpus() has been used for kgdb on
> RISCV. A custom one allows to debug CPUs that are stuck with interrupts
> disabled.

This confuses me since we're using an IPI for the roundup. How does that
work on CPUs stuck with interrupts disabled? I think this text comes
from the commit message for the arm64 patch, but arm64 does the roundup
with a pseudo-NMI.

> And using an IPI is better than the generic one since it avoids
> the potential situation described in the generic kgdb_call_nmi_hook().

This is true.

> 
> After this patch, the kgdb test show that:
> 	# echo g > /proc/sysrq-trigger
> 	[2]kdb> btc
> 	btc: cpu status: Currently on cpu 2
> 	Available cpus: 0-1(-), 2, 3(-)
> 	Stack traceback for pid 0
> 	0xffffffff81c13a40        0        0  1    0   -  0xffffffff81c14510  swapper/0
> 	CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.10.0-g3120273055b6-dirty #51
> 	Hardware name: riscv-virtio,qemu (DT)
> 	Call Trace:
> 	[<ffffffff80006c48>] dump_backtrace+0x28/0x30
> 	[<ffffffff80fceb38>] show_stack+0x38/0x44
> 	[<ffffffff80fe6a04>] dump_stack_lvl+0x58/0x7a
> 	[<ffffffff80fe6a3e>] dump_stack+0x18/0x20
> 	[<ffffffff801143fa>] kgdb_cpu_enter+0x682/0x6b2
> 	[<ffffffff801144ca>] kgdb_nmicallback+0xa0/0xac
> 	[<ffffffff8000a392>] handle_IPI+0x9c/0x120
> 	[<ffffffff800a2baa>] handle_percpu_devid_irq+0xa4/0x1e4
> 	[<ffffffff8009cca8>] generic_handle_domain_irq+0x28/0x36
> 	[<ffffffff800a9e5c>] ipi_mux_process+0xe8/0x110
> 	[<ffffffff806e1e30>] imsic_handle_irq+0xf8/0x13a
> 	[<ffffffff8009cca8>] generic_handle_domain_irq+0x28/0x36
> 	[<ffffffff806dff12>] riscv_intc_aia_irq+0x2e/0x40
> 	[<ffffffff80fe6ab0>] handle_riscv_irq+0x54/0x86
> 	[<ffffffff80ff2e4a>] call_on_irq_stack+0x32/0x40
> 
> Rebased on Ryo Takakura's "RISC-V: Enable IPI CPU Backtrace" patch.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/smp.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 9b047899791c..c180a647a30e 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/kexec.h>
> +#include <linux/kgdb.h>
>  #include <linux/percpu.h>
>  #include <linux/profile.h>
>  #include <linux/smp.h>
> @@ -35,6 +36,7 @@ enum ipi_message_type {
>  	IPI_IRQ_WORK,
>  	IPI_TIMER,
>  	IPI_CPU_BACKTRACE,
> +	IPI_KGDB_ROUNDUP,
>  	IPI_MAX
>  };
>  
> @@ -115,6 +117,7 @@ void arch_irq_work_raise(void)
>  
>  static irqreturn_t handle_IPI(int irq, void *data)
>  {
> +	unsigned int cpu = smp_processor_id();
>  	int ipi = irq - ipi_virq_base;
>  
>  	switch (ipi) {
> @@ -128,7 +131,7 @@ static irqreturn_t handle_IPI(int irq, void *data)
>  		ipi_stop();
>  		break;
>  	case IPI_CPU_CRASH_STOP:
> -		ipi_cpu_crash_stop(smp_processor_id(), get_irq_regs());
> +		ipi_cpu_crash_stop(cpu, get_irq_regs());
>  		break;
>  	case IPI_IRQ_WORK:
>  		irq_work_run();
> @@ -141,8 +144,11 @@ static irqreturn_t handle_IPI(int irq, void *data)
>  	case IPI_CPU_BACKTRACE:
>  		nmi_cpu_backtrace(get_irq_regs());
>  		break;
> +	case IPI_KGDB_ROUNDUP:
> +		kgdb_nmicallback(cpu, get_irq_regs());
> +		break;
>  	default:
> -		pr_warn("CPU%d: unhandled IPI%d\n", smp_processor_id(), ipi);
> +		pr_warn("CPU%d: unhandled IPI%d\n", cpu, ipi);
>  		break;
>  	}
>  
> @@ -209,6 +215,7 @@ static const char * const ipi_names[] = {
>  	[IPI_IRQ_WORK]		= "IRQ work interrupts",
>  	[IPI_TIMER]		= "Timer broadcast interrupts",
>  	[IPI_CPU_BACKTRACE]     = "CPU backtrace interrupts",
> +	[IPI_KGDB_ROUNDUP]	= "KGDB roundup interrupts",
>  };
>  
>  void show_ipi_stats(struct seq_file *p, int prec)
> @@ -339,3 +346,19 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
>  {
>  	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, riscv_backtrace_ipi);
>  }
> +
> +#ifdef CONFIG_KGDB
> +void kgdb_roundup_cpus(void)
> +{
> +	int this_cpu = raw_smp_processor_id();
> +	int cpu;
> +
> +	for_each_online_cpu(cpu) {
> +		/* No need to roundup ourselves */
> +		if (cpu == this_cpu)
> +			continue;
> +
> +		send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
> +	}
> +}
> +#endif
> -- 
> 2.34.1
>

Other than the commit message, the patch looks good to me, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

but I guess we should extend this and the CPU backtrace support to use
NMIs when we have support for them.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
