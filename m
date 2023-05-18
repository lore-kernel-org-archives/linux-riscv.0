Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D38C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga6xSZIFWq73c/NOVcLUwrhoCdvFA5TRk8s0RlSjb9I=; b=ODQAobg37RCiamwNgRZt041Hca
	dCRiFBiiJLfziojGFnl7h0ve063ABp83+o9+NZgbaZbD6Gq2cCJeQhyTEdP0A1a01T4mUjKY+HK7A
	i/LdoWbp5zltHly7n+OX4NlauD51SmJ0dD6XEujoAsx4Q6m+GKzSkAvgGsn9B78BdwgfLaXscQ/oh
	TIJeOe3DE1wbuaHGpfawUjgfgH+TPRcQFKyEMsSTIhEyjXgwTuuerEIxaLoI4SzHmZ5WIXmeBTHuv
	dSxmX1NG9qHPLWotfVkN6hsSdvBU8zDrDVO7MR49Qd+0J9KmbbWXq5yT60g652mTNOmWgiuqn3/ci
	KKhb6hQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeHU-00D9Se-2a;
	Thu, 18 May 2023 14:07:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzeHQ-00D9QU-2J
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 14:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684418816; x=1715954816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Ql81PbdPYsst1Egf8I5nhPuh1Xe/UW0zjJnF/GxGws=;
  b=G/A1PhJfkc/XSh8vn/bgDClDbL6l0jK5a3iIsUhJAiFsnxeM9MiikMnl
   B1dDatcj9DqgJIEGbpRLU3sq2yjHFbMd/uVZvIZY2xqyapiA2wp92pgTK
   9dTzf/QKFcEqYVaJ+dfBMG1ORiEe2glYEBZ8g33Kyl1KpaCJS8evxiDVV
   RjmF0a7t4dwA5veAg40d7Hpmv2sF5OwCd+bEgKGn7gphUyN8lX3gylgkl
   D32XsOC2ys+51WIA/T9EbyrIUe3eXSqvMUPdvUrAg5r/2tcHezAhv5X+t
   Nmfp5rsNjJrAwCb0ymelRA/SOgBziQD7fj2ME0JB8iTXb6HzgfeJm2few
   A==;
X-IronPort-AV: E=Sophos;i="5.99,285,1677567600"; 
   d="asc'?scan'208";a="216119339"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2023 07:06:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 07:06:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 07:06:38 -0700
Date: Thu, 18 May 2023 15:06:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <anup@brainfault.org>
CC: Andrew Jones <ajones@ventanamicro.com>, <palmer@dabbelt.com>,
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
	<alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
	<atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
	<rick@andestech.com>, Leo <ycliang@andestech.com>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
	<u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_070656_953316_B66742F8 
X-CRM114-Status: GOOD (  37.13  )
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
Content-Type: multipart/mixed; boundary="===============4930499196025490552=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4930499196025490552==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="inIwqqp4mBpjB1FE"
Content-Disposition: inline

--inIwqqp4mBpjB1FE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 07:13:15PM +0530, Anup Patel wrote:
> On Thu, May 18, 2023 at 4:02=E2=80=AFPM Andrew Jones <ajones@ventanamicro=
=2Ecom> wrote:
> > On Thu, May 18, 2023 at 09:58:30AM +0100, Conor Dooley wrote:

> > > -  riscv,isa:
> > > -    description:
> > > -      Identifies the specific RISC-V instruction set architecture
> > > -      supported by the hart.  These are documented in the RISC-V
> > > -      User-Level ISA document, available from
> > > -      https://riscv.org/specifications/
> > > -
> > > -      Due to revisions of the ISA specification, some deviations
> > > -      have arisen over time.
> > > -      Notably, riscv,isa was defined prior to the creation of the
> > > -      Zicsr and Zifencei extensions and thus "i" implies
> > > -      "zicsr_zifencei".
> > > -
> > > -      While the isa strings in ISA specification are case
> > > -      insensitive, letters in the riscv,isa string must be all
> > > -      lowercase to simplify parsing.
> > > -    $ref: "/schemas/types.yaml#/definitions/string"
> > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)=
?(?:_[hsxz](?:[a-z])+)*$
> > > -
> > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it he=
re
> > >    timebase-frequency: false
> > >
> > > @@ -133,8 +117,13 @@ properties:
> > >        DMIPS/MHz, relative to highest capacity-dmips-mhz
> > >        in the system.
> > >
> > > +oneOf:
> > > +  - required:
> > > +      - riscv,isa
> >
> > This is the part Anup keeps reminding me about. We can create better wa=
ys
> > to handle extensions in DT and ACPI, but we'll still need to parse ISA
> > strings to handle legacy DTs and holdouts that keep creating ISA string=
s,
> > at least during the deprecation period, since ISA strings are still "the
> > way to do it" according to the spec.
>=20
> Coming up with an alternate way in DT is fine but we can't deprecate
> ISA strings since ISA strings are widely used:
> 1) Various bootloaders

