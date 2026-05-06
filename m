Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1FEFF8855
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/PUJKrv2ZRgiE2/OmT12Fhx5K+pojl389wdUnZPsuM=; b=Rj9YzzrfdHv0D/
	DOrWoNM2mmp7AUXBx5umYvKh59Cr+4HX3P9amwkm81rcWShcwuNRv7glmyyXv4kTlAAhc9tPrywBS
	9BSqbuRJgJeKW2ZBgsKQc9AhYOlNJLkM53ibJePhPcEJ19lOmbrl2YdUsf59uzeRY6SEgnILs8zY0
	K7X5qMCraYe98M1yRxNPIm9nwnY7+19fhO+yOSdiR4mQ6xGFM079Vm8KApcE2VEcTgn462M6dlkVh
	bbqOXOfGArCufObqYo+eHe4uidL/v9rUwKupF1scrobRboFsOusomPxPHCEgsQ/KH+DvZ0ChN18R/
	bg6J9zG+Ayg/Iz4whPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKc7P-00000000rqI-11h8;
	Wed, 06 May 2026 13:16:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKc7N-00000000rpT-1Jui
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 13:16:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-449de065cb3so4087934f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778073407; x=1778678207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkLthMXBD6rHNtZ6kKIiz/VN62oSAEzmoivCWMdRkvc=;
        b=Vx4HM1PV82Lim8geShYGc5SBY7X74J61rbqRiqmMOGM1tnd+4T1yCDnOIENOk6ooLt
         fLU8LOW+GrQOajPnads8YKxe4Q3wQwU1JDc/OpBkRWCH7obY7vFoLftR7frboDB+hlYG
         1nFUjV6d6pNqfabOLbAZ8m516DglhEeDIDZXwqhi7JqVic4qJ+1VHkWcCz9FYg0ieneW
         d4d8vRCiAy/cCHr6hUQz8lMBbNELSdMNCF2jd3+tCsfjgJ85wx6KLL7CA/cWDIqgHn6s
         qioLOLEEWuiMvPlGDC74cS6zeqZ8ydHwpuSfMGcDvIk9tLhJoQS/LldZiKuFdMVQkJif
         7Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073407; x=1778678207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zkLthMXBD6rHNtZ6kKIiz/VN62oSAEzmoivCWMdRkvc=;
        b=EwA1Er4MYCGXDYe99Ff2/NrtyVaxQUzYB4qTl8jF9MVNrHwc5HnYgah8UhWmdfgIs3
         o8UaCBErXJ+njp7dtknmMIAUIOBQ8GNatxFxyJliQg0a/9KSTtqD1A6iWbmwsoyxrF1m
         vDQ/KMMd0bBBx9yaKw9SWrp7vfBCm1UpcUsdYhcZtgVklIzI8Wub2u5hzMAmcb4dbxCp
         DwX9TVsY9G9a471gnlwCLmdw35untQ/tEzybsqmqP+r+nmrnfPeEqYCMEs3yzI6wwzMo
         a6ZaIzfyIikSnvz/E2IEoyAIQj5MywnF3/KGaS/T1rSvsfZgrkiQ+h81mxN4/xQtI6RM
         VyOw==
X-Forwarded-Encrypted: i=1; AFNElJ8Jw+15v5o4+svUyQ5VLpiHZAJDc2l8+9+RlR8RLkpIWQDFd6KZEsSCCsYSYAVbeIwCbMtqksZHubjCLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNUD1Up4+7Tcs7Nb+OA6/KT//GntpVXEG+1N7Kg35Eqge/mQmp
	bpBYlhzm4or2skecNDOPzG0X0doX7iRNFKBo/Kt5+7rEp7eVZ+9YSXp5RMwlahOL
