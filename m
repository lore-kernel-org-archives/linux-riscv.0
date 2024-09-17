Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF0CC021A7
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6TWaMNBW6/pSbF+ig4XKlLd/heGAIoaTiakDo8E9c/c=; b=s8l/G8I8yeqyXV
	tsBrja9wnIB3dAS/Wt0bfEwmTkb0djqMu+ju1qsPM0XaydWhODIa2MZedamCASwH94A51ETEr+F+I
	+H/LQLOuvNS/sccNeuzOfRcndz7jaDqTiCgClgyv/g6QCy8EFgx1KhMeqHelhQzQ9UIHMlXj0hPfm
	nUlMS/V1wCMsGnu4/muS4G+6zeQhYLEtM2itgTHxGXMCDwTnTarJmgCljTie/IZohjOy9kZmWeK8J
	RKw9TfjoTLN3yJd+logK4tdkJK5u0HteOVPHof8/7h5krgiYRDRa28etv5p4vDvQIgOfx/6v4hYMM
	dwgT8isew0yA9h9K7Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXyP-00000006Cet-3GTA;
	Tue, 17 Sep 2024 13:10:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXyN-00000006CeK-0Y8Y
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:10:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-207115e3056so50301505ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726578626; x=1727183426; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tmpipaU5ffyWBh3m6fh3V3iGFrcojyzndJ3rQy5E5JM=;
        b=yIfqz8s7TLihEyY5vZC/dMm1zNlKqlEv7ny7li9qx8/TCdNx7BOKBx3rZcqfxznu5a
         WVY7NszHEQ3xGEaMIlBKP1ArfwveUbSgQGShUEOwE1O4mVE5t9QKxqiAq0TDTP29xyAo
         Qa6hT+tOvHHd8R7w9NszgY3O3rTbuUcX7Ny2nEnAB8Jwlmgdce2xQO2U/6nMsuTRlmhw
         RqvCC3glTxULGR2SlSBhWu20vB/Rmc5tyMAuP7xcTknx+lgHgKgkXTolVb6YZEdkNmVn
         aaKXViUm1Uly9H1Bj26I6ugS1l23QUTa20WrU9v8WX2W6tSzdfEPw1XmEOYJF9VJUOEo
         sD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726578626; x=1727183426;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmpipaU5ffyWBh3m6fh3V3iGFrcojyzndJ3rQy5E5JM=;
        b=u5Bss3D8XC9o/mU0/z5Gc8MqhyRUD9JHGeque/QzMXm92571uVBb7kPZH67355MYMA
         JfOxz/d/YTANt298Y++0wHJ2fW8XaPA3U1MQPt7VPTPdTN5glb1Y4JO8snQxVqRZVw+0
         QhGTn26FJ1Yf5zEBzRFbCpYERUg1BKRBYlUKUSQvGUdsYsU5h/LC84dh6tfw5VZkdWDX
         6/LXi3f0kpt6kTCB3CSXtkC2n10CNtrnfhsFpbbzpHl1L3K6nKFhcbxLCgA61tjz89O0
         YFlcNMlIBUr/D5FgGszOpdNhxhJ1Lc3qxxYEM6qOA+q9sCy1WxCJCwRvCFml0mzYPepD
         6C+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVK/YYY7BxUBN7O5DhNaZ3FrLudAlFnr0OTwAuYD1CMApu6Fj1pMKhlcyZ0HlF2cKBeUv7SD5mVucoDqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfmO0EiBBdbu8g1srDAUIHWvUPiYGJEVmBEZloL2CNwsboGK1t
	ejCd3McRVsHcjuvgNRTW9YXpXiW1kGxX9DRvmJS0ft+FomSDaxlrmk4l0+L4pFo=
X-Google-Smtp-Source: AGHT+IHr2PTsAEqZCBw/S1zvsTs5J8nFAVPnfPYChOs8eSgK4C2WuQJcW+CGfn1gsM2xolgbVSznbg==
X-Received: by 2002:a17:902:da84:b0:206:c911:9d75 with SMTP id d9443c01a7336-2076e3b2654mr255519565ad.20.1726578626018;
        Tue, 17 Sep 2024 06:10:26 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945db10csm50158835ad.53.2024.09.17.06.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:10:25 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:10:25 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:10:18 PDT (-0700)
