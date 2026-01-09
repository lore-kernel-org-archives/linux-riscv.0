Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3797ED26D9E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpzv970TOs536p/Ror7WlEl7mcN+ALUFHRTLxQbkrV8=; b=rL3DuZD3lBBBCclD/BLdNKTbDx
	UAbA5BxYsK6awiqqnj8Dk6nIsXDysF2LZfsa5HNUOGc/jAsgHA8UidB7kp6h7RMslAQBzoqqBXX8W
	R1DBUut0jY6LTzIO2cPr+uT3GYmOCRJRhgQ7A3L/J9DAEfv1aaRteUG07rnxnGdOm9jU2um9d8Y1a
	glDktSKqdDrzgg3BFS88HkrCB2rda9Uvg+QDGF2zTdcnp98hXK3pWJBdNw+P+NriUQDyc5zhk8KvU
	GN0uGRB5KSVj/tJnadGcESJn/QB2uVYGAxx9daQUxGaLlxzfepTlMLQ1VJ9Jtn8NKS2LA39ydIW0Z
	WRCx5+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veKAk-000000032vW-06qQ;
	Fri, 09 Jan 2026 21:37:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veKAi-000000032vQ-27pg
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 21:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9910D60160;
	Fri,  9 Jan 2026 21:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08013C4CEF1;
	Fri,  9 Jan 2026 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767994647;
	bh=jDXexHmDoezfjqragjJjO9OSzM0KCZAvHcQ7WoQC0ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAaKdZZF5MM9ulrDAGDvxLLkucPB9EB/r8fRIkb64mBWW+pf3+eLwDaNvRHFy41S+
	 GKYq8eUSvRSIJP2h5Q7EjRtOKzYRsSmVj9rmc8pjIxdMY7njHBx8zI9hB26drAsTsK
	 4sq8Oy25Y7lpRGDiksgHRfa8J11xf+FozDblZo3xql7/KFVECZ5yOq+7+SB6bwq2Xr
	 kQ8DCY3zv3YojfNuAm3LTBaDgMYvrnpRLFlzuTivOhXkAyIwexApjDerpXq3zcF/cb
	 RYHSecgq5uhtUuInrk4jO284I+3Lah4vPG0LckU7o/Xyd7fREi632S/hxmC+GWSvt6
	 FVXl+MZNJW7YQ==
Date: Fri, 9 Jan 2026 21:37:22 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: riscv: extensions: Drop unnecessary select
 schema
Message-ID: <20260109-anthill-krypton-ad69ad7e6376@spud>
References: <20260105212910.3454517-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260105212910.3454517-1-robh@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4041455087620924972=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4041455087620924972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b4RaDUMMDJz9doTI"
Content-Disposition: inline


--b4RaDUMMDJz9doTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2026 at 03:29:09PM -0600, Rob Herring (Arm) wrote:
> The "select" schema is not necessary because this schema is referenced by
> riscv/cpus.yaml schema.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

I'll grab this I guess.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 565cb2cbb49b..29e8b50851ed 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -24,12 +24,6 @@ description: |
>    ratified states, with the exception of the I, Zicntr & Zihpm extension=
s.
>    See the "i" property for more information.
> =20
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        const: riscv
> -
>  properties:
>    riscv,isa:
>      description:
> --=20
> 2.51.0
>=20

--b4RaDUMMDJz9doTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWF1EgAKCRB4tDGHoIJi
0s4RAP9fdj8nDmDjS+3ykvYNLT//huW5xpcMyxk2FVwB9oRBzAD8D/Rf+To4vqD9
2jRIJk7fF9kXiyAy0VZJ4HW0DkMr/A8=
=wext
-----END PGP SIGNATURE-----

--b4RaDUMMDJz9doTI--


--===============4041455087620924972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4041455087620924972==--