X-Gm-Gg: AeBDievqL3sqRsl/xdnHQNFtCnCymDgKBMEByMt4/LE1Ev/AtQYS5n9QavpUf1SYk3M
	NxN2RiUIIN4/3ZwbaQqp4/xvASJzQPa3WM6CaaZii+TzsWc7hpu0la8J6u8dqfQ3MFPnEAaShK2
	PT/jnx2ZzIG1NCnItmpP/0KLJfbGL7SdBJNndMO+U4kGXCYy2k0LEenUgAf07eVB3QvJAAdfENf
	iLftt7/reHUaGT0A3WmeQNiWxBZzbr4N89ohmDFQE8a/uTIHElmxaKfRzE/JVGwI+ioMA3Qp2to
	kmuuq5ZLAaLEOwIeOC1lgwspkWB5GvfzKPbr1h74J2jA7amb/3/TiHlWyeiOC7Qe0TkK8Pb6DOs
	ScXYPfYP/AAeTA9tDFS6ab/jvmlR7TT7BTo8FS89FKFFvHEgRM/udHVuo1Z/TBBjVTER9u10gqv
	HCDc8ETeMJJedp2ha2CqeQ78sPNGeuSzYkXJsKSNJejM6v1+5BUJCplN2md9HFC1nO5Pbl
X-Received: by 2002:a05:6000:2dc8:b0:43c:fc5c:aa0b with SMTP id ffacd0b85a97d-4515df65d9fmr6043762f8f.42.1778073406730;
        Wed, 06 May 2026 06:16:46 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:89b3:e462:e9ca:df27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03df9sm12187126f8f.24.2026.05.06.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:16:45 -0700 (PDT)
Date: Wed, 6 May 2026 15:16:43 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Gleixner <tglx@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: panic if IRQ handler stacks cannot be allocated
Message-ID: <afs_O7DQKOKo6ZTm@osama>
References: <20260404185522.21767-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260404185522.21767-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_061649_376166_2C26465F 
X-CRM114-Status: GOOD (  18.73  )
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

On Sat, Apr 04, 2026 at 08:55:20PM +0200, Osama Abdelkader wrote:
> init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> or scs_alloc return NULL, call panic() in this case.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> - call panic() in place instead of return -ENOMEM
> ---
>  arch/riscv/kernel/irq.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index b6af20bc300f..017d42e778be 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -75,28 +75,34 @@ DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
>  DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
>  #endif
>  
> -static void init_irq_scs(void)
> +static void __init init_irq_scs(void)
>  {
>  	int cpu;
> +	void *s;
>  
>  	if (!scs_is_enabled())
>  		return;
>  
> -	for_each_possible_cpu(cpu)
> -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> -			scs_alloc(cpu_to_node(cpu));
> +	for_each_possible_cpu(cpu) {
> +		s = scs_alloc(cpu_to_node(cpu));
> +		if (!s)
> +			panic("Failed to allocate IRQ shadow call stack resources\n");
> +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> +	}
>  }
>  
>  DEFINE_PER_CPU(ulong *, irq_stack_ptr);
>  
>  #ifdef CONFIG_VMAP_STACK
> -static void init_irq_stacks(void)
> +static void __init init_irq_stacks(void)
>  {
>  	int cpu;
>  	ulong *p;
>  
>  	for_each_possible_cpu(cpu) {
>  		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, cpu_to_node(cpu));
> +		if (!p)
> +			panic("Failed to allocate IRQ stack resources\n");
>  		per_cpu(irq_stack_ptr, cpu) = p;
>  	}
>  }
> @@ -104,7 +110,7 @@ static void init_irq_stacks(void)
>  /* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
>  DEFINE_PER_CPU_ALIGNED(ulong [IRQ_STACK_SIZE/sizeof(ulong)], irq_stack);
>  
> -static void init_irq_stacks(void)
> +static void __init init_irq_stacks(void)
>  {
>  	int cpu;
>  
> @@ -129,8 +135,8 @@ void do_softirq_own_stack(void)
>  #endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
>  
>  #else
> -static void init_irq_scs(void) {}
> -static void init_irq_stacks(void) {}
> +static void __init init_irq_scs(void) {}
> +static void __init init_irq_stacks(void) {}
>  #endif /* CONFIG_IRQ_STACKS */
>  
>  int arch_show_interrupts(struct seq_file *p, int prec)
> -- 
> 2.43.0
> 
ping.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
