Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E429FF886F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 02:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9jbkp4pbq6P3jbCoy2VuQUIIzdnk+Fska4fTweGafM=; b=S/9Z2LnZ3Wx45dOok4ekiFqFsI
	SMvwb9guaST4RX2pv/+Stw9Kjt0SmOOyj1mH5FMEHErYRK6V1Lthi5t8HkK2AHzlyYzYkklZczO3E
	DRIJEN+6/QpkJBCW4x8HUxCw+neoi7HSVBvm5s8L/Qh7xbC0U7nHJlt6byGyJ7yM7hbhqekPTZPGF
	zUee836/bEsR3AX/RnY7FES5Sj6aBhWckQgc8bXHA9fQ4SflZhrbcW0NpBmK5pFUsLOvnHgbCjAv+
	5AVSxKgrgC3vP9mqPsbkJ40tkXX1cN0W0y15IO+zHUdzh+VvN8MCAhupWixb7rm4Gtt6jIDpOZdnm
	IxLha5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHule-00000002n9M-1RAa;
	Wed, 29 Apr 2026 02:35:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHulc-00000002n9E-13rb
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 02:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 519926015B;
	Wed, 29 Apr 2026 02:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2969C2BCB7;
	Wed, 29 Apr 2026 02:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777430110;
	bh=jpIK6hmwn1Fh9Mum9QGhf4dG9xqtXCD2+W4rd2H5kHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyE768OeMJEbsnEmzterKf2Ez6S9dXkfXVgURSw0yZZPBa4lC6KimD3De3kJ241hf
	 EKix9Yx6+xExVdlAmyTJw/rTYuCi5cYPcrDo992b3n5+k8yr9xi3VTN52t5NwURZbu
	 2NAleXgSgWr9SzC+OFskpT240fur+rU2XAtP8YQyOoRr2tBITlX5YJF3CR9djkISuW
	 qpxONGLSHpa1nqH9Tx1M9r2L5MOKSVZIm2sT1PH4Du6KOnlZZFe3wyOpZh+27QhFSD
	 a73xVcMGnKotP50ndLF9TDW1d3CciFrHVQbWLaRvBE1NBnOO6QxqmsdymMTJeLt99K
	 ynoe4U5qSaXQQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CBF701AC5851; Wed, 29 Apr 2026 03:35:08 +0100 (BST)
Date: Wed, 29 Apr 2026 11:35:08 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX is
 running
Message-ID: <afFuXO3IfV6CSsLf@sirena.co.uk>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
X-Cookie: 667:
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
Content-Type: multipart/mixed; boundary="===============0451785704483760713=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0451785704483760713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ywcan+wgjpNp2zB0"
Content-Disposition: inline


--Ywcan+wgjpNp2zB0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:

> Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")

	Fixes tag: Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
	Has these problem(s):
		- Target SHA1 does not exist

--Ywcan+wgjpNp2zB0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxblwACgkQJNaLcl1U
h9AmPgf9EyhGWupByngJPOAIOzddMuTD9q6YNSITxCShSQtFhMR+vK56aZ3D5n1L
amCgyhAauqiGTQ63bwkPr9qS92t2dbTVyUB3H9/pjkxGFlTKv5Y7V94NpTGZZDFi
1gquKI8BJzie0dafW99Jt0lo+6K/W5h1MULK0imK8tCDjC/0P3OnzKnWqCzwI0rf
eGfhYIwotlK622QxStby4B65tEaF3Tbj9T/zvs3wmCzjg2CL6CXiC/UKQsD0vUUG
tECTMR9TLnBikNBuebd5Tfm+loHIjUNtwT4NioCdcp79oJblFKsrZnZXrLIsWRaN
uWl6P30eBVqFokFL/GbNRyZJ2uWtRQ==
=eVWm
-----END PGP SIGNATURE-----

--Ywcan+wgjpNp2zB0--


--===============0451785704483760713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0451785704483760713==--

