Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC5DCAC5B9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avH6Z9eN2I11K50mFp/D3mjNiogg+isFZHHJD8uXfAg=; b=KLqobyT3yjbVIDxeQnlyQCvwGd
	KowedsHJdo5JuaJ69QzKIjNhOhghfstv+Usx36rLM7EEQDuLWpOGRvT/Ee4/I6uXQoNu6yY9HAtcy
	fkgUMyUZniPMJu91cdGi6ZUgxDR2BdWzIUue0SsgixiWyHp2DX61h48p7N6mAefblPfMuXKOFaFoA
	EWdsxQx/sFAQvq13FXGcCBn6xTKFUsyQIuJPQn4DzFeBsemitRlQoFx9qiHCDX31e+nY5CplbD/Qq
	s2dVyvGlRu9dgpVqcFbq4cECDaInTAySvqDSIHqHUCTRE8noZq0ZC43QdW0K/xkw6Kru3nJ6lHA0E
	Tr6YLfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HzD-00000003BLT-3oxD;
	Mon, 29 Sep 2025 17:48:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HzC-00000003BLH-3OkB
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 17:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF88962675;
	Mon, 29 Sep 2025 17:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1160C113D0;
	Mon, 29 Sep 2025 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759168107;
	bh=QYNJjNkcAi8f1hxQxRPpHKeysPae/MLqNM8ctOgO/eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lnk+Fs6k9EebnHXbPkvyWtVU1BONOuKH3ce7BMs3Y0U/Z0cB17CrCv9odBtFdJ5w4
	 l74lyv0bm5fELHyt3Zy8iG2ZlfDpGdYZ9ZjDWjtWOrNWjMzg73gsQOgrBRfcKVWlWS
	 1ofJVXY7HhUg9IC1rUnxb+UWvGWevioLdtuQlPVIqli29hAn4HQyIPIsZ57Jjz8dxs
	 q8meddvm47unHiBchMMv53FkEyREEI/xyR3s9qD/ei2KHYR1g4zfIaq/l/c0OhlETO
	 T+B2Gmv4ahhs1WeS2x/hJI7vpF+dkUVsFYvkyA3uOyIZrIKCb2Y3piOMuFcPoOpGjq
	 9BkJ22xbJq/1g==
Date: Mon, 29 Sep 2025 18:48:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <20250929-challenge-molecular-947bb1f5962b@spud>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <20250928074914-GYA1344940@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20250928074914-GYA1344940@gentoo.org>
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
Content-Type: multipart/mixed; boundary="===============4603568960030963660=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4603568960030963660==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvUen0NxRlUjr0cE"
Content-Disposition: inline


--cvUen0NxRlUjr0cE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2025 at 03:49:14PM +0800, Yixun Lan wrote:
> Hi Troy,
>=20
> On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> >=20
> > Document the compatible string for the MusePi Pro [1].
> > It is a 1.8-inch single board computer based on the
> > SpacemiT K1/M1 RISC-V SoC [2].
> you could wrap at slightly more characters, I remember 72 chars
> (haven't spent time to find a formal document link..)
>=20
> >=20
> > Link:
> > https://developer.spacemit.com/documentation?token=3DYJtdwnvvViPVcmkoPD=
pcvwfVnrh&type=3Dpdf
> I'd suggest to list core features of this board, while using this link as=
 a complement,
> base on previous experience, vendor may change the link address, thus the=
 link vanish

The link doesn't even work for me. Is this board actually made by
spacemit as a developer platform?

>=20
> > [1]
> > https://www.spacemit.com/en/key-stone-k1 [2]
> >=20
> pleae keep them in one line, no break, and no blank line between SoB,
> something as below
> Link: https://.. [1]
>=20
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Do=
cumentation/devicetree/bindings/riscv/spacemit.yaml
> > index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f=
1ea5ca9fe28caf45a 100644
> > --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > @@ -22,6 +22,7 @@ properties:
> >            - enum:
> >                - bananapi,bpi-f3
> >                - milkv,jupiter
> > +              - spacemit,musepi-pro
> >                - xunlong,orangepi-rv2
> >            - const: spacemit,k1
> > =20
> >=20
> > --=20
> > 2.51.0
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--cvUen0NxRlUjr0cE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNrGZgAKCRB4tDGHoIJi
0nnyAQC2RbyZY4DxV9VTcddgsLFj7tNKJ8OGxuJMGloqBaPbzQEA+MImol8+wEvz
kopy4+f2gaph1xiXjMrIP82j4HmnMwc=
=wddC
-----END PGP SIGNATURE-----

--cvUen0NxRlUjr0cE--


--===============4603568960030963660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4603568960030963660==--

