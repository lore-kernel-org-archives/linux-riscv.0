Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81543CAC585
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Y/Qat6AzRKplphp48SZUYlsDNRZPg5kxstqtlHPmX0=; b=kToofqOmRB1EpR
	dbYymbT6ckTqEJK1uWc/trda87VRdVBVaQLP9QFeD7NViyZ1oh+xo2p4VKoVALItc/FjSwJ4y1lFR
	zZUK2maeW09UMTR6cD/ajQSY18hemJne9qg5QADwqGWANkxjJKRiAtRxpmFnfFUhvHD/+F5DOFk7m
	v+KLoC0Pye3EhZo425cjEy8vNSdKTUnUzQSmEIjYvtUaqBDPhqimedUUZkBIB8sOEbn0yX8F1GciQ
	8xFF4T7qwu4+hnnL6KerC5z1XB80JOQU1x3M85VSHfsEKCHtn3cnnC1OV8Fry0R99K28WO0B9N362
	gbuO9z/4yezzJRwyAFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZjn-00000006M8E-1XsW;
	Tue, 17 Sep 2024 15:03:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZjk-00000006M7i-2erc
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 15:03:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so59976515e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726585406; x=1727190206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEjfOu7U4qW/b8av+aYUfpVst9tLz9bG3DCS1JXbv6Q=;
        b=d+JF2LWlJxytndzL8B++1LE+G3yxaq+YboCj59T8lBEUbzk6qQWYL86ME+LOoy9P+a
         rKHPqFVWBEBfhSs1/MSUcfhglSmjaLxCxTJ+mp2d++MEckmefR+6xqGA9sIWvATivWGr
         y+oK+h5l3JsAL3RIaDLrY/UaA/C7LRCcll2uQhRHutfNgiRBybEvi7RW+QIrxgNGRR+l
         vF+IT2CZWYBdNfvjVhNB4ckZtFftZeW3wxsqgdoi6vl4ZWR31oLVrkJYgo2LJFaTm5Tv
         y882xyQP3r8px3fiESKkm4r5w39uuvm177CCDhoGvmXDQwSt9RgUmr6zOw3PAQUxhHEh
         1I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726585406; x=1727190206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEjfOu7U4qW/b8av+aYUfpVst9tLz9bG3DCS1JXbv6Q=;
        b=pQw22uuDTxaTFm4QTHQSOHux+bjYluaE/mhZbkUMpvW37nzpv7oDypELPGJtfyy7Vc
         cK6fF1GhMG6vtnLJmUOrMXHcY7dPoJOjnGdrl1hkp96Tz4ecEGgnkHxxK4xntPgfb3a8
         Ca5l5XZH6Rhb4saXLK1sPIwF4CQ03FVayxzTMnCCt5Mn/ECPsNqbQYLirtlg9NoaJNpu
         gAQCAwz9UwamsthzPNF9b1Li38ZNamCgZc2XK+x+kP/5fNclz+eit7THhUGoi8KmRrUn
         klSkww34fZPwmJyam0oaj5UyKjDSyS1KVfIXXf4rGUEikNbeVyWGud0UqRYMoU4+jP+/
         +t8g==
X-Gm-Message-State: AOJu0Yx48btLr88zXdZZj2RX8y3uJ9aCb2EpXEuS8WQe2lUzYKmfZnBM
	BojTIlwY18H3VC4NhZ/S3wFKsIppDeP17O7QHk2OGSUA5fINc/Z3BkL69BIbkDU=
X-Google-Smtp-Source: AGHT+IE509PIgGJLgtatMO/F5FZJq/6KkzgLOlDt8Uchy/rQAQ1FKzvuvPLTcVZZZ8K82Ui2J88/mg==
X-Received: by 2002:a05:6000:1847:b0:374:c160:269e with SMTP id ffacd0b85a97d-378d61e28acmr17727506f8f.22.1726585405388;
        Tue, 17 Sep 2024 08:03:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780024fsm9810258f8f.81.2024.09.17.08.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:03:24 -0700 (PDT)
Date: Tue, 17 Sep 2024 17:03:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, schwab@suse.de
Subject: Re: [PATCH v2] RISC-V: Schedule SBI-0.1 for removal
Message-ID: <20240917-eaaf475e51774a8953eb45cb@orel>
References: <20240917135308.24997-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240917135308.24997-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_080328_695815_E03C122B 
X-CRM114-Status: GOOD (  23.09  )
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

On Tue, Sep 17, 2024 at 06:53:08AM GMT, Palmer Dabbelt wrote:
> We've said we're going to deprecate SBI-0.1 for a while now, but I
> didn't find that written down anywhere.  So mark SBI-0.1 as deprecated
> and print a timeline for that deprecation on systems that probe it.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/Kconfig      | 17 +++++++++++++----
>  arch/riscv/kernel/sbi.c |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f00d474e13d0..fad197d5e122 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -838,12 +838,21 @@ menu "Kernel features"
>  
>  source "kernel/Kconfig.hz"
>  
> -config RISCV_SBI_V01
> -	bool "SBI v0.1 support"
> +config RISCV_SBI_V01_DEPRECATED
> +	bool "SBI v0.1 support (DEPRECATED)"
>  	depends on RISCV_SBI
>  	help
> -	  This config allows kernel to use SBI v0.1 APIs. This will be
> -	  deprecated in future once legacy M-mode software are no longer in use.
> +	  This config allows kernel to use SBI v0.1 APIs.
> +
> +	  SBI v0.1 support has been deprecated and will be removed after the
> +	  2025 LTS.
> +
> +	  If unsure what to do here, say N.
> +
> +config RISCV_SBI_V01
> +	bool
> +	default y
> +	depends on RISCV_SBI_V01_DEPRECATED

I think this could be simplified to

  def_bool RISCV_SBI_V01_DEPRECATED

>  
>  config RISCV_BOOT_SPINWAIT
>  	bool "Spinwait booting method"
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 837bdab2601b..1209a4e53ed1 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -686,6 +686,7 @@ void __init sbi_init(void)
>  			sbi_debug_console_available = true;
>  		}
>  	} else {
> +		pr_warn("SBI-0.1 is deprecated and scheduled for removal after the 2025 LTS");

I don't think pr_warn appends a newline.

>  		__sbi_set_timer = __sbi_set_timer_v01;
>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
>  		__sbi_rfence	= __sbi_rfence_v01;
> -- 
> 2.45.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
