Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD7BEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJUzjLanUiVw8NmHkJ5yPSko65m2m3PV5SoqpNdEt8w=; b=sFSke+9QSc2hFKNhRhs6mUjyOt
	qlTNEe794H80k4CBcGJriBfpWkihzrtGjSiz3JSztZydJiTn/a6DxF75omusw361jxGo5i4kSBuM/
	1erxFXxwdq7rZAy3qgm1ysRxT6mSs2NLAx0sgWF0xmesRP68f9TQKN42BkNP1dr9a8qBkD6vylzJt
	bc+ZHdZldVk1bHalI8OiO6X/iCxE5+WI5upMZYCJyH9BpiVSHde3E9nJ4bgYOuMfIxueUoVl4R7NL
	tBWFl8FlFAUpjb76ANU2NG1BQb1jYCUChED96SmKXpSZiXcPRakqX/j54O99p21hueFZeHSSZtsDz
	Ve+SDm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6ud-00D3wv-2A;
	Tue, 27 Jun 2023 11:31:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6uY-00D3vh-0k
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 11:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687865466; x=1719401466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QH8bCWg3AE+hEhb3xFWyuBXx3P9V8zIniV4gMZjSDGI=;
  b=zO7uqquPdpCpdEpGTWfYNeDZDXFUgkZBvUJg3Q5hukjdv22wAX9ePDB6
   G1TYmi9KsaD7GfymASGWzKWxRmGhHory1OzusZQ+swC7gt/bN5yixZqaV
   l5hddxw3yxjO+crZ5xmsEsOnlUV4IKnEZHDzHpCYzNP7257EKz6/j4zNx
   GxnDSq5PiP7lSdVIHWxmwtVolqLSSFaSQ9IYJVaAULZcrfQr2bGeEwOxj
   +IzQBMKgTHN0F/2EGfDSeHOzvT5GNDv391zDyNLho+47HYzRNUVnK+/hO
   /RBHPhMjx6BcyiBHXt/gVi2OtzWNz6wZqbLsIKE9ssnjrAeTt6ZWcVo5V
   A==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="asc'?scan'208";a="158783040"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2023 04:30:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 27 Jun 2023 04:30:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 27 Jun 2023 04:30:53 -0700
Date: Tue, 27 Jun 2023 12:30:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@atishpatra.org>
CC: Stefan O'Rear <sorear@fastmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Jones <ajones@ventanamicro.com>, Anup
 Patel <apatel@ventanamicro.com>, Jessica Clarke <jrtc27@jrtc27.com>, Rick
 Chen <rick@andestech.com>, Leo <ycliang@andestech.com>, Oleksii
	<oleksii.kurochko@gmail.com>, <linux-riscv@lists.infradead.org>,
	<qemu-riscv@nongnu.org>, <u-boot@lists.denx.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>
Subject: Re: [PATCH v3] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230627-harmonize-monastery-c6b40d2e5556@wendy>
References: <20230626-unmarked-atom-70b4d624a386@wendy>
 <a6449161-d800-4094-bf15-cde890ed17b5@app.fastmail.com>
 <CAOnJCULs47ZCai5EOQJPFrgV1-2xPjWAOB2CfUDStcigsR5Wew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCULs47ZCai5EOQJPFrgV1-2xPjWAOB2CfUDStcigsR5Wew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_043106_400806_2B0CAC90 
X-CRM114-Status: GOOD (  55.15  )
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
Content-Type: multipart/mixed; boundary="===============7977128949680028503=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7977128949680028503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kURSL2kHWkb9OT7S"
Content-Disposition: inline

--kURSL2kHWkb9OT7S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Atish, Stefan,

On Mon, Jun 26, 2023 at 11:35:10PM -0700, Atish Patra wrote:
> On Mon, Jun 26, 2023 at 5:40=E2=80=AFPM Stefan O'Rear <sorear@fastmail.co=
m> wrote:
> > On Mon, Jun 26, 2023, at 6:10 AM, Conor Dooley wrote:

> > > Off-list, some of the RVI folks have committed to shoring up the word=
ing
> > > in either the ISA specifications, the riscv-isa-manual or
> > > so that in the future, modifications to and additions or removals of
> > > features will require a new extension. Codifying that assertion
> > > somewhere would make it quite unlikely that compatibility would be
> > > broken, but we have the tools required to deal with it, if & when it
> > > crops up.
> > > It is in our collective interest, as consumers of extension meanings,=
 to
> > > define a scheme that enforces compatibility.
> > >
> > > The use of individual properties, rather than elements in a single
> >
> > no longer individual properties
> >
> > > string, will also permit validation that the properties have a meanin=
g,
> > > as well as potentially reject mutually exclusive combinations, or
> > > enforce dependencies between extensions. That would not have be possi=
ble
> >
> > Under what circumstances is a device tree which declares support for a
> > superset extension (e.g. m) required to also declare support for its su=
bsets
> > (e.g. zmmul)?  There are compatibility issues in both directions.
> >
> > Proposal: If an extension X is a superset of an extension Y and X is pr=
esent
> > in riscv,isa-extensions, Y must also be present if Y was ratified or ad=
ded
> > to the schema before X, but need not also be present if Y was ratified =
after
> > or at the same time as X.  If X "depends on" Y, then Y must be present =
in
> > riscv,isa-extensions even if X and Y were ratified at the same time.

Yes, I think that this all makes sense from a compatibility point of
view. Splitting it up:

> > If an extension X is a superset of an extension Y and X is present
> > in riscv,isa-extensions, Y must also be present if Y was ratified or ad=
ded
> > to the schema before X

This makes total sense from a "being nice to" software point of view.

