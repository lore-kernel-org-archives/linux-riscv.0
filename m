Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA666CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh0TJ0HvhF+I50j9BruiuWogn9a8//GrUVl24MP+hY4=; b=PxYAxhmSqNQbHa
	iNUO3rn2ehWeP3moV+AYPj5EkyQbrOoaUw+O8ETw08xPTT23wvLvXfaYL31jKoNsUERAtH+RW6PGG
	n+GDAMuqzqdB25tFV8atP4CZRy2IfOvezDq6d1HbhwgsXsEO7GD86UW9VRPU5oUGtGsz1bxl80n1t
	rBvYVwdPYNTo0DGHhUIPb41/5usH1gtU2dXmic+yknjwICSxU1pkoWTdr31N/Vtp9fmiGJp/8oOnw
	ZnwpsBZgOW2tbbc3yECit+aLLiw8xPZF2dYq8yCHhyYs+vkTyPKxpjY79rns2Y4uKrCSzY2/dtbms
	AusREmECdg9Ep+q3eJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrC5-00000006Qiq-2g1Y;
	Mon, 18 Aug 2025 04:10:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrC2-00000006QhS-39S1
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:09:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24457f53d2eso43550935ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490198; x=1756094998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cic6m/dj0aD9eVh/PT4j71J5W/VVI1QVdV93xvllQvk=;
        b=jlGZ86C+ZDjGuKLLfq+9CmaYiAp2RXXhvUN/rUxZAOlVvj3vh8+8J6W3Ewe5MApH7/
         CweqOiicXqhKPPh2+7a4PQnsCFgzpa8XVPVue3qwPbK8Vs5/BfZ/xzdZUZ1g7rIeSt/q
         W7cWpcJ7AMJoWvuSuj3EF5G0c5oyoDv6OPUzHmOqfQgxQp47kCr9qv5aHR/+jY4ADVE2
         cT0FJ1oPSX8uMHQdDKXaW7M57GH+jbzJnqLdWYME1dcqJAsRUR9vRM5zF3zeEtguYgEv
         6ZqhGi1I5d/oGXp+UjtQUirW+vQxL+WcVAznhWM2sRAmxDvrl1+WaeG/tz37gUdFYUut
         NS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490198; x=1756094998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cic6m/dj0aD9eVh/PT4j71J5W/VVI1QVdV93xvllQvk=;
        b=PkV6zGYRE8pfOJYExLTmXRJy9/hSTmT9rpDM3RYI6oWVLJzn6gq08Vmnlk6/V0SPJg
         Myn80GK1A+IPXU9JX0zmJpGmNyRUoayqT8KkIzCQW+0scjtzoHqOsFJN2DmCwtDaVhjt
         myzSrKvtQZbR8BPLgniQOeMfQQUE7rPqP6LmfTaaMtt+Gu2n9TFmwEgLvoj3M+2yHzs8
         aGKWEwRnGgDJbuk308qnHG04D3+OXRXORmmfxFFUEZvnli2pZWVyjTVGv5xsaGn7VwXo
         p4xDXhgR7I2SYUWzpYFXHZMuxViyc9AFbJc2IvlaLeymTpdavr/oDp1lNfocV5Tgt5bm
         AT/w==
X-Forwarded-Encrypted: i=1; AJvYcCVSdnO1BQR5ZBftsR74cs74osO2Zu/OaqpkzptAa0zPrXAkEvFjMor7LJH/DFSYDfpiWVxbINKTXxMI0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YykZuqv9pzIa2xN0BcD5K2vQNXTMTHkGIXUPUp4320/7Wwmq/DX
	c0asqrf4Db6oRxcvmaXXc7vwb/XqgwEqdNGLB7dtT8LOsbzgemwzv0TD+JBXiXJYSE8=
X-Gm-Gg: ASbGncsevgA06Mvlu21yKzCX9C0wmneombbcedvvx67NfLqKPXg+8esWzkLita6aZKQ
	sSC8tZmHxrOz9qSRohSw3PIBzH6UP2q92xbDU3it28uakOvUVvZaBAXxCRF5ZYC4UkR/eKDSg1b
	L1cM+63dvpxhUbKCF3yhoIXClFY9Uz+O4l2AxdutiwlUN8EthSiqRGhMuQDFswutejTMOa6/CHD
	34xCeEutgx7vaL6j6HJA8IukVGle/0+MaMdnTg0eJ5LGsSJ43yNBM/AtTFYODobTv/5VMvxndOi
	+6jMhtTj36KvY5pDV3McNJ/njTeMIowgvGfRFoG+oTOj1kejt1CpsUJhMV7w+tGkEeeznj21eyz
	fA2I6NJO6zUDHzGrIUC5+/5v9lFZGCEn+rkNZJQ==
X-Google-Smtp-Source: AGHT+IECZ/fHWu0eLpHlyIlOaOKTW7TB5KbiIYIV2gyGFhcdQyqL1sbiVLLuzteuinhCHVBZ4RQLFQ==
X-Received: by 2002:a17:903:4b4c:b0:23f:f3e1:7363 with SMTP id d9443c01a7336-2446d73e7c9mr128300415ad.23.1755490197940;
        Sun, 17 Aug 2025 21:09:57 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d578aa4sm66701445ad.153.2025.08.17.21.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:09:57 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:39:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
Message-ID: <aKKnjDt5bSTFtFQX@sunil-laptop>
References: <20250815161406.76370-1-apatel@ventanamicro.com>
 <20250815161406.76370-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815161406.76370-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_210958_794309_1922BA83 
X-CRM114-Status: GOOD (  27.51  )
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
>
I think it is better to pass valid error pointer here.

>  }
>  
>  u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
> -- 
> 2.43.0
> 

Otherwise, LGTM.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
