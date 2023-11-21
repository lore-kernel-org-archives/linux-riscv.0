Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AE2C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnK51mUg77j27lW2uJEkEzY+sbskTBb683OPhBjTu64=; b=wtqZUlDB/8lSjp
	FWxrnTsp4kzExiZPLwXfbufBP/ZIJ088x6OHfsgXdKv1DlvUs7v8h5KCzoh6i+yFgyPHUdNHR7w+m
	R+nL/ynud/Fn5SNuDA6xyG1U0g329lJI8WBbgNVymyrvgHkwLwu0qRFl67LLll9ElXQt8hzVpYTR7
	3hyYdpe7t3wwAlnpQ6MDoQ4FsXied+C2CZ4MmeKMnMj/55GNkwcOHcvpOcFoU/lRv7CzjRIY4C7V0
	xbVjmHwhAwSR1EghM21t0fFAbDXZUdOMZ5NIU7iP94tIWDqLcIH8miOuzjnJvIvksOGF3ubTFe8+N
	UxAUXPUzqrpXjVtcSnrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZQz-000CLn-1K;
	Tue, 21 Nov 2023 22:41:33 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZQw-000CL3-1A
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:41:31 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7a6889f33b9so211165739f.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606488; x=1701211288; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6Y5P6vvizTkCcH4d/w5IMJ1P3rAQH0RFmdfD+hCzFk=;
        b=Dx5H+ieFe2Sp1aG6CPwpJO0O2JxpfC+KA+1OEUosdV0K6bE9m/tVn93pCyTd/UItFD
         D+kfleawjD7HV/l6X7aGygtPtn1uIbGK5VFKpipwsNo58B/cJlfzbOao5qmHLSXQXtHO
         CGeMU+QbMeHpw/Zzbd7BkET7qDFNeit9pWg24AA3s4j7AkNYjouX8DXgFO0h/+NivhP2
         tl+FQygCWI/z32XfGpj6LnbDVZlV4Fwq5SJbCc/L5RH7RFM5/iBwHFA5o1VyaMCgeQp7
         CHKx9Z8i9oUl7t6APYhr69Cma52++IvDSF1CqcWw3+CwgRCc3/UZo45xJj0NgqLmZrCG
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606488; x=1701211288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6Y5P6vvizTkCcH4d/w5IMJ1P3rAQH0RFmdfD+hCzFk=;
        b=u7QXRxmEGAmAZsGpm0sAQHALtqNohiVafgOmvtNOUK4mwSXHEeblvEbiqA/yL2pB8j
         1FR5WDZVB8UbHCOOOGCRSoxJjAjVZyIkB5iyERlh8AgFjYhJy+uMqeFHdtkPXfs11JAg
         K1q55Pok/sf39SMhOfrarKZA+WnvxPFH6ljfTelJZnVFleqJEwsPb4CXenk32g9e3tWl
         E9JeCNaY6/avmn6hw99p07qC/CWq0CGf6C9g6qmVjjsvH1CnNul79EAbq8fjeDNeOzCY
         imHB09rjpfaA8BqBnEsggT7JybL2NSi1sxLMOlSlMOa4KK5SPqCt4fGCew3dWkY0eaMj
         gcEQ==
X-Gm-Message-State: AOJu0YwTPjnNfPrFzl4nv6UmVITuPNty4WNuOiealB5ewRQmU5xqUzLC
	i4utMN8/2/tdk9E0LqXMN3YBZA==
X-Google-Smtp-Source: AGHT+IFH/7RqkC4+CMkzTbT30NHfcCp/3hQroU+yf96S1nn9LE96a/StCjzs0+QoFrxTjKwkdSqwCg==
X-Received: by 2002:a6b:f719:0:b0:79f:d04d:ce5a with SMTP id k25-20020a6bf719000000b0079fd04dce5amr326806iog.2.1700606488169;
        Tue, 21 Nov 2023 14:41:28 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id s7-20020a056602010700b007b34b374dd1sm509116iot.18.2023.11.21.14.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:41:27 -0800 (PST)
Message-ID: <8c0f4eba-1923-4686-b07b-1f3b78b298e9@sifive.com>
Date: Tue, 21 Nov 2023 16:41:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] tty/serial: Add RISC-V SBI debug console based
 earlycon
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-4-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_144130_409500_F6737EA7 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Anup,

On 2023-11-17 9:38 PM, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/tty/serial/Kconfig              |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 732c893c8d16..1f2594b8ab9d 100644
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
> index 27afb0b74ea7..5351e1e31f45 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -15,17 +15,33 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
> +	sbi_debug_console_write(n, __pa(s));

This only works for strings in the linear mapping or the kernel mapping (not
vmalloc, which includes the stack). So I don't think we can use __pa() here.

> +}
> +
>  static int __init early_sbi_setup(struct earlycon_device *device,
>  				  const char *opt)
>  {
> -	device->con->write = sbi_console_write;
> -	return 0;
> +	int ret = 0;
> +
> +	if (sbi_debug_console_available) {
> +		device->con->write = sbi_dbcn_console_write;
> +	} else {
> +		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))

"else if", no need for the extra block/indentation.

Regards,
Samuel

> +			device->con->write = sbi_0_1_console_write;
> +		else
> +			ret = -ENODEV;
> +	}
> +
> +	return ret;
>  }
>  EARLYCON_DECLARE(sbi, early_sbi_setup);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
