Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psvlUz2N4DprSW3bh40hOdcDtHR0/UaHjTZWkREJncg=; b=ixfnb0ElwSZhNB
	oHLMqnRmDFj8yoj4MrGgXnHw6GFQRJAYtD5etpD+e+yXMgMlK89oVXPaWRMFJ6vLxkhK1wrOu8rI6
	7vJUWk58fk4mALQqUd6Rf9MIag5y3Do6OuM4nux9aYpzawIllOcT7WMWstc0fp4ZyDpja15n0bz/6
	C2LhBK6KfaGrX3e2P50W1FPE9vxFycXVAUw254at3DeGxGfmWVtCCud7QMFX3uIF7fO+Y67Ym8hzg
	crvv9e2xD0lyoT5DymS60cwGjCnTnO1QkDThzCcce/dCp0xIz2/8ZY842sxOfqEeooZ0x1WYhdCjq
	jgdoi5ElOqVnrVqJZdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPpD-00EwVr-1a;
	Wed, 13 Dec 2023 14:02:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPpA-00EwTX-2T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 14:02:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c41df5577so38148555e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 06:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702476173; x=1703080973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8CNgTMGbobolB1r9w8VNb165BlBAplPuvdaxYrWog0=;
        b=L/dZ/mW11NP+0umYFUe5ruHtlCvURyLOiMR69aQeqRfrFwsRM8+xeBUw8RYocxE6SU
         23+LhyA4HpDBOPtY3IvShVmeAg/KI5sgi9vm8yM5y+tpx/gOhSbVqnxi1XaX5D7CZb1x
         KrukpNcpAsdwQfME/sqyA+CZST4+4t6RxppLhGFYHmCjGRGkeDpHxeMGDXBKCwoKTjEw
         n4Qz+PDFvPi4QBlMuOTpwGdkMVG45EeUcSsK+osfdWBc2QaRZ8tc1YnwrbVxR2q4z3FJ
         XZbPHVbvS75S/2woCBwG5hB2KFtiyiuK88splJEIHj0RNe5NZuAUbJklKddRdBcusDF9
         WVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476173; x=1703080973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8CNgTMGbobolB1r9w8VNb165BlBAplPuvdaxYrWog0=;
        b=ueDzyAvyPu5Eb2p/rHiY+H03RcfyoT1O9Rhwfk3lbPa/q+KDF0cEB40RStf1qdfVvO
         CSHRuQPDDc5a/cEKQ1RFX7B52wcbVORSFupqalGy9q9HToiatLH8cXj3up14YvDEjbNc
         Gz75Kje+UbQjvqERx1CuOtj1yKrjqcd8j0LBWpq4LOn28VLbqtpvyRO/f9YN0VjkpUyk
         ezgOxKLKi0rNklQsD63nc0JRy3YT7r47mUS4CXftkBRCbI6PMKhmF50287Vxt1a/CRMi
         k/1ibXzQzabIjwR3DVz/d4ONZim24PXNWzLKqAXF4D4/stQzmz/5auMY7nqjfFSScgLF
         mMGg==
X-Gm-Message-State: AOJu0YwQ92rLjMDiqBriH++HEnEsJCTseWe0HM8Gew9Jj5pebDkzR++1
	ZtS4o87xe1NFZaMKEKMQbKm0Ig==
X-Google-Smtp-Source: AGHT+IHHe1VYvYeZf/3ceduRCoWvVbIdH20JSg3fNMXtxhw7fHkTGIiZ2b27mL7MboW3CuD0I846lA==
X-Received: by 2002:a05:600c:2483:b0:40c:3314:5be0 with SMTP id 3-20020a05600c248300b0040c33145be0mr1879277wms.295.1702476172702;
        Wed, 13 Dec 2023 06:02:52 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fm14-20020a05600c0c0e00b00407b93d8085sm22968185wmb.27.2023.12.13.06.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:02:52 -0800 (PST)
Date: Wed, 13 Dec 2023 15:02:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Thomas Huth <thuth@redhat.com>, Aaron Lewis <aaronlewis@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 05/11] tools: riscv: Add header file vdso/processor.h
Message-ID: <20231213-9d5ad03bed3056007c6e714d@orel>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <7b633cc441f5133608597463301fef122f5174d3.1702371136.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b633cc441f5133608597463301fef122f5174d3.1702371136.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_060256_806157_C2BD0650 
X-CRM114-Status: GOOD (  16.23  )
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

On Tue, Dec 12, 2023 at 05:31:14PM +0800, Haibo Xu wrote:
> Borrow the cpu_relax() definitions from kernel's
> arch/riscv/include/asm/vdso/processor.h to tools/ for riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/arch/riscv/include/asm/vdso/processor.h | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
> 
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> new file mode 100644
> index 000000000000..662aca039848
> --- /dev/null
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_VDSO_PROCESSOR_H
> +#define __ASM_VDSO_PROCESSOR_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <asm-generic/barrier.h>
> +
> +static inline void cpu_relax(void)
> +{
> +#ifdef __riscv_muldiv
> +	int dummy;
> +	/* In lieu of a halt instruction, induce a long-latency stall. */
> +	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> +#endif
> +
> +#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> +	/*
> +	 * Reduce instruction retirement.
> +	 * This assumes the PC changes.
> +	 */
> +	__asm__ __volatile__ ("pause");
> +#else
> +	/* Encoding of the pause instruction */
> +	__asm__ __volatile__ (".4byte 0x100000F");
> +#endif
> +	barrier();
> +}
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ASM_VDSO_PROCESSOR_H */
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
