Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97619C54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Mar 2024 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iYSljT2LLDrKmFQIFrLVPB+IjBWWt79InRndS82JEM=; b=kjC+uGoCyW/Q5N/BFM6QpnI00t
	tTpuKVqFz7gjY4Shni/as1fm1HlZnXpGcHHJ91gQm33xIqDH8TzPr93rcz9Bb5kTCNX/W5Bf+sBvI
	F9LmOSnuOHCKiRe080i/nSBnRdxaCyIRWd0789RyawejX/KW6AUDzunDM9nmkPvoYntPK4azkFxl7
	Zsv4qrO90yLYExJIa3tbEOsfGFIgVBhDuOstAXGpICgLp34+eV1dCVgq06BuxGi49dnUkHnlaitBb
	Yn9Sc/4qs/UG4MirWXH9IuZZ+6MF24jhEP4BF0jfOIhuiZbNWcvX9LHAYjwiILi1n2601dmMhpnl6
	/gycSbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlryM-00000005UK7-3Z0H;
	Sun, 17 Mar 2024 14:58:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlryJ-00000005UJI-48ku
	for linux-riscv@bombadil.infradead.org;
	Sun, 17 Mar 2024 14:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y60ESoNnop+pjP8a03NFsXjTAVDNBiLWhae4lMTgV7s=; b=CIdjmIlAESCiykXryaULePvT93
	RtP7LJcwTuQ1F7JQ1Quk5QuGf0DRWUq4PgUzlJUi3YsFlVuP4DpKGZXkm+qtjF6AZ8a9VYNfhsExX
	pevr9bew0xkkQA9RjlEZhLjKJdmeGRyOXBl3JJsrHiGlyrsvsqG6l46Yn/aqqeCIl9ElEA9QHCSAa
	kxZlw9lYajqYZviiF+UA7rV5v7nl/rMeBhtofG4wtwjke6ZVP4hL1L591aJMdb+M/vtNb1dKYdwhv
	DezUDdsPsrH0vj5lwzv84itnodoiiGZrhpFRzMV3yl011OMzS2K+PYNSXlqkIt5cn4Rnx7XQicnRu
	hGmXiDmg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlryF-0000000C5rW-10sB
	for linux-riscv@lists.infradead.org;
	Sun, 17 Mar 2024 14:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9721F601BD;
	Sun, 17 Mar 2024 14:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153AEC433C7;
	Sun, 17 Mar 2024 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710687519;
	bh=4hYK4NSlZ7J/yp23ZsRuOVuH209yZtPKW8QX6ctpQxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWpzGW0qxekZ3lAxNLpO/SIgfvn5xmjyPr185A7bawaZCsKJAqLQf9d7sjp1cEK1F
	 +2rzc8lY9gAUi5bL9YW87gk0Ydz/UabfDGPLZVQZbkJe1y+OVziUVx26zRRg4OTGL9
	 IqTTTYmIMKqoS8dYkmjRODl1sTglw5SMUCLCrGw1IqNDozkuWCAZH11JGHYZSKzbOk
	 P/O1Phy8y/yWEuoX0kAhauro/Qk7u2zwFTg9IPDwGa+Vrs7A6Prn3hL2Ulh3oNRk7X
	 likDZxaO0xJVLA8XoPPKJLr4i7YBZsLdRVi7n7CUxnLjoEmcfuNtQTnOsJRSkIpH2Z
	 zZkART3XN/36A==
Date: Sun, 17 Mar 2024 14:58:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: cache: Add docs for StarFive
 StarLink-500 cache controller
Message-ID: <20240317-snide-pounce-4a82ee1704ad@spud>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240314061205.26143-5-joshua.yeong@starfivetech.com>
 <20240315163607.GA1444248-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240315163607.GA1444248-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_145843_747470_FC53FEA3 
X-CRM114-Status: GOOD (  22.33  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, geert+renesas@glider.be, leyfoon.tan@starfivetech.com, heiko@sntech.de, prabhakar.mahadev-lad.rj@bp.renesas.com, guoren@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, evan@rivosinc.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Joshua Yeong <joshua.yeong@starfivetech.com>, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============5371675394857943825=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5371675394857943825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JkNPYk6d8cks6SMP"
Content-Disposition: inline


--JkNPYk6d8cks6SMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 10:36:07AM -0600, Rob Herring wrote:
> On Thu, Mar 14, 2024 at 02:12:05PM +0800, Joshua Yeong wrote:
> > Add DT binding documentation used by StarFive's
> > Starlink-500 cache controller.
> >=20
> > Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> > ---
> >  .../cache/starfive,starlink-500-cache.yaml    | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/cache/starfive,st=
arlink-500-cache.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/cache/starfive,starlink-=
500-cache.yaml b/Documentation/devicetree/bindings/cache/starfive,starlink-=
500-cache.yaml
> > new file mode 100644
> > index 000000000000..97ddf7db39e9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cache/starfive,starlink-500-cac=
he.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cache/starfive,starlink-500-cache.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive StarLink-500 Cache Controller
> > +
> > +maintainers:
> > +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> > +
> > +description:
> > +  StarFive's StarLink-500 controller manages cache shared between clus=
ters of
> > +  CPU cores. The cache driver provides mechanism to perform invalidate=
 and write
> > +  back functionality to the shared memory.
>=20
> What a driver does is not relevant to the binding. You could describe=20
> what the registers control though.
>=20
> > +
> > +allOf:
> > +  - $ref: /schemas/cache-controller.yaml#
> > +
> > +# We need a select here so we don't match all nodes with 'cache'
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - starfive,starlink-500-cache
> > +
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: starfive,starlink-500-cache
> > +      - const: cache

You're also missing a soc-specific compatible here as far as I can tell,
as one of the other patches in this series specifically calls out the
JH8100 as where this cache controller is. AFAICT, "starlink-500" is the
name of the IP or of the coreplex - it's not the name of the SoC.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  cache-size: true
> > +  cache-sets: true
> > +  cache-block-size: true
> > +  cache-level: true
> > +  cache-unified: true
>=20
> Drop these and...
>=20
> > +
> > +additionalProperties: false
>=20
> ... use 'unevaluatedProperties' instead.
>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
>=20
> cache-unified should be required as I imagine the cache is always=20
> unified. Perhaps other properties too (cache-level already is)?

And I also suspect that a load of the values can be restricted to
specific values for that jh8100 compatible.

>=20
> > +
> > +examples:
> > +  - |
> > +      cache-controller@15000000 {
> > +        compatible =3D "starfive,starlink-500-cache", "cache";
> > +        reg =3D <0x15000000 0x278>;
> > +        cache-block-size =3D <64>;
> > +        cache-level =3D <3>;
> > +        cache-sets =3D <8192>;
> > +        cache-size =3D <0x400000>;
> > +        cache-unified;
> > +      };
> > --=20
> > 2.25.1
> >=20

--JkNPYk6d8cks6SMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfcFGAAKCRB4tDGHoIJi
0pWNAQCbqLMU21tC41TsMzHu7Npk2WPeIA2cuSEU4dz0i7iOpQEAm+9ZG7QgRTsq
WKL2v/DB2ZR5kbqHYAQjQk3cx8aStAY=
=zEPf
-----END PGP SIGNATURE-----

--JkNPYk6d8cks6SMP--


--===============5371675394857943825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5371675394857943825==--

