Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8BD606A332
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbGd5YPy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQZXYBNC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k7pSwOsvOcpLUvYI0z1IwaFG193c2RmBfNGTyXdWofE=; b=ZbGd5YPyUX9Tde/hA2oIuI1/sC
	/5LZMiucddx2ZFuS/20rbg3QoG+tpZBYZfsyWjsTQ89eQT5S6DSScgZrom+8SeD9xokQNKiOGfJrq
	pUMVU3FpvverHr90yU+XAdqYTT7rFKdx7cJNgy/fHMk4TlXFOeYDLvijLoZ7T3N8mw9tlPD1+s5Eo
	iHVHVpyI6P7XCAqi+a3xLy/dVV7LABaCiXzIzdT9HTeQt4z4blTuB5ORaX+Rot2pqHjj1ptY+oTw9
	vhje2X6omJD7S0lc/whw0OFww/3Xr2PcQYRzHNvpRH5SjkX7BI/kYofiyg2CnSSdyXf9bVSYTyuda
	UknP9uHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT10d-00000003TiA-0bRE;
	Mon, 16 Nov 2026 18:00:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT10b-00000003Ths-3mtF
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 18:00:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D8340533;
	Mon, 16 Nov 2026 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37751F000CC;
	Mon, 16 Nov 2026 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852049;
	bh=/zjGa4vftK22+4ZgrHy8l4SQJaqBEhraQH3lTrIqopY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQZXYBNCgDxZbME4v+OnHbx25Z8RhlKG494y+pte8zX6Dm1SiTZEfzITRRljf0Ovo
	 3j3vqbw9ZhWSbSKQMg+2jTc0h94/5qeeXAq8B0Du4RqASjJoleorgylrO0YSRnXlQ1
	 aO61v804YcbLMM7uAQ1xDBdxJ2jTNxY0n1WAMNdHPfBy6Xd1O/Of2iaJ6p8LOiq3JG
	 0uUMDxsRVwjqkHgOS0XiQDUx1PoofEnD4gfSz+YobhcFLLqA7EsDNQhhdDbA0fs7lx
	 R5gA3LcnJRjO13+KidknV6u1qbgZTNrW4hAopnoPh/mKHuAJ53GS1cr5ZV0ZMVMcQj
	 lhqHXIRIU50Kg==
Date: Mon, 16 Nov 2026 18:00:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mina Hui-Min Chou <minachou@andestech.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema
 for generic LLC support
Message-ID: <20261116-deduct-emphasize-b2482186cfcb@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-13-minachou@andestech.com>
 <20261113-emporium-provolone-0e7b0e39c97a@spud>
 <20261116-crazy-adventurous-cockatrice-61c62b@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116-crazy-adventurous-cockatrice-61c62b@quoll>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4491033612493169886=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4491033612493169886==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZgC/w/fRk9AwVDqJ"
Content-Disposition: inline

--ZgC/w/fRk9AwVDqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 01:05:52PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 02:05:29PM +0000, Conor Dooley wrote:
> > On Fri, Nov 13, 2026 at 03:11:36PM +0800, Mina Hui-Min Chou wrote:
> > > The last level cache controller of Andes cores is not specific to
> > > AX45MP. Other Andes cores, such as the A27L2, use the same controller
> > > with the same register interface, but the binding only accepts
> > > andestech,ax45mp-cache. Add andestech,llcache for them, and describe
> > > the binding as an Andes last level cache rather than an AX45MP L2
> > > cache.
> > >=20
> > > The cache-level, cache-sets and cache-size constraints describe the
> > > AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
> > > of other Andes cores can be level 3 and have other geometries, so
> > > allow cache-level 3 and require cache-sets only for AX45MP. Match
> > > renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
> > > branch, which would otherwise also apply to andestech,llcache.
> > >=20
> > > Also add an example for andestech,llcache, and add myself as a
> > > maintainer of the binding.
> > >=20
> > > Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> > > ---
> > >  .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++---=
--
> > >  1 file changed, 54 insertions(+), 17 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp=
-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> > > index b135ffa4ab6b..da9688cc95f7 100644
> > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.=
yaml
> > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.=
yaml
> > > @@ -5,14 +5,15 @@
> > >  $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > =20
> > > -title: Andestech AX45MP L2 Cache Controller
> > > +title: Andestech Last Level Cache Controller
> > > =20
> > >  maintainers:
> > >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +  - Mina Hui-Min Chou <minachou@andestech.com>
> > > =20
> > >  description:
> > > -  A level-2 cache (L2C) is used to improve the system performance by=
 providing
