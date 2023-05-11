Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D06C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sb6oY+gBoBidnaQ7+e5+POPLkEiNaIc0FnNQjKmuuI=; b=A8aa6iQ/DP8be1OSVAtCR1/xtE
	Z1N1c40Y4Mdjn+cmecB7i9yDCPI9JEZFeW0OG59n3qIXG30OglD162TrZbGzByDyxUWsoJIYdFXr8
	PFBMZVTtAdwVl3SO6SESG+vQzFLy3Ft9ro3k+CrFieQh3e3cBNMevU27Pbhla3DOcyblDyeodizZi
	fo2OMIj0PWSoNQc629m+NKBHToYSwLH0UbqnShkFDau5nOE9v/jOS1HM699dgP0grXRRdVszrQMoQ
	FMs/tCiVhdgOKkZjipr5CWk5hnGhLrXtR8prW0DRW+NSsInEHhbo5omDwzn4AQOanfOJJfAnkIoFh
	Sy2GqxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxE8a-00A5Iy-0c;
	Thu, 11 May 2023 21:47:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxE8W-00A5Hw-1q
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 21:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E22536135C;
	Thu, 11 May 2023 21:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5E4C433D2;
	Thu, 11 May 2023 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683841663;
	bh=N6lJFJqzV7ytXV6+rKvzLTpx6yPBkX401wQ/wXQJiW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wl4jlKhfsue4/c+zHUnLXabF7cR1b91X+0Z0SohLoB3xQfCNIeKpkTEOtl58tmT95
	 XIkYw3V6b9NROUr+rjpt7DpTXeftAsRn6BXaKbVCcmaehEZQ7wO8E6bg/a029tcowQ
	 ey72wKPZEURG+TG+Bek/PzhY95qLydEe0IMV+wfQFl5MREW0QwxfgjLY5dTia0zvUq
	 PT+HOLs0/U/1tt+5HbqigcHs1eBKPKs8RbOPEwi1U1fEDKJUTNNdJU/dmRgV3dv10Z
	 0ShNuEBMu+Ch/Mzy6wcYT89wFiyS3xf0PhQCuS7YXemz/SnOJdJ0tui/ENxsLKrL4L
	 Ac774mfOgQwAQ==
Date: Thu, 11 May 2023 22:47:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230511-punctuate-dinghy-0dd9be94270c@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
 <CAOnJCUKM13+qzR-rKJZj6OD=-DWiu0z9atzBJ89j_bRwByiowA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKM13+qzR-rKJZj6OD=-DWiu0z9atzBJ89j_bRwByiowA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_144744_719529_62F9B21B 
X-CRM114-Status: GOOD (  24.43  )
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
Content-Type: multipart/mixed; boundary="===============8020048484248184728=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8020048484248184728==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KNnUOQ8SfmCZhf4A"
Content-Disposition: inline


--KNnUOQ8SfmCZhf4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 02:27:44PM -0700, Atish Patra wrote:

> > The other thought I had was that perhaps some software may choose not to
> > implement version x.y.0 of an extension and only support x.z.0, z > y
> > for some reason. We'd want to refuse that extension if the extension is
> > found, but the version is not listed as being something compatible with
> > x.z.0, and while the ISA spec does say that the default assumption is
> > 2p0 for unversioned extensions in its current form, I struggle to
> > extrapolate that to extensions not currently part of the unpriv spec,
> > but rather defined on their own.
> >
>=20
> That's a fair point. However, any new RVI ISA extension will only have v1=
=2E0
> as per my knowledge. Any new feature will have to be part of a
> different extension.
> At least that was the plan discussed last year.

That's more than last year at this point, and nothing has changed in the
documentation! Talk's cheap, ehh?

> https://github.com/riscv/riscv-isa-manual/issues/781#issuecomment-9832226=
55
>=20
> Are you aware of any discussion that changes this ?

It's called "trust issues". I am far less worried about the addition of
new features though than the removal of existing ones.
Part of me fears for fence.i-less systems for example, but there would
be other ways to bodge around the mess if it comes to pass.
If we are *sure* that no extensions will modify features additively or
subtractively, then this may not be needed at all & I can avoid having
to bend dt-validate to my will.
We have no guarantees for vendor extensions on that front either,
they're free to do what they like w.r.t. versioning, no?

--KNnUOQ8SfmCZhf4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF1iegAKCRB4tDGHoIJi
0kU0AQDe4wPkJbvFunY7Hd7tVeEqB9Nx4RBMWPuYxZW9CGVh0wEA201Uii1iRlaK
nSvwRBXu5EKO8fs96wDjwGzDo9UlRAQ=
=BbjJ
-----END PGP SIGNATURE-----

--KNnUOQ8SfmCZhf4A--


--===============8020048484248184728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8020048484248184728==--

