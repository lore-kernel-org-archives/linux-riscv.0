Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32428C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:29:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9AB20665
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZYoM4ad";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/fh7nU6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9AB20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GzBeR+ThQwSQFtdX76j+psc6GEtHWxvcsEI6NMstn0k=; b=AZYoM4ad5e0foKo89JnRojffo
	NS8vTLujvnHJiRWokURIlXKrnBNiohYXnPpX6RGeiKJjCigVP2vhcqYgT4Zp9TnvEnXvG2sc2vvf2
	vZh007YP06lrgslLiLPkFmh0Kx87vNnD+Qt3GMTh+w/eaWFlsD1JWZ0cEW4o9mfAf5aODZj4m7T2s
	Xdh0kC2qLP2EVV0aSq41nNE9YUYwcoCiKQuEcXIY6fCvUpvmmLl1JUs/nP+t4giW1JXLHAcBAydmx
	tAzJZ0DcskpUqQAeg/20mimmIYwNN8vPOf4AQKmumEbAuuZiYMc1RKF3yj66/EuZE5Un9ejh0UYgo
	2vylt8G7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcDn6-0003RR-1h; Mon, 09 Nov 2020 20:29:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcDn3-0003Qm-1Q
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 20:29:25 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 323E020665;
 Mon,  9 Nov 2020 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604953763;
 bh=Rmn9ZkAaWXCOFOiXXcYPk0gblYpBbOJQA2lJtHBLpj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P/fh7nU6/zuB6CR3SIkzV6nj9A3GMyjKWyjIEVHOmGtTTCHQrOiFfmI5D355sDcSS
 m+DHV5m8+ZT67oamgoDcyzy3pRMoAlJUfdqtaOsesrvkjI680BxSHPLspLF5OnG3pr
 WINxiGRlo3zBWDCQiGof11RFG8RRtgJkkpm/oew8=
Date: Mon, 9 Nov 2020 20:29:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109202909.GM6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
 <20201109191909.wfuwpddng4rdn4ca@mobilestation>
 <5808c9b9-5955-4733-2c56-b93c627cb556@gmail.com>
 <20201109201744.zlxwur4p3ejbraup@mobilestation>
MIME-Version: 1.0
In-Reply-To: <20201109201744.zlxwur4p3ejbraup@mobilestation>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_152925_197911_1B4B4803 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4942929862156094198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4942929862156094198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Jdw4pA1x1k2W7MG"
Content-Disposition: inline


--9Jdw4pA1x1k2W7MG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 11:17:44PM +0300, Serge Semin wrote:
> On Mon, Nov 09, 2020 at 02:40:01PM -0500, Sean Anderson wrote:
> > On 11/9/20 2:19 PM, Serge Semin wrote:

> > > Getting back to the patch. In fact I don't really see how the
> > > Receive-only mode will help us with solving the problem noted in the
> > > patch log.

> > Shouldn't it put MOSI into High-Z like when the device is idle? The
> > issue is mainly that the idle state and RX state are different.

> AFAICS the manual doesn't say anything about High-Z, but only: "In
> receive-only mode, transmitted data are not valid. After the first
> write to the transmit FIFO, the same word is retransmitted for the
> duration of the transfer."

This is the sort of behaviour I would expect, and I'd expect that going
high Z could potentially cause electrical problems as the line won't be
being driven when it's been designed to be an output from the controller
so it's probably not desirable to do that.

--9Jdw4pA1x1k2W7MG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pppQACgkQJNaLcl1U
h9CQXAf+MRf1ClMjYE+JjElpTuYREIF/+rT0noit74ukCGL6ljY9PQCfnr38Bj6Q
p86yadtF0NBIiIHgrcAYT13G6raDxNad5Et39feqb49hizl7LCLAB3z6mOK4+0wU
PLzwBdXnMcTj57E7a59cUewuk+rXNGBvQGCOjYlbBEMVBWmAQu7xfMXz7YB/34c8
1tXdtYuDIPAbt5jSTEvwOPWQI0QXxIrcnDLVA7sGjZGqgVSW4Kr+cRkdc4xSi5+x
jieX/6lHH1udyrNTQ7MQ9e1sOIMBw/t0dDaWcsKCHeuKn/+0EnI7rTon2oyHo9Zm
WIiNsFFUGWkIhT1JV0GsvqTheLXjWQ==
=bJgX
-----END PGP SIGNATURE-----

--9Jdw4pA1x1k2W7MG--


--===============4942929862156094198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4942929862156094198==--

