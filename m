Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8663C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ainJi+J7M3cOehhgONeAHupR4CFcxSbAxr1OthUr+7A=; b=ArqGN/+2OI6bZmJd+SiPu9mtSJ
	/LbDKQEfSTbQkA7/nhnAzMx6uDzDhYJ8qsEPfFulHNCe7/bXhBdhDzETA/RgLlpubzCXCFo5MWa34
	unL/Yd6wOCURnyw7LyzeJs38uYTQWXvUZq8/NQGSeChiXHRMJrnnM38wnW8OLfQjhWmDb/qZLMvc4
	j9zfyXtSPs+KDrTnx0s7cdZzDMN2w37bMcBzKmmmrv3V9QPt4+MrBOEZJSyeW5w57K3GbG5thMrXT
	J+V5TxDs0f7vNZI15jkH4faYPkg5XsH6KJC5Gxe3AmgQyD6VKk1WInalYnArMLAEJSqJKG78BUSe3
	ZQc5lUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDIi-0000000HFXh-1EY0;
	Fri, 12 Jul 2024 10:14:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDIe-0000000HFX1-2Wto
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 10:14:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fb3cf78fa6so12191535ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1720779287; x=1721384087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYGKh1rSGwZMMdb+jKC0h+rI0XGmJjkbO0qhMEGPnio=;
        b=SjRFMt+xLKsGvNpxPZE92z7eVJya8XzlDrIeU8PEhesjDJqBaMYoLBRnLd4w+Mh8MF
         OhGgPIauVGQteG1u+ciSmpFbyPdXzpi59GWjjQiPt2z+GhPngRUPxBnQlPYqsHxTT07W
         B4Aw4XfQH05shouU2HX1a1fkCrSgs3Uw/exNIPYa6HRnCLxAUnWuW6vupnVA/vgllpTn
         yl0cskLD9WX7c0eHMnegw21JQZlOLZIvxacWiWvsUpGR76ciCMc5x8cSSMo3rLEZEEze
         KZGoIDfsugePY3KJES7bvb3zwGbZWPe2KV9MU5TdB5ZC71ah+SUm+VUlzhOpPTiJru96
         GkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720779287; x=1721384087;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYGKh1rSGwZMMdb+jKC0h+rI0XGmJjkbO0qhMEGPnio=;
        b=JvUDcYBBmL8jNbq8e/qFbLd+PDfQIzp3dul7FB2HVyJf594mCQMlWsmPcmw9+S9v+T
         P/wdhYKPutFYSqD+C1fFiXTJ0Mc8VJ4vGbce64LyWx9Ht8GMkEkjcAymxrAzSMHK3nhy
         2X0wl2f5CPbV2wC/ksmTXuMZ07ip1CJ4PaF8zFX+jsG/OgOeIvtc9cUllSrc1GrQ7c4V
         qCLGzDu2/FQ9OrWITskE1oH3Zoo8Vb0jkkRWSFeE4AXM03bnsGZ4m8ZLJP+pKm0OHXVE
         wYbXqaSVaTNpqE6ZOd8CrV8BoKVYAyVUyvGzk2Wkji2KlbjeD2f1HHB29pQhIrjtoaQo
         L87g==
X-Forwarded-Encrypted: i=1; AJvYcCXGR3Id0GvC/h+QoF8SzRHOLaoeRfVAqwPdicDwYXJ5gRJXHkL95dACtt2fs3xLm5cm85yqwSsKIjiKbO+VuKOrcFfGT+a8PoSXxcW5VfOV
X-Gm-Message-State: AOJu0YxT2KeKcsvq+G4/SmhdO5xuXGppUCxJA8kezaGVIPV4jvoMX8ny
	aOeD8ouBwu8vz66Zk7WavbkX/NuGCeqWuRJC253GKdZIJjX1uk5iJBYHp12VtkY=
X-Google-Smtp-Source: AGHT+IFMifVwNt8IScPJ6260qWA57jb2o+gvsjPQqNzo05GV8To6C74ereNxSC9kehEGRwxHHbYwvA==
X-Received: by 2002:a17:902:d481:b0:1fb:7b96:8479 with SMTP id d9443c01a7336-1fbb6f098bdmr91958555ad.58.1720779287137;
        Fri, 12 Jul 2024 03:14:47 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad0387sm63859975ad.274.2024.07.12.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:14:46 -0700 (PDT)
Date: Fri, 12 Jul 2024 03:14:46 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Jul 2024 03:13:37 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Enable IPI CPU Backtrace
In-Reply-To: <20240417050711.41930-1-takakura@valinux.co.jp>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, Bin Meng <bmeng.cn@gmail.com>, Atish Patra <atishp@rivosinc.com>,
  daniel.thompson@linaro.org, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
  akpm@linux-foundation.org, Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com,
  taka@valinux.co.jp, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  takakura@valinux.co.jp
From: Palmer Dabbelt <palmer@dabbelt.com>
To: takakura@valinux.co.jp
Message-ID: <mhng-d03b5c09-5fc6-41dd-9257-dfec64492705@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_031448_943613_E0A10831 
X-CRM114-Status: GOOD (  25.58  )
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

