Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD60C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 03:41:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A3C64F99
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 03:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A3C64F99
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mRv/XYADrTfG7omwbxe9T2jGaeAAUcZtePFIp+Dvzcg=; b=FX0fxBgijdvAnffAxQZU8dG3q
	54aB8W/6PKcfXMZzvJNEckiZss7TbYQk5awSM2HXi+Cv6/POEvYrAKUOcvU3pTifhafpJfZsCEztG
	HDYztny0aNPPOy/g9TkqIm4i0IiOaScbtuIt8BnEUZ2PgXK2b99H9KB7mW+vnRcJh+Nn+KXMENdFs
	Rb4J7V51Ca2Z6cUzAkCp5b5DhLb+4t8s32iBi/246/hWx6XiP7F+Tevwd/nhPSFeqAIhKcaFybKBZ
	qBFxwlVN3zrexQvxdopYP5peGx9WVG6LNAwfGsHCPXU6D9q90BAdP6X7/Iof9QvY4rxekL/+gDhpT
	YW1yvXFJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMN39-002MRs-B5; Wed, 17 Mar 2021 03:40:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMN32-002MQB-LH
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 03:40:44 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so2488271pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 20:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=t280vDZQWk0iZZ+xQFR7BI6xACbsATSb7UzAA7K2/a0=;
 b=Humdt9srb74JTFtTLWQFozZx4MkuAbxcuC0K/hAZ5mVCgDHroQ+B5lp/tFiHSs+1fB
 38gITDQeMM6jaALv1oRJIz5cyKYq/Klf5POvfPvYtHVUeU3zrlO27iPji+39hoa5tAfi
 PWVpnulycTQuCx4y5nsc0oV4FK4GErfmmnFNxAl1GKnhOfAr223cbIpIXY0qcBi/h/q6
 VgrM8+ttoNi4HncnjFBaJKF04RnkD2OL7B2k/kMDKinkug3q9vebo84Bq4mJ0LaTv/bU
 7npOzBfb0uicwUxurpmoO4aR08rauCjmBjyyBiS46a7dVMNmHkq3ANaOSjgqKGnRbTFe
 2ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=t280vDZQWk0iZZ+xQFR7BI6xACbsATSb7UzAA7K2/a0=;
 b=GyHvKpmx1wozZyi+JckRvLLYOLtrD7uO0pHJpdnKSYjs+ScXjtm1RCF1hFUyglQB7f
 ocZsVldeelDdxzwmjqiaCdSQ/Xk3Wlhm+uZ0oH/+jV9RCBTKmf88f4OqIMt+5USuTQV9
 kccn6q9uCIPxr2iRIkUfNQ7iS+altMyU2n3IQxNIGZ5PsLb0d1L40bKYsNUYCr/IAHrp
 Vz9IeJ3x/nYF6BgKgkCswfIh60DP2a1qjF24G0HoRAO3W0O9b+hHoU/4/+rPcqIUwRl+
 AqsFiGBrHjXS92ZynNnYSjq8R5QGsTU4AcBpbebBqz6RSQaP1IA5rqfqMrqbvx6ECY/N
 MwPg==
X-Gm-Message-State: AOAM533StIA+UcRQCaVYfrTAjJ7X7uVvjWBQxfg5WgAdInn4ggQYNMbi
 iKuvIGt+sAZbdwBQzragfwoF08GUkU+yF8P+
X-Google-Smtp-Source: ABdhPJw+fTIoWjUDX5CUuSKCp+cvthbxVN3kxlUImWClYDjMZlRLuSxvAy55TEc3ABlo9funImT0rQ==
X-Received: by 2002:a17:902:ed41:b029:e5:c92d:ec24 with SMTP id
 y1-20020a170902ed41b02900e5c92dec24mr2356365plb.57.1615952439246; 
 Tue, 16 Mar 2021 20:40:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s200sm17957184pfs.53.2021.03.16.20.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 20:40:38 -0700 (PDT)
Date: Tue, 16 Mar 2021 20:40:38 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 20:40:31 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: Enable generic clockevent broadcast
In-Reply-To: <20210307022446.63732-2-guoren@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, guoren@kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 guoren@linux.alibaba.com, tglx@linutronix.de, daniel.lezcano@linaro.org,
 Anup Patel <Anup.Patel@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>, greentime.hu@sifive.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-25b45eaf-1d0b-4292-9228-1ac3ac68832b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_034041_335958_E25CB173 
X-CRM114-Status: GOOD (  19.31  )
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

On Sat, 06 Mar 2021 18:24:46 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When percpu-timers are stopped by deep power saving mode, we
> need system timer help to broadcast IPI_TIMER.
>
> This is first introduced by broken x86 hardware, where the local apic
> timer stops in C3 state. But many other architectures(powerpc, mips,
> arm, hexagon, openrisc, sh) have supported the infrastructure to
> deal with Power Management issues.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/Kconfig      |  2 ++
>  arch/riscv/kernel/smp.c | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 85d626b8ce5e..8637e7344abe 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>  	select ARCH_HAS_SET_DIRECT_MAP
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
> +	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> @@ -39,6 +40,7 @@ config RISCV
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY if SMP
>  	select GENERIC_ATOMIC64 if !64BIT
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
>  	select GENERIC_IOREMAP
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index ea028d9e0d24..8325d33411d8 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/cpu.h>
> +#include <linux/clockchips.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/profile.h>
> @@ -27,6 +28,7 @@ enum ipi_message_type {
>  	IPI_CALL_FUNC,
>  	IPI_CPU_STOP,
>  	IPI_IRQ_WORK,
> +	IPI_TIMER,
>  	IPI_MAX
>  };
>
> @@ -176,6 +178,12 @@ void handle_IPI(struct pt_regs *regs)
>  			irq_work_run();
>  		}
>
> +#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
> +		if (ops & (1 << IPI_TIMER)) {
> +			stats[IPI_TIMER]++;
> +			tick_receive_broadcast();
> +		}
> +#endif
>  		BUG_ON((ops >> IPI_MAX) != 0);
>
>  		/* Order data access and bit testing. */
> @@ -192,6 +200,7 @@ static const char * const ipi_names[] = {
>  	[IPI_CALL_FUNC]		= "Function call interrupts",
>  	[IPI_CPU_STOP]		= "CPU stop interrupts",
>  	[IPI_IRQ_WORK]		= "IRQ work interrupts",
> +	[IPI_TIMER]		= "Timer broadcast interrupts",
>  };
>
>  void show_ipi_stats(struct seq_file *p, int prec)
> @@ -217,6 +226,13 @@ void arch_send_call_function_single_ipi(int cpu)
>  	send_ipi_single(cpu, IPI_CALL_FUNC);
>  }
>
> +#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
> +void tick_broadcast(const struct cpumask *mask)
> +{
> +	send_ipi_mask(mask, IPI_TIMER);
> +}
> +#endif
> +
>  void smp_send_stop(void)
>  {
>  	unsigned long timeout;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
