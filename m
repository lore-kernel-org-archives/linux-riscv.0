Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0872C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSMqUU7uWwNJbKr32iCe/WqO98rMy743CabOsgnCXQA=; b=RJelnJVBWt5AEVRdossF9IsE5J
	ljVor/sQFbcgcvOyQj3Ho3MLyXdkhiNQQ9xezOBJxOXkiRtRUBlE1CbggcO3nxr8snMzV5bXgk27k
	qOjIdT65IzelEsQf0aw7pDZdZEdvEEkRArsVJPQO8Rq6CrkJJyCPhDTy0M1H0Xu9V9/8WlH3YG8A4
	XJNtHie1uycMGad0hyWMhHI2DkM7qee085WunK3yfgBmfn6ylEeHp/ZMeZtM9uxh/jgsOJXP2wuN6
	IsJNURrZFOHXmODEn70NbRD71KybxFAlE26jAGrjwPCGe9LHPgeBRBT/3itkczhdEDkGhqaTmwLxV
	agBTWOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxq25-000000068Cn-1HS9;
	Fri, 19 Apr 2024 15:20:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxq21-000000068Ai-1M2p;
	Fri, 19 Apr 2024 15:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89FF861A01;
	Fri, 19 Apr 2024 15:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA52C072AA;
	Fri, 19 Apr 2024 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713540004;
	bh=1kdVwLElLzaz4bsya0m7/1uwWWLKQl/YNOx2FfJccZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuCJAwBs7zsxV7HOlNyyJE2gYqiSHuzut5N4zinlRoXaOWNRnq/ZNIWEzh2g+T0sU
	 qb/YHjNlXxBjPXg8YLnQIOjd87FkaRFFfV7QfX3ZSMf77kEpRQ/F3Se4NPBy1vA0J1
	 oomoo7Dy/VkwvioCpVGnG6Q7tMDQME2EvvaPOrlXuUCnmQ9Cb0vjsOzb+mDUdRf7BE
	 kspjtkGdRmK1zL4oSEb4bZTq9bEqjJDdiqRCM4VU1rjL2R5Wt6arALIyQnhlhNAswH
	 ghWc243H+6MQAEigo/XdmdA98XIzLoNsYgxMgBoVx5GJU7LESB4lLqaRuGIfcLClep
	 DfItc8b9Hv6KQ==
Date: Fri, 19 Apr 2024 16:19:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240419-disdain-litmus-82874cc4872e@spud>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
MIME-Version: 1.0
In-Reply-To: <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_082005_511589_8B0DD960 
X-CRM114-Status: GOOD (  34.65  )
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
Content-Type: multipart/mixed; boundary="===============1683142384328185302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1683142384328185302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Hvn84EQb/nPMg28"
Content-Disposition: inline


--/Hvn84EQb/nPMg28
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 05:16:05PM +0200, Andrew Jones wrote:
> On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> > On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > >=20
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++=
++
> > >  1 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 468c646247aa..584da2f539e5 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -177,6 +177,18 @@ properties:
> > >              is supported as ratified at commit 5059e0ca641c ("update=
 to
> > >              ratified") of the riscv-zacas.
> > > =20
> > > +        - const: zawrs
> > > +          description: |
> > > +            The Zawrs extension for entering a low-power state or fo=
r trapping
> > > +            to a hypervisor while waiting on a store to a memory loc=
ation, as
> > > +            ratified in commit 98918c844281 ("Merge pull request #12=
17 from
> > > +            riscv/zawrs") of riscv-isa-manual.
> >=20
> > This part is fine...
> >=20
> >=20
> > > Linux assumes that WRS.NTO will
> > > +            either always eventually terminate the stall due to the =
reservation
> > > +            set becoming invalid, implementation-specific other reas=
ons, or
> > > +            because a higher privilege level has configured it to ca=
use an
> > > +            illegal instruction exception after an implementation-sp=
ecific
> > > +            bounded time limit.
> >=20
> > ...but I don't like this bit. The binding should just describe what the
> > property means for the hardware, not discuss specifics about a
> > particular OS.
> >=20
> > And with my dt-bindings hat off and my kernel hat on, I think that if we
> > want to have more specific requirements than the extension provides we
> > either need to a) document that zawrs means that it will always
> > terminate or b) additionally document a "zawrs-always-terminates" that
> > has that meaning and look for it to enable the behaviour.
>=20
> IIUC, the text above mostly just needs to remove 'Linux assumes' in order
> to provide what we want for (a)? I'm not sure about (b). If Zawrs is
> unusable as is, then we should probably just go back to the specs and get
> a new standard extension name for a new version which includes the changes
> we need.

An (official) new name for the behaviour that you actually want, especially
if the patchset sent the other day does not have the more stringent
requirement (I won't even pretend to understand Zawrs well enough to know
whether it does or not), sounds like the ideal outcome. That way you're
also sorted on the ACPI side.

--/Hvn84EQb/nPMg28
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKLmAAKCRB4tDGHoIJi
0g5bAP4gpBeGLR39p3Uv89m8zJpGf129yNgJOYfGxi/SIvRKAAEAtESaPNdVR57/
QIqWIobvFuJf/rR+CDw4zDeDOE0Abwc=
=dR2/
-----END PGP SIGNATURE-----

--/Hvn84EQb/nPMg28--


--===============1683142384328185302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1683142384328185302==--

