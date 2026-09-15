Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA8FC88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/x6aL9TFo8McEGfW2609BmeeQe2cl74h6mzEl2fKig=; b=myBYzG+RDyYSx//rty25fqm99y
	ipqiLilrpBp+tPTqMoIoLvYRo5eplprxdOi1Je78uWZEUZR92eSKX++V84KjhJtDItT/bUtdnjHci
	HeDtVuEFGcJ3aIUURduyBTZ7bEeLPniKdbRTRoZ6swePcrZ9+7ZpLUtHijEU4ZJI/q60cV6kwunWh
	8vCrHa34LTPSE+NHafv5qb1L15731oLmJTXw+9je2X8c8bIpQ3yim82Hdvw04gqw8Pu89/LFCMOEB
	BEna9TKWv+ovnXc4TGkXFavwqSndUzqmLRmZbG8QaTqoee/tPM9mVFjGxL190L0oY8Ts97g1TY8rk
	7tOK9wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XhY-00000007ijI-21xg;
	Tue, 15 Sep 2026 18:16:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XhV-00000007iiW-3U8A
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 18:16:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25811600CB;
	Tue, 15 Sep 2026 18:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FA91F000FF;
	Tue, 15 Sep 2026 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496171;
	bh=ySr+56whePHW7B5Qp//edff3HYB29zXpe14GFiZEua8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ydzy2E7mRGaTox9NCLsc//oh6DLpnC840Z50/VcGsJVlmGC+XGO7HmrqI89C8B6n9
	 KtTCV0wKUFZk0D5iW0Zu2Ia1I3sXIJTBNtJAofNg/2ZJsg7mwD+UV5DU8NfVE3C+hs
	 AgW1E1RpMtLrAEIdW7H5+TucdPnSOMie0hjmpl28TzdAr7qTSMZhCfWDLKSuaxydQC
	 1Hu08eMCnY+B5V40O1oXKy3MgXbKCs2wTMEroKMj9AsvnIrPjWRy2aq7XEN4RTtYIg
	 OcEmen8kaChTAaXri19P2gvISEaI2a6LrY2Tp5biWBx9OwZj9LgNAI/gYQsknAMXKq
	 7qzkZQC2rLfEg==
Date: Tue, 15 Sep 2026 19:16:04 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Message-ID: <20260915-mummify-overripe-ed52faf90098@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-4-3267f14ebce1@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20260914-p8700-dts-v1-4-3267f14ebce1@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============2667706554736280702=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2667706554736280702==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0zvhSKx1C7J763gn"
Content-Disposition: inline

--0zvhSKx1C7J763gn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:52PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aplic compatible for the MIPS P8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe5=
35075111601b80e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -27,6 +27,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - gf,mips-p8700-aplic

I'm also curious about why "mips" appears here. Isn't p8700-aplic
specific enough?

>            - qemu,aplic
>            - spacemit,k3-aplic
>        - const: riscv,aplic
>=20
> --=20
> 2.43.0
>=20
>=20

--0zvhSKx1C7J763gn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmLZAAKCRB4tDGHoIJi
0r8ZAP93/tLAEnhBCnKK0KqnJFLPNSvTn8/pgSvD7+LthvtOUgD/RHbkEYrvDoM+
K4ZZEN7ahJ2apXzW1QvSUkjeRBuoDAI=
=c5qF
-----END PGP SIGNATURE-----

--0zvhSKx1C7J763gn--


--===============2667706554736280702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2667706554736280702==--

