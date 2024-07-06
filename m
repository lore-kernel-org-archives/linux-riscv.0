Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE838C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nKAPgLY/IJd0HAOcFyo80xo3egx8cs1KNWAKZIVxCo=; b=aahjqROreh8KHP
	i/pV9HadEq4KSqHioUvEWsp+Wra5IgGbMakdunu4QHIdQU3xzASyrN2PdlZZLZcrJW0MriBBsWWo3
	on3uk77577vMP4rvHyPfRjByoTF7cMxi2kh+ui1SOBXXqui+aN8KGWoMxAqRmNorBZVXSYIDMpkbX
	6fscM+liLuIU9+gQYwooC0pOM4N/NjOTUyYgp2AuBqIjmXSi1AEhznoTwePteOO98BaImDvypCJFz
	9zs2J59doNEEHTrHs/hM2cHb7hJSkHA1A/FUZJ8f1uWy5XG5gSKW0XPrqcMDBdGoBS4PEZug9WF9e
	GwEvdeKBhBruIcnZeDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ62g-00000000ITl-39qH;
	Sat, 06 Jul 2024 14:05:34 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ62d-00000000ITF-0X41
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 14:05:32 +0000
Date: Sat, 6 Jul 2024 14:05:24 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] serial: 8250: don't lost port's default capabilities
Message-ID: <20240706140524.GYA4122589.dlan.gentoo>
References: <20240706082928.2238-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706082928.2238-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_070531_215357_5433A50D 
X-CRM114-Status: GOOD (  18.95  )
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

On 16:29 Sat 06 Jul     , Jisheng Zhang wrote:
> Commit b0b8c84cf58d ("serial: of_serial: Handle auto-flow-control
> property") added support for fifo-size and hw-flow-control properties
> to avoid adding new types to 8250.c for UARTs that are compatible with
> the standard types but that have different size fifo or support 16750
> compatible auto flow control. We avoided many new 8250 port types with
> this nice feature, but there's a problem, if the code detects fifo-size
> or auto-flow-control property, up->capabilities will be set
> accordingly, then serial8250_set_defaults() will ignore the default
> port's capabilities:

> 
> |if (!up->capabilities)
> |	up->capabilities = uart_config[type].flags;
> 
so the previous old logic is trying to override the config of 'type' uart,
while this patch try to extend capabilities with default config of 'type' uart as base

I tend to agree this is right direction (but wasn't 100% sure..)

btw, Jisheng, can you also check serial8250_do_startup()? which has similar logic

> If the port's default capabilities contains other bits such as
> UART_CAP_SLEEP, UART_CAP_EFR and so on, they are lost.
> 
> Fixes: b0b8c84cf58d ("serial: of_serial: Handle auto-flow-control property")

I believe the commit just reveal the problem, make it more visible, but not the root cause,
'git blame' lead to b6830f6df8914f ("serial: 8250: Split base port operations from universal driver")
as the original commit introduce this logic which seems exist long time ago..


> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/tty/serial/8250/8250_port.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 893bc493f662..e20614241229 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -3245,8 +3245,7 @@ void serial8250_set_defaults(struct uart_8250_port *up)
>  			up->port.fifosize = uart_config[type].fifo_size;
>  		if (!up->tx_loadsz)
>  			up->tx_loadsz = uart_config[type].tx_loadsz;
> -		if (!up->capabilities)
> -			up->capabilities = uart_config[type].flags;
> +		up->capabilities |= uart_config[type].flags;
>  	}
>  
>  	set_io_from_upio(port);
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
