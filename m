Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7A0CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icYdxYIvID3cQoro1D4QUYOJ7Z2rDfOmakGLVH40zz0=; b=io7n0eFwlvDL3S
	UpUPOclTgFd+0Srl6chA09Wi9qMbjez0cUpEhesHrLUqLH9n+772qmHpQG/RAy+lS5AVnDpJxYGu6
	1uWpJKRvbGB/ugy1P4tTuGID2/cIqk4rc7+kSUowEZ7LYzIrvjBfCtfTYXSJJk+eEJzOrwTbwPUVw
	BVkPPlzOG0ShjGZBtHH28ruLloAnfCaapvVlAoB0znVTTcFZefcSzEid2JEDjX0SXUtGl1G1tVhu2
	HLSwtX2c/TdPotcoC6dq51Qd4Guaq9n3j0tUIkR/t+BgHW1JAoEBRVCia2Zdcyfs58dhlJ3qlX6tQ
	S+Rne+OBRALDurtTwaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtONL-00GiAJ-0b;
	Thu, 19 Oct 2023 08:27:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtONI-00Gi9W-26
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 08:27:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40651a726acso67006655e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697704040; x=1698308840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aS9ZmATMA5UdrpXcs84XzGO/WomcKSWd4ogsdFNAVRI=;
        b=ojYNwBN1q7g9Am4UVbcTvPNlSP7+P4jAOgq4kITT7uvRvBobQ8saXhXL37SojTpIBE
         +S2/ZyhkJnhYcToA9QpBpT8fzW4H7eCFGNJyEAXNdZvJbJFlXU93WuRWflt7plfaqUtG
         /KLDb94dc+OPB7zA2JyQbNGDFYwByNyC10224V7Fzi4zkaJvHEaX1/rjGt8yuF/mWQOs
         /H6/UUFOXY/l8MZLM1Q6wemeagGqqzfkJYd0v4XxcMFJR9RQFzH92jwUjhpNQ1KCU4w6
         bNxohfs+cOZAWYS/bhql9c3cO9tHY9AzEgx08trzRVwyVV4wyEChTvtivWOMyhUcMkdG
         WZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697704040; x=1698308840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS9ZmATMA5UdrpXcs84XzGO/WomcKSWd4ogsdFNAVRI=;
        b=kmy8NEoWIpTkgq++W1bg7FyrijpTX/NIlP7e6quchXGSxpiZDFXAKL79yxSrLdUGjm
         Q8XM4yuIqlhazfvQCQlvsLpNXH8OkMwEGVVJRAJnx/JQ1fnum0iTsjJr2QWZ2mOehVuE
         Dvj4Ya26lXnCNgNiCuNYjGgDD66VywFj+pk0ncfSG29tm+avEzBH18NjJKPqKGj2myKQ
         dMZXsjC4/icNzzhmv7FV5ZeQ2LsaK8yrO6HXBMo9eSQT2Je5Q0nYWeeP8hGGDvNrjlyC
         3Z9IToCB+HpaGA0BGMFZwKysNxk3y/dcJF1HQ52fZ1n2TVZDqP04XA1nS7jm/gP+EFaI
         XJtQ==
X-Gm-Message-State: AOJu0Yw/G04ixvwLMIwIbDwiG9oAifzr0M5ZiZYIKQaPdYSSJPnqxT8f
	dz8F4iqXNnLCdRbKjCXAUldheA==
X-Google-Smtp-Source: AGHT+IHskKNqI6cyPtwKoTi5Al9ucFLHv3VeiXwM9dmzqt6kOBsKQXH4yfubGN4sdMpzP0jv+CThYA==
X-Received: by 2002:a05:600c:3542:b0:401:73b2:f039 with SMTP id i2-20020a05600c354200b0040173b2f039mr1228282wmq.7.1697704040501;
        Thu, 19 Oct 2023 01:27:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b00405959469afsm3842187wms.3.2023.10.19.01.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:27:19 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:27:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] tty/serial: Add RISC-V SBI debug console based
 earlycon
Message-ID: <20231019-f3c3768f5e95e747e1457c49@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_012724_687524_F5E2B5CA 
X-CRM114-Status: GOOD (  20.89  )
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

On Thu, Oct 12, 2023 at 10:45:07AM +0530, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/tty/serial/Kconfig              |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index bdc568a4ab66..cec46091a716 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
>  
>  config SERIAL_EARLYCON_RISCV_SBI
>  	bool "Early console using RISC-V SBI"
> -	depends on RISCV_SBI_V01
> +	depends on RISCV_SBI
>  	select SERIAL_CORE
>  	select SERIAL_CORE_CONSOLE
>  	select SERIAL_EARLYCON
> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> index 27afb0b74ea7..c21cdef254e7 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -15,17 +15,41 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
>  	sbi_console_putchar(c);
>  }
>  
> -static void sbi_console_write(struct console *con,
> -			      const char *s, unsigned n)
> +static void sbi_0_1_console_write(struct console *con,
> +				  const char *s, unsigned int n)
>  {
>  	struct earlycon_device *dev = con->data;
>  	uart_console_write(&dev->port, s, n, sbi_putc);
>  }
>  
> +static void sbi_dbcn_console_write(struct console *con,
> +				   const char *s, unsigned int n)
> +{
> +	phys_addr_t pa = __pa(s);
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +			  n, lower_32_bits(pa), upper_32_bits(pa), 0, 0, 0);
> +	else
> +		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +			  n, pa, 0, 0, 0, 0);
> +}
> +
>  static int __init early_sbi_setup(struct earlycon_device *device,
>  				  const char *opt)
>  {
> -	device->con->write = sbi_console_write;
> -	return 0;
> +	int ret = 0;
> +
> +	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> +	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +		device->con->write = sbi_dbcn_console_write;
> +	} else {
> +		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
> +			device->con->write = sbi_0_1_console_write;
> +		else
> +			ret = -ENODEV;
> +	}
> +
> +	return ret;
>  }
>  EARLYCON_DECLARE(sbi, early_sbi_setup);
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