Aye, for the reason, as I mentioned earlier and in the RFC thread,
removing existing parsers isn't a good idea.

> 2) It is part of /proc/cpuinfo

That is irrelevant.

> 3) Hypervisors use it to communicate HW features to Guest/VM.
> Hypervisors can't get away from generating ISA strings because
> Hypervisors don't know what is running inside Guest/VM.

Generate both :) As things stand, your guests could interpret what you
communicate to them via riscv,isa differently!

> In the case of ACPI, it is a very different situation. Like Sunil mention=
ed,
> ACPI will always follow mechanisms defined by RVI (such as ISA string).
> Other ACPI approaches such as GUID for ISA extension are simply not
> scalable and will take a lot more memory for ACPI tables compared to
> ISA strings.

My proposal should actually suit ACPI, at least for Linux, as it would
be a chance to align currently misaligned definitions. I won't speak to
GUIDs or whatever as that's someone else's problem :)

> > Also, if we assume the wording in the spec does get shored up, then,
> > unless I'm missing something, the list of advantages for this boolean
> > proposal from your commit message would be
>=20
> IMO, we should try our best to have the wordings changed in RVI spec.

Yes, doing so is beneficial for all of us regardless of what happens
here. I do think that it is partially orthogonal - it allows us to not
design an interface that needs to be capable of communicating a wide
variety of versions, but I don't think it solves some of the issues
that riscv,isa has. If I thought it did, I would not have gone to the
trouble of respinning this patch out of the other approach.

> > * More character choices for name -- probably not a huge gain for ratif=
ied
> >   extensions, since the boolean properties will likely still use the sa=
me
> >   name as the ISA string (riscv,isa-extension-<name>). But, for vendor
> >   extensions, this is indeed a major improvement, since vendor extension
> >   boolean property names may need to be extended in unambiguous ways to
> >   handle changes in the extension.
> >
> > * Simpler, more complete DT validation (but we still need a best effort
> >   for legacy ISA strings)
> >
> > * Simpler DT parsing (but we still need the current parser for legacy I=
SA
> >   strings)
> >
> > > +  - required:
> > > +      - riscv,isa-base
> > > +
> > >  required:
> > > -  - riscv,isa
> > >    - interrupt-controller
> > >
> > >  additionalProperties: true
> > > @@ -177,7 +166,13 @@ examples:
> > >                  i-tlb-size =3D <32>;
> > >                  mmu-type =3D "riscv,sv39";
> > >                  reg =3D <1>;
> > > -                riscv,isa =3D "rv64imafdc";
> > > +                riscv,isa-base =3D "rv64i";
> > > +                riscv,isa-extension-i;
> > > +                riscv,isa-extension-m;
> > > +                riscv,isa-extension-a;
> > > +                riscv,isa-extension-f;
> > > +                riscv,isa-extension-d;
> > > +                riscv,isa-extension-c;
>=20
> One downside of this new approach is it will increase the size of DTB.
> Imaging 50 such DT properties in 46 CPU DT nodes.

I should do a comparison between 50 extensions in riscv,isa and doing
this 50 times and see what the sizes are.

--inIwqqp4mBpjB1FE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGYw2QAKCRB4tDGHoIJi
0hSeAP9jzSAva+PzLu6ehqVimB0Aoyoav0gV6v8bchdyV0ETdgEA0jVTNEscUYpu
ogN+UZoE7KVethG+zRAi1/oDPc87rgo=
=HFE9
-----END PGP SIGNATURE-----

--inIwqqp4mBpjB1FE--


--===============4930499196025490552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4930499196025490552==--

