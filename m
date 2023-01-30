Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29DEC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWIoofqakU0+AxPedi6vpsm614RZ/q2qfRlW1Y/oGSo=; b=zh4PT+JWmFRS6r
	giE3LfsDwMV9iwDjN4bXmOyKkSmRxBj07UQKKZ84uDL16EWmLvUWwnF4ZzParNRqh/bGt5hPpgCFR
	9AZ3ewA6wLhe34iXRYQowbDyeaqgscEvADGpX/7r2innq5apyRWk8PgT3THX6m6/pG22y+rnnRTmH
	Z/cvxwBeNeMxbAh7fEt4M2DzOcsqjdBYgouEi0lXKQ0lXbDZwc+YULHGmyzpvUKG0Ro4p8v784XDt
	298+1ijNzoyRZ8gZesZcxvC2F/qi1RckFh95Z6TSh+eVLS19P5Qc+iMrSB453gQjKMe+wNV/oLa9o
	/demCgxZr1EpSOBgAdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPR9-002eB9-0X; Mon, 30 Jan 2023 08:22:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPR6-002e9z-IC
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 08:22:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id ml19so5837486ejb.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 00:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgDUPbagJ258/yYJwTe+iBI4MNIZYVSZ6ZzoNPxg3fQ=;
        b=jSp7KjkCzGj1vQKZ0uEHgGSyqnFHwGb6uCwVOYIFVF3irUcSnbFRs3RJYkoL3pbQed
         dgc0jFKouPQLyqYvawKhOrrKVEmrX90bYT7BshFZZkvaHyEtJxMJRXU8ZGWfJ+CMfy4z
         ZUELBSnWaj6unZUN81MzGnOfvWoZoFaoBuZA6dGcewgR+Im9Ukh+z9IP1FSj+3FTAdAu
         mz0n0ifzBUuWDlEBEPy+UcRNDVZdtGH0H3NprHNnzT9Z1b9FZf8qeHjc20cVD2XIXYgJ
         5kaGs0JpY9Tr+lZm2BK9tukZEyYiC5XE2/Vd52HLUaq0GDFtsYy3GyUmZiXatLWH1ERy
         bAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgDUPbagJ258/yYJwTe+iBI4MNIZYVSZ6ZzoNPxg3fQ=;
        b=Mnzcpwygbj5ed94NgPiP5QkuSZXge16pUcBZRarnywvyFQunpK/xgdP6wh/CSVtmee
         3xQSck9GcX5NmjU5WLLtuFRNUu6ivbnnRYnShX9xNFX9uozUtGGC5Hs87xUKau+Mu6lW
         +fJqmSy7pOVbxMtryYNxgXNLByth2Vw/p5bK4uTB0S2Lfb0gj6fBx4V7fCyNUwm4rB4P
         smWC8n+ddP+8jcK0W/i0gsPqnzUCzyzrO+vAfsHZ0XNYNkgfsiTv9MiHI0UNK8mUvpOJ
         XIXSC5CmNU0OBbnbqlBE15T9iFkSBAMmvsznt21xqwY28cTX2Xcsm1gvsQBmCTKi3TA7
         UqLg==
X-Gm-Message-State: AO0yUKXnlKk1SAWztqJ/cXoIMAxPNVvZWFHFzcvcFX7V3IFOMPpP2Tvz
	E2ScsJQkghC7HmxVIKuFW7DO3g==
X-Google-Smtp-Source: AK7set/TE2eXiD1YEub5PF6wQ93zAdcnZkd4hp4UQ+9ft2Lj39OoTndCc5pf4awrIzvvnfW3qKVkBA==
X-Received: by 2002:a17:906:3e49:b0:812:d53e:1084 with SMTP id t9-20020a1709063e4900b00812d53e1084mr7125067eji.70.1675066960922;
        Mon, 30 Jan 2023 00:22:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b29-20020a50ccdd000000b004a21791ff18sm4412926edj.12.2023.01.30.00.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:22:40 -0800 (PST)
Date: Mon, 30 Jan 2023 09:22:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	yuzhao@google.com, conor.dooley@microchip.com, guoren@kernel.org,
	tongtiangen@huawei.com, anup@brainfault.org,
	akpm@linux-foundation.org, falcon@tinylab.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
Message-ID: <20230130082239.xptbyeqskdczm6ns@orel>
References: <20230129064956.143664-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129064956.143664-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_002244_618094_29C36881 
X-CRM114-Status: GOOD (  20.94  )
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

On Sun, Jan 29, 2023 at 02:49:56PM +0800, Jinyu Tang wrote:
> The arch_has_hw_pte_young() is false for riscv by default. If it's
> false, page table walk is almost skipped for MGLRU reclaim. And it
> will also cause useless step in __wp_page_copy_user().
> 
> RISC-V Privileged Book says that riscv have two schemes to manage A
> and D bit.
> 
> So add a config for selecting, the default is true. For simple
> implementation riscv CPU which just generate page fault, unselect it.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  arch/riscv/Kconfig               | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  7 +++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..17c82885549c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -180,6 +180,16 @@ config PAGE_OFFSET
>  	default 0x80000000 if 64BIT && !MMU
>  	default 0xff60000000000000 if 64BIT
>  
> +config ARCH_HAS_HARDWARE_PTE_YOUNG
> +	bool "Hardware Set PTE Access Bit"
> +	default y
> +	help
> +	  Select if hardware set A bit when PTE is accessed. The default is
> +	  'Y', because most RISC-V CPU hardware can manage A and D bit.
> +	  But RISC-V may have simple implementation that do not support
> +	  hardware set A bit but only generate page fault, for that case just
> +	  unselect it.
> +
>  config KASAN_SHADOW_OFFSET
>  	hex
>  	depends on KASAN_GENERIC
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..1db54ab4e1ba 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -532,6 +532,13 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	 */
>  	return ptep_test_and_clear_young(vma, address, ptep);
>  }
> +#ifdef CONFIG_ARCH_HAS_HARDWARE_PTE_YOUNG
> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> +static inline bool arch_has_hw_pte_young(void)
> +{
> +	return true;
> +}
> +#endif
>  
>  #define pgprot_noncached pgprot_noncached
>  static inline pgprot_t pgprot_noncached(pgprot_t _prot)
> -- 
> 2.30.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
