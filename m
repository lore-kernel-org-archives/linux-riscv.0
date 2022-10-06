Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381A5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0I8dQaqUjwSXPSmj0xMMYPsppGN+Bz6JKIFt9O5A3E=; b=uoURx0ijpbE2tH
	BRw3n08PlJ8ZN4VetiLLXAvDSHKq3NcNHgFpWleUDYbbfvYuB5mcpPDCkp8jkB0ibzlbTXfAYq3KZ
	GXIk1trQRQXQxck4Iz6tk3nteaS+G6P+UGMysOHqqVrie6yVx3F7/5bcwlK43efqAgYGgVSeuiaes
	s3CjvF9b84JbBGPEWsdfQmQN3VRtIBF8e6y+QxFK5R6sDr3IYocuLj09yO16F15uBK8VBNWGyrJvu
	P9CNRttwIqm/3sYFstc9OP4XQcRKoT36/Db03u8XU8lHG02nUzIGU9fCkqPUk/mmg0f8Z+hiOD8lC
	yoXt2E9Heqzx9PT69WmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQiu-002ahB-OP; Thu, 06 Oct 2022 13:15:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQiq-002aav-Dk
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:15:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id e18so2770419edj.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=C3zWAQBpIW3PZpVPpSUfTCDFk3CK+4WyR74h9CUwMsU=;
        b=iVHfFo/CpB5OBIq7+p0elW88jDoyuYwnUOlw9lTnQeOzsrEekcZUKb/HReEyyXqZBR
         dH6Y1Mo/uW2N59NDcduWBLfNRaMWsCJ2ztIqE/Iz6k7AMTthdZSRrO3fLmFaua7yP2y/
         4YjOIp+5dXNyqrmQK3jOKJdwKmLG2Fjy3P6qcrpZUxhnt36TFoxUP8e5e0HTiJyOUfb2
         DzrwmmR+VvZl4ljtXh1GrKLdvR4DiBK9u1uIu+Y9npDO5A+OcwC4mpnb0+z3iuGerp/U
         6C46WWnxSSgAY5zv/dbOKs9yVh6qG33IgofTMt/wD1l3nZrFuOKteZSc8cqhy5UuD89m
         lA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=C3zWAQBpIW3PZpVPpSUfTCDFk3CK+4WyR74h9CUwMsU=;
        b=pXcf/xMoFuD/0JOHkzj6IDJ8qL7/6JD6TGz1PUikXckmFaD0DBhRLomMGthRY66nny
         FndViSfBwwwEtsMCUVpVyT7WhzUdveTNXTLSsKQysa3hke6TVUjcor8c5G6dsDHrwEIT
         V/eJSdPb7fyKkdCD5GfUjpDwi8hgUvCEBSFW9tRDu/IvHFYWdOiOsV2AfU9/ZV3+vAxS
         vUOTupPE9zf/Jl+m3uyiKNuIiMm5tl7ThjH6MrjwE6nYnEadJ0tItPpqYbD41OUs6aXt
         +T24zODHq6P8WxK3nm05dB+lNg0IUhbgCAkumlgR67O3FV+OnFXLi8Ui+lJYv24IVC5x
         T8hw==
X-Gm-Message-State: ACrzQf2uFwrwSOE51+DORhMM07b2B5Kb8IGa4cZTPqGQ/A4SeQ/YtGD5
	KrRLlnLtfpn/Xrcw858rjDZK64i1vFlDQg==
X-Google-Smtp-Source: AMsMyM4gHbe3CFDT3BxF1JnwGIhtjpYQNTFT0EOibrKWzjA30a45VV2/808gOMB7w74H64u3Tyq5bw==
X-Received: by 2002:a05:6402:2926:b0:459:675b:38a9 with SMTP id ee38-20020a056402292600b00459675b38a9mr4632411edb.60.1665062129421;
        Thu, 06 Oct 2022 06:15:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id i26-20020a50fc1a000000b00458e73fe1c1sm5802996edr.8.2022.10.06.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:15:29 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:15:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] riscv: hwcap: make ISA extension ids can be used in
 asm
Message-ID: <20221006131528.ovcvgnp4tdkfcnb7@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_061532_488749_DB01B6A5 
X-CRM114-Status: GOOD (  18.71  )
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

On Thu, Oct 06, 2022 at 03:08:13PM +0800, Jisheng Zhang wrote:
> We will make use of ISA extension in asm files, so make the multi-letter
> RISC-V ISA extension IDs macros rather than enums and move them and
> those base ISA extension IDs to suitable place.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/hwcap.h | 45 +++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6f59ec64175e..6cf445653911 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -12,20 +12,6 @@
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
>  
> -#ifndef __ASSEMBLY__
> -#include <linux/jump_label.h>
> -/*
> - * This yields a mask that user programs can use to figure out what
> - * instruction set this cpu supports.
> - */
> -#define ELF_HWCAP		(elf_hwcap)
> -
> -enum {
> -	CAP_HWCAP = 1,
> -};
> -
> -extern unsigned long elf_hwcap;
> -
>  #define RISCV_ISA_EXT_a		('a' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
> @@ -46,21 +32,36 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_BASE 26
>  
>  /*
> - * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
> + * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
>   * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
>   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>   * extensions while all the multi-letter extensions should define the next
>   * available logical extension id.
>   */
> -enum riscv_isa_ext_id {
> -	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> -	RISCV_ISA_EXT_SVPBMT,
> -	RISCV_ISA_EXT_ZICBOM,
> -	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,
> -	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +#define RISCV_ISA_EXT_SSCOFPMF 		26
> +#define RISCV_ISA_EXT_SVPBMT		27
> +#define RISCV_ISA_EXT_ZICBOM		28
> +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> +#define RISCV_ISA_EXT_SSTC		30
> +
> +#define RISCV_ISA_EXT_ID_MAX		RISCV_ISA_EXT_MAX

afaict, RISCV_ISA_EXT_ID_MAX is ununsed and can be removed.

> +
> +
> +#ifndef __ASSEMBLY__
> +#include <linux/jump_label.h>
> +/*
> + * This yields a mask that user programs can use to figure out what
> + * instruction set this cpu supports.
> + */
> +#define ELF_HWCAP		(elf_hwcap)
> +
> +enum {
> +	CAP_HWCAP = 1,
>  };
>  
> +extern unsigned long elf_hwcap;
> +
> +
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension static
>   * keys. We can use static key to optimize code path if some ISA extensions
> -- 
> 2.37.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