> > but need not also be present if Y was ratified after
> > or at the same time as X.

It may make sense to reduce this to only after, or not permit the
supersets at all where they are ratified alongside their subsets.
Cross that bridge when we come to it perhaps.

> > If X "depends on" Y, then Y must be present in
> > riscv,isa-extensions even if X and Y were ratified at the same tim

For Linux, this is already the case for F & D. I think that's a good
policy to follow.

> > >
> > > vendor extensions
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > Compared to riscv,isa, this proposed scheme promotes vendor extension=
s,
> > > oft touted as the strength of RISC-V, to first-class citizens.
> > > At present, extensions are defined as meaning what the RISC-V ISA
> > > specifications say they do. There is no realistic way of using that
> > > interface to provide cross-platform definitions for what vendor
> > > extensions mean. Vendor extensions may also have even less consistency
> > > than RVI do in terms of versioning, or no care about backwards
> > > compatibility.
> > > The new property allows us to assign explicit meanings on a per vendor
> > > extension basis, backed up by a description of their meanings.
> >
> > How are vendor extension names allocated?  Will any proposed name for a
> > vendor extension pass through linux-riscv@ before it shows up in the wi=
ld,
> > or are vendors expected to allocate extension names unilaterally?

The same way any other dt-binding works, it's no different in that
respect to compatible strings.

> > Is it
> > worth creating an experimental-* namespace for prototype implementations
> > of unreleased extensions?

IMO, people are free to do whatever they like in their own development
trees. I don't really know why we'd introduce stuff in dt-bindings for
things that are only in an experimental state.

> > > +  riscv,isa-extensions:
> > > +    $ref: /schemas/types.yaml#/definitions/string-array
> > > +    minItems: 1
> > > +    description: Extensions supported by the hart.
> > > +    items:
> > > +      anyOf:
> > > +        # single letter extensions, in canonical order
> > > +        - const: i
> > > +          description: |
> > > +            The base integer instruction set, as ratified in the
> > > 20191213
> > > +            version of the unprivileged ISA specification, with the
> > > exception of
> > > +            counter access.
> > > +            Counter access was removed after the ratification of the
> > > 20191213
> > > +            version of the unprivileged specification and shunted in=
to
> > > the
> > > +            Zicntr and Zihpm extensions.
> >
> > I think this may belong in the description of zicsr?  rdcycle in 201912=
13
> > is a special case of csrrs, which is in zicsr not the base.

Sorry, this is a bit unclear. Do you mean that the sentence you have
provided here should be in the Zicsr entry?

> > > +        - const: m
> > > +          description:
> > > +            The standard M extension for integer multiplication and
> > > division, as
> > > +            ratified in the 20191213 version of the unprivileged ISA
> > > +            specification.
> > > +
> > > +        - const: a
> > > +          description:
> > > +            The standard A extension for atomic instructions, as
> > > ratified in the
> > > +            20191213 version of the unprivileged ISA specification.
> > > +
> > > +        - const: f
> > > +          description:
> > > +            The standard F extension for single-precision floating
> > > point, as
> > > +            ratified in the 20191213 version of the unprivileged ISA
> > > +            specification.
> >
> > Do we want to be able to describe the K210 in the new schema?  I believe
> > that it implements the 2.0 F and D extensions, which are neither forward
> > nor backward compatible with the ratified ones.

If it is not compatible, then it should not claim to be :)
We currently report the thing as implementing the same F extension as
anything else that claims to support F, but I don't think we should be
adding a new strictly defined property if it does not apply. Kinda
defeats the purpose I think. I'm not sure whether it should get a new
property, or continue (mis)using riscv,isa, in that case.

> > #include <stdio.h>
> > int main() {
> >     long a,b;
> >     asm("fsub.s fa0,fa0,fa0\n"
> >         "fdiv.s fa0,fa0,fa0\n"
> >         "fmv.x.d %0,fa0\n"
> >         "fcvt.s.w fa1,x0\n"
> >         "fmax.s fa1,fa1,fa0\n"
> >         "fmv.x.d %1,fa1\n" : "=3Dr" (a), "=3Dr" (b));
> >     printf("box(nan) =3D %lx\nmax(0,nan) =3D %lx\n", a, b);
> >     return 0;
> > }

As an aside, if you are building software for a k210, you probably know
pretty damn well what your target system is, given the constraints of
the platform!

> > > +        - const: h
> > > +          description:
> > > +            The standard H extension for hypervisors as ratified in
> > > the 20191213
> > > +            version of the privileged ISA specification.
> > > +
> > > +        # multi-letter extensions, sorted alphanumerically
>=20
> The multi-letter extensions name should match(ignoring case) the name
> of the frozen/ratified or
> vendor specific extension name. Correct ?

Iff it is the first time of appearance, yes.

> > There are quite a few extension names defined in ratified specifications
> > that aren't in that list yet.  Would there be interest in adding them or
> > are we waiting for specific conditions to be met?

I only added what was already in use, adding new stuff can be done
subsequently.

> > In particular several subsystems depend on "ziccif" from the profiles
> > spec but we haven't previously had a way to check or document that
> > dependency.

Cheers,
Conor.


--kURSL2kHWkb9OT7S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJrIUQAKCRB4tDGHoIJi
0lBbAP9jXwlv1nE24nhP671Dp1q3gBe8nJMes2/JaeL9fMfJAQEA2xRKTGT94tyg
aW8dQFmO2POpJoKK3PwGFpGEdNajoAc=
=BB4b
-----END PGP SIGNATURE-----

--kURSL2kHWkb9OT7S--


--===============7977128949680028503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7977128949680028503==--

