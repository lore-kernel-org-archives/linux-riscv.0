Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27535C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQmElLNgdqPm1QaB9Fj+2e4mtJM2GWeBJZFOb+uoW2I=; b=VT9d0p6ns0QVil
	itAohUhwOGFaCZd3haVFYZ26bVfWTMmeKLpyPWQFcmp3rULOlXnByKazmFmQCbpFP7CvLnX/TA+wr
	7LXLKUnYu6bUGG2ZMU3hh09EsQPQILsVrXHFGF95ZlN10Hjex1kDjFjs3zycz+mqSpXIRKD9kKOcw
	2fH9yxhtZf7g3ZMT8+GPCYQmczmtmwbeg9LbHGf3L9VnAjyF5xneOC+laE6Ix9J7O+b+qCv5B4BaM
	PLHWyXu/Hy5u8FBOLwHhEvGXwfGR2Du93SgRHBgLk3JuLqqqN2YGIBl+W9CsLvvPsRWM7hoxHFjJy
	8E3q6l92V1A8T0L+HaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp3OS-004cva-27;
	Wed, 19 Apr 2023 08:42:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp3OQ-004cuE-0m
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 08:42:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id r15so7147716wmo.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681893737; x=1684485737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dI4gg2igg6AIeyroVNuQHRouhhEwWzZhmrfKiY1DeJY=;
        b=bR3pAcq1sgLfrZrL2l4v9pIOZfeOQUt2Ia3vMESH6di5pQUP4VrT/tTTjeygWOJ3Vn
         K692tXhk1kUYD1/V+6txRIls3ZgY13Qq4PcVVVyBqV57BxlkcSdKT5PMHpXbgJBFJ/ae
         fmejsEzZusJoag2ekzJ+LlEI6PL4aEMg4AWKCPqcVIGUL1f22of7kOftSAqr+80N8YoF
         r1kNT70Okw7NUe2+ZV1wTNZfR3xUeO/AK8y+jRavmGuJtOEcckZktn8So0cjtuDY9zA0
         z4riAprynxTjR5EZPfvfJoq2XAlUG3Nk4MGcgSVJD9fy/NnapD8O3d/g2D2ehAn30b7R
         JnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681893737; x=1684485737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI4gg2igg6AIeyroVNuQHRouhhEwWzZhmrfKiY1DeJY=;
        b=BLnLqpQ3ZjhmECtSrfmThQsf0yKlUvDbONTSHzr28e65P65QH5Pltmz3WajnDOPRF1
         qWaz+efb3VOCTAZXftYvj2AT1lec7LBtUtiDob8LpdSYrhnmjmijS/m00HpsJZh9ic38
         WEf/X7jPvq8ksw1PetIRAw/7aGm1O4rd2nC5hjL2TmgRJSq0Z1uOAQzancPG8X7djRF1
         Ou1MMeYGT62S/Kj2875Y9jlQxw7aXq47iDH71cyJzJc+xX7gIy0pjsk9tdgiY3MrFkQX
         WSEcZxeQWK15dZnRH34MqMUSzQTWEfFEhZ0zfDg0Cy79sXgSX2qj5SpkM/QmWO6x8K2U
         Df2w==
X-Gm-Message-State: AAQBX9d1uK/XpVnV8sB6YxLIDkqD4v+23SZWn5JVapepc647hmA2QS8b
	pI4pGBkyihKfIy0ODd1ZXqpSEA==
X-Google-Smtp-Source: AKy350au3QVNohrAqQ5Uf0FccByA3jbACN6lHBsCA+giCVCh3vnwAW7Bd1XRlewSyylOigqvoNew4Q==
X-Received: by 2002:a7b:c40a:0:b0:3f1:7372:66d1 with SMTP id k10-20020a7bc40a000000b003f1737266d1mr7186605wmi.0.1681893737599;
        Wed, 19 Apr 2023 01:42:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c181000b003f046ad52efsm1440063wmp.31.2023.04.19.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 01:42:17 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:42:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>, 
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 
	'Paolo Bonzini ' <pbonzini@redhat.com>, 'Juergen Gross ' <jgross@suse.com>, 
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 'Anup Patel ' <anup@brainfault.org>, 
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <245mmbzeqcap7i6cjmoaaitpmecefjo2ul63qjmodjv77uz54e@tizorx3p64fz>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417103402.798596-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_014222_284801_117F99B4 
X-CRM114-Status: GOOD (  23.63  )
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

On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:
> When the SBI STA extension exists we can use it to implement
> paravirt steal-time support. Fill in the empty pv-time functions
> with an SBI STA implementation.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/paravirt.c | 56 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> index 141dbcc36fa2..5f8d96b919e4 100644
> --- a/arch/riscv/kernel/paravirt.c
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -6,12 +6,21 @@
>  #define pr_fmt(fmt) "riscv-pv: " fmt
>  
>  #include <linux/cpuhotplug.h>
> +#include <linux/compiler.h>
> +#include <linux/errno.h>
>  #include <linux/init.h>
>  #include <linux/jump_label.h>
> +#include <linux/kconfig.h>
> +#include <linux/kernel.h>
> +#include <linux/percpu-defs.h>
>  #include <linux/printk.h>
>  #include <linux/static_call.h>
>  #include <linux/types.h>
>  
> +#include <asm/barrier.h>
> +#include <asm/page.h>
> +#include <asm/sbi.h>
> +
>  struct static_key paravirt_steal_enabled;
>  struct static_key paravirt_steal_rq_enabled;
>  
> @@ -31,24 +40,65 @@ static int __init parse_no_stealacc(char *arg)
>  
>  early_param("no-steal-acc", parse_no_stealacc);
>  
> +DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
> +
>  static bool __init has_pv_steal_clock(void)
>  {
> +	if (sbi_probe_extension(SBI_EXT_STA) > 0) {
> +		pr_info("SBI STA extension detected\n");
> +		return true;
> +	}
> +
>  	return false;
>  }
>  
> -static int pv_time_cpu_online(unsigned int cpu)
> +static int sbi_sta_set_steal_time_shmem(unsigned long lo, unsigned long hi,
> +					unsigned long flags)
>  {
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_SET_STEAL_TIME_SHMEM,
> +			lo, hi, flags, 0, 0, 0);
> +	if (ret.error) {
> +		if (lo == -1 && hi == -1)
> +			pr_warn("Failed to disable steal-time shmem");
> +		else
> +			pr_warn("Failed to set steal-time shmem");
> +		return -ENOMEM;
> +	}
> +
>  	return 0;
>  }
>  
> +static int pv_time_cpu_online(unsigned int cpu)
> +{
> +	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
> +	phys_addr_t pa = __pa(st);
> +	unsigned long lo = (unsigned long)pa;
> +	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
> +
> +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> +}
> +
>  static int pv_time_cpu_down_prepare(unsigned int cpu)
>  {
> -	return 0;
> +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
>  }
>  
>  static u64 pv_time_steal_clock(int cpu)
>  {
> -	return 0;
> +	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
> +	u32 sequence;
> +	u64 steal;
> +
> +	do {
> +		sequence = st->sequence;
> +		virt_rmb();
> +		steal = st->steal;
> +		virt_rmb();
> +	} while ((sequence & 1) || (sequence != st->sequence));
> +
> +	return steal;
>  }

So anybody poking around the implementations for other architectures will
see that I shamelessly ripped this off from x86's implementation. However,
looking at it again, I think all the references to the steal-time info
should be wrapped in READ_ONCE(). I'll write a patch for x86/kvm to
add READ_ONCE's and also update this patch for rfc-v2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
