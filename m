Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642EEC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 16:05:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5D9206CB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 16:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nn8TMhpm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="odJWZEdO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C5D9206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8I/hMiu3DMmfPwJMp1yY/ZKiyF7rH/uJUyat65liTwo=; b=nn8TMhpmcjfHbarr46Ybf4pfS
	EWcpD1hSjgb299v71W61iVrjFJykbthVv/Zqaz9oEEEKYIP62ZP45aRmebAnPpHFHL7qYOOz2LM8x
	PSJucy7XfUcBPwOtzRvq1dtBl8MQbfJ0HciDfJ/TCoF8wubUB7vzv45GL1SNlE93tNmlm7X48k2G/
	Cw3UPBaxYHCYJ4i7/xmE6pkf7KRk1TheA3fXcIPaVTBg+SiKqxWmnL3HnK+FuaQi6hXGJjx6+FEJy
	qRVnsjFqmywPhz3p8UMqOoJY2ZJaT16soaZew6aJdwJMSFm6cLkMJmIYOnpebqXZ2BQu+fO73SAP5
	HXXB4IVjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9ez-0006RH-Ph; Mon, 09 Nov 2020 16:04:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9ex-0006QV-EK
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 16:04:48 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 850AE206CB;
 Mon,  9 Nov 2020 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604937886;
 bh=qpWupAqFktlAEJCGUxawGfsjvPHqwItam4PilNDZDXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=odJWZEdORfx4XYNW+XSLTcqpyLh0L6/TizWw7/tBSYB0os70KfIybjw1fYuz2377d
 TZLCkYm3yI1wN/YILWmIFVM5fwhRHo/ij6rbj2SLFFg5g4uH+Qu/q/wfw+ZaTeA1R7
 D0UWuhrjTm+M+XZAwx4UXPGqnh/LqjXpXQbLeXHY=
Date: Mon, 9 Nov 2020 16:04:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Message-ID: <20201109160432.GF6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-5-damien.lemoal@wdc.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_110447_605666_C042453D 
X-CRM114-Status: GOOD (  22.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2196714248447865351=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2196714248447865351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMWmSaSbD7nr+du9"
Content-Disposition: inline


--rMWmSaSbD7nr+du9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:

> With boards that have slow interrupts context switch, and a fast device
> connected to a spi master, e.g. an SD card through mmc-spi, using
> dw_spi_poll_transfer() intead of the regular interrupt based
> dw_spi_transfer_handler() function is more efficient and can avoid a lot
> of RX FIFO overflow errors while keeping the device SPI frequency
> reasonnably high (for speed). Introduce the "polling" device tree
> property to allow requesting polled processing of transfer depending on
> the connected device while keeping the spi master interrupts property
> unschanged. E.g. device trees such as:

This isn't something that looks like it should be configured via DT as a
separate property, this is more of a tuning property as far as I can see
- even on the same hardware there might be cases where people prefer to
keep using interrupts but for example allow transfers to stall while
waiting for the interrupt controller giving lower throughput but more
CPU cycles available for other things.

Unfortunately we don't have any information about how much interrupt
latency we should expect which makes this a bit annoying.  I do see that
there's already some existing attempt in the DMA code to tune burst
sizes to avoid FIFO overflows - it looks like the hardware is doing
something unusual and possibly unfortunate here though I've never
looked at it so I'm not sure exactly what is going on there but perhaps
ther's some tuning that can be done in there?  TBH I'm not clear what
the failure mode is where we need software to service interrupts
promptly in the middle of a DMA transfer in the first place, that seems
really strange.

--rMWmSaSbD7nr+du9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+paI8ACgkQJNaLcl1U
h9D74gf+M46xb04/TMs2lLQseMfMEPw7Fh0jhSYWXuEmx5c0TM/8PPV56XCoV6CF
RuIPkAKLK0Gz0FwLWQ7hNLwz9TczwxzKygGLVcODVuQqhQf7rRlTb4wABZirWIkp
GnOJ3npCwKyvsCc61l3sdyasnwbnmi1X3X3qgmLWEGrK1RAyVLF/bx8swuL29L9n
LUdhKqqzFHS0czgcTQXMgkrGE7GpM2CFZP7bYA/meuOjLB6/8u9siqAdD/e/Fvub
ccmw/vmi5UIUGSP0xTc5p27QmjqOG/8GiZIGq4IPqKdawxgErIrYoLblm4N/BGrT
EmfK2cMi+qlFLQLy76Fixh/wnOZhSg==
=mHA6
-----END PGP SIGNATURE-----

--rMWmSaSbD7nr+du9--


--===============2196714248447865351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2196714248447865351==--

