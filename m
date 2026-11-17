Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9E606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3Yb6l8P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEmtPG3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VO2Z6KwxsHfO8drTHsM+MNLfTb52vikq9p5h8RKcA9I=; b=b3Yb6l8PSSbLu5c6owJKrhxDVj
	xVVPH8SLCdpFfk34KVJOn+3+fmw1Eoi0CAwQXZ5t+6vnVToqRRppCQn+OEk+Y4M3vEUbyhhgA+1Py
	LdBHFinRbeEid5hpkmuN098It00G/J97V3SVoW+819M6lcrl/aTsC+AGEDEJgIfljdudPEdaubNvz
	9E0DohH2uppD/7sS5vvdxBnpTvRmcLw4p28G1njzCJuCxr4KWWo/9+ZPjrqihe9PlJsLz7AMDW8as
	6DeTszDC/LpUojHHwiEmjH+/kcCTwBDglwgyxdC6U98uTBuei7leu7TNOhEthkoBIV7qy8tsl82YN
	wc2CBhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNHU-00000006gHk-22L6;
	Tue, 17 Nov 2026 17:47:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNHS-00000006gHV-0je5
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 17:47:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 342F26014B;
	Tue, 17 Nov 2026 17:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5B21F000C4;
	Tue, 17 Nov 2026 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937660;
	bh=cR2AOpEGYiKzlikyUl8O8YBDqVn1oEriwrxHwFqrRDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZEmtPG3s6pzK3McY+POU0Zq2TtX9e07Rj1YqBffwbPVGP8TkDyQJCNbdPeg2omzxW
	 faO2+XQKzaVmTsVMjy4bEJ9cWc0xGyqjv92fhd0DO2LTt3egZtGCtK7DzJMeS501eq
	 mOzVO6yAQHf8dxcm57tesdPrPpt1U1REoMWk//2mNIlHiAmixSEY1FCMGteYEB+Tpk
	 XBEEneUOaZCy5JVsvirYZWR/hreA139SsdaICnhvMAExt0Ey4XACSXIYgDooRh+qjd
	 exUltOpX4iTIn8XI04WZwuCbRjG50FeYqJ5lv4u2+v5YgoGDyo/TrfO/aNiWXGugaq
	 UGOcPA2xwfI0w==
Date: Tue, 17 Nov 2026 17:47:35 +0000
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
Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
 compatible
Message-ID: <20261117-yippee-blissful-76204cadd922@spud>
References: <20261116003937.1776888-1-minachou@andestech.com>
 <20261116-dreamless-matador-3163d4abbf0b@spud>
 <avvH6t8NHrya+hz6@atcsi01.andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <avvH6t8NHrya+hz6@atcsi01.andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7897119030457290577=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7897119030457290577==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yL4HbPHY7ZmtVyGZ"
Content-Disposition: inline

--yL4HbPHY7ZmtVyGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:20:10AM +0800, Mina Chou wrote:
> On Mon, Nov 16, 2026 at 06:26:33PM +0000, Conor Dooley wrote:
> > [EXTERNAL MAIL]
>=20
> > Date: Mon, 16 Nov 2026 18:26:33 +0000
> > From: Conor Dooley <conor@kernel.org>
> > To: Mina Hui-Min Chou <minachou@andestech.com>
> > Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
> >  alex@ghiti.fr, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
> >  conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
> >  prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.o=
rg,
> >  devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
> >  linux-kernel@vger.kernel.org, randolph@andestech.com,
> >  cyyang772@andestech.com, tim609@andestech.com, az70021@gmail.com
> > Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
> >  compatible
> >=20
> > On Mon, Nov 16, 2026 at 08:39:37AM +0800, Mina Hui-Min Chou wrote:
> > > Add the compatible string for the Andes A27L2 CPU core, which is used
> > > in the Allwinner V821 sun300i SoC. The V821 devicetree will be submit=
ted
> > > separately by Allwinner.
> >=20
> > I'm going to apply this, on the basis that it will be used elsewhere.
> > Ordinarily, it should come with the allwinner series.
> >=20
>=20
> Hi Conor,
>=20
> Got it, thanks for applying it~

Just to note, because this patch was separated, sashiko did not review the
driver changes. They looked fine at a quick glance, but I would like to
see another revision (with this patch excluded obviously and the things
that have been commented on so far solved) so that it can take a look.

Thanks,
Conor.

--yL4HbPHY7ZmtVyGZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyTNwAKCRB4tDGHoIJi
0nDfAPwKHrmXEY408835g7LwKKUsD3y2VAZE1B3oMkjVyjOigQD+NM5PZ2WItqP6
lGZX8OLP+0WQqR6FozKNWS1q0T38KAg=
=oYqq
-----END PGP SIGNATURE-----

--yL4HbPHY7ZmtVyGZ--


--===============7897119030457290577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7897119030457290577==--

