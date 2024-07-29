Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCBEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb2W/LLs7re+s1w/d8CX1OfBl4fBYf+hf+DHceyL6Q0=; b=YzEskU21wCxKiA
	Oy9SC9IIMX3dcKc+4Vz8Z3Rbq40E+UOjkPbWD3S0aP9Rjx8hNSJmF0bWGlYBHpCe1Srr3r3efcsPw
	8hh9TpMIVU2WnjbLubB+8p0C3+if1eSj6iyDsx0ReotFiUpm4ol8KyWI3bM8p3tDDgSe0mFVGtMhB
	wTksrPNpChtonJhPLtRxf1SgKFEDQb3YDF3TMkLUcS57tMF/pMTpmfgh+5Y6jQCGe5vY03tnkBasL
	1+LuCT7VZNU2xh7jOmpPkdcj2WwXn6mxvcq7yj/kni4i7hgDa0Sdd0+jY5Y6/QRuKQZm90ERVki1P
	ArcGNqsZg5OulGUnw8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQ4I-0000000BKrT-3M0E;
	Mon, 29 Jul 2024 13:05:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQ4G-0000000BKpK-2GrP
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 13:05:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so5978263a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722258334; x=1722863134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oL6Ei2KYeBDeJNbLf68ofb+Lx3i9/7UrWfP1UrSTo+I=;
        b=HexqGFonWhffJvBxb70BOzjn2RLCQNVMNDUDlTmxIi2DbD+tKzXwBMr4PRDsrbPXH0
         zDLwDCbx5HK45HM6BA7FW88/CJTKZxz2wYD61IC5J5RsBSwe4jfy3GUp6coC+N4DWUCV
         ovNUNYmDwwA6hqoEdZ3HB3+OIHdRODi7ucd36n5IHxzAzvGeOqjpT0QaacH0P4St/5M6
         nBMqJh7r4vQDmmZyxeLOKfw/x6tJlZ/A/frOC7QE9u29UNtRjkPiJiBzaiU0mRp66hJQ
         HlkoOIPr1n1HDHaAosftv3EreT0EQwKwfqAxB+ic6/UKT3pn/Yw80ofcC06K2JuRZdLH
         h+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258334; x=1722863134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL6Ei2KYeBDeJNbLf68ofb+Lx3i9/7UrWfP1UrSTo+I=;
        b=aEdqjAJ9iXuaDTIn2JwqW+a4rJsdJPnrkBdAbUbPOCcw/eSnure2TqD7AOYMiyyHZJ
         +E24BNX/N9FjDyOHEN0ESubMpHkLJ7NEbOGpUB3wlI8Tsg3yy9dQtoYi+lIDhcbUCHPa
         aZbNdXxE9QPE09fU3UUCGRYd5PS9guZFaTx0yJHkLgnG3SlhoBmdZ4SQzl6u3yfj1bi6
         xjfGE4lVmBGWmZEveEbJsgYwWJaSzmMUyQ/J1WP9hdXlP1JhrkjbeS14MzKUmATFSntK
         aXe9JzquzSQes63UIrnxZmjWAAyaHGZm9Iau2cYsGgZM9z6+kPeF9zDFnsDUskztRPam
         KDOA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLBYSjeLn16g7WVJUUWBw6vgvWzjV/wyOIZ6GQZW2/xOmbHMK+AZguEoRdpl7nfuXTD8Z9Pil/S5QBRD36R/o9aLbfBTpAXYQDxiip60y
X-Gm-Message-State: AOJu0YwPCkfeXAto5MPpD/Kt7u9IR34E6eXOsPfG9oH+519UE8277L24
	D7PK3pr32pe7Sgs4ZD47L0zcVHojDEaeI4okhIp2qn1IapbvVsX38CS/b+0+UYU=
X-Google-Smtp-Source: AGHT+IF0LI+nFBLvWwrjgKxa86+5pT2h9JjZMBwNTkHKWP7qRNiQQsN51SlBoLwcS80o17x5Hl5UHQ==
X-Received: by 2002:a05:6402:13ce:b0:59f:9fc7:1e70 with SMTP id 4fb4d7f45d1cf-5b02000c21amr5865160a12.6.1722258334038;
        Mon, 29 Jul 2024 06:05:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63b5a7a0sm5773400a12.51.2024.07.29.06.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:05:33 -0700 (PDT)
Date: Mon, 29 Jul 2024 15:05:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH] ACPI: NUMA: initialize all values of acpi_early_node_map
 to NUMA_NO_NODE
Message-ID: <20240729-fdff8667bb22fcd63ea33ce3@orel>
References: <20240729035958.1957185-1-haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729035958.1957185-1-haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_060536_619817_8F22B555 
X-CRM114-Status: GOOD (  17.22  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Gavin Shan <gshan@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, James Morse <james.morse@arm.com>, xiaobo55x@gmail.com, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 29, 2024 at 11:59:55AM GMT, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>

Thanks, but I think Reported-by, or both Reported-by and Suggested-by,
is more appropriate. Also, I agree with Sunil that we probably need to
split this patch for arm64 and riscv in order to add appropriate Fixes
tags.

> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  arch/arm64/kernel/acpi_numa.c | 2 +-
>  arch/riscv/kernel/acpi_numa.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 0c036a9a3c33..2465f291c7e1 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -27,7 +27,7 @@
>  
>  #include <asm/numa.h>
>  
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
>  
>  int __init acpi_numa_get_nid(unsigned int cpu)
>  {
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 0231482d6946..ff95aeebee3e 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -28,7 +28,7 @@
>  
>  #include <asm/numa.h>
>  
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
>  
>  int __init acpi_numa_get_nid(unsigned int cpu)
>  {
> -- 
> 2.34.1
>

With the tags additions,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
