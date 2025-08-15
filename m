Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C4CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf9eXwTMcTJbTQE/L1PxJwVvtSKUz26lef3Rwt/pqnw=; b=GkQh1ZBwERJ0yb
	LvdJIuy17hPS6iBSGGi5QhgAUbXgDhVzB2iwanqW1CwQbYj92scAlhJ11EC58NLLZT7SVYnGxWWjY
	SUTD1OOeuXO5CjPl3ltSuZHBYg5219/MBj1gYXZuu0ditjEfaX9D1JLZo1v62eXd9yEs4jBqDdnJP
	E6x0+D7jXDechVDWi37h965kpxmsHe1GhD6211rF4SX0vlli8rc/TR6Y1YcViRonioZ4BQJuuTv20
	ywIynOtV5AF72joSrzG3IhVm0hdDFIn8ftrGvkAffnBF6Ixp37rcyE2b5OTVIf7en9b1aKN//rEw1
	aSNUzdJ5uRojoERlbizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0uj-00000003RiV-21da;
	Fri, 15 Aug 2025 20:20:37 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0cm-00000003Oj1-3lyV
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 20:02:06 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-61bd4e002afso639724eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755288124; x=1755892924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pcuxVVhwBqk6/ThFcilXJFO7I/Y8OkGOhPu8yVAUZTE=;
        b=d0x7aU7zw4T4DUnZef9ISv4YAvdXvcGy5HmmfynsCD9d07o/9tT6Wa3MnOSV+0jNsZ
         3xRgLt1u/8Kws2gc2ZAmuyjIDUb9+x1s1KMIj1V/yz5JFAxcMuZ+6EqX5PB6SkRF8hMf
         w7+5yfauiJD1GCg3B0K41iY6NEO67HLIugeEV42j0XiWsN8TbY0TnWleoV++dXjCnmuQ
         GQlpNmpYipF/ggbD911XKdlk/wGHHH8fw068p6cThXLZhOWESTZD2GUD8We251H84VA+
         6l/yhYrL9mqMoLvjHY4Ev5n9/U1snqsNOckTmsN+vgwC9fLkw0umIcwDTX2XDqTjHwPZ
         uMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288124; x=1755892924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcuxVVhwBqk6/ThFcilXJFO7I/Y8OkGOhPu8yVAUZTE=;
        b=mt1zc52OveqOZlc3ZGQyM+PKzr5HcLaDNJDmrNP+1mdHEOX7779JqWN6851nK2s1nB
         hAfPtCTUa9aQG37kfM090s5HrdLjoCyBOgNXkF/t3S4cjfW2Z1idiB4uLoDiTuP8Bjvr
         oao8OYqY8m8NoT2NJ9LfgypGoieKpT2riRt/Hl6fv8acnVhGLS5xmmvq6w6Tive5toZv
         hSg+22cODyk6vNIFrlKFE6ZTS3QA6FprrExbe7c5yDu6NVo9v0PRkN698Qy/xvxffaDa
         Fl7SaZc6JanCCFDvIABCH5zpQHS8V2BU7eMEwqfm2pP1zwa9xsGw7Z4HBniP6ilG366K
         FF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhKi9AeyY6tGHFd7sE19qbxWdI2VPKjMSvGyj7qrbX0hoH+F0+jth+j7J2VveGxb8nr6ITILxsnFFZBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgxRlO25k1Z/6Kt++elirsLD8eytnMBqueOQhpSKye/2ZsIkIi
	3EeqBtcMTg0h087UIOM5Xffc8ej+Uu03y89ABFs9OOmrYkg0aGAC2/rvzRboBM6qh1c=
