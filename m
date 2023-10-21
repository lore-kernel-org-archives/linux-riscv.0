Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D1CC004C0
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Oct 2023 16:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyQKNcV5MM98bnBUuMOW3focKGOC87IfB9IUVW/tJ3k=; b=xiN+J1sFczt2QB
	Jo3MfmA8PynB8cIZLXph6MA0EO3495nss8evL0wSdN2rfjxdgyZr5Sv993+l5uGUUyvL54Sx/VW1o
	7UeleYAYjk5bw9iMt1d2HTacpMkR2odKg9bKCIjhkhOAOwXcBFSYD0uuC7W9uekC6YnHvufzH8GOk
	7/kZYbVmya7jihCHpoHmYeSwcKsGpLjkNA8DNY38+GE1udLT5w/U7ga1vT6HNpbOb5twdL1ObSRB3
	E+My8rYeYVTNQDhIrUKopc0U9BU1FQ4adh/zYAyOkPyqAjbWAbpeoLfbDqj2lnOjJphR+2logUCcd
	ZZwUsU7drISQtbMiaBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quF6y-004FqT-23;
	Sat, 21 Oct 2023 16:46:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quF6s-004Fop-2O;
	Sat, 21 Oct 2023 16:46:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CDC34B80E7B;
	Sat, 21 Oct 2023 16:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA210C433C8;
	Sat, 21 Oct 2023 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697906746;
	bh=MN1/oJukE4EkbtjF4EsDiPa4e+4k6rhpReY9dOx0rVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG2rxm/nXn3ve2cTPaP/raeMGmB70IeM1Ut27WsvANxOpR+Veq+GgHzIg+//lxz4d
	 6uLoJ0ZsctjIObzV1It7g+tCxrCAJLp6lzF65mWR7jFRpoYEsMeABM1F4q5uU5Dvok
	 W1RsvxDiwmItNWuJHnqnamJDE9ZshM/EFWVQyZ1g=
Date: Sat, 21 Oct 2023 18:45:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] tty/serial: Add RISC-V SBI debug console based
 earlycon
Message-ID: <2023102120-unleveled-composed-45a2@gregkh>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_094559_049414_E5C7E82A 
X-CRM114-Status: GOOD (  21.14  )
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

On Fri, Oct 20, 2023 at 12:51:38PM +0530, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

This is still a bit hard to follow, and I guarantee it will be a pain to
maintain over time, trying to keep both calls in sync, right?

Why not fix up sbi_ecall() to get this correct instead?  It should be
handling phys_addr_t values, not forcing you to do odd bit masking every
single time you call it, right?  That would make things much easier
overall, and this patch simpler, as well as the next one.

Oh wait, sbi_ecall() is crazy, and just a pass-through, so that's not
going to work, you need a wrapper function for this mess to do that bit
twiddeling for you instead of forcing you to do it each time, I guess
that's what you are trying to do here, but ick, is it correct?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
