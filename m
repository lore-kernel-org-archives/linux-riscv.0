Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB58AC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTFmzgzGTJjwEU/l7mGM6aUCBC6DkNR+4G45OFmMoTg=; b=p11uHbBxg1UQeGk1ZdGl740Ip1
	CUjrXSLg1wvgzUdvkC1V8D6ETORvRRbI4PlBzewHzfExzli+SgGBTO4lyDIUF5wxl0bPVlcdb9ChU
	yez5Q2h/+NhYuP3nHJA1yXHoIYXEa7lZUEpvSzS5OGFr02YPiOdtMr0tUyY9Rq2QlM1DFcA71eg8b
	i2aOlutMm7Ke/7JAzSIyijlj30umYJadCpFjN1c2xf2twdaDj5MUlsxaN4fQVhl7BQrbVYLex6QVS
	kpD+Z/zd8caXFz97A4BSyi/gxN3y+QS+MXN/qX3cBnuGtUVt/C9b0kyG5wRnUOv4uxqPv8eZY6juB
	mAiDl2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Ne-0044zl-04;
	Thu, 13 Jul 2023 17:45:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Nb-0044z8-2W
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BA4961AD7;
	Thu, 13 Jul 2023 17:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCBFC433C7;
	Thu, 13 Jul 2023 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689270326;
	bh=IuiR4PQFRb5jjeu/eXPnB00w8kn3VUx67UcIqHzRIiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fw11RTSirIkCiGpu4270/6WKRbWeJFwiLRDwKaKvm7jW/DXQSf4XORi3TsMTa2i7n
	 LrdgZT9GgB3hlCm8pHJDfer9+qM+z8/wUdFtYUSVjjQqS6pnhBvjmgJePyiA4ZzaC+
	 ggKffkS9vpVG4ZGAuW/11dvl92wbBJOQawVL7S6xJCgs0uUaQtUFgX1nw9s2yahVUv
	 SNrLcwN/IOS13sR6lAtLsT5tP0Nn4LFvMFqeS2b+WpF/AeESwHrbG8MsYyzfRdvUKN
	 Nmy2sMqxLzFxmYpBn6gBeDAcuXY1MLbY87fPnrlzyGPPaDgRKvXcsc5doi8fTKWXQ5
	 rJkZNc6eAAkxw==
Date: Thu, 13 Jul 2023 18:45:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, palmer@dabbelt.com, heiko@sntech.de,
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230713-statutory-balance-f2c9e862f2e3@spud>
References: <20230712-postal-affiliate-0d61a209897f@spud>
 <ZLAoIWX+qqWvucWz@xhacker>
 <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_104527_905233_BC8B4D81 
X-CRM114-Status: GOOD (  21.53  )
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
Content-Type: multipart/mixed; boundary="===============2394570664404108119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2394570664404108119==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qQ5GSYj0Qa4e94d/"
Content-Disposition: inline


--qQ5GSYj0Qa4e94d/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 01:33:56PM -0400, Guo Ren wrote:
> On Thu, Jul 13, 2023 at 12:48=E2=80=AFPM Jisheng Zhang <jszhang@kernel.or=
g> wrote:
> > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:

> > > +             /*
> > > +              * "V" in ISA strings is ambiguous in practice: it shou=
ld mean
> > > +              * just the standard V-1.0 but vendors aren't well beha=
ved.
> > > +              * Many vendors with T-Head CPU cores which implement t=
he 0.7.1
> > > +              * version of the vector specification put "v" into the=
ir DTs
> > > +              * and no T-Head CPU cores with the standard version of=
 vector
> > > +              * are in circulation yet.

> T-HEAD's vector 1.0 SoCs is in circulation. Kendryte K230 is the
> shipped SoC chip, which vendor id =3D THEAD_VENDOR_ID and with vector
> 1.0.

Where can I buy one, if it is in circulation?
Googling in English might not be the best thing to do, but doing so I
could find basically no information on the k230 - I did know it existed
and tried to find some info on it before sending the patch.
If it is not in circulation, then the comment is not inaccurate & when
they do arrive they can use the new dedicated property to convey support
for vector.

> > > +              * Platforms with T-Head CPU cores that support the sta=
ndard
> > > +              * version of vector must provide the explicit V proper=
ty,
> > > +              * which is well defined.
> > > +              */
> > > +             if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D=
 THEAD_VENDOR_ID) {
> If you insist on doing this, please:
>=20
> if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D THEAD_VENDOR_ID &&
> riscv_cached_marchid(cpu) =3D=3D 0 && riscv_cached_mimpid(cpu) =3D=3D 0) {

Why? Does the c908 report non-zero mimpid/marchid?
If yes, does it need either the errata for CMOs or the page tables?

Thanks,
Conor.

--qQ5GSYj0Qa4e94d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLA4MgAKCRB4tDGHoIJi
0jccAQD7T3Le2Fgwy4wz443KLfn07klfulNeuQa4erKwlGy5PAD/VzKLR+XBUBAq
4nd3ruKdQYpJBYuFtYg31gF6EY38AQ8=
=ZHpS
-----END PGP SIGNATURE-----

--qQ5GSYj0Qa4e94d/--


--===============2394570664404108119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2394570664404108119==--

