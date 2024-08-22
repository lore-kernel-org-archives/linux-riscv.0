Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2640DC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 04:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teO6elOOnKGV+y8I1bEzCoViVDhp95XKF/nMMCtaFZ4=; b=r6UDFk79RcI1UG
	r5rglJ/H86Auxs8n9VzkBANzi1Fzt5KeE+HhCcaZ8csrETwZ7TQIt+l1ipdwVUDK3jUMTyXOElZ8u
	68BSRw0zVgF4/8gN9kZAsFtWVWJRfdy10RkKwfx38tEI/dcZgyq6qdmXs9/Ebbx5MIOQTwKyOYZqb
	tyfVb9dcb+vHElxlh7lwEgcAcetbHx8Uu2062H8/vEhRy1d3KrkegMdcNabMMTEHIhPrYJW9Pivbq
	SVlkZn+qgkR7k3lrKnrmUFqms9wC75vL8xF/+SbXnsYn5MwdUMcb8UpKsneMZTF3ajaIRa/3SiCHv
	ffsgHcaq29eMzHsFwwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzRG-0000000BNMb-3Kbk;
	Thu, 22 Aug 2024 04:28:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzQ2-0000000BMyp-1FLX;
	Thu, 22 Aug 2024 04:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6175160F5A;
	Thu, 22 Aug 2024 04:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABF1C4AF09;
	Thu, 22 Aug 2024 04:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724300849;
	bh=7V+H9aiy6Hmq4hq9uhSZuA59Ro8lxYpKbAXrcA3sXLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v+ZgCF6eGa392JfISoJqCnTuDfcClAdh4ysQ90tWOJT9KwmDps2Ub8yXHB8VBfEt9
	 gNm4EtxXR0XFMPuBd3fS7RWPUvFAoIt55q2o82p/TP/yq2vaQjH7uS3t9fbsq+VMv7
	 CFVcp8RUFyDabTFc+aKR7xr/50PvrmGpZ4Joa0EU=
Date: Thu, 22 Aug 2024 12:27:26 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1 0/5] usb drivers use devm_clk_get_enabled() helpers
Message-ID: <2024082210-stadium-sly-cf06@gregkh>
References: <20240822040734.29412-1-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822040734.29412-1-liulei.rjpt@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_212730_676630_EDB0EF27 
X-CRM114-Status: GOOD (  12.04  )
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

On Thu, Aug 22, 2024 at 12:07:25PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> ---
> The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of 
> certain interfaces due to the lack of synchronization during the 
> commit updates. These issues have been corrected in the v1 version.
> 
> version 1 changes
> 1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
>   devm_clk_get_enabled().
> 2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
>   devm_clk_get_enabled().
> 3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
>   corrected to devm_clk_get_enabled().

Patch versions start at 1, this should be 2, right?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
