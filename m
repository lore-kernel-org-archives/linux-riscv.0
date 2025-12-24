Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB24E776FC
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qw9PDt/MxK2ahjo2vLzGWgjuA9jK9zf6YwXMpkWg2x8=; b=cZlOn/khZeO46HLvKfAdU+YMWp
	NDNbCU/FxcRPHpDMHDhJTXVd0fb58uCjUM90krwZUvtpB3p/knM8KpKGgnZjEHvVwUE5vG8RqStaZ
	gts/Cf49zgeonbv4pmslwDBg5Ruh+/p0ZzO0B9DDUgaU4Qn6X6r5G6teACxhGcxDrUcWam1ElCPKh
	K9E8zWrEtx1WFtENhZR5MK/fgeiFOGDMN/dnPopZh0NatGnb7w1vmcPFKnfaW0h8M/XPAwGKhDe+g
	iMttShLxULWztXeu3c5x/If5CkrJcqHgHktkumVt7/kGyvsKuh6x6alguoNF14m3vNc266qdsA2Rg
	WbzgimFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYfI-0000000HVYF-1y3p;
	Wed, 24 Dec 2025 23:53:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYfG-0000000HVXl-2nYx
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 23:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A34544145;
	Wed, 24 Dec 2025 23:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B57C4CEF7;
	Wed, 24 Dec 2025 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766620389;
	bh=H0yqiO0IIh+bx2j+z5i/ox186xpZi3mE9KvZEbkJJuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlFxyKY2+80CMGNz7Jd+5h8dEgmn04kJoRtkVRXSZ0yXW9UwMn9P5hmADYMXlHmAi
	 ZochvG5h3JUryyw1cQahRqFJADt6oABUlPucQIPabU60fsYmwNiq4qiPpx8iuyNZst
	 cHZ2w9QDLn5+xMHcrh6azjhkah2GmrMK+MVjdPgsLltrpM928JQzFsWxKu5hNyO0Zu
	 QC+xyWPrhR/v9yoyBJ1Fuqe7u5UFtWq6QHflaAbGkB0Byy18UtNjYc1gKBHJofyUdU
	 CvLu40TmvlWHHQM8+JMZh6VXvSzdo+cLlNB+4h81VpZig5/3273Mmvl/FL0XXu5nLz
	 Cv3PAVooB/i7A==
Date: Wed, 24 Dec 2025 23:53:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
Message-ID: <20251224-charcoal-woozy-d2138984e37a@spud>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_155310_743863_3D7EA41B 
X-CRM114-Status: GOOD (  28.65  )
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
Content-Type: multipart/mixed; boundary="===============2339182209423740208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2339182209423740208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HifpPaV/N2udDB+0"
Content-Disposition: inline


--HifpPaV/N2udDB+0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 02:51:17PM +0800, Guodong Xu wrote:
> Hi, Conor
>=20
> On Tue, Dec 23, 2025 at 5:17=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Dec 22, 2025 at 09:04:17PM +0800, Guodong Xu wrote:
> > > Add description of the single-letter "B" extennsion for Bit Manipulat=
ion.
> > > B is mandatory for RVA23U64.
> > >
> > > The B extension is ratified in the 20240411 version of the unprivileg=
ed
> > > ISA specification. According to the ratified spec, "the B standard
> > > extension comprises instructions provided by the Zba, Zbb, and Zbs
> > > extensions.
> > >
> > > Hence add a schema check rule to enforce that B implies Zba, Zbb and =
Zbs.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > > v2: New patch.
> > > ---
> > >  .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++=
++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 565cb2cbb49b552959392810a9b731b43346a594..385e1deb23996d294e766=
2693f1257f910a6e129 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -109,6 +109,13 @@ properties:
> > >              The standard C extension for compressed instructions, as=
 ratified in
> > >              the 20191213 version of the unprivileged ISA specificati=
on.
> > >
> > > +        - const: b
> > > +          description:
> > > +            The standard B extension for bit manipulation instructio=
ns, as
> > > +            ratified in the 20240411 version of the unprivileged ISA
> > > +            specification. The B standard extension comprises instru=
ctions
> > > +            provided by the Zba, Zbb, and Zbs extensions.
> > > +
> > >          - const: v
> > >            description:
> > >              The standard V extension for vector operations, as ratif=
ied
> > > @@ -735,6 +742,18 @@ properties:
> > >          then:
> > >            contains:
> > >              const: f
> > > +      # b comprises the following extensions
> > > +      - if:
> > > +          contains:
> > > +            const: b
> >
> > What's the value in adding b, if it depends on having all 3 of the
> > components defined individually too? Currently all "superset" types of
> > extensions are permitted without their component parts also being defin=
ed,
> > this doesn't follow convention and therefore needs to be explained.
> >
> > You obviously need this construct because the kernel does not understand
> > "b", and even if you added support for interpreting "b" to the kernel
> > this is probably still needed to make sure the ABI is maintained for
> > anything importing a devicetree from the kernel.
>=20
> Yes, exactly. Unlike other single-letter extensions, "b" was ratified
> (Apr/2024) much later than its components zba/zbb/zbs (Jun/2021).
> Existing software and the kernel already expect these explicit component
> strings, so enforcing this dependency ensures cores declaring "b" will
> also be correctly understood by older software that only looks for
> zba/zbb/zbs.
>=20
> I will update the commit message in v3 to clearly explain this reasoning.

> Does it sound good to you?

Ye, sounds good.

--HifpPaV/N2udDB+0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUx83gAKCRB4tDGHoIJi
0ljjAP96xVKxRWfFsjBSIjF8h7xUeXl0VufSfLRn5F0vEPVYagD9FVwi2yti7kCT
/cmOcUpIv5O0e1rm6HZBmL6W+TJv+ws=
=eCFG
-----END PGP SIGNATURE-----

--HifpPaV/N2udDB+0--


--===============2339182209423740208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2339182209423740208==--

