Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAABACDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9FuuSWJhluRurE5YGhdl9mzM6ymfgJtqEsZLzu5EvQ=; b=eaDxCm0EJ8T1qJ
	zUSHLFp4g61GeRQdl2PwfCnNv0LHw7J0Ufs6PegZcAkFdxe5ToRCQHrtIWrY63VCfbTKqZkOwzc2f
	Me6SWpWAFOpKevWZjnF1XwiPgXgBOC/vbgHUlJqi8n/koOyxX9NLylS2qHaGJU0hNyr1O+IJpR9AD
	jyztyI97TpuqTdwD/swfrKJht0gmayChHRmw1X4HChc9XBpaQbMmxhV984JVMcBOXOHM2g4hAHFy6
	WpFWE2WsTtat5GdGItZGEUyefWPu+P4Ha6Ky8S7CorzWWCFv29mcwLTYbPeGh1w39CFoa/671kLEK
	XVwEgq30Qs+crYhzpTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtn1p-001sIY-3C;
	Fri, 20 Oct 2023 10:46:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtn1n-001sDV-1a
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 10:46:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so918852a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 03:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697798808; x=1698403608; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4FNgEavOCML3+P3zV8vrHxk6JHiOQKnLJ34VOXcto0=;
        b=QAB2+fgfrUxzRE3aRgEU1PbMHRCL18TKHub1DvQ9fVDh82xd+DUrKu65b00HeHhpD9
         eiYC/7XbsbiZY6TqlS8nVwXdg4oiHQ3ZNXTPvCOQCRV6JmILkOpkXryi6EG70zGx5ZTc
         UFwGN1clW/C5TeHvJ5mg1mutET5jP1Pr/fNyFQGons3vMwrA9YMp9YYAUVbE58zsMhr8
         watA1f/R9o///XBO6ve4QYg++0cYfnKmT2cmZ9o2PdCp/fm8PrSpvLyChnPcoNRtJt9Y
         PTMJSIFJvmHEtzlTKCwL6FziSn7yb374XFlbiF6KJGhIF22e8Zhuh8ORFXPITI9LVK5h
         oSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798808; x=1698403608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4FNgEavOCML3+P3zV8vrHxk6JHiOQKnLJ34VOXcto0=;
        b=HfoWWIx9VMIifnFcXMaDnoqiY5UhqfFjF45xyS/HMrx2IUqng2WEL6bVZyCFSdCd0t
         i5JkLFSQZSSDwlZziD2btfKw8ZGWPoxpOIEo1XB5UJGNSaVg4C+l4zdQuHh9MkJ/l6vq
         Ef1c6DTnBiu8Rg92Gy4utgpT9yOW0aHJK2FLOL1z+qdxtD7Q7Ed3jvR08TCSeW/HrCxL
         JUH5UXXzcGiHtIO/ZIJTZWJJkA/uLZT2bsa+HZypSz+2MIGM6g6mw4LwYuIUug5AE1u2
         gNTorQPN56ZkxC7A9qWdaITSykmIAXFaYzlANBkVattzvvpfi485DijbiXYngDfc8X89
         x3fA==
X-Gm-Message-State: AOJu0YyqOrDrNdhF2kg2KFSouQ7BxnypBqEfH5mvQ05FuI2LEKltxo9J
	H2lK9FOjZIZglXUEYxKDp/noIw==
X-Google-Smtp-Source: AGHT+IGO0GMjn00PKL7e3zKeoD4F27QBrWs+IFdZxdcX9F+Azofcpoji3ND0CTBFW2yKpQjyxJQKzg==
X-Received: by 2002:a17:907:3d92:b0:9b2:b71f:83be with SMTP id he18-20020a1709073d9200b009b2b71f83bemr978732ejc.1.1697798807645;
        Fri, 20 Oct 2023 03:46:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f17-20020a1709062c5100b009c5c5c2c5a4sm1205348ejh.219.2023.10.20.03.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:46:47 -0700 (PDT)
Date: Fri, 20 Oct 2023 12:46:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI
 driver
Message-ID: <20231020-f1ec2b7e384a4cfeae39966f@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_034651_532944_46DABB43 
X-CRM114-Status: GOOD (  24.72  )
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

On Fri, Oct 20, 2023 at 12:51:39PM +0530, Anup Patel wrote:
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
>  drivers/tty/hvc/hvc_riscv_sbi.c | 82 ++++++++++++++++++++++++++++++---
>  2 files changed, 76 insertions(+), 8 deletions(-)
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
> index 31f53fa77e4a..56da1a4b5aca 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -39,21 +39,89 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
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
> +	phys_addr_t pa;
> +	struct sbiret ret;
> +
> +	if (is_vmalloc_addr(buf)) {
> +		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> +		if (PAGE_SIZE < (offset_in_page(buf) + count))

I thought checkpatch complained about uppercase constants being on the
left in comparisons.

> +			count = PAGE_SIZE - offset_in_page(buf);
> +	} else {
> +		pa = __pa(buf);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				count, lower_32_bits(pa), upper_32_bits(pa),
> +				0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				count, pa, 0, 0, 0, 0);
> +	if (ret.error)
> +		return 0;
> +
> +	return count;

Shouldn't we return ret.value here in case it's less than count? I see we
already do that below in get().

>  }
> -device_initcall(hvc_sbi_init);
>  
> -static int __init hvc_sbi_console_init(void)
> +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
>  {
> -	hvc_instantiate(0, 0, &hvc_sbi_ops);
> +	phys_addr_t pa;
> +	struct sbiret ret;
> +
> +	if (is_vmalloc_addr(buf)) {
> +		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> +		if (PAGE_SIZE < (offset_in_page(buf) + count))
> +			count = PAGE_SIZE - offset_in_page(buf);
> +	} else {
> +		pa = __pa(buf);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				count, lower_32_bits(pa), upper_32_bits(pa),
> +				0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				count, pa, 0, 0, 0, 0);
> +	if (ret.error)
> +		return 0;
> +
> +	return ret.value;
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
> +	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> +	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));

Why an outbuf size of only 16?

> +		if (err)
> +			return err;
> +		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> +	} else {
> +		if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
> +			err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 16));
> +			if (err)
> +				return err;
> +			hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> +		} else {
> +			return -ENODEV;
> +		}
> +	}
>  
>  	return 0;
>  }
> -console_initcall(hvc_sbi_console_init);
> +device_initcall(hvc_sbi_init);
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
