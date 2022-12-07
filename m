Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C573C4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 22:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQeZa7t1Tza7YNI6Ew//F8WXeeC02wKpyd8z2r4CdTk=; b=WJjusgRJlljYOB2aPuPr1XDpjl
	hh7FxNLI5bzDHLsk7sM0ZX9vfRudTUzm6bxFkPgZLxJdUeC0FxdidhoowcwRpukMPlflAL84yUko1
	vlWV45xZLvY9miZskaNl7p/KP0x195bmQQrpzqQVGVyKT7RoaPhwEPciqDHGzCnYolEbBzeC2Sk/a
	mNehOAUGYJshZ1R+jy+kkgTgCPphV9a5ZuENuog7C6pBiL7lZ+8NN8jK5dQwk+KyGtOusrgQPyLu4
	Kx0GASFshwYBnhzeiJfjxgyxV12Ca0xWBuVZKbWeVmU9uQUaQQYi2ZtKh1Ds4L7wxKabMHmAGMWZh
	rq7dHCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p32Wm-00DfEY-7n; Wed, 07 Dec 2022 22:04:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p32Wj-00Df22-Cg
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 22:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0279B82170;
	Wed,  7 Dec 2022 22:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A023C433B5;
	Wed,  7 Dec 2022 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670450664;
	bh=Ckhlf9re8EjGT39DYR/q2VjHa1O8JxkRSJeqoIPKPZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRRdXncVUGhMn+U0bGN+u0+MG3Fu2GhSWH+BO2sJy5ndOQuEwkqPvrP9J+ECWVDsG
	 cI1NBQ4fgu0aN/+zjM+qNkDUfkhN+V0JwFwPJY6PQ8NX86/Y78j1MlYykpbQRc9cBt
	 nfyag5kGQA3gMX/W1Skf6YMrZrGQkJxs1q6rievCFC55bcjuNQju+uCo4cNneFdURR
	 j1vjEancI7M/zCc5bzvDa8UNhMVU2hLyEcMc6mAJVVU9aFk9TBQgFXPDSKh5CQ2EsX
	 CwcfxHLzRfGqFS+k6ZSF7z46XGB3wpeju5WuHaXR4S2KY3VYnUHfbdlzitqzG6x+C5
	 0MaOgGLLtfJ8A==
Date: Wed, 7 Dec 2022 22:04:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	emil.renner.berthing@canonical.com,
	Jisheng Zhang <jszhang@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <Y5EN44bscFwFYrUv@spud>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-13-heiko@sntech.de>
 <Y5D8CHkJZGmQKxdh@spud>
 <F5E250D9-29DD-40C5-AF34-82B59DD4BD11@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <F5E250D9-29DD-40C5-AF34-82B59DD4BD11@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_140429_620107_23378ED6 
X-CRM114-Status: GOOD (  12.82  )
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
Content-Type: multipart/mixed; boundary="===============6259295235865788084=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6259295235865788084==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8GIJ+ua69QmSyq2K"
Content-Disposition: inline


--8GIJ+ua69QmSyq2K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 10:00:13PM +0000, Jessica Clarke wrote:

> >> +static u32 riscv_instruction_at(void *p)
> >> +{
> >> +	u16 *parcel =3D p;
> >> +
> >> +	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
> >=20
> > I feel bad for not mentioning this before - can we replace this magic 16
> > with something self documenting?
>=20
> I mean, it=E2=80=99s a u16 * two lines above, that seems a bit unnecessar=
y...

I guess that's why I didn't mention it before... Can safely disregard
that request so Heiko!

--8GIJ+ua69QmSyq2K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5ENvgAKCRB4tDGHoIJi
0j0IAP9YU+H1MbPO+pqeSpKA0QNC6uy2XbOZgeuRZEnvTaMIJQEA1qZW/Xzawbwr
incx24Ixm3LHnuTaMIPuycS/Ag8PNQ4=
=tOvG
-----END PGP SIGNATURE-----

--8GIJ+ua69QmSyq2K--


--===============6259295235865788084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6259295235865788084==--

