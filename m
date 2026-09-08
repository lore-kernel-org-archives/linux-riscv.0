Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58117C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ1cu+hI4Y3wCOxWhhIvmPONFNUT9A5gWuZpQAEzVnU=; b=tOtJRrSX5vi016X0iRXHxSJ6tU
	gt5ojftvlVjzaBYWvjQgus8ygofV0tN46DUgHEaW+wsSKm4Q8EvAI5pWZh2yMsto6hpiAa54s4MBt
	Y5X9DfEAnkYsAfY9rDf9Z7zVOfxdmi0+SUqb6cvdzLMhjU5jEq31WrCMHwb1zeTpX1D6QoyXQKHBZ
	ldX57diJnUfpGMV55ODWFUM6dctBH0gemQ6QV2jQyNW8Pp4DsE3FzaDlLa9N2xfZ2wR2313fS/yoc
	NV96Wr/8Zg+NUl+klBxM5y29WbnVToKx9w/reC/7ruKYuM1rjD0hJkS7gqCRp2Z+zRlta9UdqIuJB
	AhFSY8rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3z0e-00000009jVv-00Qh;
	Tue, 08 Sep 2026 16:49:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3z0c-00000009jVS-3ILS
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:49:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C05A3601F6;
	Tue,  8 Sep 2026 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963E41F00A3A;
	Tue,  8 Sep 2026 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886161;
	bh=y6T1PYQqEn6OIeTwH0vHF5OJqwdcrmzAmh0h23/q0Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SPwxPVk8fz9RQjdCG9nvLPDAsXD85yMMzSEOXuCEo7gfKxDVXHXYiF8KjV2YNssYn
	 glrzFWegtcKevREEyWDO+WhXWBQdbomRRpcmlp+OJzaElgAZ9KrIq5BFkhmAwAlP4F
	 +BDAV557/dV5SOnBm/REj2a9720pP9vb7dDWSgomxtCEm3z8sNkACsY/U5/c6HsToL
	 wGxLutYGuwQcffvnlJAISi/NR27hiGP5m9Uou01pKkPiQaL/MMy2qp9bt7Tc4at2yb
	 gHsbbkieoSGR3ei2HRmjMTL0HQ7o/mhC0wTCMAxbjz6/7O9PQpbI0T3Bq8+G/GY6ZJ
	 5yadK4lV92WrQ==
Date: Tue, 8 Sep 2026 17:49:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: timer: sifive,clint: Deprecate
 spacemit,k3-clint
Message-ID: <20260908-veto-shelve-cb17a634b3b3@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-4-7931e5bc86ad@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260909-k3-aclint-v2-4-7931e5bc86ad@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============7441386818208262705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7441386818208262705==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IuSQJzEXQvkbH5Mt"
Content-Disposition: inline

--IuSQJzEXQvkbH5Mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 12:28:47AM +0800, Junhui Liu wrote:
> The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
> devices. The existing spacemit,k3-clint compatible incorrectly describes
> the SSWI register space as a legacy CLINT.
>=20
> Deprecate this compatible in favor of the K3-specific ACLINT
> compatibles.

If it is this badly wrong, please just delete it.
Leaving it deprecated implies that it is frowned upon but still works.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 3673836e14de..88b9be2230a1 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -34,7 +34,6 @@ properties:
>                - microchip,pic64gx-clint # Microchip PIC64GX
>                - sifive,fu540-c000-clint # SiFive FU540
>                - spacemit,k1-clint       # SpacemiT K1
> -              - spacemit,k3-clint       # SpacemiT K3
>                - starfive,jh7100-clint   # StarFive JH7100
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
> @@ -62,6 +61,10 @@ properties:
>            - const: riscv,clint0
>          deprecated: true
>          description: For the QEMU virt machine only
> +      - items:
> +          - const: spacemit,k3-clint
> +          - const: sifive,clint0
> +        deprecated: true
> =20
>      description:
>        Should be "<vendor>,<chip>-clint", followed by "sifive,clint<versi=
on>"
>=20
> --=20
> 2.55.0
>=20

--IuSQJzEXQvkbH5Mt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqA8iwAKCRB4tDGHoIJi
0v9CAP4tmH9S8FqWvAmMNur5RwhJXGOKYGFd14MfPoINIao7xwD/WE/k+8/EMQm5
+qKGULH+GknCPb7GvBi+nEKSOiozsQk=
=uhnI
-----END PGP SIGNATURE-----

--IuSQJzEXQvkbH5Mt--


--===============7441386818208262705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7441386818208262705==--

