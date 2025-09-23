Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFECAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzdmsWWKjkz7zDD1VionfGdBK5OcLpVSWM0XuAA8gnM=; b=aU35wBGxb2e9GFwHZOECpuXgU4
	NZDs3DZTBXVRiQl1u71f+nPnnpet437n0ITCXAV+v7xjbrqWPvhEO1Q9U57NPDLq/Tn5DYIA2Wum8
	MvxWueCRTBlEUT0GCSLjojddgbuyp3a0qGVayyOigFPKBwHAzplhHi4pIm4rWzwGgcPnfBNdammI/
	K+MlDuJt2B8jokusBXes8rzmRlheRlarRJ3CzQtPy6YgJ2Ltb0qAFRWTbSRex0ZOQNUuab+81sMDr
	/7jamrRsse4uAzcV1x+geFp4bv6d9bmLWwCKo3PrqcDXDEIFooZ8YXjEPJ97KlW5CkLr1bTYQgSML
	po5hzT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yNO-0000000CoJe-2XjD;
	Tue, 23 Sep 2025 08:27:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yNL-0000000CoIh-2g3a
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 08:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE8D343FED;
	Tue, 23 Sep 2025 08:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2770DC4CEF7;
	Tue, 23 Sep 2025 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758616070;
	bh=DpOw3esgxv6fryqqMWiEbCIzH82geJydVvITLMOkr54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7EdvDgVwmk0J7sjYuIr5k+k1hAX1ayYzxWUkv9BJ2K+XHyLuvkeBcPHlOHWtSY7j
	 GU1uxKJwDKI2vmRC0ZQkEPEJg9ChqJeTTE6DojnEJWRXbaTkymc525jUGu/9EqjpWG
	 19jftow50k0Slyg09ReA5iifXwDu71SRTnOrAw50BWhY9Jnv8U2e83ZSdLx2eb/fOO
	 M/Cz+13FQjZNlE+GqPskVnNKOmUVqRcKztDDdoBDLParnFPZWD8c29gt2Ij4+oJtpS
	 Ab8HfCaQd4rURk33a0wctqwdYQ5O6nF71AFKY5AKuhP47cUi+GUGgCjHCfcjVF/QCR
	 5qds8jkpkA4DQ==
Date: Tue, 23 Sep 2025 10:27:45 +0200
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <aNJaAQXdoDlytTDy@finisterre.sirena.org.uk>
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-3-elder@riscstar.com>
 <20250922230639-GYA1303776@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20250922230639-GYA1303776@gentoo.org>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_012751_720634_F12BA389 
X-CRM114-Status: GOOD (  13.09  )
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
Content-Type: multipart/mixed; boundary="===============3790855393459375508=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3790855393459375508==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6HpbpinsD42eNuLJ"
Content-Disposition: inline


--6HpbpinsD42eNuLJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 07:06:39AM +0800, Yixun Lan wrote:
> Hi Alex,
>=20
> On 11:17 Mon 22 Sep     , Alex Elder wrote:
> > This patch introduces the driver for the SPI controller found in the
> > SpacemiT K1 SoC.  Currently the driver supports master mode only.
> > The SPI hardware implements RX and TX FIFOs, 32 entries each, and
> > supports both PIO and DMA mode transfers.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--6HpbpinsD42eNuLJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSWgAACgkQJNaLcl1U
h9Ag9Qf/agE9cLG7wxZYtQSASbZ9xoCAx98tPfyf7p5VPkN7z7QMkc8/+v5EAuZ4
YpdaixFWN/I5CPMJG9ERW+ly0OleInqkzNX6DXwLwITABENCMHtC7zIRoSQGSl7b
iMAhL0728G9SMt3GQYj8XYiPA7/4e6meb62W17h/W0aabrxuPi614O86fGS/puJt
47uLgJlJuTTHKRt70Z5PeY1sy2oQZpmGTmbstGNS9P5/n2Xs3GL5C1lLyVfac/S+
VIB7+AHD9FJORL4oiBtEHyjZ3L8OS7xk5Pds0PYKVCtvFdBXd73QXlTbCfsGtG4l
HU6g8m1YlQpcZ+62tVSSBAdQ4PJtMQ==
=Wogy
-----END PGP SIGNATURE-----

--6HpbpinsD42eNuLJ--


--===============3790855393459375508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3790855393459375508==--

