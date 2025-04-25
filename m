Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7977BC369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPV6JQXuDiRJmQJJ/XHBXyxN90kkrOxyS+I8OtUlfbg=; b=BHUGaFrIsU4nVF/KvzxfqLOnf+
	eZON+locxbqxlXpMADWueu9WSChmZsLmw2qUQRWFSrUft4SZZ8fw846otr+t4vL1GIu1raEutL8+y
	FAAc/Q2mod4hzA8k7T7l4lM/q3ps9gI9C4J8HQiKnc3lK1ZDnm+0uDC6M6acTkWwuItgAeFOBNyO1
	IMRhWzirLQtAw1Q0u23X5OApt8o+MKPwNx8M5eT0/3Xf8qqA14CqZgPHI9LFuHn+4ZetHKKYSc1Th
	Kkf9fTukoP9bLBrCru0YSb488tNZ5K2OexgWOb83BlhXogXiCx+J2hsvlf0fmWA5nKNXRFLPqEbrL
	jTXTVxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LnN-00000000BWc-0Dmy;
	Fri, 25 Apr 2025 16:20:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KAd-0000000HSZt-1i1h
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 14:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D820A4AA56;
	Fri, 25 Apr 2025 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045ABC4CEE4;
	Fri, 25 Apr 2025 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745591810;
	bh=K2RdwYQvxoGdkMb4tRtn11nLabJWv4T2dHWe753R+lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0BlZTgliYLpKMPqcPn0s9FTdF2UvlHq4qxPzcEaLoyqevgouX1IzelnR3Hg5t06K
	 Ik706/6ehA0pE+fOk420fIvbz2USLSeUV6wb61gY2p4Or157l/RNF4WFNha8pFM+5A
	 ceWIt7io1tvZyuLCj0w4gb08P9cw5ACpSGU0JpNkKTOpTG5fXq0D9K0A9rd72S6p/l
	 SLZTt4kdl/mTfif4dlaa67I66ReQ+HHtPh7VzoLboicfCqolP3iSBH7l5ofIMYvFr/
	 qF5sfl292IYrAQGsMxatk7tlFE+mcZ4sF+5FPxN+mi07DtHjl+ecKe/4/tpkVFCxKM
	 UavRglTEVkZLA==
Date: Fri, 25 Apr 2025 15:36:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support
 for K1 SoC
Message-ID: <20250425-unsuited-perennial-96d13be0b927@spud>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
 <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
 <20250424-untried-refueling-50c5902d63c9@spud>
 <20250425000406-GYA49092@gentoo>
MIME-Version: 1.0
In-Reply-To: <20250425000406-GYA49092@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073651_465260_ACA93B00 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alex Elder <elder@riscstar.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0047067937617531439=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0047067937617531439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kUnUDH4nBaYcHt5+"
Content-Disposition: inline


--kUnUDH4nBaYcHt5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:04:06AM +0000, Yixun Lan wrote:
> Hi Conor,
>=20
> On 16:22 Thu 24 Apr     , Conor Dooley wrote:
> > On Thu, Apr 24, 2025 at 05:40:49PM +0800, Yixun Lan wrote:
> > > Enable GPIO support, in order to activate follow-up GPIO LED,
> > > and ethernet reset pin.
> > >=20
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >=20
> > Do you want me to grab this patch, or do you have a defconfig branch to
> > put it on?
> >=20
> Yes, I'd appreciate if you willing to pick it, to avoid potential conflic=
ts?

Sure, done.

> (I currently do not maintain defconfig branch)
>=20
> BTW, we might have few more in this cycle, e.g. - clock, reset

Cool, just poke me if you need them picked up. I should see an email,
but failing that, @ me on your IRC channel.

Cheers,
Conor.

--kUnUDH4nBaYcHt5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAud/AAKCRB4tDGHoIJi
0saMAPwOeQlQUrG6np6OmBikq8VoxLk3DzM+HkXJFjuDkb5spwD/VLAVmmRQJRdW
7Kd+TdyJ9DvK5K22vsvOBcpQHKAbIAY=
=qbG6
-----END PGP SIGNATURE-----

--kUnUDH4nBaYcHt5+--


--===============0047067937617531439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0047067937617531439==--

