Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72350C25B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 20:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBsht8yiUqOeh9FdYbwEI5RCd9EuPOqDPzSfw/qzmDQ=; b=Zw7KzWDOTYzt/6qDHHD+GBZL8c
	pCpRCiDLsutviTF47CadgrytsIMLTG5+ggpuHRrEOqMe7ftisMYeuf9s6pX5cdxfAoL2oU1OkkiVs
	zDoWAPQZGOyghBlIHh7KCZCwvvdsX7vWTyoLWMfdR4evgBqx5AVIQo1nkF74KXI0GT8wtPZCGDKwm
	8ekSqZCy7VJt+kOx88WeiLYZrcneRmLYbXlalF7kezZahEEeuUsStogzZxhMMjbHD/t2qRXCoqwX6
	Y9uBu3/SNkU91bvYZgJTOXjJlza+CPel0sOUWpQjtfyUUVyoXh6TQw43EardcqeRKd5Cx2yKLNpPo
	dpKEhIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s83ki-00000008tmy-3rVk;
	Fri, 17 May 2024 20:00:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s83kf-00000008tlq-0HXq
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 20:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D15D61E2B;
	Fri, 17 May 2024 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D682CC2BD10;
	Fri, 17 May 2024 20:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715976023;
	bh=mO7CseUBhealxcctlNPit4cFTmehA1i4nglslSvX8Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uO0fxI8FFLkYVRhck0Wkwx/iUrrEBPSCiE1OLZUMOTKhIS+nXvu1wE+JoKWtqMEtA
	 LXJ5vd6gSyk8beFp1jqgCWWEHoYSMKILQksgqSed+SLOCXZ8siJx9RvnbFxYL9oPcE
	 YZ/PS0lL2aLLwNdh5F5w7oqBH4DqJ3UuOUUqqJ4hmNpfO6PFnHwdB3AHvfCIT08gKP
	 9gr/2lLLvdSP1GDtTLKySmBavbprNQNj1rnAcJw4nPbaxI7Rd0S++A6+oGrL+bZJE3
	 wRjdxVd3SheJRPYXMsUIYfTRjQ8ZW+5hjhOZG72KO8sw73dk0W4LhsxVZ1S58FbsBp
	 8zNIkWQplmvZw==
Date: Fri, 17 May 2024 21:00:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
Message-ID: <20240517-browsing-trespass-a46ef27fc115@spud>
References: <20240517150741.181303-1-kanakshilledar111@protonmail.com>
 <20240517-disfigure-disperser-1fa6b36729ec@spud>
 <CAGLn_=s4ghNODpVhPdk61Jt4XLteXp4W7oFS9WOb9O2-9BiXWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=s4ghNODpVhPdk61Jt4XLteXp4W7oFS9WOb9O2-9BiXWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_130025_217504_C481BB6D 
X-CRM114-Status: GOOD (  15.82  )
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
Content-Type: multipart/mixed; boundary="===============8106273345048172742=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8106273345048172742==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D4u/o0+VChCwFfPF"
Content-Disposition: inline


--D4u/o0+VChCwFfPF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 11:21:54PM +0530, Kanak Shilledar wrote:
> On Fri, May 17, 2024 at 9:34=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Fri, May 17, 2024 at 08:37:40PM +0530, Kanak Shilledar wrote:
> > > +properties:
> > > +  compatible:
> > > +    const: "riscv,cpu-intc"
> >
> > A new warning with dtbs_check from your patch:
> > /stuff/linux/build/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: =
interrupt-controller: compatible:0: 'riscv,cpu-intc' was expected
> >         from schema $id: http://devicetree.org/schemas/interrupt-contro=
ller/riscv,cpu-intc.yaml#
> > /stuff/linux/build/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: =
interrupt-controller: compatible: ['andestech,cpu-intc', 'riscv,cpu-intc'] =
is too long
> >         from schema $id: http://devicetree.org/schemas/interrupt-contro=
ller/riscv,cpu-intc.yaml#
> >
> > There's a duplicate description in riscv/cpus.yaml:
> >   interrupt-controller:
> >     type: object
> >     additionalProperties: false
> >     description: Describes the CPU's local interrupt controller
> >
> >     properties:
> >       '#interrupt-cells':
> >         const: 1
> >
> >       compatible:
> >         oneOf:
> >           - items:
> >               - const: andestech,cpu-intc
> >               - const: riscv,cpu-intc
> >           - const: riscv,cpu-intc
> >
> >       interrupt-controller: true
> >
> > I think the one in cpus.yaml should be converted to a ref and the
> > andestech compatible added here.
>=20
> I am working on the v2 patch, in which I didn't provide any ref to the
> cpus.yaml and just replaced my compatible section with the one above
> to resolve the issue with `/renesas/r9a07g043f01-smarc.dtb`. I tested
> with others and didn't get any warnings.

Please don't do that, we shouldn't have two different places that each
are defining compatibles etc for the hardware.

Thanks,
Conor.


--D4u/o0+VChCwFfPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZke3UQAKCRB4tDGHoIJi
0q6PAPwKVqnbhecYJjHe4HwYA3O0NAWGknlpQcOFDft4MhEAGgEAhNhFfkElcT02
xQCzM1ohYrPWjt9F8QeIP9AviRyqswU=
=03KH
-----END PGP SIGNATURE-----

--D4u/o0+VChCwFfPF--


--===============8106273345048172742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8106273345048172742==--

