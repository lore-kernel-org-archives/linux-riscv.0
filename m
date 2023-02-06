Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4A9C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4njp9WYtX6P8YuEFbftOz3omOOi2jhEDlsbbJ0m+aYM=; b=UgyOcWmwQrw5bQ
	Y3TarmOH7/Ns0AsL2MwIZme1ux5vSrIvbgDk3g+18KFl56QfI/v7co1r9+NEc2pkdJwi/VjboZ3b7
	aLcDaKsk9txW3OrmA3gKa2NkbL711scc8JR7d/k56/TI7v2473i2q6k8t8ixA/550/7GBrFftNzh7
	5jByGPFAWV5DTALIvUb1MHWCNnN1H57YG+NGszhBc3xhirh86QVBVEQ6vURNKETaZ/croYnhO0WEb
	/q82DhVg7GAz2YrY/RgOeWE/0tKOyHmK+/otTcZKrfSm0rGLpJ1r5sWzBoXXFwciNHySN65SQH3qq
	jGk0Ipqp2pzfYfl1HX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzwL-008LMy-9F; Mon, 06 Feb 2023 11:45:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzwJ-008LLn-Fk
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 11:45:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id bh13-20020a05600c3d0d00b003dff6cd8b7eso3316757wmb.5
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 03:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=io5TxYTm89uOwis4jMUJKqqOWIjw0glfkZGNfVGgNSU=;
        b=FC/5NK6QDrqhjg2/7Lbh1v+jYhc9NoQTA2S3rwBO63DuoHzCrgRZPagVpiwP13HI8I
         /13pK6x9yQZKlJgkbmqGK2LH386NzvRHkSit7V1Gt8mNpNv1fTRU4XQdTfbQSAvIT4ns
         CIMiDpUPoyN+bsc6XcuwER/UT+0DbNtIufyt0ZcBL81XwxAWfF+kF0Yxa0eOZKmKT0RX
         uA2J1hiW6bGCas01BvPdb66EpPgBKpjYc4sfrKW6Dj3eMOgMCRkraOA/gBvHd+xSpegh
         66iZK8XO4d20O2wQ07fZa3lySHEo5xkUBlwW3+v1JeVWdK9HidWic/aQTVphdYWpstL8
         jHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io5TxYTm89uOwis4jMUJKqqOWIjw0glfkZGNfVGgNSU=;
        b=uI/kdBEiMxuIjGfLRYhpYTITtJD5VBKCVohX38gtN4Po2cOBsAUIwUaVof3h3Udk87
         U+Oaa2g39G9lD5EjERW75s9QceqLuJw4wE+ytEhPQJsaHvgmUTdhFQz/jSudhOoU8Hkk
         VCp2bqAzPIm65tdXoAYe9f82bLYqRGLuJu8XGnNcxANLFJLFmCvuiGF8OmxpJfpHbNA9
         DcvLPHoYScJ0YHiCgOKVZ0yYc1aUm2mX1oXMkgoe+Z+S1rBCtJQT/IgOGn1F3QkMf8NN
         /t6mVGD6Kg/Zv3Rt7SkxRHdTZlUWsGdPaymnvZMUt75s8taKN7I5+2wb8FsKkRn428Ng
         /uMQ==
X-Gm-Message-State: AO0yUKWZwNcP9HhQD8qgZT3/ANtc5Jjg62PibjCDGXHk/wEadic6FrQI
	x9EKTv181pksiPqYlPZO3oN1hQ==
X-Google-Smtp-Source: AK7set+woglDIefyaTuMiIQ1NVBVkbBZ/GTk5hK+CMxKO2V7IQS7B/4hgjgn1NR9cp4Bk4s/bz/mTg==
X-Received: by 2002:a05:600c:538b:b0:3df:a04a:1a7 with SMTP id hg11-20020a05600c538b00b003dfa04a01a7mr15145742wmb.22.1675683937343;
        Mon, 06 Feb 2023 03:45:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c13-20020a056000104d00b002bfebe2d67esm8816271wrx.9.2023.02.06.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 03:45:37 -0800 (PST)
Date: Mon, 6 Feb 2023 12:45:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 07/14] RISC-V: KVM: Add skeleton support for perf
Message-ID: <20230206114536.oif5huw4jqhsdtic@orel>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
 <20230205011515.1284674-8-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205011515.1284674-8-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_034539_559065_6B1C5660 
X-CRM114-Status: GOOD (  21.41  )
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

On Sat, Feb 04, 2023 at 05:15:08PM -0800, Atish Patra wrote:
> This patch only adds barebone structure of perf implementation. Most of
> the function returns zero at this point and will be implemented
> fully in the future.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     |   4 +
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  78 +++++++++++++++
>  arch/riscv/kvm/Makefile               |   1 +
>  arch/riscv/kvm/vcpu.c                 |   7 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 135 ++++++++++++++++++++++++++
>  5 files changed, 225 insertions(+)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
>  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 93f43a3..b90be9a 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -18,6 +18,7 @@
>  #include <asm/kvm_vcpu_insn.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
> +#include <asm/kvm_vcpu_pmu.h>
>  
>  #define KVM_MAX_VCPUS			1024
>  
> @@ -228,6 +229,9 @@ struct kvm_vcpu_arch {
>  
>  	/* Don't run the VCPU (blocked) */
>  	bool pause;
> +
> +	/* Performance monitoring context */
> +	struct kvm_pmu pmu_context;
>  };
>  
>  static inline void kvm_arch_hardware_unsetup(void) {}
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> new file mode 100644
> index 0000000..40905db
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Rivos Inc
> + *
> + * Authors:
> + *     Atish Patra <atishp@rivosinc.com>
> + */
> +
> +#ifndef __KVM_VCPU_RISCV_PMU_H
> +#define __KVM_VCPU_RISCV_PMU_H
> +
> +#include <linux/perf/riscv_pmu.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +#include <asm/sbi.h>
> +
> +#ifdef CONFIG_RISCV_PMU_SBI
> +#define RISCV_KVM_MAX_FW_CTRS	32
> +
> +#if RISCV_KVM_MAX_FW_CTRS > 32
> +#error "Maximum firmware counter can not exceed 32 without increasing the RISCV_MAX_COUNTERS"
                                    ^cannot                              ^ no the

> +#endif
> +
> +#define RISCV_MAX_COUNTERS 64

I'm still not sure about the above. I wrote more in the v4 thread
about it.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