X-Gm-Gg: ASbGnctqpM8A0H4fX4jeDTkY/YSLrEn7idds0cOrq9WujtcRcm+cD/CVaTLNu+qo3jm
	DPgRUSSUcbi+W/ArR2o6b+PuptAiLkB86isymmnA5sQhhlTOMJumvcWnsYtDPDprrpyQAvO7t7k
	HkQedZ68EAbBmUH8UQhkjtL9tFh7Xj0rRQuAbf+D+s0OYaGXbm5na2I9yRPHxBw222S9wjy8vNC
	d+t/ehxvqx7ocieIfr1juJZjX7i22qQh/sb07urbKrk+GiwSrH/3QZxxNcAlpXqpvB3Xm/QH9K2
	kh2kFbZFGGtygzlygJf0HgPruQi6hroN9TQn8nuqkSUEbNxzKXW9oP9w8OLrVzNskBqaa/pENoC
	oTLO6cs7i2eMhyBVxaTymPLHF
X-Google-Smtp-Source: AGHT+IH6UijrJj9CokQ7LeOZUer1dBOG0/ag/iMKh5MHL6K68xaBLTbERAAjBI3+UFgVXTVGT2cXIw==
X-Received: by 2002:a05:6808:3a0e:b0:435:8501:2b96 with SMTP id 5614622812f47-435ec540455mr1913900b6e.21.1755288123755;
        Fri, 15 Aug 2025 13:02:03 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949f85b6sm589160173.67.2025.08.15.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:02:03 -0700 (PDT)
Date: Fri, 15 Aug 2025 15:02:02 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
Message-ID: <20250815-e69bdc695cf78e6ce07e580c@orel>
References: <20250815161406.76370-1-apatel@ventanamicro.com>
 <20250815161406.76370-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815161406.76370-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_130204_948394_3B809237 
X-CRM114-Status: GOOD (  28.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 15, 2025 at 09:44:06PM +0530, Anup Patel wrote:
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h |   3 +
>  arch/riscv/kernel/Makefile   |   1 +
>  arch/riscv/kernel/csr.c      | 177 +++++++++++++++++++++++++++++++++++
>  drivers/acpi/riscv/cppc.c    |  17 ++--
>  drivers/perf/riscv_pmu.c     |  43 +--------
>  5 files changed, 189 insertions(+), 52 deletions(-)
>  create mode 100644 arch/riscv/kernel/csr.c
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 6fed42e37705..1540626b3540 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -575,6 +575,9 @@
>  			      : "memory");			\
>  })
>  
> +extern unsigned long csr_read_num(unsigned long csr_num, int *out_err);
> +extern void csr_write_num(unsigned long csr_num, unsigned long val, int *out_err);

My preference would be for an interface with the return/err parameters the
other way around, i.e.

int csr_read_num(unsigned long csr_num, unsigned long *val);
int csr_write_num(unsigned long csr_num, unsigned long val);

and then ensure all callers always check that the return value is zero
before proceeding to use val or assume val was written.

> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_CSR_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c7b542573407..0a75e20bde18 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -50,6 +50,7 @@ obj-y	+= soc.o
>  obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
>  obj-y	+= cpu.o
>  obj-y	+= cpufeature.o
> +obj-y	+= csr.o
>  obj-y	+= entry.o
>  obj-y	+= irq.o
>  obj-y	+= process.o
> diff --git a/arch/riscv/kernel/csr.c b/arch/riscv/kernel/csr.c
> new file mode 100644
> index 000000000000..f7de45bb597c
> --- /dev/null
> +++ b/arch/riscv/kernel/csr.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#define pr_fmt(fmt) "riscv: " fmt
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +#include <asm/csr.h>
> +
> +#define CSR_CUSTOM0_U_RW_BASE		0x800
> +#define CSR_CUSTOM0_U_RW_COUNT		0x100
> +
> +#define CSR_CUSTOM1_U_RO_BASE		0xCC0
> +#define CSR_CUSTOM1_U_RO_COUNT		0x040
> +
> +#define CSR_CUSTOM2_S_RW_BASE		0x5C0
> +#define CSR_CUSTOM2_S_RW_COUNT		0x040
> +
> +#define CSR_CUSTOM3_S_RW_BASE		0x9C0
> +#define CSR_CUSTOM3_S_RW_COUNT		0x040
> +
> +#define CSR_CUSTOM4_S_RO_BASE		0xDC0
> +#define CSR_CUSTOM4_S_RO_COUNT		0x040
> +
> +#define CSR_CUSTOM5_HS_RW_BASE		0x6C0
> +#define CSR_CUSTOM5_HS_RW_COUNT		0x040
> +
> +#define CSR_CUSTOM6_HS_RW_BASE		0xAC0
> +#define CSR_CUSTOM6_HS_RW_COUNT		0x040
> +
> +#define CSR_CUSTOM7_HS_RO_BASE		0xEC0
> +#define CSR_CUSTOM7_HS_RO_COUNT		0x040
> +
> +#define CSR_CUSTOM8_M_RW_BASE		0x7C0
> +#define CSR_CUSTOM8_M_RW_COUNT		0x040
> +
> +#define CSR_CUSTOM9_M_RW_BASE		0xBC0
> +#define CSR_CUSTOM9_M_RW_COUNT		0x040
> +
> +#define CSR_CUSTOM10_M_RO_BASE		0xFC0
> +#define CSR_CUSTOM10_M_RO_COUNT		0x040
> +
> +unsigned long csr_read_num(unsigned long csr_num, int *out_err)
> +{
> +#define switchcase_csr_read(__csr_num)				\
> +	case (__csr_num):					\
> +		return csr_read(__csr_num)
> +#define switchcase_csr_read_2(__csr_num)			\
> +	switchcase_csr_read(__csr_num + 0);			\
> +	switchcase_csr_read(__csr_num + 1)
> +#define switchcase_csr_read_4(__csr_num)			\
> +	switchcase_csr_read_2(__csr_num + 0);			\
> +	switchcase_csr_read_2(__csr_num + 2)
> +#define switchcase_csr_read_8(__csr_num)			\
> +	switchcase_csr_read_4(__csr_num + 0);			\
> +	switchcase_csr_read_4(__csr_num + 4)
> +#define switchcase_csr_read_16(__csr_num)			\
> +	switchcase_csr_read_8(__csr_num + 0);			\
> +	switchcase_csr_read_8(__csr_num + 8)
> +#define switchcase_csr_read_32(__csr_num)			\
> +	switchcase_csr_read_16(__csr_num + 0);			\
> +	switchcase_csr_read_16(__csr_num + 16)
> +#define switchcase_csr_read_64(__csr_num)			\
> +	switchcase_csr_read_32(__csr_num + 0);			\
> +	switchcase_csr_read_32(__csr_num + 32)
> +#define switchcase_csr_read_128(__csr_num)			\
> +	switchcase_csr_read_64(__csr_num + 0);			\
> +	switchcase_csr_read_64(__csr_num + 64)
> +#define switchcase_csr_read_256(__csr_num)			\
> +	switchcase_csr_read_128(__csr_num + 0);			\
> +	switchcase_csr_read_128(__csr_num + 128)
> +
> +	if (out_err)
> +		*out_err = 0;
> +
> +	switch (csr_num) {
> +	switchcase_csr_read_32(CSR_CYCLE);
> +	switchcase_csr_read_32(CSR_CYCLEH);
> +	switchcase_csr_read_256(CSR_CUSTOM0_U_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM1_U_RO_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM2_S_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM3_S_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM4_S_RO_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM5_HS_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM6_HS_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM7_HS_RO_BASE);
> +#ifdef CONFIG_RISCV_M_MODE
> +	switchcase_csr_read_64(CSR_CUSTOM8_M_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM9_M_RW_BASE);
> +	switchcase_csr_read_64(CSR_CUSTOM10_M_RO_BASE);
> +#endif
> +	default:
> +		if (out_err)
> +			*out_err = -EINVAL;
> +		else
> +			pr_err("%s: csr 0x%lx not supported\n", __func__, csr_num);
> +		break;
> +	}
> +
> +	return 0;
> +#undef switchcase_csr_read_256
> +#undef switchcase_csr_read_128
> +#undef switchcase_csr_read_64
> +#undef switchcase_csr_read_32
> +#undef switchcase_csr_read_16
> +#undef switchcase_csr_read_8
> +#undef switchcase_csr_read_4
> +#undef switchcase_csr_read_2
> +#undef switchcase_csr_read
> +}
> +EXPORT_SYMBOL_GPL(csr_read_num);
> +
> +void csr_write_num(unsigned long csr_num, unsigned long val, int *out_err)
> +{
> +#define switchcase_csr_write(__csr_num, __val)			\
> +	case (__csr_num):					\
> +		csr_write(__csr_num, __val);			\
> +		break
> +#define switchcase_csr_write_2(__csr_num, __val)		\
> +	switchcase_csr_write(__csr_num + 0, __val);		\
> +	switchcase_csr_write(__csr_num + 1, __val)
> +#define switchcase_csr_write_4(__csr_num, __val)		\
> +	switchcase_csr_write_2(__csr_num + 0, __val);		\
> +	switchcase_csr_write_2(__csr_num + 2, __val)
> +#define switchcase_csr_write_8(__csr_num, __val)		\
> +	switchcase_csr_write_4(__csr_num + 0, __val);		\
> +	switchcase_csr_write_4(__csr_num + 4, __val)
> +#define switchcase_csr_write_16(__csr_num, __val)		\
> +	switchcase_csr_write_8(__csr_num + 0, __val);		\
> +	switchcase_csr_write_8(__csr_num + 8, __val)
> +#define switchcase_csr_write_32(__csr_num, __val)		\
> +	switchcase_csr_write_16(__csr_num + 0, __val);		\
> +	switchcase_csr_write_16(__csr_num + 16, __val)
> +#define switchcase_csr_write_64(__csr_num, __val)		\
> +	switchcase_csr_write_32(__csr_num + 0, __val);		\
> +	switchcase_csr_write_32(__csr_num + 32, __val)
> +#define switchcase_csr_write_128(__csr_num, __val)		\
> +	switchcase_csr_write_64(__csr_num + 0, __val);		\
> +	switchcase_csr_write_64(__csr_num + 64, __val)
> +#define switchcase_csr_write_256(__csr_num, __val)		\
> +	switchcase_csr_write_128(__csr_num + 0, __val);		\
> +	switchcase_csr_write_128(__csr_num + 128, __val)
> +
> +	if (out_err)
> +		*out_err = 0;
> +
> +	switch (csr_num) {
> +	switchcase_csr_write_256(CSR_CUSTOM0_U_RW_BASE, val);
> +	switchcase_csr_write_64(CSR_CUSTOM2_S_RW_BASE, val);
> +	switchcase_csr_write_64(CSR_CUSTOM3_S_RW_BASE, val);
> +	switchcase_csr_write_64(CSR_CUSTOM5_HS_RW_BASE, val);
> +	switchcase_csr_write_64(CSR_CUSTOM6_HS_RW_BASE, val);
> +#ifdef CONFIG_RISCV_M_MODE
> +	switchcase_csr_write_64(CSR_CUSTOM8_M_RW_BASE, val);
> +	switchcase_csr_write_64(CSR_CUSTOM9_M_RW_BASE, val);
> +#endif
> +	default:
> +		if (out_err)
> +			*out_err = -EINVAL;
> +		else
> +			pr_err("%s: csr 0x%lx not supported\n", __func__, csr_num);
> +		break;
> +	}
> +#undef switchcase_csr_write_256
> +#undef switchcase_csr_write_128
> +#undef switchcase_csr_write_64
> +#undef switchcase_csr_write_32
> +#undef switchcase_csr_write_16
> +#undef switchcase_csr_write_8
> +#undef switchcase_csr_write_4
> +#undef switchcase_csr_write_2
> +#undef switchcase_csr_write
> +}
> +EXPORT_SYMBOL_GPL(csr_write_num);
> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
> index 42c1a9052470..fe491937ed25 100644
> --- a/drivers/acpi/riscv/cppc.c
> +++ b/drivers/acpi/riscv/cppc.c
> @@ -65,24 +65,19 @@ static void sbi_cppc_write(void *write_data)
>  static void cppc_ffh_csr_read(void *read_data)
>  {
>  	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
> +	int err;
>  
> -	switch (data->reg) {
> -	/* Support only TIME CSR for now */
> -	case CSR_TIME:
> -		data->ret.value = csr_read(CSR_TIME);
> -		data->ret.error = 0;
> -		break;
> -	default:
> -		data->ret.error = -EINVAL;
> -		break;
> -	}
> +	data->ret.value = csr_read_num(data->reg, &err);
> +	data->ret.error = err;
>  }
>  
>  static void cppc_ffh_csr_write(void *write_data)
>  {
>  	struct sbi_cppc_data *data = (struct sbi_cppc_data *)write_data;
> +	int err;
>  
> -	data->ret.error = -EINVAL;
> +	csr_write_num(data->reg, data->val, &err);
> +	data->ret.error = err;
>  }
>  
>  /*
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 7644147d50b4..aa053254448d 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -16,6 +16,7 @@
>  #include <linux/smp.h>
>  #include <linux/sched_clock.h>
>  
> +#include <asm/csr.h>
>  #include <asm/sbi.h>
>  
>  static bool riscv_perf_user_access(struct perf_event *event)
> @@ -88,46 +89,6 @@ void arch_perf_update_userpage(struct perf_event *event,
>  	userpg->cap_user_time_short = 1;
>  }
>  
> -static unsigned long csr_read_num(int csr_num)
> -{
> -#define switchcase_csr_read(__csr_num, __val)		{\
> -	case __csr_num:					\
> -		__val = csr_read(__csr_num);		\
> -		break; }
> -#define switchcase_csr_read_2(__csr_num, __val)		{\
> -	switchcase_csr_read(__csr_num + 0, __val)	 \
> -	switchcase_csr_read(__csr_num + 1, __val)}
> -#define switchcase_csr_read_4(__csr_num, __val)		{\
> -	switchcase_csr_read_2(__csr_num + 0, __val)	 \
> -	switchcase_csr_read_2(__csr_num + 2, __val)}
> -#define switchcase_csr_read_8(__csr_num, __val)		{\
> -	switchcase_csr_read_4(__csr_num + 0, __val)	 \
> -	switchcase_csr_read_4(__csr_num + 4, __val)}
> -#define switchcase_csr_read_16(__csr_num, __val)	{\
> -	switchcase_csr_read_8(__csr_num + 0, __val)	 \
> -	switchcase_csr_read_8(__csr_num + 8, __val)}
> -#define switchcase_csr_read_32(__csr_num, __val)	{\
> -	switchcase_csr_read_16(__csr_num + 0, __val)	 \
> -	switchcase_csr_read_16(__csr_num + 16, __val)}
> -
> -	unsigned long ret = 0;
> -
> -	switch (csr_num) {
> -	switchcase_csr_read_32(CSR_CYCLE, ret)
> -	switchcase_csr_read_32(CSR_CYCLEH, ret)
> -	default :
> -		break;
> -	}
> -
> -	return ret;
> -#undef switchcase_csr_read_32
> -#undef switchcase_csr_read_16
> -#undef switchcase_csr_read_8
> -#undef switchcase_csr_read_4
> -#undef switchcase_csr_read_2
> -#undef switchcase_csr_read
> -}
> -
>  /*
>   * Read the CSR of a corresponding counter.
>   */
> @@ -139,7 +100,7 @@ unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
>  		return -EINVAL;
>  	}
>  
> -	return csr_read_num(csr);
> +	return csr_read_num(csr, NULL);
>  }
>  
>  u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
> -- 
> 2.43.0
>

Other than the suggestion to flip the interface,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
