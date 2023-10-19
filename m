Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00800CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhxAmzJQg4ei5UVhRrMwlV8MBH0ruVgkTWvSYjqs9xs=; b=Eu5KkRv+w5v6DO/rqc+yoIp6iw
	6+vRFnMT2CkpGf4dqHBW6xJTBrtGkieA30XeaU0GGeFAXtA6NdItpxceGhezOiQv/7CDoSmgNG1Ss
	Viej6ncQbBi3PIJJtVIxu2T3GZxkoEgGXYvvvoPqXNNTFMzv8uaTauhO4eOoy6VsmWildDhLtLSrS
	h0vgv7+YDbCD77kP0X30pZVAXQ5pDohH8aRkCVYCa7JZ9UbbGyBK89aTebFfbN7aA0loAI68ft0lr
	1liOO2YoXJAy9uF4ki4oWwgN0KnZ8WRnzpS3R8mjZ1p9yIA1Q7eA050J6x79XKNC1zfSDp93Y1jet
	8Xh9l7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV1X-000Cii-1V;
	Thu, 19 Oct 2023 15:33:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV1T-000Cer-1N
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 15:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1E948B827E9;
	Thu, 19 Oct 2023 15:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5FDC433C8;
	Thu, 19 Oct 2023 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697729597;
	bh=HwwRNCwT8BYB1JzATrYA1vnmNd3NZ1gsX/BTgIeQxys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N97pbG5eH+rIsR4tEcQlulJ2kgrWW2CryHjiZOTPl5Li7NNuRFr7bLP5lcqz06mb8
	 I0yq83Oz7HW3+xQj2QxqHqRZvb7UvfQQJF1JLaAWhqjApWcvYt5CgteXF7OEntP3yB
	 e+/sKHHlXiqrMgRmA4oy/muxqBC44EUPh76dQMzwrY0Q2fZCNuCkwhNoGlaDwqFvUj
	 sE7xiMKRnN68hE7eoJDiEVZFu6KO0BWkPpeMdESqXx22QsqFKg/vGJYnu+DVeb0iO3
	 JQQygDm6uKa9lDbcIXYvBau0PjJay6LR1B6BRuy4WnGAk+j+4F0fAkFEuO55Zb2lfA
	 CeA7SsZiSU+9A==
Date: Thu, 19 Oct 2023 16:33:12 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, Jerry Shih <jerry.shih@sifive.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
Message-ID: <20231019-nuclear-vista-ef3e0b9bef71@spud>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_083319_734137_34AC1179 
X-CRM114-Status: GOOD (  32.53  )
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
Content-Type: multipart/mixed; boundary="===============7190578230734851670=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7190578230734851670==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VdNzOK6fe6sE2V7+"
Content-Disposition: inline


--VdNzOK6fe6sE2V7+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 11:35:59AM +0200, Cl=C3=A9ment L=C3=A9ger wrote:
>=20
>=20
> On 18/10/2023 19:26, Evan Green wrote:
> > On Wed, Oct 18, 2023 at 5:53=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger=
@rivosinc.com> wrote:
> >>
> >>
> >>
> >> On 18/10/2023 03:45, Jerry Shih wrote:
> >>> On Oct 17, 2023, at 21:14, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.c=
om> wrote:
> >>>> @@ -221,6 +261,22 @@ const struct riscv_isa_ext_data riscv_isa_ext[]=
 =3D {
> >>>>      __RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
> >>>>      __RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> >>>>      __RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> >>>> +    __RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
> >>>> +    __RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> >>>> +    __RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> >>>
> >>> The `Zvkb` is the subset of `Zvbb`[1]. So, the `Zvkb` should be bundl=
ed with `Zvbb`.
> >>
> >> Hi Jerry,
> >>
> >> Thanks for catching this, I think some other extensions will fall in
> >> this category as well then (Zvknha/Zvknhb). I will verify that.
> >=20
> > The bundling mechanism works well when an extension is a pure lasso
> > around other extensions. We'd have to tweak that code if we wanted to
> > support cases like this, where the extension is a superset of others,
> > but also contains loose change not present anywhere else (and
> > therefore also needs to stand as a separate bit).
>=20
> For Zvbb and Zvknhb, I used the following code:
>=20
> static const unsigned int riscv_zvbb_bundled_exts[] =3D {
> 	RISCV_ISA_EXT_ZVKB,
> 	RISCV_ISA_EXT_ZVBB
> };
>=20
> static const unsigned int riscv_zvknhb_bundled_exts[] =3D {
> 	RISCV_ISA_EXT_ZVKNHA,
> 	RISCV_ISA_EXT_ZVKNHB
> };
>=20
> Which correctly results in both extension (superset + base set) being
> enabled when only one is set. Is there something that I'm missing ?
>=20
> >=20
> > IMO, decomposing "pure" bundles makes sense since otherwise usermode
> > would have to query multiple distinct bitmaps that meant the same
> > thing (eg check the Zk bit, or maybe check the Zkn/Zkr/Zkt bits, or
> > maybe check the Zbkb/Zbkc... bits, and they're all equivalent). But
> > when an extension is a superset that also contains loose change, there
> > really aren't two equivalent bitmasks, each bit adds something new.
>=20
> Agreed but if a system only report ZVBB for instance and the user wants
> ZVKB, then it is clear that ZVKB should be reported as well I guess. So
> in the end, it works much like "bundle" extension, just that the bundle
> is actually a "real" ISA extension by itself.
>=20
> Cl=C3=A9ment
>=20
> >=20
> > There's an argument to be made for still turning on the containing
> > extensions to cover for silly ISA strings (eg ISA strings that
> > advertise the superset but fail to advertise the containing
> > extensions). We can decide if we want to work that hard to cover
> > hypothetical broken ISA strings now, or wait until they show up.
> > Personally I would wait until something broken shows up. But others
> > may feel differently.

I'm not really sure that those are "silly" ISA strings. People are going
to do it that way because it is much easier than spelling out 5 dozen
sub-components, and it is pretty inevitable that subsets will be
introduced in the future for extensions we currently have.

IMO, it's perfectly valid to say you have the supersets and not spell
out all the subcomponents.

--VdNzOK6fe6sE2V7+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTFMOAAKCRB4tDGHoIJi
0jJxAQDXlhaCx8sNyUh8SSBPQepeS21XzSfsPqfo0fiwFpQb7wD/QhyzMzwWfC/1
nl0r8JLAMrkerLCK3Mpf0dfHXirH+Ag=
=NsYQ
-----END PGP SIGNATURE-----

--VdNzOK6fe6sE2V7+--


--===============7190578230734851670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7190578230734851670==--

