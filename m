Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCFDCA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyNekrZg+yfAE6u00aUNL366O5OvXQk2XfSb+WCY83g=; b=vGP5zktUwWVFGL
	2Sbw9eOfJrRMebp7n6FQnhKNbo64ECxzk6mLKUNh4/lyE2UyWvXeC+hOQmCpYUBzCcTcwfHPyCj1x
	20ydCZS2VaxFN6nvsnbstxvREBG5Y3z32juC0cfIPI8/MxjgeGZyvV8UbMeuN6qPWim9JqUm/UV5U
	wt3qpYAisfj5cO5pG2vq2zUcVrWfyxqrz5aQcT2cf/6AmPPWGMUpo8kbHGtp7zXTp+oRwyFcQjCTD
	iXqwHTR44WoxwHwFAOSIGyyA3zZwSLJrV3n5YnHdDw7DRTA2bg4l3eZB/5A0fRC1aUlaoJ+GPG92b
	MYth3Go0s0EgVf/Nah7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0uZ-00000003RRR-1eTy;
	Fri, 15 Aug 2025 20:20:27 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0EV-00000003M95-0qNj
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 19:37:00 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e57376f644so13403945ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755286618; x=1755891418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7DgASsy61mSObI5Zc/GrPmOkK9c4HSQIjPYfhAD6IUY=;
        b=QLBGrEXnDqh3Luy7YMXf4CmZcHOJqf5ff/El5UmLIrwxSPb1fSyWV+7BNKonPNBOwc
         GnS5Pr0h5tCvGwk2mAqcuenXcuG5307qE71tcheUJcZudxLcNcILAYT8dH5HqRvVNSZO
         QkD/jJkiwISziZ1JFOUQIvA5Wglj3y5lqfO2dmWtvtQgAhl8BUmu/ildNEM9VuEdzsSq
         kKlyYbglxpBYThQ7N/hfWYlRQ7mvX6VNcJqoQyJUBHpH66kInqfEHUrQjLfAROFDPVnr
         5G0D284wa57xzCTa8ubYuiOVEu0MI4iTWvAFqdVwShpJwRBEc1LeoLPfE2MqYyzhbDox
         AVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755286618; x=1755891418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DgASsy61mSObI5Zc/GrPmOkK9c4HSQIjPYfhAD6IUY=;
        b=XOI0qEbA9/XkIz4motaG5ZN8QHKQSeg8/dGmuIrfpUCXIX68U0fy+dudV6Ia9s0SbJ
         qPf4TED9Wzl7THBGquNZZYjChXqq9D3bxjrdakiGR+fjniYkyaPpdfetrBxu16lhbYfg
         +8TC2k8SE3ORZ/EcYvio1oQN12sZ3UirBOCx1nEXUxDfYz60C8MXDAdpwr4VEeo2ULcN
         rTz9sa9qISEcv1vL0o3tegvpyyQLPOfOMslzuT3t/ejiamafKFN8b65nd0KT3shHwUe+
         tcOfonpahU9PjrRmpjePS5ZmCbp4bp8CP6dCWvwqvUDDyGAScmcfgK7hPWlcUnduaW9A
         FyQw==
X-Forwarded-Encrypted: i=1; AJvYcCWeEgb2WpmF09c+VTKq3JtvyTAStMaknFQjFMhSjVK53f4ZJhMg08hdum9jllZ7NcesQ+VeFj+DgpFY2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi/kxBJrqhd8fNOw9HO+M7tuBdvZJEzhMAJuUIOGzZv5Hbaw0R
	dOq8pCh/k+l+Th2MdZwtjI7g9VuBmkiKsSt9WR6/YsAaGahI23F5fncZcW3uK2xn1PY=
X-Gm-Gg: ASbGncuicn4jj1Hm9+4pghGVqSHiMb8+i6NKB9j+Z2CNXyBgDnR50uta7DqSnZhimTf
	Glsid69d3uPpx/RkFf4QVmuEGHxt5zEeaxmhS12mjmgY5uui+BxISUGYCmvYndvS1gdvc+v/dGR
	wFXp6olg/jJUyhoB4d+RyxnuBWNoCzEsxfWIMfeQhuvhg4v1b9Aes33j7uczEJcGbPemWKjrGn+
	XNQHOnjy3w6yHJADD19JRb/0s8U3qxqLKuZPSTvc5yD9DLGubwy9ajojGq6Jxa+4Lx42u2cSfE4
	VP46Xy/a0OXD81jfMHgHE4N5xV9PxnJGKFhXctDWQYmVQNBlWGtK/JMeed9dAF8NfKD0Iv2esxq
	d6u5gQ9wL6lIXnnuHh4Njt2YO
X-Google-Smtp-Source: AGHT+IH50HAImdgEzMYWVcKbXBtm0Htc491sbSs2fh8HxUr57vHHb8MC8O7OYnqjBnPqId7Doh1Eog==
X-Received: by 2002:a05:6e02:180a:b0:3e5:3520:4a75 with SMTP id e9e14a558f8ab-3e57e9c4f1dmr68415975ab.23.1755286617859;
        Fri, 15 Aug 2025 12:36:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e6cef44sm7903315ab.48.2025.08.15.12.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 12:36:57 -0700 (PDT)
Date: Fri, 15 Aug 2025 14:36:56 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
Message-ID: <20250815-770a166e7b6f890d714dd4dd@orel>
References: <20250815161406.76370-1-apatel@ventanamicro.com>
 <20250815161406.76370-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815161406.76370-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_123659_270684_3D6FDD1A 
X-CRM114-Status: GOOD (  16.08  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