Subject: Re: [PATCH] serial: 8250_platform: Enable generic 16550A platform devices
In-Reply-To: <20240730051218.767580-1-sunilvl@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Message-ID: <mhng-d52ac6ff-2221-4613-9fce-f73467495389@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_061027_199921_F78319FE 
X-CRM114-Status: GOOD (  32.36  )
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
Cc: apatel@ventanamicro.com, dfustini@tenstorrent.com, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, andrei.warkentin@intel.com, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, andriy.shevchenko@linux.intel.com, jirislaby@kernel.org, ajones@ventanamicro.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jul 2024 22:12:18 PDT (-0700), Sunil V L wrote:
> Currently, 8250_platform driver is used only for devices with fixed
> serial ports (plat_serial8250_port). Extend this driver for any generic
> 16550A platform devices which can be probed using standard hardware
> discovery mechanisms like ACPI.
>
> This is required in particular for RISC-V which has non-PNP generic
> 16550A compatible UART that needs to be enumerated as ACPI platform
> device.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/tty/serial/8250/8250_platform.c | 77 +++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)


It seems a bit awkward that we need something RISC-V specific here.  I 
guess the idea is that we don't want to depend on PNP because we'd end 
up with a bunch of PCI dependencies as well?  That seems like kind of an 
odd way to do things, but I'm frequently suprised by ACPI stuff so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if someone was waiting for me...

> diff --git a/drivers/tty/serial/8250/8250_platform.c b/drivers/tty/serial/8250/8250_platform.c
> index d5c8d851348d..bdfb16bed4f2 100644
> --- a/drivers/tty/serial/8250/8250_platform.c
> +++ b/drivers/tty/serial/8250/8250_platform.c
> @@ -6,7 +6,9 @@
>   *	      PNP 8250/16550 ports
>   *	      "serial8250" platform devices
>   */
> +#include <linux/acpi.h>
>  #include <linux/array_size.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/once.h>
> @@ -100,6 +102,65 @@ void __init serial8250_isa_init_ports(void)
>  	DO_ONCE(__serial8250_isa_init_ports);
>  }
>
> +/*
> + * Generic 16550A platform devices
> + */
> +static int serial8250_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct uart_8250_port uart = { 0 };
> +	struct resource *regs;
> +	unsigned char iotype;
> +	int ret, line;
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (regs) {
> +		uart.port.iobase = regs->start;
> +		iotype = UPIO_PORT;
> +	} else {
> +		regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (!regs) {
> +			dev_err(dev, "no registers defined\n");
> +			return -EINVAL;
> +		}
> +
> +		uart.port.mapbase = regs->start;
> +		uart.port.mapsize = resource_size(regs);
> +		uart.port.flags = UPF_IOREMAP;
> +		iotype = UPIO_MEM;
> +	}
> +
> +	/* Default clock frequency*/
> +	uart.port.uartclk = 1843200;
> +	uart.port.type = PORT_16550A;
> +	uart.port.dev = &pdev->dev;
> +	uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
> +	ret = uart_read_and_validate_port_properties(&uart.port);
> +	/* no interrupt -> fall back to polling */
> +	if (ret == -ENXIO)
> +		ret = 0;
> +	if (ret)
> +		return ret;
> +
> +	if (uart.port.mapbase) {
> +		uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
> +		if (!uart.port.membase)
> +			return -ENOMEM;
> +	}
> +
> +	/*
> +	 * The previous call may not set iotype correctly when reg-io-width
> +	 * property is absent and it doesn't support IO port resource.
> +	 */
> +	uart.port.iotype = iotype;
> +
> +	line = serial8250_register_8250_port(&uart);
> +	if (line < 0)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  /*
>   * Register a set of serial devices attached to a platform device.  The
>   * list is terminated with a zero flags entry, which means we expect
> @@ -110,6 +171,15 @@ static int serial8250_probe(struct platform_device *dev)
>  	struct plat_serial8250_port *p = dev_get_platdata(&dev->dev);
>  	struct uart_8250_port uart;
>  	int ret, i, irqflag = 0;
> +	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
> +
> +	/*
> +	 * Probe platform UART devices defined using standard hardware
> +	 * discovery mechanism like ACPI or DT. Support only ACPI based
> +	 * serial device for now.
> +	 */
> +	if (!p && is_acpi_node(fwnode))
> +		return serial8250_platform_probe(dev);
>
>  	memset(&uart, 0, sizeof(uart));
>
> @@ -198,6 +268,12 @@ static int serial8250_resume(struct platform_device *dev)
>  	return 0;
>  }
>
> +static const struct acpi_device_id acpi_platform_serial_table[] = {
> +	{ "RSCV0003", 0 }, // RISC-V Generic 16550A UART
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, acpi_platform_serial_table);
> +
>  static struct platform_driver serial8250_isa_driver = {
>  	.probe		= serial8250_probe,
>  	.remove_new	= serial8250_remove,
> @@ -205,6 +281,7 @@ static struct platform_driver serial8250_isa_driver = {
>  	.resume		= serial8250_resume,
>  	.driver		= {
>  		.name	= "serial8250",
> +		.acpi_match_table = ACPI_PTR(acpi_platform_serial_table),
>  	},
>  };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
