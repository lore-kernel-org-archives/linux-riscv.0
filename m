Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A671C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9ZOmNzKonf59ytchHo9AfSf/WMn6VeEElfFxJ/gzXY=; b=IG+L1Ap9BTDLWw
	Z7ARLp7abaenvd4iJ20AzaRKcC9hcbcys9JyKlyNIOGn7XGcFdJQXYEHSPG3HMV8AyaVSwSxojslm
	8ImOKCqUR9+9KlEW1Ta5JmbOaG1Dbg/nZImsFDVM4qVYDx1OXYSnyiUFBpZPsVqc+TkMglX8oqe4W
	iWJ7I70Mf8QNr6Qefg7z3twnnlZUVvad1Z/4pYR3krPQvtgKEJEDC5KijU1MIlLHm44gTq6h1MJnN
	EZlDX7+Db2jumcgrhkvLBZjf25CiTBY3VNjXsi6m3MbPqGVu4CORRLPeHR8xapP83SAnx2tARPIhk
	HFRmWjjQ8T/rSxTZCP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ1Jl-0000000HaCQ-0l1S;
	Sat, 06 Jul 2024 09:02:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ1Jh-0000000HaBz-3qHj
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 09:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5010F61B45;
	Sat,  6 Jul 2024 09:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16FBC2BD10;
	Sat,  6 Jul 2024 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720256565;
	bh=LzforoF+0+/UCbH+FWr8s4xGhJ+NQq3I23rEgnI8QdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQd5NoS5X/i50MviFgFPHobQte/egNY5LF4NB2pwGn1s5nFdHDqVwSsvuERpqB45k
	 4oWYAzCEJIk7WTWvEhgt1L4vCbgeYANMvF1CJKVkZg0a9Zmdz8sMLfcmma6wftNlBW
	 hovwa6za6SBoeN8D++D0FnXqDF97Inv2YR0aWK1k=
Date: Sat, 6 Jul 2024 11:02:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] serial: 8250: don't lost port's default capabilities
Message-ID: <2024070631-chrome-impromptu-e140@gregkh>
References: <20240706082928.2238-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706082928.2238-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_020250_026109_62D4C643 
X-CRM114-Status: GOOD (  20.60  )
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

On Sat, Jul 06, 2024 at 04:29:28PM +0800, Jisheng Zhang wrote:
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
> If the port's default capabilities contains other bits such as
> UART_CAP_SLEEP, UART_CAP_EFR and so on, they are lost.
> 
> Fixes: b0b8c84cf58d ("serial: of_serial: Handle auto-flow-control property")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/tty/serial/8250/8250_port.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
