Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D63CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2M0wT20N5g1YTYkpekXwhbUbB5bSE10/HhqZQ5gZRfE=; b=W206Nz0cX2Oxli
	5T1SxCTj8f1PGQOxx2r/w56TWjDT+8urUgpYN80VDOeJXIIMe97OhoXZ4YBpTtB8Rz6/GggXAni7N
	p5G0ENgj9PVAJ5B7TusS0EsDGadR2z/oXpLJSmP+LVfInmR85xbb2fhGlWyPUQXRyplfx0mZ8l93I
	0BjSuKMM+QhepchwvSqQk+TNh95MYvIBcf8CrxVFN5xjUIHfGwgBWZYJqQrNHJ+kTgkUuu4TQsoQ/
	ptKleMDSjO6TXND4YTDCWLPKbiEyXdRpI7zQzz8uE940Fvdhv5NgbphrKFTxEDgMCtfk+M/SvoGyE
	igeFqWsw+9NMqBmZ8YwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrAI-00000006QXg-426Z;
	Mon, 18 Aug 2025 04:08:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrAG-00000006QXI-2FBO
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:08:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4716fb8e74so3437095a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490087; x=1756094887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HqYW3/niXX/hrER2h0jNeJd0YnT4zpM9DFH12VPKBec=;
        b=DXydbU+Dz1h5vg9IEFD16u4hFtzO8I5qg9TWQoygpMFMM9bf54kR+C4t7ecZ5vgSEl
         Y25d80SfmBOnx7qZHOCjXo4Fy1ecMubAyQFMAcwgvHG4pRfl5s4VBDzpIdrF5bxGCHhw
         H/NwXEb8yMf3LRpYiyu9C4Wto7U8w5JKxFrvXqr/UZKHvYpAhF2655NKdOxxpOTOdy0G
         DPvy0kMFq6ekiuI72c7FEcF4Xxj4a8tDHZiUNGeAxCPJUWPL2Cjj0pMlZfIb8fT5/InX
         7e9oyLIczIc0oAu0kjSjNR7/27coUGs7oD28qXTnK2yBrcUTGIUhYILjvVGaNnqiG2+O
         +QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490087; x=1756094887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqYW3/niXX/hrER2h0jNeJd0YnT4zpM9DFH12VPKBec=;
        b=Vl+lE7vvso3nNcHtW+oNrnWGccIGaOAug1gdjeFS3RAiBXoUPyim6bbiblZeKf59XS
         wnkxWsEmvNNRh/Qu6bmC9llGINHUQuM+RYTDe/TzBqjz+xDB0HlwaMYCZIisRKHe3/2Q
         mkGsEvQh1Q4rR4+t/CJ+jH10XdPSabCidlahJKs3LBBGkNtUn5YtyhbXD3HqyBUE9GuV
         4x16SdtkeO+ZENxd5JQ+CVTQcky/DqZiC/JpUbYts5PcuDyN4dWbfnekzD09hCuJh4E6
         q0h/V8QxOtQnwQ2oGCkxBgaZ88aoilMJizq6Iol+5HwCYnUSdoXQ3yj7tUZh1JUVgHm9
         +/og==
X-Forwarded-Encrypted: i=1; AJvYcCVOW4sP/f3u8xwL+KdDPKW8ta9LA+9N8F5PVcg20aUQBUZ+41oVytOiddburg92lLk8dp0fhvL225KZrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIP56vwb/RaLSof8ODSEdZMtXwR7M/6uLj62IQrOiThKlAYlPI
	44To2xJ1RGZZCVn2lCRo5vxRigNeOgM2TKIKwWEvki0Xqp1O4jrq2qo3JNo5dopLHpE=
X-Gm-Gg: ASbGncut4Sb6k9MfGGPCjyjTOl8C+GFy5YsKlOkaAhGrDqMX0mNxq1L7QkD03QnrdPp
	uILXwUCitjceyVuoy1OA9SB1X+Gr35X3ykQAGo4dlb1GYNo1Wg9LfplFvOTVWUaG4r2GVJulhWk
	rzbTB8B9r2hJR+FqQUfh7vQzFCaVPXbyG34gFKe7rTVvVb+b3T11B9y4F2nqgmHxtV1jabtvv9R
	oVeS1VqXu5dA9xSTj8VCRoLWLpAn0Z5Ufe2vX9nQ5GcoZCoDMT9etgxCt1ke+8caXwa6Jd6IKpC
	xBCuSQt24Ijo4eWhZ3uQ5k+ifkiwPF9rFZIWHmrkxPZ+PABwyKPpDBq8G6y89P4BthKw0O5dpPP
	4Yqf/Ef76pbJgYCEtY+jPczI5Z/I=
X-Google-Smtp-Source: AGHT+IFtt6MKC6uRsTqYvk5xcpF9n7P7wcfIkwiveUPUOkCEFAvbc2mFtbWODk1+Ww5xxAQfbkJcXw==
X-Received: by 2002:a17:903:2ac4:b0:23e:22dc:665c with SMTP id d9443c01a7336-2446d888ab1mr173360925ad.33.1755490087274;
        Sun, 17 Aug 2025 21:08:07 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb065a6sm67472495ad.52.2025.08.17.21.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:08:06 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:37:58 +0530
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
Subject: Re: [PATCH 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
Message-ID: <aKKnHltuYeTTB_pA@sunil-laptop>
References: <20250815161406.76370-1-apatel@ventanamicro.com>
 <20250815161406.76370-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815161406.76370-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_210808_576660_10179226 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Aug 15, 2025 at 09:44:05PM +0530, Anup Patel wrote:
> The cppc_ffh_csr_read() and cppc_ffh_csr_write() returns Linux error
> code in "data->ret.error" so cpc_read_ffh() and cpc_write_ffh() must
> not use sbi_err_map_linux_errno() for FFH_CPPC_CSR.
> 
> Fixes: 30f3ffbee86b ("ACPI: RISC-V: Add CPPC driver")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