On Tue, 16 Apr 2024 22:07:11 PDT (-0700), takakura@valinux.co.jp wrote:
> From: Ryo Takakura <takakura@valinux.co.jp>
>
> Add CPU backtrace feature using IPI on riscv.
> Currently, riscv doesn't yet support the feature while other
> architectures do. As IPI multiplexing allows to handle
> multiple IPIs, I think this feature can also be enabled
> on riscv by adding IPI.
>
> This patch defines arch_trigger_all_cpu_backtrace() which triggers
> the IPI for CPU backtrace.
> It will be triggered in the events of oops/panic when options
> (oops_all_cpu_backtrace/panic_print) are set accordingly.
>
> Below is the case of oops with the oops_all_cpu_backtrace
> enabled.
>
> $ sysctl kernel.oops_all_cpu_backtrace=1
>
> triggering oops shows:
> [  435.716754] NMI backtrace for cpu 3
> [  435.716893] CPU: 3 PID: 621 Comm: in:imklog Tainted: G           OE      6.9.0-rc4 #1
> [  435.717086] Hardware name: riscv-virtio,qemu (DT)
> [  435.717182] epc : fallback_scalar_usercopy+0x8/0xdc
> [  435.717300]  ra : _copy_to_user+0x32/0x58
> [  435.717391] epc : ffffffff80c33d88 ra : ffffffff80598e3c sp : ff20000000e83b50
> [  435.717544]  gp : ffffffff82066bf0 tp : ff60000091fd7000 t0 : 3363303866660000
> [  435.717711]  t1 : 000000000000005b t2 : 3363303866666666 s0 : ff20000000e83b60
> [  435.717874]  s1 : 00000000000001af a0 : 00007ff74d3df74f a1 : ff60000082cdc800
> [  435.718040]  a2 : 000000000000003c a3 : 0000000000000000 a4 : 0000000000000000
> [  435.718196]  a5 : 00ffffffffffffc4 a6 : 0000000000000000 a7 : 0000000000000010
> [  435.718333]  s2 : ff60000082cdc800 s3 : ffffffff82066910 s4 : 0000000000001df1
> [  435.718475]  s5 : ffffffff8206a5b8 s6 : 00007ff74d3df74f s7 : ffffffff8206a5b0
> [  435.718616]  s8 : ff60000082cdc800 s9 : ffffffff81e26208 s10: 000000000000003c
> [  435.718760]  s11: ffffffff8206a5ad t3 : ff60000082cdc812 t4 : ff60000082cdc812
> [  435.718909]  t5 : ff60000082cdc818 t6 : 0000000000040000
> [  435.719019] status: 0000000000040120 badaddr: 0000000000000000 cause: 8000000000000001
> [  435.719191] [<ffffffff80c33d88>] fallback_scalar_usercopy+0x8/0xdc
> [  435.719330] [<ffffffff80094eee>] syslog_print+0x1f4/0x2b2
> [  435.719446] [<ffffffff80095e10>] do_syslog.part.0+0xb0/0x326
> [  435.719594] [<ffffffff8009692e>] do_syslog+0x66/0x88
> [  435.719816] [<ffffffff803a1a80>] kmsg_read+0x44/0x5c
> [  435.720017] [<ffffffff8038ea92>] proc_reg_read+0x7a/0xa8
> [  435.720251] [<ffffffff802fae20>] vfs_read+0x94/0x264
> [  435.720478] [<ffffffff802fb906>] ksys_read+0x64/0xe4
> [  435.720709] [<ffffffff802fb9a6>] __riscv_sys_read+0x20/0x2c
> [  435.720880] [<ffffffff80c43ea2>] do_trap_ecall_u+0x60/0x1d4
> [  435.721236] [<ffffffff80c4f74c>] ret_from_exception+0x0/0x64
>
> Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
> ---
>  arch/riscv/include/asm/irq.h |  3 +++
>  arch/riscv/kernel/smp.c      | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 8e10a94430a2..ed8f76879270 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -12,6 +12,9 @@
>
>  #include <asm-generic/irq.h>
>
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);
> +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace

I'm getting a build failure with SMP=n (allnoconfig), the implementation 
is in smp.c which isn't built without SMP.

> +
>  void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
>
>  struct fwnode_handle *riscv_get_intc_hwnode(void);
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 45dd4035416e..6e297b9eb641 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -21,6 +21,7 @@
>  #include <linux/delay.h>
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
> +#include <linux/nmi.h>
>
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
> @@ -33,6 +34,7 @@ enum ipi_message_type {
>  	IPI_CPU_CRASH_STOP,
>  	IPI_IRQ_WORK,
>  	IPI_TIMER,
> +	IPI_CPU_BACKTRACE,
>  	IPI_MAX
>  };
>
> @@ -136,6 +138,9 @@ static irqreturn_t handle_IPI(int irq, void *data)
>  		tick_receive_broadcast();
>  		break;
>  #endif
> +	case IPI_CPU_BACKTRACE:
> +		nmi_cpu_backtrace(get_irq_regs());
> +		break;
>  	default:
>  		pr_warn("CPU%d: unhandled IPI%d\n", smp_processor_id(), ipi);
>  		break;
> @@ -212,6 +217,7 @@ static const char * const ipi_names[] = {
>  	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
>  	[IPI_IRQ_WORK]		= "IRQ work interrupts",
>  	[IPI_TIMER]		= "Timer broadcast interrupts",
> +	[IPI_CPU_BACKTRACE]     = "CPU backtrace interrupts",
>  };
>
>  void show_ipi_stats(struct seq_file *p, int prec)
> @@ -332,3 +338,13 @@ void arch_smp_send_reschedule(int cpu)
>  	send_ipi_single(cpu, IPI_RESCHEDULE);
>  }
>  EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
> +
> +static void riscv_backtrace_ipi(cpumask_t *mask)
> +{
> +	send_ipi_mask(mask, IPI_CPU_BACKTRACE);
> +}
> +
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
> +{
> +	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, riscv_backtrace_ipi);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
