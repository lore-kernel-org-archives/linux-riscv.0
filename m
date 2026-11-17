Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC671606A339
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fz7wONHN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xd9eNF2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Es/S+d/M+5yg6Tk3FII9KMxQqXlQk6TsR12Djk353E=; b=Fz7wONHNKtXDsxES0xtAVsfXIE
	itS1Er1joycvXuYTnDsv6VKDWti3LUXNV2waMEgZlpfIsfuTs+Dslg6oRIlLON8FTaf4r/5QzuU19
	2s//AhOO/dKGFhRhHeKEB4UDwgv7J2a/E7uMKrwMzVwv6yypoEisS8+WqoTapFfxPRH2Fuxvsow0N
	axw1hCUKZJtIN7lZt2SW1UC5Y02m4Aq1TeQsaM8bIMAKT6wyKP6G4luYZHz6emrZeYi71ipS0lh5k
	gVMRWYo+tOFoHAHRK4/4H3/dwMZCEV+vZ7I/YoeWGDvTgBUWfGpVxNsLvi+U9EqNW/5VxBdEcMVBz
	zDkoabUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN8A-00000006cO3-37X6;
	Tue, 17 Nov 2026 17:38:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN89-00000006cNi-3sME
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 17:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45EC56175C;
	Tue, 17 Nov 2026 17:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491531F000CC;
	Tue, 17 Nov 2026 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937085;
	bh=qId5oU6efIffOiA8tajVDPe+EXVi31e7RDD++IFkWI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd9eNF2S3oJf9M51r2Y/Hh74LuP3daNmTKtT+nlwtb2NzKaQdYQP9sBuAJSTxYHR9
	 ES3WC9v2/wT609F1swgrUu0z86ub3Tlr+YkhfGeWdvTjrbH80AcGWFjU4WxVlhM3//
	 7ZpTaNw0Ik6mai6S8PJNHdltg6Rd5aHhSAaUFAGMQIPByj0RP+i1tUNrkXvcPZO3rP
	 8cKv2CgK2FiUHVYd09Wkpm0I2yeUg+lnA7Q8pCXy4cOSQIQq60QkJjIGWSaKqlwXsF
	 3IFAAFuSN69OLyOVUp7bO3CtyPJVSnYYBZqtgOfPtcP9Y+9uCPo2m2NXQL/Bg4b0Dm
	 1i4VABcTU0BjA==
Date: Tue, 17 Nov 2026 17:37:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <20261117-grape-skeletal-89da442523ce@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
 <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
 <avwdT/vGjfsUCkHv@atcsi01.andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <avwdT/vGjfsUCkHv@atcsi01.andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1587786277506579887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1587786277506579887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xX4oY8xNNpMcBrcO"
Content-Disposition: inline

--xX4oY8xNNpMcBrcO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 05:24:31PM +0800, Mina Chou wrote:
> On Fri, Nov 13, 2026 at 01:53:29PM +0000, Conor Dooley wrote:
> > > Move the match into soc_is_r9a07g043f() and make it also require
> > > ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> > > and take the generic Andes cache errata path. No other upstream-
> > > supported SoC uses this AX45MP mimpid, so their behavior does not
> > > change.
> >=20
> > But a device using this soc that doesn't have a dts in mainline won't
> > function properly, so this is fragile. Why not just do it properly and
> > check for RZ/Five specifically?
> > Can check for of_machine_is_compatible() probably?
>=20
> I will check for RZ/Five with of_machine_is_compatible("renesas,r9a07g043=
"),
> which on RISC-V is only used by RZ/Five, and drop the marchid/mimpid matc=
h.

Looking at what is quoted, I wonder if my main point I forgot to
include. Checking for ARCH_R9... (or any other SoC in that manner) will
fall over on multiplatform kernels. Code needs to be written so that no
matter what Kconfig options are enabled it will work.
of_machine_is_compatible() solves that though.

--xX4oY8xNNpMcBrcO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyQ9wAKCRB4tDGHoIJi
0qBvAP9+1RrfwGvdcMspPE/tS0MBvdZoS5zBpUQxasuB4VeMFQEAo9VQjBYpr8/L
QPB6RwjCOmhkEDqVr7MkDkNYTdGuZgs=
=h6tV
-----END PGP SIGNATURE-----

--xX4oY8xNNpMcBrcO--


--===============1587786277506579887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1587786277506579887==--

