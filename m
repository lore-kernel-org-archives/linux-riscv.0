Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7A8CD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jROuF3heoU3I+kJfyVQf2SB6/ZCx0uMCnZ8gTbgz1M=; b=m1imFk8BYw4NEO
	bMhyj//Lyz7mYuGh9EOWGy8hDmJP21JwDcykvMAVpJh0F08m9gGTLSe0x9J/W1WOzKZqN4v5R6R5b
	qpnuAdywplfn+MoUPf1uLiBCE8nLaf8rRL3MJ0j6frN1jbr3FUDj7O0qnc6FTVa17CiCTupt0mkOM
	dzL3r4b/U0Pj8XsJ+hjMLs6qr4gtbftW0qcdSmPC1vndHLDRex+MYSmiTIE8uSb5xN6TH1jgvJf5A
	OSXkRvS4X5ApHe39xt/gzGJoL5sodmJoLhjUEjtxxJgSEHBuPAkFTkc0Oq3sN41bn5XWyhkW8ztMX
	UCcD9fQNOLKci1HqMkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGHq-00DpY1-0O;
	Tue, 10 Oct 2023 17:12:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGHm-00DpX0-0s;
	Tue, 10 Oct 2023 17:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72E43615AB;
	Tue, 10 Oct 2023 17:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E682C433C7;
	Tue, 10 Oct 2023 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696957965;
	bh=+k83Wr/EUECBDmTY4zF/z/iAjbCmN1Z0PcCaY918fko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8/uqYlf08jWlRslIBjTFO+O3KgIK4hpU8keuMdttxUwK2/9BA0rrNe2DhBa7HpYl
	 I/alfdg11rxUhylY0/9H2xtDI6H1yC7wPztb9/1hUE9ZzcSiPSz0b0kYJerOuVfCok
	 WHXS5S9wReYUkDvdHstV1VmsH6cDy1VV/U/4BhNk=
Date: Tue, 10 Oct 2023 19:12:42 +0200
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
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 5/6] tty: Add SBI debug console support to HVC SBI driver
Message-ID: <2023101045-hazard-popcorn-7d19@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010170503.657189-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_101246_387795_DA222FDD 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, Oct 10, 2023 at 10:35:02PM +0530, Anup Patel wrote:
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -15,6 +15,7 @@
>  
>  #include "hvc_console.h"
>  
> +#ifdef CONFIG_RISCV_SBI_V01

Please no #ifdef in a .c file, that's not a good style for Linux code at
all.

And what if you want to build the driver for both options here?  What
will happen?

> +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
>  {
> -	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> +	phys_addr_t pa;
> +	struct sbiret ret;
> +
> +	if (is_vmalloc_addr(buf))
> +		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> +	else
> +		pa = __pa(buf);
> +
> +	ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +#ifdef CONFIG_32BIT
> +		  count, pa, (u64)pa >> 32,
> +#else
> +		  count, pa, 0,
> +#endif

This is not how to do an api, sorry, again, please no #ifdef if you want
to support this code for the next 20+ years.

thanks,

gre gk-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
