Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4165AC3ABD8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRoFgKwDJ3dQ07oFKC3cauaIfs/+UyOWI00b+CV9ePQ=; b=pEuK/7859odKV8rJrKzwd38zzp
	yH91Fazpbxsr5TG4YNWIpv+Q28PKqvbIybhg182LKBWkCaJd/l6y7x16cvU4MrR/NrscMx7rWuflw
	lsFTvuc22byZQG63wxFkjFQ58cohS8qTrbNP5EWTXMIoZPDbhmRIFVfoQDdfsydACfV5qYwaVaO55
	JtTm9z+2Szh+USPwdPlf1uXArB3F52aAdV+r818aDkfq7W5DpPWhMHsERApjYuWyY91RQOMvF9ViC
	+dLEAxVHNjXltO+tmTgCIHNJlmFwvnR022LEu+DvI4Fx1Oawod1o2ITz5NZEHuGJ59G+SQM66Q0T5
	3kxhAsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEryg-0000000CrC9-3kBW;
	Tue, 13 May 2025 15:55:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErwS-0000000CqqG-1VjC
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 15:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8082FA4D961;
	Tue, 13 May 2025 15:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574E9C4CEE4;
	Tue, 13 May 2025 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747151595;
	bh=bGea28BdYlH0En91j3DBfSyfXO+62W84BSnvaKbiFxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1RPcaNDM3rlbUb38uz4rTUDyU8Zvjtj4QQuJoRnicTgyNv/o9KxENj8B4NL6bF3s
	 z5uZdD89UKe+zD6/14St1KZ3Lo6eQ8W7CGIi4pxI+GANzuhzTv/ojw+aR4p5rkuuQK
	 YN5Dqeyhygf9OTPdgFN2K0tgxIdBMirZ1Jf/U+ZK8Pl5asl5pTb82g9fJFECjCUyat
	 gT61jnQ1VVlqRvZwb6CmSnlpZI6yjDfCGYJFGD/4/vKYDASyNtbVsGLlGZKq+vgCcY
	 x4UKqR3ckkW0kYuWJBFKSfBxkxsfWBFM4KUNO28EvpnPzYTm0YSl2zc3CEw7l0EBKn
	 STSJUxz4nkRYg==
Date: Tue, 13 May 2025 16:53:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v3 6/9] dt-bindings: cache: add QiLai compatible to ax45mp
Message-ID: <20250513-duplex-collage-5a52f50b74bb@spud>
References: <20250513094933.1631493-1-ben717@andestech.com>
 <20250513094933.1631493-7-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250513094933.1631493-7-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_085316_532867_D87A0DA3 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Type: multipart/mixed; boundary="===============4108882490503941943=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4108882490503941943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hn+PSynL2KApRliI"
Content-Disposition: inline


--Hn+PSynL2KApRliI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:49:30PM +0800, Ben Zong-You Xie wrote:
> Add a new compatible string for ax45mp-cache on QiLai SoC.
>=20
> Also, add allOf constraints to enforce specific cache-sets and cache-size
> values for each compatible string.

"Also" is a massive hint that this should be two patches. I think the
Renesas part (if it can only do 1024/262144, and is not configurable)
should be a patch of its own, since it is valid independent of this
being added.

>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../cache/andestech,ax45mp-cache.yaml         | 52 +++++++++++++++++--
>  1 file changed, 47 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> index df8bba14f758..dc03ffae6c9f 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -28,7 +28,9 @@ select:
>  properties:
>    compatible:
>      items:
> -      - const: renesas,r9a07g043f-ax45mp-cache
> +      - enum:
> +          - andestech,qilai-ax45mp-cache
> +          - renesas,r9a07g043f-ax45mp-cache
>        - const: andestech,ax45mp-cache
>        - const: cache
> =20
> @@ -44,11 +46,9 @@ properties:
>    cache-level:
>      const: 2
> =20
> -  cache-sets:
> -    enum: [1024, 2048]

^^ this and...

> +  cache-sets: true
> =20
> -  cache-size:
> -    enum: [131072, 262144, 524288, 1048576, 2097152]

=2E.. ^^ this should remain at the top level...

> +  cache-size: true
> =20
>    cache-unified: true
> =20
> @@ -66,7 +66,49 @@ required:
>    - cache-size
>    - cache-unified
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: andestech,qilai-ax45mp-cache
> +
> +    then:
> +      properties:
> +        cache-sets:
> +          const: 2048
> +        cache-size:
> +          const: 2097152

=2E..and you just constrain things here. Effectively this means just
restore the enum outside the if/then/else.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043f-ax45mp-cache
> +
> +    then:
> +      properties:
> +        cache-sets:
> +          const: 1024
> +        cache-size:
> +          const: 262144
> +
>  examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>

Honestly, just delete this whole example, it doesn't do anything
meaningfully different from the existing one.

> +    l2_cache: cache-controller@200000 {

But if you don't delete the example, remove the "l2_cache" label cos it
is unused.


Cheers,
Conor.

> +        compatible =3D "andestech,qilai-ax45mp-cache", "andestech,ax45mp=
-cache",
> +                     "cache";
> +        reg =3D <0x00200000 0x100000>;
> +        interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
> +        cache-line-size =3D <64>;
> +        cache-level =3D <2>;
> +        cache-sets =3D <2048>;
> +        cache-size =3D <2097152>;
> +        cache-unified;
> +    };
> +
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> =20
> --=20
> 2.34.1
>=20

--Hn+PSynL2KApRliI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNq5QAKCRB4tDGHoIJi
0v7rAPsFhJbHaCPBhRimiE9I+FLuciA6lcf8JDnxppQLNLe1swEA+quUTT+7Ll1N
7ZUvKDF4vkqbcGzirfTwqsdYCnwJIgM=
=L0Zu
-----END PGP SIGNATURE-----

--Hn+PSynL2KApRliI--


--===============4108882490503941943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4108882490503941943==--

