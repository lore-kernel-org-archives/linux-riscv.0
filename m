Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB9C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHYp+ewrWWgGDoLPL4UYLlIbgjJesyoz/GXCoYDNIys=; b=C/QoFoKlMOB13y
	SSsZjYcfiKcdMhSX1XYkf8eewso4zTV3l8gwZEF5cpAsKFD0atsGgAfSuexS8vqA9nyHsRQlcYvDM
	I+qGdzDVv9ZjT6dWAtktWZslzvr6InVKjY/r2BbVOzS9a5BNQJpzRPYLmkbDDdJMO6bp9dXQDmcEr
	xfqrO4nyZqD1nqMoJ4XXUYjBUgga2f5tiBV5JtU4IKEiyzvWnjNtWo2qK4ZYlwLnqXoZN07XGLdLp
	Vd+gJ43bYhTzWS3RV3s/bShTHAxqHkyicbarE6Z5mT5NbqE1yuynLgXVSHgOIlaoibVvDXF+y91Ft
	lfN9qfG5gPGwbtAdgtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1putLp-00Ad2b-1R;
	Fri, 05 May 2023 11:11:49 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1putLm-00Ad1z-2L
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 11:11:48 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so3098787a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683285103; x=1685877103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=821Az3AivGuT6dtPPas/uoHO8Iz2n1fCbNOlcQweC8g=;
        b=iJQAaROji6BPzSHNs676Wj2UD/iAHkOkYb3gkG9vHZmlhLs87O9ISnweOAZFAZLYNc
         2FGswL+DEn31J2KJUlsXGXO9UIzm1MG/fViYgrMaEnCPjJ+ckcq4AMgiE2Rmtwao2sQe
         Jsv7kMTEjnbFhpfYN5uQEUH6Ma/A1uB2zl4C6p9Qw8MJkb95b6vAHdDdRomy4s0m0NbI
         uzoVUAXdMbBe+ZVDOaaMbnZoRBLTc4oEKQGtYhXzySFQF+GXgyPB1Yiqc4BV6t88R5b8
         U07PQkwTqlQaocXoIMBnc7iV8c9WLqO6LEuXSY+1RM6on3JG9ZUzxyt5n3wfp00n4EZA
         +iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683285103; x=1685877103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=821Az3AivGuT6dtPPas/uoHO8Iz2n1fCbNOlcQweC8g=;
        b=LfDpv8ueNwYjLTBkaJnDpfHw4ZHvfWbJRZ32Zfcqh6V3nsTfrmGqgHNHlb+Efu6Rf1
         ux37M2B3ekCSpmB/Rar7QXQbQhaulIj/+qfevyg9bgXXSKl32WhLL0l+JHTxtigKrp01
         vu3loQVc2PWU38jxZ4/BjszFOtPa3evb7L2v4fR36CYm8TkGSOo5bk8x5qJ4V9cQb4n3
         YnO4UjwYklB9j8cCQ2RQUFyO7V7fqgbYnQYsXDirww/Ou8gYL2qbbF1yHCbxVOc0/ND4
         OmnXy4NnMTJc9DI2BsgmZL+4tu4Fr+dfjSsUcNQLBc+9gi1Ag8RRqHEv4niGpOBymwm8
         sahQ==
X-Gm-Message-State: AC+VfDzhju0a4MX9z26iI0Yc4IiJ6++hKMbLSrYxcGtydDPdtAKAqqKs
	WLfA926qlUaBnu5g80sxuCPXK4Pqor21dZ/ILcU=
X-Google-Smtp-Source: ACHHUZ6WPGKvDQiUPfgBJ6fgJihpYrDmpDBbHwhr34HZF1kBNrdeLhzn8zz4eckPPzBmovuwsMuM/A==
X-Received: by 2002:a17:907:9345:b0:958:4870:8d09 with SMTP id bv5-20020a170907934500b0095848708d09mr735326ejc.37.1683285103520;
        Fri, 05 May 2023 04:11:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id md8-20020a170906ae8800b0095390b1dd39sm809334ejb.115.2023.05.05.04.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:11:43 -0700 (PDT)
Date: Fri, 5 May 2023 13:11:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 7/7] RISC-V: always report presence of Zicsr/Zifencei
Message-ID: <20230505-bfc5ac83cc446364b06cceeb@orel>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-oncoming-antihero-1ed69bb8f57d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504-oncoming-antihero-1ed69bb8f57d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_041146_784302_BAF129B5 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 07:14:26PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Zicsr/Zifencei were part of i when the port was written and are required
> by the kernel. There's not much that userspace can do with this extra
> information, but there is no harm in reporting an ISA string that closer
> resembles the current versions of the ISA specifications either.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpu.c        | 2 ++
>  arch/riscv/kernel/cpufeature.c | 7 +++++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 9af793970855..aa61031f7923 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -44,6 +44,8 @@
>  #define RISCV_ISA_EXT_ZIHINTPAUSE	32
>  #define RISCV_ISA_EXT_SVNAPOT		33
>  #define RISCV_ISA_EXT_ZICBOZ		34
> +#define RISCV_ISA_EXT_ZICSR		35
> +#define RISCV_ISA_EXT_ZIFENCEI		36
>  
>  #define RISCV_ISA_EXT_MAX		64
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index b0c3ec0f2f5b..0d5d580dca61 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -204,8 +204,10 @@ arch_initcall(riscv_cpuinfo_init);
>   * New entries to this struct should follow the ordering rules described above.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> +	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b425658bbf08..92f0e7b78eef 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -292,6 +292,13 @@ void __init riscv_fill_hwcap(void)
>  #undef SET_ISA_EXT_MAP
>  		}
>  
> +		/*
> +		 * Linux requires Zicsr & Zifencei, so we may as well always
> +		 * set them.
> +		 */
> +		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
> +		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
> +
>  		/*
>  		 * All "okay" hart should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't
> -- 
> 2.39.2
>

Besides the ordering you pointed out,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
