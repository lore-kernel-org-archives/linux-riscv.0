Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C59AC021BB
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obXI7l4t+4340oDBtSjJx3eNkYAeSgzgkwdzRnemEiU=; b=YLOuKK4qZ6eXT8IjimWu2rdv4K
	s8ItYXwLM0qeiRu1EWXFxeihrD/XXsLL4gIG2gFy+yvFhvMkjGEKFA3JckpjJc4/4oXuokVStQMqd
	ldNuMgjmZnUe2YNzi/W4+TRfOZ7IY0YKkeFmidDTvvPrFEeH5NBbG2nLzF0LGlKzB99pOj+xD10Om
	Tv50IU+GnSj5X5y457tjITgMtDQVOTHxenYVjbOidUbRkLa+n1VRWHR4O0U6VA0xxlxc6eKuFHDc0
	/n+JhUT0wxFo3Z6V+wucVHw01+KHOBNf+pzdKrxgY8oPQlAgRNyKlSoEwLiJJvNgiLwi9SRXxt796
	IhjnsbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZeU-0000000E8mx-1HO4;
	Mon, 24 Feb 2025 14:41:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZDT-0000000E2zf-0bsS
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 14:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 801FA611A7;
	Mon, 24 Feb 2025 14:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9A3C4CEE6;
	Mon, 24 Feb 2025 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740406429;
	bh=Wj5zNTFE65XNxiA8k1aNlq7fh0+PHSo3kv55LtTe++g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzUlrUEagmgWDkKMcYHpr3NF/IPe4G+kar7+P8A56kIuePhlML7wmBe1IHbDViWKe
	 DaimGC8xz4/2YgHzW8v+mzDqDCzEjd2dhWKhqJz9f5pTvaD8htiZj0tuDDkNKOoDHX
	 c3i2ZVFiw5RNkyVjiFn3cxazrNNePCNmzFhrwHZLSzpOLm5MS99S5YhahN33KkXE0A
	 YXSJYRUSlVU1TxHbryTlNFKdJ0iAyjVdeQOgRu0SIE5CE2vQ1DROI7XQt4IaACKbUQ
	 EhzCMUXxb5Ag6ueoRxT5eWBkzTEKK3gLhti1cG2hZpjgsXpq9+y6vGgOXZFshN/AoP
	 at0TSPXrBj5pQ==
Date: Mon, 24 Feb 2025 14:13:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] spi: sophgo: add Sophgo SPI NOR controller driver
Message-ID: <0f129e58-e6fc-4089-8342-d80563884fcc@sirena.org.uk>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-3-looong.bin@gmail.com>
 <20250224132115-GYA41655@gentoo>
MIME-Version: 1.0
In-Reply-To: <20250224132115-GYA41655@gentoo>
X-Cookie: Phone call for chucky-pooh.
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
Content-Type: multipart/mixed; boundary="===============2293353818520788805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2293353818520788805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UWZHJyc+GhLlyMAz"
Content-Disposition: inline


--UWZHJyc+GhLlyMAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 01:21:15PM +0000, Yixun Lan wrote:
> Hi Longbin:
>=20
> On 18:12 Mon 24 Feb     , Longbin Li wrote:
> > Add support for Sophgo SPI NOR controller in Sophgo SoC.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--UWZHJyc+GhLlyMAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme8fpYACgkQJNaLcl1U
h9CvhwgAgA7reQo+bW2TBpz7S9P/Vf9l+tPV26EuZw1UD0BK6c26I2whD1dwZ/Cn
YX6TXKPVtAW7/vg4GKLNlCjvV1CfGfPBa+3SMnW+o1a2VBbs02Yy4gK1G9JVlGI0
qZ2qhE+RsgoWmLeb5/k3k/qN9OmWLXLIjBXAl5MtLpn0Zvxc60zLxfymrwmweR8f
BHTKormpZ8eWY62Alb/9h99yW1tzG4UzhZTEBY0aBIsaZ+lfOGWg105ZJAOrhIIn
ub3BU2ABas5zIiCtmAj9ya7FC/87J13/s6ZSjz14B0Mw+nm8fUQ6RHIJz9CpDmuG
GApr8Se4bDfFXOB7ZHlGw34RfHczhg==
=W+n0
-----END PGP SIGNATURE-----

--UWZHJyc+GhLlyMAz--


--===============2293353818520788805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2293353818520788805==--

