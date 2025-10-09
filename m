Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC80CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qpvLHGWXdszvYPhPLFkWiOkNBiiCT4vYjQvZ1jO/AU=; b=QQ4CWJwDhfxJpulREnmxLS0A+U
	xgBqyE9urKhPKbvWYHwn9R3JWv8NXx++NaWXD3L+MIEBjm/IrBBaDFNGtQiEt0/WPSyMb4TJlAgqZ
	wcLwYXIyx8HAIlbZnWjrtHRNIXKBq+x6U6yR6PuA3qs0aBZvFZW89ydTCsNVHN7hOxijT9tPgIQfs
	MJ9wkQbAf5EmqKhaQqgLkYrZjHUkbFXR5y8z54p5sfBqDVRPupOBJdxfdoc08D+sHbldfZOJxRw8a
	9ifG28XC36XnBahH4i7N3ETY7tuuVOQcqoy5v4o9Gtah6iddkQ73HPtUYdL3iMe5vH0wzVSCryLEL
	qeY3vt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sY2-00000006VCA-146A;
	Thu, 09 Oct 2025 15:27:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sY0-00000006VBD-2lPA
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 15:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AA9A6231C;
	Thu,  9 Oct 2025 15:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDFAC4CEE7;
	Thu,  9 Oct 2025 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760023635;
	bh=mmGYKciRNdjxJeWKpsJv6Woc1jASOtzqRmKHlNJJKRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fE5kcC50z+Off25M9rzlEmb3rVm9DTmA1FsHLUM+sy6uE+szyKARzhu5PuYHJNejx
	 m+fYpfQNC7RmWaR4ffMy06GFdBRgMhLtLi8uCl8b4x7cFaoizmJ36LGekJtXJl//pM
	 yHhhV1K6YumXVfHTC3UMLx8RdqK1hHLA3r1OQp+j20uCynU7EK1HaKoeLeJ9cou56c
	 jVHL+SwOeCjGhK1otMdtt5A1FpkInAoAXeSGt2djiKYehtW/rDIQYLRjjXt5Hmj4eG
	 /7K5LTBCu0FN92gEPKVKqaFAI7fPoqC4QtgtKotQ0Van8nLvXJ02ZI9EdboH/49DE1
	 YkqRxh2ZGhwRQ==
Date: Thu, 9 Oct 2025 16:27:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troy.mitchell@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <20251009-crazy-outhouse-fe3e47d0dbe7@spud>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <20250928074914-GYA1344940@gentoo.org>
 <20250929-challenge-molecular-947bb1f5962b@spud>
 <A5845378AE731404+aOdtKmFPaYfc2n7n@kernel.org>
MIME-Version: 1.0
In-Reply-To: <A5845378AE731404+aOdtKmFPaYfc2n7n@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============9084496715705574085=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9084496715705574085==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTeySwOLHeYm7U/L"
Content-Disposition: inline


--TTeySwOLHeYm7U/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 04:07:06PM +0800, Troy Mitchell wrote:
> On Mon, Sep 29, 2025 at 06:48:22PM +0100, Conor Dooley wrote:
> > On Sun, Sep 28, 2025 at 03:49:14PM +0800, Yixun Lan wrote:
> > > Hi Troy,
> > >=20
> > > On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > > > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > >=20
> > > > Document the compatible string for the MusePi Pro [1].
> > > > It is a 1.8-inch single board computer based on the
> > > > SpacemiT K1/M1 RISC-V SoC [2].
> > > you could wrap at slightly more characters, I remember 72 chars
> > > (haven't spent time to find a formal document link..)
> > >=20
> > > >=20
> > > > Link:
> > > > https://developer.spacemit.com/documentation?token=3DYJtdwnvvViPVcm=
koPDpcvwfVnrh&type=3Dpdf
> > > I'd suggest to list core features of this board, while using this lin=
k as a complement,
> > > base on previous experience, vendor may change the link address, thus=
 the link vanish
> >=20
> > The link doesn't even work for me.
> Could you double check if it really doesn't work now?
>=20
> > Is this board actually made by spacemit as a developer platform?
> Yes.

With the link, that seems pretty clear. Not sure why the link didn't
work before, but it is working now.

Cheers,
Conor.

--TTeySwOLHeYm7U/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfUSgAKCRB4tDGHoIJi
0m1+AP0eT/PWdBBoKEsVOyd51NTvO64ceUYNyzdvNKX+jrdvAAD/RUig3ZZAszrn
9sEmMD7SB2/wCBYFNmp+18Vv1noH4AU=
=TzA+
-----END PGP SIGNATURE-----

--TTeySwOLHeYm7U/L--


--===============9084496715705574085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9084496715705574085==--

