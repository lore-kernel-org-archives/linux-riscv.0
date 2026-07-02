Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D81C43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 18:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leOJTvJUevOFAgnl7RcaO+lJ4Fhd3q2WbxP3AELHbo0=; b=UnelG1Zk2GgmQn8HggF6Mgah/G
	Lid3Ulp1CbBfvbtetpMkVglqzphXFG33xbtuvat7gfkPKP4D9z864QG0E5OkDs0A9sIOITW2SdJDR
	dB4V4d7JxGW6vyb0mcHqZEr9H3H7mP1FT+QEaKcUoN11vPURSBsRQlDNhh2Np/rEnxUaKKQnBeqJD
	hRalBjkzDRz+OnJlWBo7jmIqT1XP4ZyQzjNSp2K2qtyYaI+fPyPagdhV+mgGGOSzecUusGACgYtkZ
	CPMpWOW/CJ4h3F4Hmgi+zmmrlY2i8tVMXexqeDHNSxY4oy50j++TYpMgwz0MW7u+xNSWvqsw8rf/c
	Typm7yTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfM8S-00000005GZV-0TQF;
	Thu, 02 Jul 2026 18:27:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfM8R-00000005GYv-0lcu
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 18:27:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9543440A29;
	Thu,  2 Jul 2026 18:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F7C1F000E9;
	Thu,  2 Jul 2026 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783016858;
	bh=DeSCQ8pdGrSk9IgVsqX/etUdgJ6A9isrO5fR258BLOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CFeduGhZbMxqkISWlGvydQ5dSYo9l+yikN4aOdsG+xSaxfXU64ILiTpR/FHjdPSFu
	 7XHYfRvZ6nLJ/5hFHCsQWdLRTyNsEZE+WZJG7Cvbldw1ASP+Glyi+Ez3neVDGIGSFf
	 o9hJaEzrkoOz48mG3fwx4LiLdBu15rvzxCNSQhceYZ1K0mTb3gvFv3ajonBDY5iPUw
	 SAVRzJS1KcLLQagk+kiZJ6GWK2VPqLWOBdaUHVlM3W5ZwS5Wuk/V0yp6F4PQnIpz6R
	 ovc3hB+8l9cGKqETdPWTL6ggCVg1mJVdQpDNkQRw77L3gpcdwyP9tw8eGiOyZcFhPP
	 6HyGLRfcrQVbg==
Date: Thu, 2 Jul 2026 19:27:34 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-can@vger.kernel.org
Cc: Naga Sureshkumar Relli <nagasuresh.relli@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v1] net: can: mpfs_can: add Polarfire SoC MSS CAN
Message-ID: <20260702-monitor-deodorize-26a5907b93b8@spud>
References: <20260702-lens-constrict-6dc7d287c647@spud>
MIME-Version: 1.0
In-Reply-To: <20260702-lens-constrict-6dc7d287c647@spud>
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
Content-Type: multipart/mixed; boundary="===============6457487447363042025=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6457487447363042025==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2gwRrDM2wOky5yI"
Content-Disposition: inline

--f2gwRrDM2wOky5yI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 03:34:58PM +0100, Conor Dooley wrote:
> From: Naga Sureshkumar Relli <nagasuresh.relli@microchip.com>
>=20
> The Microchip Polarfire SoC has two instances of CAN devices inside the
> MSS block. Add driver to support this MSS CAN.
>=20
> Signed-off-by: Naga Sureshkumar Relli <nagasuresh.relli@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> Hey Marc,
> I've finally got around to sending this driver.
>=20
> Unfortunately the author left microchip (which is part of why sending it
> took so long). I've done some mechanical cleanup, but left it mostly
> functionally unchanged mainly because I lack a setup to test it
> thoroughly were I to do so.
> I'm hoping that what's here is by and large okay on that front, and
> maybe that sasiko will point some stuff out if there's stuff I missed.
> I did remove/modify some code, so hopefully I caught all the obviously
> problematic stuff.

Apparently there's a lot that I did not catch, given there's a wad of
complaints from sashiko. Certainly feel free to ignore this version
until I resolve the dozen or so things that it has raised.

Thanks,
Conor.

>=20
> The IP that we are using seems to lack an internal reset, so the reset
> for the whole peripheral is used instead, and I wonder if it is
> overeager? Doing ip link set xxx up causes a double reset, for example.
>=20
> There's no binding of course, because that's been upstream for quite a
> while!

--f2gwRrDM2wOky5yI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakatlgAKCRB4tDGHoIJi
0tW3AQDDSpv7nPtGgdoU/g6m5Uo/6OCbMr6TBlbYJ1gvDPgQ4QD/e6guV/XsRxiM
djX8Ip8m4JVdFNe2xtl8J1ulqvbYzws=
=R6q1
-----END PGP SIGNATURE-----

--f2gwRrDM2wOky5yI--


--===============6457487447363042025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6457487447363042025==--