> > > -  a large amount of cache line entries and reasonable access delays.=
 The L2C
> > > +  A last level cache (LLC) is used to improve the system performance=
 by providing
> > > +  a large amount of cache line entries and reasonable access delays.=
 The LLC
> > >    is shared between cores, and a non-inclusive non-exclusive policy =
is used.
> > > =20
> > >  select:
> > > @@ -21,18 +22,23 @@ select:
> > >        contains:
> > >          enum:
> > >            - andestech,ax45mp-cache
> > > +          - andestech,llcache
> > > =20
> > >    required:
> > >      - compatible
> > > =20
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - andestech,qilai-ax45mp-cache
> > > -          - renesas,r9a07g043f-ax45mp-cache
> > > -      - const: andestech,ax45mp-cache
> > > -      - const: cache
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - andestech,qilai-ax45mp-cache
> > > +              - renesas,r9a07g043f-ax45mp-cache
> > > +          - const: andestech,ax45mp-cache
> > > +          - const: cache
>=20
> Illogical split of patches. If this was to stay, then THIS commit is the
> reason to rename so rename would happen here, not in some time in the
> future. Same for everything you do.
>=20
> Organize your patches correctly, not doing things half-baked... but
> anyway do not rename files just because you added one compatible.
>=20
>=20
> > > +      - items:
> > > +          - const: andestech,llcache
> > > +          - const: cache
> >=20
> > Device specific compatibles are mandatory. I would accept this patch
> > with a
> >           - not: {}
> >             description: Need a SoC specific compatible
> > like the safexcel eip binding.
>=20
> But why all others cannot use ax45mp as fallback? Is this really a
> generic block among multiple generations of SoCs?

I think it's fairly likely that it is.
I do like having constraints that restrict cache-sets etc to what the
device can actually do, but using ax45mp as a fallback doesn't prevent
that, since the constraints are really set by the soc.
>=20
> What sort of arguments from contributors are to support that?
>=20
>=20
> >=20
> > pw-bot: changes-requested
> >=20
> > Thanks,
> > Conor.
> >=20
> >=20
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -44,13 +50,11 @@ properties:
> > >      const: 64
> > > =20
> > >    cache-level:
> > > -    const: 2
> > > +    enum: [2, 3]
> > > =20
> > > -  cache-sets:
> > > -    enum: [1024, 2048]
> > > +  cache-sets: true
> > > =20
> > > -  cache-size:
> > > -    enum: [131072, 262144, 524288, 1048576, 2097152]
> > > +  cache-size: true
>=20
>=20
> See writing bindings. Widest constraints stay here.

I think how this should be done probably depends on just how much
variance there is intended to be. How many more configurations do you
envisage here Mina, and do they follow a similar scheme of being
multiples of 128 KiB?


>=20
> Best regards,
> Krzysztof
>=20

--ZgC/w/fRk9AwVDqJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtEywAKCRB4tDGHoIJi
0gsoAP9cJXD82VhaI9dfpcUpcm/x197IG+YoD5kkHOlZoagMmAEArDNq7L49yZ7v
jRBGmhrDCdVo05rVz+7tQnUfm4nQugk=
=GWzB
-----END PGP SIGNATURE-----

--ZgC/w/fRk9AwVDqJ--


--===============4491033612493169886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4491033612493169886==--

