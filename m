Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88325C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7bjOFoV05idoZrBJkd68IuGKcjYPGs7W3xSEuABc0Q=; b=ku4/UGDC6kyxbJT65CEuxC/pnV
	UjpOWoTfLmW0HGAtuKIkXm/etEZXI2SpxzLnt7uvDxOzrSqNQ6xFrsEf5lCEGeAURlAJgrp9yXQg8
	VS2p8QHgiGygwN+brI0C+JqkGM+3MtqYxQL3eWErP6QnSSnVdWDtlXrSQQHQY6vte29xJsnThZsQG
	2WQNjBBmJpKlliqItviEjSGI0VRdxZXPi/pm4gbzEZC2RZNEi2/wZysmthmXlFgOlwiFPrlvvsMEE
	R6LiZAJUFI0Fx6Jtspw66XmVYy8NJ3LdvscMx4PgVEPgKRWDRH7ArmhRdw/J+gmzCQ+PehNr1hQUe
	v15dN9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwLr-00Haqr-2v;
	Mon, 08 May 2023 08:36:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwLo-00HapE-0u
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 08:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683534968; x=1715070968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q5ODJunHXC2mcC++rxUZpJJ+DUhK13R4N+xZYOfCDPU=;
  b=nHt+NicCdX0Tkuz9jDi1d36nxXG6lD9IXXcy6kQCKdA+z3B5vLX+b7YL
   +U3YNnzssI71eyfgtCZJxpg94/5rgJhkcRHnCZQuyTmE19kMr9JiXc4Ej
   ordEqfkjxEQ+7sYLx/J0cDdWBHh5rgFvLFfO9uehxTgv/a7oNKCgCPTmh
   v+pH5LUZ+ViqUL7Jz4al93mfBxFp006WhavHofOsmcKWIFxyQTdRMWQmx
   Gk+MiSU3IHzl5BNPX+vnutDRxyRi8Xb/u874oYgGonahRnwmXgAx6MtRP
   XslTJWwhxKGb0F1yz8WfD7aw6Y64b9zY372sk3ug5erU5/Hn8abZwssQ0
   A==;
X-IronPort-AV: E=Sophos;i="5.99,258,1677567600"; 
   d="asc'?scan'208";a="210122642"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 01:36:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 01:36:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 8 May 2023 01:35:58 -0700
Date: Mon, 8 May 2023 09:35:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Message-ID: <20230508-refute-reliable-f50dafa6afbd@wendy>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud>
 <394696a52bf1d767044e3f990cebfbaf69dabe70.camel@icenowy.me>
 <7518428.EvYhyI6sBW@diego>
MIME-Version: 1.0
In-Reply-To: <7518428.EvYhyI6sBW@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_013608_385386_FD66EA43 
X-CRM114-Status: GOOD (  22.20  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1796994640469313567=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1796994640469313567==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bEoJ+zKkEnHhY3/3"
Content-Disposition: inline

--bEoJ+zKkEnHhY3/3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 10:23:02AM +0200, Heiko St=C3=BCbner wrote:
> Am Montag, 8. Mai 2023, 05:32:17 CEST schrieb Icenowy Zheng:
> > =E5=9C=A8 2023-05-07=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 22:35 +0100=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > Hey Jisheng,
> > >=20
> > > On Mon, May 08, 2023 at 02:23:02AM +0800, Jisheng Zhang wrote:
> > >=20
> > > > +               c910_0: cpu@0 {
> > > > +                       compatible =3D "thead,c910", "riscv";
> > > > +                       device_type =3D "cpu";
> > > > +                       riscv,isa =3D "rv64imafdc";
> > >=20
> > > Does this support more than "rv64imafdc"?
> > > I assume there's some _xtheadfoo extensions that it does support,
> > > although I am not sure how we are proceeding with those - Heiko might
> > > have a more nuanced take.
>=20
> I guess the interesting question still is, are these part of the isa
> string or more of an errata?

Yeah, I dunno. That's possible a policy decision more than anything
else. I don't remember if it was one of your patchsets or elsewhere, but
I do recall a split between xtheadba etc and vector, where xtheadba was
defined as a vendor extension, whereas vector is not. Their extension
spec repo <https://github.com/T-head-Semi/thead-extension-spec> appears
to be aligned with that view, apart from the CMOs that we have already
called an erratum.

> The binding currently says
>       Identifies the specific RISC-V instruction set architecture
>       supported by the hart.  These are documented in the RISC-V
>       User-Level ISA document, available from
>       https://riscv.org/specifications/
>=20
>=20
> I guess if we decide to make them part of the isa-string the binding
> then should get a paragraph mention _xfoo vendor-extensions too.

I have an idea in the works that may allow dealing with this kind of
thing, but it's a bit of a departure from the existing binding.
I will hopefully post an early RFC of it later today.
That said, the binding does currently allow you to put in _xfoo vendor
extensions as-is.

> Personally, making these part of the ISA string definitly sounds like
> the best solution though :-) .

You would say that wouldn't you! In general, I'd rather we filled in as
much information as possible here, even if it is not currently in use,
to avoid having to retrofit as support becomes available.

--bEoJ+zKkEnHhY3/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFi0WgAKCRB4tDGHoIJi
0mLjAPwIbkf8ND8bETn28FqkNQUw7WZE4pCwsbtCxP4g9Fa/zAEAx7QdvUgGgoki
L2lbouRlgh/MWTdnd6MR7meT9HAKNgY=
=n0NK
-----END PGP SIGNATURE-----

--bEoJ+zKkEnHhY3/3--


--===============1796994640469313567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1796994640469313567==--

