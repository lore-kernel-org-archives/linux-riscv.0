Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF99C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 22:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bz8alN04LBzB7+GDdItQD0grk24JtyY7+IWoBql+JYo=; b=U2FKib701FJqRd
	OxkzO7v7/n5qhLyAtLP/syQ1KToOL6QFY9I4qAmpN1G9T0Xo14MPjUvFeDXUnP5g5RnI7vdLWAY0q
	RY+2sCrxJsOgJ+7oTKr39QYeNP5UOKFK3ryld7aYuxBpVnWpW+efJrAvamaAFesagnCyoPFetMYq1
	ip6XIwSrw5VM1slqIF4hIl/kqBR4vTSe+Tf3xiSI47mZD6fImZ/9dloyytytHsmBC7IKRT8jM/K3d
	4F+X1ckNlYzYWyUay4hYvkiSeO4iLGJfZwS5Jkjm/5T2cTdghq4B1gWUV+cg7kfOYNgevA25jPxtd
	NI0cuyXdUa3keXRExvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQDyI-00000000wWv-1wa5;
	Sat, 06 Jul 2024 22:33:34 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQDyE-00000000wWB-2rR3
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 22:33:32 +0000
Date: Sat, 6 Jul 2024 22:33:23 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] serial: 8250: move mmp|pxa uart earlycon code and add
 xscale earlycon
Message-ID: <20240706223323.GYA367.dlan.gentoo>
References: <20240706101856.3077-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706101856.3077-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_153330_770916_FAC87B58 
X-CRM114-Status: GOOD (  19.12  )
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

Hi 
On 18:18 Sat 06 Jul     , Jisheng Zhang wrote:
> There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
> and the 8250_pxa. The previous one is generic and the latter is binded
> to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
> HW to support, making use of the generic 8250_of seems a good idea.
> However, there's no earlycon support if we go with this solution. So
> move the mmp|pxa-uart earlycon code to core 8250_early.c.
> 
> At the same, add xscale earlycon support too, only build test since
> I have no xscale machine any more.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/tty/serial/8250/8250_early.c | 11 +++++++++++
>  drivers/tty/serial/8250/8250_pxa.c   | 16 ----------------
>  2 files changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
> index e3f482fd3de4..6176083d0341 100644
> --- a/drivers/tty/serial/8250/8250_early.c
> +++ b/drivers/tty/serial/8250/8250_early.c
> @@ -171,6 +171,17 @@ OF_EARLYCON_DECLARE(ns16550a, "ns16550a", early_serial8250_setup);
>  OF_EARLYCON_DECLARE(uart, "nvidia,tegra20-uart", early_serial8250_setup);
>  OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
>  
> +static int __init early_serial8250_rs2_setup(struct earlycon_device *device,
> +					     const char *options)
> +{
> +	device->port.regshift = 2;
just wondering if possible to introduce a generic earlycon sub option? so kernel
can parse reg-shift from command line parameter instead of hardcoding here,
which would benefit more drivers (potentially without adding more OF_EARLYCON_DECLAREs..)

I mean something like this:
Documentation/admin-guide/kernel-parameters.txt
uart[8250],mmio32,<addr>[,options[,reg-shift=0,1,2,4 ..]]

> +
> +	return early_serial8250_setup(device, options);
> +}
> +OF_EARLYCON_DECLARE(uart, "intel,xscale-uart", early_serial8250_rs2_setup);
> +OF_EARLYCON_DECLARE(uart, "mrvl,mmp-uart", early_serial8250_rs2_setup);
> +OF_EARLYCON_DECLARE(uart, "mrvl,pxa-uart", early_serial8250_rs2_setup);
> +
>  #ifdef CONFIG_SERIAL_8250_OMAP
>  
>  static int __init early_omap8250_setup(struct earlycon_device *device,
> diff --git a/drivers/tty/serial/8250/8250_pxa.c b/drivers/tty/serial/8250/8250_pxa.c
> index ba96fa913e7f..b5d937f6f3f9 100644
> --- a/drivers/tty/serial/8250/8250_pxa.c
> +++ b/drivers/tty/serial/8250/8250_pxa.c
> @@ -165,22 +165,6 @@ static struct platform_driver serial_pxa_driver = {
>  
>  module_platform_driver(serial_pxa_driver);
>  
> -#ifdef CONFIG_SERIAL_8250_CONSOLE
> -static int __init early_serial_pxa_setup(struct earlycon_device *device,
> -				  const char *options)
> -{
> -	struct uart_port *port = &device->port;
> -
> -	if (!(device->port.membase || device->port.iobase))
> -		return -ENODEV;
> -
> -	port->regshift = 2;
> -	return early_serial8250_setup(device, NULL);
> -}
> -OF_EARLYCON_DECLARE(early_pxa, "mrvl,pxa-uart", early_serial_pxa_setup);
> -OF_EARLYCON_DECLARE(mmp, "mrvl,mmp-uart", early_serial_pxa_setup);
> -#endif
> -
>  MODULE_AUTHOR("Sergei Ianovich");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:pxa2xx-uart");
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
