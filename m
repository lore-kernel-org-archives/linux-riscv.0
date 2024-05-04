Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69129C10F1A
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtT+sv270ZRP5u68Kf14ApVdF3gbcCnMa42vCnadNYI=; b=JichkOIqHUF1zm
	R9jE8tLyTx9w787Wz/32NFh0qdSzSTF6Zud6jAasGnamyRjan6M9BcSLEpHV1jX8rhoeLJENpMIHU
	bDtBLA6H4Gyaz62+VvKPqjv0MmToyjzwH2p+KHaptkweUTx0nxSbhlWQsCTAzVSdkUy3tNZl8qJr1
	1fSnzcwrJ0Ymy+oqNTnvbtU2n9+tphIM1SuUt1vRs0TC+7KyW/JAKUh337XiA5rDJdhfvqs4EdL+H
	e4rFvxQ7GA1uCEKsF33tbTqhNw2MLqP/AdS9wBVqJTiK7+0MX5pG/bg9Q24YxZOO2vBDuUSE2wTVz
	PdeMps+GNz56SdHbdA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Hhv-00000002OH1-3IIG;
	Sat, 04 May 2024 15:53:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3Hhq-00000002OEn-2Jyg;
	Sat, 04 May 2024 15:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9987CE01BC;
	Sat,  4 May 2024 15:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED39C072AA;
	Sat,  4 May 2024 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714838021;
	bh=8I8m+ARERilkFj7kIbhJ3jfl4OiynemXtq1r//9ZZG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBFZQmgdyX6pMsEUa7czdAYYb8afZ3p6iRVUD/H9YzuOfGgH1cZKo2dib2Jh93VK+
	 8LPWbA2+H9SGLgmogKYkxW5/Q+Vq/loJY9A+poOwUtd5I2agVivdOgQXtTwcqUx+b6
	 m+Duex3ZyppN9X/0T/ZfT4gefnqjqWMjeM41aIDI=
Date: Sat, 4 May 2024 17:53:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 17/17] serial: 8250: Add 8250_acpi driver
Message-ID: <2024050421-coil-payphone-f3a1@gregkh>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-18-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_085346_972440_88C69DE7 
X-CRM114-Status: GOOD (  24.60  )
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

On Wed, May 01, 2024 at 05:47:42PM +0530, Sunil V L wrote:
> RISC-V has non-PNP generic 16550A compatible UART which needs to be
> enumerated as ACPI platform device. Add driver support for such devices
> similar to 8250_of.
> 
> The driver is enabled when the CONFIG_SERIAL_ACPI_PLATFORM option is
> enabled. Enable this option for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig        |  1 +
>  drivers/tty/serial/8250/8250_acpi.c | 96 +++++++++++++++++++++++++++++
>  drivers/tty/serial/8250/Kconfig     |  8 +++
>  drivers/tty/serial/8250/Makefile    |  1 +
>  4 files changed, 106 insertions(+)
>  create mode 100644 drivers/tty/serial/8250/8250_acpi.c
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3cae018f9315..bea8241f52eb 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -150,6 +150,7 @@ CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_ACPI_PLATFORM=y
>  CONFIG_SERIAL_SH_SCI=y
>  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
> diff --git a/drivers/tty/serial/8250/8250_acpi.c b/drivers/tty/serial/8250/8250_acpi.c
> new file mode 100644
> index 000000000000..3682443bb69c
> --- /dev/null
> +++ b/drivers/tty/serial/8250/8250_acpi.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Serial Port driver for ACPI platform devices
> + *
> + * This driver is for generic 16550 compatible UART enumerated via ACPI
> + * platform bus instead of PNP bus like PNP0501. This is not a full
> + * driver but mostly provides the ACPI wrapper and uses generic
> + * 8250 framework for rest of the functionality.

No copyright line?  Odd, but ok, I'll take it, glad to see your company
finally realizes the lack of needing them :)


And as Andy said, please use the existing driver and extend what you
need, don't write a new one, we really don't need a new one.

> +static int acpi_platform_serial_probe(struct platform_device *pdev)
> +{
> +	struct acpi_serial_info *data;
> +	struct uart_8250_port port8250;
> +	struct device *dev = &pdev->dev;
> +	struct resource *regs;
> +
> +	int ret, irq;
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!regs) {
> +		dev_err(dev, "no registers defined\n");
> +		return -EINVAL;
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	memset(&port8250, 0, sizeof(port8250));
> +
> +	spin_lock_init(&port8250.port.lock);

Are you sure this works?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
