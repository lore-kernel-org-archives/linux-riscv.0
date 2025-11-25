Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CB4D0EE13
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oh5Cpv6uOvTz6gJw4BBoiMvPnYFUeaQlJPvn738rXQ=; b=ZCaf3yqEZMFSI/mS1rzJPZKDLb
	6HSpLC0eKUds3DSQK3K07ubQkWWjnTXTYL7N9IWyf2Pryzbq5m+hZREAw4f3vEsah2SPkYrLYUBkL
	iEk3McUz4iFbVjglxcMrXw6NNwvV9WZvgGS6tAzAX/ddvQefStAInh3Ovae349OZtyZ2Ez/hJXvd2
	BT1D0MWFvNGYT2k7l/9VKnqZNFb2jW9YxZuJXa/pIzoQUZQrUlCysAxCU3iWvl+a+mpNEYkY2b93u
	egl81cUABhIBLKQgpNjNr4gOAcDsNCgdLQm5KOCjTMnldk/rpWhg36lJbzZoNaR2wGUIt9CauC/X7
	+voD+g1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzD5-0000000DrvX-2XQk;
	Tue, 25 Nov 2025 20:00:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzD4-0000000Druc-1KDq
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 20:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 726E960137;
	Tue, 25 Nov 2025 20:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EC3C4CEF1;
	Tue, 25 Nov 2025 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764100821;
	bh=7wmgeSUA+y6AQHI41p/L0fxZB3D11yKLxUkqIdhJ4v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwFYoMVo8Gk7CKe0VFuuJ3okWlTZi8B5IMClLbbULWvuETHV+Ve9t4puO4DYNor8s
	 vjJfw8WGh6WkCXAwARpRreAdLkbGZzL44xB6VNiH3/WBaNDBuG9uPq2Nik7aH4f3gb
	 j5I/LXTfZw7GzlNNHiY/F9eSiSPEDvLweWIgVVUggOxys4bv5KfBFhMT0HGDPoqhP6
	 YR5Wr2kTiiIX4Ca2IeNwA/ZqULoNzTLNQVILoyPoj3fi/VCeoKrRVEw39cRl5OQ76w
	 NIXk3HETbGgQrWK5Lj6++ySiZlAdodYHe21dt8Iwi0ChcrvLy8M7a9+dVMix1YEiBg
	 R2nNqsQAkqO6g==
Date: Tue, 25 Nov 2025 20:00:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] PCI: starfive: Use regulator APIs instead of GPIO
 APIs to enable the 3V3 power supply of PCIe slots
Message-ID: <20251125-encourage-junkie-f80e6933b3af@spud>
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
 <20251125075604.69370-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20251125075604.69370-2-hal.feng@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============0083135387821329054=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0083135387821329054==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j+BWZhcgMt7PqE4k"
Content-Disposition: inline


--j+BWZhcgMt7PqE4k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 03:55:59PM +0800, Hal Feng wrote:
> The "enable-gpio" property is not documented in the dt-bindings and
> using GPIO APIs is not a standard method to enable or disable PCIe
> slot power, so use regulator APIs to replace them.
>=20
> Tested-by: Matthias Brugger <mbrugger@suse.com>

Is this actually a valid tag?
He provided one for the series on v3, which didn't include this patch.

--j+BWZhcgMt7PqE4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSYKzgAKCRB4tDGHoIJi
0iQMAQCnkfFlvRj+TENemCjBkED0QboWJjLXrzEVht+jLtlpwgEA+fnrqb4AUqg4
NHJcnwNxIAD5Y5XuEaUuHroA7XIZCQk=
=trKW
-----END PGP SIGNATURE-----

--j+BWZhcgMt7PqE4k--


--===============0083135387821329054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0083135387821329054==--

