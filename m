Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F37C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScghfT8r23n+hHa13cBV8BnflNFgPytNm02/3mB2Jag=; b=VAQdwRoHzW5EyI
	0R259mBp2U4KgWMVE+6Rmgakq3vrfQC9w+6c6tC5uTL32ZkT12w8em6Ck+j/fgSm41rVYZfX5MMKE
	aUgavhVaSzavSTWlm6NtxBkXNn04TgtzcmOnfxZo7yAoVZQDTPY54JYseIvtrXP5fJKbQdLtMK1f/
	MvQCHt0MGNdCJAto556IPcp96Xj/Y+Lgge+tEvQXeJNgL3U+XTBKIJlrbpwRwFauqtdbeOP6YkK8o
	S356YdiAgTXxTmDlJLz2eHoEiIIj9czXLK2ovTWTsSnkQpQCeQhDAUnna4x552wbuM+8LOsiR1ndw
	5MkyU89jS4PMem7fzpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQn82-00000003hXO-359X;
	Mon, 08 Jul 2024 12:05:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQn80-00000003hW6-0Q8p
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 12:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 121F76033C;
	Mon,  8 Jul 2024 12:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64675C116B1;
	Mon,  8 Jul 2024 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720440354;
	bh=zYiZL26YpL9nyJBbsDP8s4nzF/bHXrFqq56T1M+s51E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CScz0WZ99qjtrVPURkXM/OG7BWNP/9toOwOYu6FHQmMXHVS6vkrvE9s+tv5Ag5GyX
	 d+zy08c/3FCc+bWgUIJ7D1QfpyaxOclKyAHbpORvZQ3DzeBDFFpM9eKl8bF8rGjBxg
	 O8elQO+czjq/PgK0FCDdM25lfRqHJ5rZnhexQ2hQloqpbDSQaznCXUIj6Kkm7W2zar
	 NA8pOYoEg8GY9ARqy90GQp9O/yRmwRLa4w8v5X27EEMtbutKNUoe1k2Ys/mxs1z7WY
	 Q5DiUvNWoCzrUZ0ZEEFqFibTyuflF0nlqRRMzfMh5DnQLLR9rKpBDr8DjJik3arWvl
	 3VRj9O/Fa7eQg==
Date: Mon, 8 Jul 2024 19:51:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] serial: 8250: move mmp|pxa uart earlycon code and add
 xscale earlycon
Message-ID: <ZovSzxZzZJRS8JWm@xhacker>
References: <20240706101856.3077-1-jszhang@kernel.org>
 <20240706223323.GYA367.dlan.gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706223323.GYA367.dlan.gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_050556_292586_7AC3D037 
X-CRM114-Status: GOOD (  25.37  )
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

On Sat, Jul 06, 2024 at 10:33:23PM +0000, Yixun Lan wrote:
> Hi 
> On 18:18 Sat 06 Jul     , Jisheng Zhang wrote:
> > There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
> > and the 8250_pxa. The previous one is generic and the latter is binded
> > to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
> > HW to support, making use of the generic 8250_of seems a good idea.
> > However, there's no earlycon support if we go with this solution. So
> > move the mmp|pxa-uart earlycon code to core 8250_early.c.
> > 
> > At the same, add xscale earlycon support too, only build test since
> > I have no xscale machine any more.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/tty/serial/8250/8250_early.c | 11 +++++++++++
> >  drivers/tty/serial/8250/8250_pxa.c   | 16 ----------------
> >  2 files changed, 11 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
> > index e3f482fd3de4..6176083d0341 100644
> > --- a/drivers/tty/serial/8250/8250_early.c
> > +++ b/drivers/tty/serial/8250/8250_early.c
> > @@ -171,6 +171,17 @@ OF_EARLYCON_DECLARE(ns16550a, "ns16550a", early_serial8250_setup);
> >  OF_EARLYCON_DECLARE(uart, "nvidia,tegra20-uart", early_serial8250_setup);
> >  OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
> >  
> > +static int __init early_serial8250_rs2_setup(struct earlycon_device *device,
> > +					     const char *options)
> > +{
> > +	device->port.regshift = 2;
> just wondering if possible to introduce a generic earlycon sub option? so kernel

the 8250 ealycon can parse reg-shift from dt too, so no sub option is
needed. The reason I hardcoded here is: pxa-uart and xscale-uart doesn't
mandate "reg-shift" property in the binding, while I did see mmp-uart
mentions "reg-shift" is required in the DT binding.


> can parse reg-shift from command line parameter instead of hardcoding here,
> which would benefit more drivers (potentially without adding more OF_EARLYCON_DECLAREs..)
> 
> I mean something like this:
> Documentation/admin-guide/kernel-parameters.txt
> uart[8250],mmio32,<addr>[,options[,reg-shift=0,1,2,4 ..]]
> 
> > +
> > +	return early_serial8250_setup(device, options);
> > +}
> > +OF_EARLYCON_DECLARE(uart, "intel,xscale-uart", early_serial8250_rs2_setup);
> > +OF_EARLYCON_DECLARE(uart, "mrvl,mmp-uart", early_serial8250_rs2_setup);
> > +OF_EARLYCON_DECLARE(uart, "mrvl,pxa-uart", early_serial8250_rs2_setup);
> > +
> >  #ifdef CONFIG_SERIAL_8250_OMAP
> >  
> >  static int __init early_omap8250_setup(struct earlycon_device *device,
> > diff --git a/drivers/tty/serial/8250/8250_pxa.c b/drivers/tty/serial/8250/8250_pxa.c
> > index ba96fa913e7f..b5d937f6f3f9 100644
> > --- a/drivers/tty/serial/8250/8250_pxa.c
> > +++ b/drivers/tty/serial/8250/8250_pxa.c
> > @@ -165,22 +165,6 @@ static struct platform_driver serial_pxa_driver = {
> >  
> >  module_platform_driver(serial_pxa_driver);
> >  
> > -#ifdef CONFIG_SERIAL_8250_CONSOLE
> > -static int __init early_serial_pxa_setup(struct earlycon_device *device,
> > -				  const char *options)
> > -{
> > -	struct uart_port *port = &device->port;
> > -
> > -	if (!(device->port.membase || device->port.iobase))
> > -		return -ENODEV;
> > -
> > -	port->regshift = 2;
> > -	return early_serial8250_setup(device, NULL);
> > -}
> > -OF_EARLYCON_DECLARE(early_pxa, "mrvl,pxa-uart", early_serial_pxa_setup);
> > -OF_EARLYCON_DECLARE(mmp, "mrvl,mmp-uart", early_serial_pxa_setup);
> > -#endif
> > -
> >  MODULE_AUTHOR("Sergei Ianovich");
> >  MODULE_LICENSE("GPL");
> >  MODULE_ALIAS("platform:pxa2xx-uart");
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
