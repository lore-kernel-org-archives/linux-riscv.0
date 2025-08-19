Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D3BCA0EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 04:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvxlUXTH9r+C2ek/zcGVlqwVKbwNNOW+82oQ6aLbySI=; b=oLriuaKApnucho
	4MiDvfvwfwMK3whS02ZhnP+6Jx4BnqYPGfE8xkEfjDY1nZLU402cSJJbuleGpPEk8y5x0M7G5lS+S
	5MH1JOyDTiSrdIdXXaoBxgs7k89MX9KtkH/o42+f/gLoJi+SmF+VpiWsnNGrY6nw5loQzaZGc1KMm
	0OlK+765Yn6mWzvPT3efT5C3OEjjBwjXZpk1JKSZ7BQJIR9P0B8QWIuYpggSCUF5M2+gidZMkGjDg
	9Q89KRI5uUOBtNgqe3I4qejyx3DB6rxmVPyHCOKCKFT1o1uHuFk52XLTnTg97dwY+Iy8syNpA4ot4
	z7uyp7vyUfUNBAhUAMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDwM-00000009NGu-2VwF;
	Tue, 19 Aug 2025 04:27:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDuO-00000009N8g-2jja
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 04:25:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2ea94c7dso5404832b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 21:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755577515; x=1756182315; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65Uzbt8ZenEFcFURL2MqIdAtkcFnwdoUoUCUj4Jj5Bo=;
        b=FpHeVueyybGpW0MNE2yV8L4CuWi65pMW8BjAR36vrkgaAgJkp4KEnHGJMYzzwNKppO
         F/nOLvnPC31IxOE3MkAdKu+CvhGTBFLZ+qXQK7cgiZGw3tpIF+nWTVjPR51xp8Zab60+
         vLvzxkzZugEOi0YkfLvtmKStSe4izzwJRAWzfXn+n3OVSU3JVUNX4CLlHlgELiSk0nOZ
         d9+d+iy3bDY11mrx02ZAFx3qn/5JGQIy0QXfxLt5VBYC9KvlrpCHAHB+RbSpO9ZsptB6
         YeinEbMWXkefMkOe8wjn1VNxcdLIds/jWxjVyoLb5tC3YRTWW45AdjpyMLTnmh7y+iCv
         wt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755577515; x=1756182315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65Uzbt8ZenEFcFURL2MqIdAtkcFnwdoUoUCUj4Jj5Bo=;
        b=djCZLM+J6U4JOxj4KJN6JcMS99S2wap4reBW5Qo/jdPr695WGN37PD2vArwdut26nP
         wHw2bus+e6KjnBQj+vTk/pTaQ+sRnmvTAJY5+aKMniG7Xg2gNZHFnzey62qkRN8UWqSc
         /hDsXQydN5DVUVZcS6hW+dBfRGi1RX9s2veKsbBr9rS5f822iBFGCr2VeqE4/xHxpsKP
         Bmajy+8uRhepQ2ty7XtVcg3bscCdopcEGyV6Oz5tS8gHglTvbE4QnUswLItWmiddPqeh
         7q86rvst7RCdm29Venmju8xQlHG8wK2wsO7IlOQQlUd9Q2TtZz+09sHHe1fdZe2tTjb8
         TY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRgZXewBxkdTCPKTcHrrCSyVMzMU8EpWuo5JIZXMR0evl/QeJr9Y1G2DvhjzcKcjSQstqAXT3x+AF6pA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4yYYWcYOB8AlyC9zZyRBhZz7uFcDXR348NC9MW9xC//yp1Ii3
	k1cE7Nb+enMn8NFxrQkFXsiYSjcsP/NDTSgQ1mbO8hv2HrAwNuSEP/Jm/Xxu0L19yk4=
X-Gm-Gg: ASbGnctY8gNMnLTyi+PAxUXcjtJf7s3g2wapl6rqnR0uWNYxyzI+AoDWucpkD8W66RO
	yrghHGMu9f/ADeJkLR+qB91GCCDCGhT10Ik68fl+7VutaROP8STVZiOu8eSsouVUVYOSNeVOOKr
	0bmI5C4+yrGFkT3kMj1uXc97C/lwGxW4+bnMZtWhNw3FpCB2JUjzIjpwO7HZNY7YnhRuabPsFnM
	s2/7TS1VzzrzLpEl5UuAt/W3WVp8eMqBr70u95O1EGG6t+0shCJWmSi3rpLHj5aOJ6GN14KIaqF
	ZFaO795htz+/DqMQ803fuTUs5kvY+F9/7/szOhGkpA/rmV0jI1IfiGNpFsWNQT1qt/GvB1NhERT
	i/H+d3dMnLlgninflhy/CieQ4oJw=
X-Google-Smtp-Source: AGHT+IF2A+y+SDR52L5ETqk7iiqm/dYRVBF8hu1uj4PHA6PM0xk2a8CSw259kIHYfi9AilP5yR50nQ==
X-Received: by 2002:a05:6a20:3d05:b0:240:11b3:bef3 with SMTP id adf61e73a8af0-2430d4a6febmr1790210637.38.1755577515368;
        Mon, 18 Aug 2025 21:25:15 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d13ebdcsm1154638b3a.47.2025.08.18.21.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 21:25:14 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:55:05 +0530
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
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
Message-ID: <aKP8oeKDwXGMmonO@sunil-laptop>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818143600.894385-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_212516_696745_8830F3F9 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Aug 18, 2025 at 08:05:59PM +0530, Anup Patel wrote:
> The cppc_ffh_csr_read() and cppc_ffh_csr_write() returns Linux error
> code in "data->ret.error" so cpc_read_ffh() and cpc_write_ffh() must
> not use sbi_err_map_linux_errno() for FFH_CPPC_CSR.
> 
> Fixes: 30f3ffbee86b ("ACPI: RISC-V: Add CPPC driver")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  drivers/acpi/riscv/cppc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
> index 440cf9fb91aa..42c1a9052470 100644
> --- a/drivers/acpi/riscv/cppc.c
> +++ b/drivers/acpi/riscv/cppc.c
> @@ -119,7 +119,7 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>  
>  		*val = data.ret.value;
>  
> -		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
> +		return data.ret.error;
>  	}
>  
>  	return -EINVAL;
> @@ -148,7 +148,7 @@ int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
>  
>  		smp_call_function_single(cpu, cppc_ffh_csr_write, &data, 1);
>  
> -		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
> +		return data.ret.error;
>  	}
>  
>  	return -EINVAL;
> -- 
> 2.43.0
> 

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
