Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381BAC388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 12:51:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2EA220657
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 12:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ya0sIyVA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4FQ89bx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2EA220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+8MRDVtP5GVF+AAzc/HY4BIKh5l1dl781wEAjXqBUag=; b=ya0sIyVALhDaX9QClTJfse9eM
	MkcftLrhDLb8zX1hfsfzrSDOfvxZNJ+t1oYyVz/rA0S6UHRpzsJmdp/IU8uWWTkIUvLTfxSK/V7vi
	BR7XWBrXN0O+pzDT+wdPpC9r+6Iq4i/KaYHkzbT22xj7V0MvG6RHa6IhtMH+alRU0vMFR6tLohBQZ
	CjF64nEf7p3A0zgNW58CHjl7twspqAWGRgh5CtY1WGfcVOlejxzYD4WQgzibXllSw8lFuICZG0Hjz
	TtoF/VyRADrTP8PXO8ITG7l+PnSXtShwnYOK7+wRDg1w7s8kdLG2J39K6/pXwvJaSNob01ixRN381
	lWPbG0uig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc6du-00066I-Cx; Mon, 09 Nov 2020 12:51:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc6dr-00065w-6q
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 12:51:28 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FF2020657;
 Mon,  9 Nov 2020 12:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604926285;
 bh=Bei45B1lXJhHW9eoNuI13U+f97K1W4Zn41krW3jveY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4FQ89bxQNkt5pc41PUHmso0qKRSgWcUz7/8ZFk+eWlXnAzUEdBPB9yedV7c9y2DK
 yar7WVDj/6tzsvBdG+nh7by2h8bWAGhXTV42Qe1NGvSRCYBL/oN3X3VVlYUQUMuhel
 HyHrInH6f+tVF7brZK3IqULe0QTfSx7R7lKr/kBM=
Date: Mon, 9 Nov 2020 12:51:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 00/32] RISC-V Kendryte K210 support improvments
Message-ID: <20201109125111.GA6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_075127_363339_8185292F 
X-CRM114-Status: GOOD (  19.25  )
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
Content-Type: multipart/mixed; boundary="===============9215645658462205893=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9215645658462205893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 07, 2020 at 05:13:48PM +0900, Damien Le Moal wrote:

> The first patch of this series is a fix of the device tree parsing code.
> Without this fix, a warning is generated when parsing Designware gpio
> controller nodes.

> The following 6 patches are fixes and improvements to the Designware SPI
> driver to enable support for the MMC-spi slot found on all K210 boards.

> Pathes 8 to 13 are various fixes for riscv arch code and riscv
> dependent devices. Of not here is patch 11 which fix system call
> execution in the no MMU case, and patch 13 which simplifies DTB builtin
> handling.

> The following patches 14 to 25 implement and document idevice tree
> mapping of several drivers for the K210 SoC: clock driver, reset
> controller and pin function management (pinctrl).

> Patches 26 to 31 update the existing K210 device tree and device new
> device tree files for several K210 based boards: the MAIX Bit,
> MAIXSUINO, MAIX Dock and MAIX Go boards from SiPeed and the KD233
> development board from Kendryte.

Please don't mix unrelated changes into a single series like this -
patch serieses this big are generally something to be avoided at the
best of times since they're a bit overwhelming in people's inboxes and
when unrelated changes are put in a single series it makes dependencies
between patches unclear which can hold things up.  It is better to send
the changes for each subsystem separately, it makes life easier all
round.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pOz4ACgkQJNaLcl1U
h9CEewf/d71EbjpYPiGmBNkn7r8dGy0+h6PgyHq7EGg+UJFjwHeWcI7BlgbNNsZt
RwiaM5PsMdGYvoflet8kQiuKiEh8E+cgmdMcb/vey4ge0Ay1WXmVg7Uqo4dFGKOn
wQUaomO+FwtYgXYV2G4bG4B9Ib4AsOqQn9VvhVl5lT/nPnH76Tj37FpNrMKBEjV7
IXBPp7kCwEOzPCJRRHGlos5b54D8XRYJg3YiAbJX087dS/vAva/DbwVZXTJeNDQ1
oKmgYnjdKHuE00Mhh224U/Km5GE00uOtFl91yTbAR56Nl0o+gMik42IBMq8NJXmn
tozkEgo+8a5912q/BqKHL87oPW1HeQ==
=lS0/
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============9215645658462205893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9215645658462205893==--

