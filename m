Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24387C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWgJreYfRtnvZ/b6tvWn+TgtQFBeY2bNX0ef9r7EzFQ=; b=NxtPS5jZef6e94
	yrowBH4tf2fNH21iw6M32m1XTJncAQxdnhr28ibeXAlOhtx/cqcPXPKM12sqR37wN5RkyMjr+lQwx
	Syl+muD/LtGHP+8R03HCBpJQ6TGVMZgocTthkgcaveWGBf9oH3uhiG0EqH+2tjKZbUApEWkYIapB/
	vFQ7bWB0PK7ovScqgUVFwKwy/4S1flO0y4WZvByPiiL6GTFPLNjDKsZBwonUfLfjBTbZ8byuAikZU
	daryODEhZuRdzg0t8FstXh/KvyaNnLX+VJlclxbH7L2qcCW6lubM86u0ZYMU3XLQC7XmKpekdZK5m
	0XJTuIQ29d9U616gKO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6a1l-007nzi-0c;
	Fri, 24 Nov 2023 17:31:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6a1h-007nyw-1z
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 17:31:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9fcfd2a069aso310515066b.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Nov 2023 09:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700847094; x=1701451894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MmcPyK3mkdrLM52uLYpIt1qXSSFyNhnpJboXxQydAo=;
        b=jdoRMSb23teSIjhBL4StSKS3VCdNfStctpsodi8xQwupW1sl2YO/eTIJ8Lojqis6j8
         GCLBNymjKKViF4XNLmeN4DgHrdYDFnJhMCe6VrPc6Mh2heNt+paeXyF1G17Slu75CkUz
         0IkuTfTn7AMM5zSbM7wqpcGELrtmywKOzBEzAt/BU5AbnQm6DAuWw78CkycnCmdT/ULc
         Fi2kHyD4TPtD3TleneuS94sxm+dYY5ThcR/BcCLLrKR3HLAxx96rVQ2vgY+oJej8Qa2r
         X4oUoh3Kf4Lxdno697eYR/CZ2q8fJC+lAVEl6eQijQzW0/fhF7LQDUDsH3RnG27mkU+p
         5QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700847094; x=1701451894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MmcPyK3mkdrLM52uLYpIt1qXSSFyNhnpJboXxQydAo=;
        b=RdRXgzVfFSAfySgHCs9TBOsxYH79n+nVpHva6wiD21zxGxVPZJeg8RwRg6T1XAq7nk
         Ga3upfBZmfk3VCIl4s7j59Hu8u0wqePIefSAv1M+nILwOFTnXPK1/jyuPTh+Oibjoheo
         eh0CKHEYyRjgWLmiaAfhzzKuTDNi5fnjJK7l93C/j6/wmQ06zw4uQVUsmyS3ruRYUsru
         LOGp8ETzBUUR8U3WborvVTRKumShkZCi2jO9g6qIuewgrDkXg6T9ddMQsX0uJbmu1H6s
         zQZhV7e5fnoxp2VLBHsAB0V9s3GczWFqWH2L4IcDAjknasUFrCFKtAALGzwOK6GHxhSt
         H1cA==
X-Gm-Message-State: AOJu0YwfWKI5tefS3YVi8V/cdJAdlU86K1jU4ygzHJZAzf7aZsC0ek60
	EkWaGKGXVz8Ktfofo/vcfROWLQ==
X-Google-Smtp-Source: AGHT+IG6CMsfmQV5iDvLoyvWP8dLg5EMoM/S3qrMav9BlUgZwXuqbKVl403ib2zNmITpuo9KrFP3JA==
X-Received: by 2002:a17:907:2983:b0:9fb:da63:bb2f with SMTP id eu3-20020a170907298300b009fbda63bb2fmr2616757ejc.18.1700847094196;
        Fri, 24 Nov 2023 09:31:34 -0800 (PST)
Received: from localhost ([81.19.4.232])
        by smtp.gmail.com with ESMTPSA id h4-20020a170906398400b009fd541851f4sm2306940eje.198.2023.11.24.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:31:33 -0800 (PST)
Date: Fri, 24 Nov 2023 18:31:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v5 4/5] tty: Add SBI debug console support to HVC SBI
 driver
Message-ID: <20231124-cf60c92a6a7a2b220feab211@orel>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
 <20231124070905.1043092-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124070905.1043092-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_093137_650895_3DF2547F 
X-CRM114-Status: GOOD (  22.09  )
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

On Fri, Nov 24, 2023 at 12:39:04PM +0530, Anup Patel wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> RISC-V SBI specification supports advanced debug console
> support via SBI DBCN extension.
> 
> Extend the HVC SBI driver to support it.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/tty/hvc/Kconfig         |  2 +-
>  drivers/tty/hvc/hvc_riscv_sbi.c | 37 ++++++++++++++++++++++++++-------
>  2 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> index 4f9264d005c0..6e05c5c7bca1 100644
> --- a/drivers/tty/hvc/Kconfig
> +++ b/drivers/tty/hvc/Kconfig
> @@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
>  
>  config HVC_RISCV_SBI
>  	bool "RISC-V SBI console support"
> -	depends on RISCV_SBI_V01
> +	depends on RISCV_SBI
>  	select HVC_DRIVER
>  	help
>  	  This enables support for console output via RISC-V SBI calls, which
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index 31f53fa77e4a..2f3571f17ecd 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -39,21 +39,44 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
>  	return i;
>  }
>  
> -static const struct hv_ops hvc_sbi_ops = {
> +static const struct hv_ops hvc_sbi_v01_ops = {
>  	.get_chars = hvc_sbi_tty_get,
>  	.put_chars = hvc_sbi_tty_put,
>  };
>  
> -static int __init hvc_sbi_init(void)
> +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
>  {
> -	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> +	return sbi_debug_console_write(buf, count);
>  }
> -device_initcall(hvc_sbi_init);
>  
> -static int __init hvc_sbi_console_init(void)
> +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
>  {
> -	hvc_instantiate(0, 0, &hvc_sbi_ops);
> +	return sbi_debug_console_read(buf, count);
> +}
> +
> +static const struct hv_ops hvc_sbi_dbcn_ops = {
> +	.put_chars = hvc_sbi_dbcn_tty_put,
> +	.get_chars = hvc_sbi_dbcn_tty_get,
> +};
> +
> +static int __init hvc_sbi_init(void)
> +{
> +	int err;
> +
> +	if (sbi_debug_console_available) {
> +		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
> +		if (err)
> +			return err;
> +		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> +	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
> +		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
> +		if (err)
> +			return err;
> +		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> +	} else {
> +		return -ENODEV;
> +	}
>  
>  	return 0;
>  }
> -console_initcall(hvc_sbi_console_init);
> +device_initcall(hvc_sbi_init);
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
