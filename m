Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030F8C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm5GmTHfkx+d1p2gZHCoOU8FIGf3cuvmny0avN7nEOc=; b=rCvULOeYffYxectoNfjxLguJ2/
	Ga9UA7zIVWCKslpv9Y+byYydv8VYA5b2OS3UrC6vg3/d/WaTQGrX+pBUprC9g6yUgIlCOfnpydzAA
	Bf35nWr0CNBEwlEBrrdFW00smfnLYWxxhL+FwImGUVWraaZQwPyDKgZzuIdKv+Quy8XmgdaDW2VqT
	YwEBtR3jNkIRwYhBNStmZcWhHufpzvznirko9em67EAjZlnyfY32eLJXhrtJwqH5CLrJWpfMO85xJ
	kGixawVh63VrYTu3WsVrTbKOSFqCiUEkWfbrD53EjJZkhxrTdalfnVr+ec0KFT+U9ZI7PzP6IGBRT
	+QJDXzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMm6z-00DTp2-2K;
	Fri, 21 Jul 2023 09:07:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMm6x-00DTo2-1C;
	Fri, 21 Jul 2023 09:07:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D18036122A;
	Fri, 21 Jul 2023 09:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387BBC433C7;
	Fri, 21 Jul 2023 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689930462;
	bh=0WXTjQhperGuLB19vr42OwwFDkDbfX6VvgL8YP420rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8gGHIwrRRzG3dlbX1JkKVv2nuWrCi0rtg//vuh/L2PtygygQsTMrX9plnpzeBjmb
	 VxtVvnQmyfWfDEMHsJCROGo3hYZNZa+IR6LR5dgjmNqpPOc+kZUhZkldcNCGJmangF
	 xd5Tr9bvWdjyNJFm58zo6WgHSFpXjnijh9BNqmPd+zBAatlWAOY2rU0drmOR66HfM1
	 lXRoB0F/0k4NeHaozJoJ3qbOAJYUeAh9uEw3PQ8hnQ6pKyqzmatb/Enand/UpZ9L2e
	 peNFsmr+ZdydwBY7pVjQuysC5XZaGAXcXFtLq3IHjkJqz2K6GzNFGtenprssV6P1/0
	 3HTIhfcFLHiIw==
Date: Fri, 21 Jul 2023 10:07:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] RISC-V: Detect Smstateen extension
Message-ID: <20230721-gravy-sturdy-1555d952cfb9@spud>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-2-mchitale@ventanamicro.com>
 <20230721-72554b5197954b80af35a7bb@orel>
MIME-Version: 1.0
In-Reply-To: <20230721-72554b5197954b80af35a7bb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_020743_490325_FAFBA29A 
X-CRM114-Status: GOOD (  20.19  )
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
Content-Type: multipart/mixed; boundary="===============8088344222085858590=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8088344222085858590==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="upmwHZ1n6Pv5m0+W"
Content-Disposition: inline


--upmwHZ1n6Pv5m0+W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Jul 21, 2023 at 10:49:54AM +0200, Andrew Jones wrote:
> On Fri, Jul 21, 2023 at 01:24:34PM +0530, Mayuresh Chitale wrote:
> > Extend the ISA string parsing to detect the Smstateen extension
> >=20
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >  arch/riscv/include/asm/hwcap.h                          | 1 +
> >  arch/riscv/kernel/cpu.c                                 | 1 +
> >  arch/riscv/kernel/cpufeature.c                          | 1 +
> >  4 files changed, 9 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index cc1f546fdbdc..1e6d0e182be1 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -128,6 +128,12 @@ properties:
> >              changes to interrupts as frozen at commit ccbddab ("Merge =
pull
> >              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
> > =20
> > +        - const: smstateen
> > +          description: |
> > +            The standard Smstateen extension for controlling accesss t=
o CSRs
>                                                                 ^ access
>=20
> > +            added by other Risc-V extensions in H/S/VS/U/VU modes and =
as

s/Risc-V/RISC-V/. Let's not invent new stylisations please.

> s/and//
>=20
> > +            ratified at commit a28bfae (Ratified (#7)).

An "of riscv-state-enable" at the end might be helpful too.

Either way, neither checkpatch nor get_maintainer were run on this v2
patch, the former would have pointed out that dt-binding changes should
be made in their own patches.

The C stuff is fine, but this needs to be split in two.

Thanks,
Conor.

--upmwHZ1n6Pv5m0+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLpK2QAKCRB4tDGHoIJi
0r/ZAP9+AidLcEY9v+0HcgX/DxuwXIC0LtohR0EA40GwQfRJzgEAm7r4aHVvkimG
tUJB9R3NHuNH955b9khYkebA7+4wagc=
=VuaK
-----END PGP SIGNATURE-----

--upmwHZ1n6Pv5m0+W--


--===============8088344222085858590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8088344222085858590==--

