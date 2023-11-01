Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE5C0018C
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMjHmL9Yfz4nkTpSP7RNt1GzYUJSPK3FeshWRjNyFA4=; b=i3mgCwcwJr0v1AUfOcRFRHuiCc
	VEC07+gn3WF6DKKLTYXugshLeZeZIhDY0a6rdfkHfeKJ/9RpnyB3JYcgzTOrxPTNiyxdawqFUjFyF
	SgpNZx2veH0/tdKcd66OOUt8rbR0ndx/n3vAayZ/+birS0iwowd4dpnHChgTHZAVzpRFTnZnwGXi+
	fhaXnLbqeYvT/1QYxROQ0KxEHn445MWeB4XSAZ4imjQxr6RG3RRF8+r+L0Iuofc6ot5VHZHx4Q0zB
	kc0iyjhDMI9yYwPH6WnOGAguDfQgR4Rol86qFQDhu4ZrySz9u9guyriufKBbVVqYnmsQ/NOV3jdji
	mvMdOIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9mU-007Ie9-3D;
	Wed, 01 Nov 2023 11:53:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9mP-007IcZ-2r
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 11:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9FDCBB817C9;
	Wed,  1 Nov 2023 11:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D7AC433CB;
	Wed,  1 Nov 2023 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698839579;
	bh=kT+HA+zDzpFBdPHZSCST/qs7bSjbi8b7+JQSnoifHqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7gYke/CXiKI6sE+NGcUo/Cwih/+kR9UBpPGsQRyJhEHFrzHVo/pEga4OQS2k7Z9W
	 gb6E/qb91m4td9dXkgvTLNvBpW1F5s6/8rBQOv1xvhkkVigbCFKkYXqODI4kYLCZ+6
	 UY7DQS9VWZNIXh4xddKkC1SPAnvYitevBwIzdf8/1NvHX6/hR4O3rVOV3viWUVl+3b
	 i9G5PD5idJJCpWRgmgNcke14CStmZJnuUO4uzPB2u9URSo/aSeTknCQXWl3a3lhkqW
	 4j+ZmWN/fQfpCyI6h8cFTphp+vlopUGOaWVowCKMjy914W+Owp5H3ZGtveaHnX1l2C
	 +c3neLnzUa79w==
Date: Wed, 1 Nov 2023 11:52:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 0/2] soc: sifive: ccache: Add StarFive JH7100 support
Message-ID: <20231101-random-overlord-1315a03183fc@spud>
References: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_045302_056530_070DDE04 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4264903596101723427=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4264903596101723427==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOUMIggm0qSyhk5k"
Content-Disposition: inline


--XOUMIggm0qSyhk5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 03:14:42PM +0100, Emil Renner Berthing wrote:
> This series adds support for the StarFive JH7100 SoC to the SiFive cache
> controller driver. The JH7100 was a "development version" of the JH7110
> used on the BeagleV Starlight and VisionFive V1 boards. It has
> non-coherent peripheral DMAs but was designed before the standard RISC-V
> Zicbom extension, so it neeeds support in this driver for non-standard
> cache management.
>=20
> Since v1:
> - Fix email threading, hopefully.
> - Drop sifive,ccache-ops device tree property and just match on the
>   compatible. (Conor)

I'll grab these after the mw, presuming nothing comes up in the interim.

--XOUMIggm0qSyhk5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUI8FwAKCRB4tDGHoIJi
0rPZAP923JPVEAE08sFKAd03mK5oK6G8QtIf3DWmwCgjl6rJgQD/beuiko2z//i2
B35OMBkkNMjeAunNJpSTmY/KXCQbxA4=
=l5J+
-----END PGP SIGNATURE-----

--XOUMIggm0qSyhk5k--


--===============4264903596101723427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4264903596101723427==--

