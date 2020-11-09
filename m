Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCE7C4741F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1171206ED
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GhF+bH8R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb8Tfl/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1171206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rkPFerGAALNkZPNyDogbVyZ0U7qteiyALEnc1Rmau0Y=; b=GhF+bH8RTMDVEYy4KwK0PaFx4
	k6wUEYA5Shmlbui5Wim5ITUTnjROkpYgKdO/gPW9obEzgcEpfBqRt6jt+wLhEW2K2d+2p1noVe3B2
	dZwNkObQ68tz3PAmoKlPkAfOSK3Ng3AjhQwbbdB5Z1DfdS/bgltJ7tWm2nVBpPs2vxfpXL84tzv77
	6HxovB15oUFs7e2jh2KVTjtKJL1lqLM//UGI5WmOIeKCkeHpB+i7TUo3Q+PtTXZvEoHyEhWGpIEbi
	ckYjfySCtd1QRNUFiKebyxZ0LHp4m4GVxx517gHsZX0enxBPRj7Z3r34bdqCrFLbRnjf2SRkHUibl
	V3qg9gMyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc7wP-00034d-4f; Mon, 09 Nov 2020 14:14:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc7wL-00033j-G8
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:14:38 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30B79206ED;
 Mon,  9 Nov 2020 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604931276;
 bh=kLJzaopBrWpFidVU7xRvPTiQ3M4h0ap58VBp21YzxYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jb8Tfl/071h1BNkQ95G0MdcMqzm0ItDQ91+UFxaDdcTP/Hn4YNNpN3L99eqPfm1eE
 iTtKIyIl30zgvi2L/4YXmciVZ5xR/lk9i9XeWhcEx7rqBAE3OSbNOiS8IGnLwAhJuR
 mYM+oWmy3+Hzzxh9jMiJiyv0s+Mz/Ziy5SENX1Ek=
Date: Mon, 9 Nov 2020 14:14:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109141422.GD6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_091437_638533_75897F09 
X-CRM114-Status: GOOD (  20.46  )
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
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============3724653911951013409=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3724653911951013409==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline


--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 08:47:10AM -0500, Sean Anderson wrote:
> On 11/9/20 8:29 AM, Mark Brown wrote:

> > In this case it also looks like the controller hardware requires
> > transmit data and therefore should be setting SPI_MUST_TX and just
> > removing the in driver default anyway, though that will have no effect
> > one way or anther on the issue you're seeing.

> There is a recieve-only mode, but it is not used by this driver. Perhaps
> it should be.

I'd expect it'd perform better, especially on systems that are
apparently struggling for CPU bandwidth like yours seems to.

> > Please also try to avoid the use of master/slave terminology where
> > reasonable, controller and device tend to work for SPI (though MOSI/MISO
> > are going to be harder to shift).

> Here I use it to draw distinction between the SPI master and the SPI
> slave, which are both devices in different contexts.=20

If you find the use of device to refer to the device being controlled
confusing consider also using something like client device instead,
there's a number of ways to do it (there's a list in Documentation IIRC).

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pTr4ACgkQJNaLcl1U
h9DamAf9GViNS0tl9IE38rF2GQEVHH0m8fIjSSQYDUg/HaV3KWTlgA+RxBct/6Su
0kWc3OyLDS0kbdA70oliL0kA+AQEbPnvxx6W3ktbW9HvGbf03yPhlVayBdx9QxZJ
Gz2eWEe05CPdrQwMEo8LnjrfeL1uycSgalHjDbotqu2DBbcrvHoZkt8bL5+0EdcH
a0MP1HmvpfvX+l36JPx8m6kOay+2cXYcQwIJ8FMV6rOZXpmgdlpT9UTTqMnUji8V
BFLLRgEaNi6WG8WXhB8pm3o/z9w2ukz62EPCkeNEGB36a6WI8D9zxSNQ6bM/ZszD
wqk4bWzbFhknKP96ou7EqTa6wlbLqg==
=+WcS
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--


--===============3724653911951013409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3724653911951013409==--

