Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ED8C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+lIbj5TkZmufJBQ5bP9n0Ciw8ZqWWYgWWsbPekLYlQ=; b=xym98UHhue5/EUtGy1ZLBYJ931
	8sV7jS3lrlwL9mFeFE4jw2SFZ1b/+rJtS4PG8Q/xR5+Ijg3TrN6RXqHXIYx1Hn81APAUvKebUgWCY
	QuEq+0bu2d0uAbIhpiV2yOr3trCM3BRXNGezUCuC1kItRFzaapZvh5BpkC6UFqd7SU/lH+3ReIt99
	pA1LoVtswiMOgXjugI4xnNEMWdFW0OnC3K2ekXZl89yB1CmBSLMeyep9UYUJ20B4AB0oj9zt/lvgT
	N0SEHnT+YrdFIdYvIejmazemwbMcbr5wBHBfTu8kxngDml5O4gctYoSgagGYFh6lOuzEc6LfKNJbK
	APgGWhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpZd-0000000CI2b-1hlV;
	Thu, 26 Jun 2025 16:35:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpZc-0000000CI2S-3KeR
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 16:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7224613B1;
	Thu, 26 Jun 2025 16:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA350C4CEEB;
	Thu, 26 Jun 2025 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750955739;
	bh=wCbmMUfYuBUun3CeeJIDrLKEeED82fEYjdia+QOR/Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpRnWyUsDt/6Bm1WS2q7jSb3hxiZostCdoFgPSZc4/EejwiOrpdxVQojHspcOM1pA
	 LMBJibUqxJz/eRwGVXF7Cbr/KPrUiQjrjqNlikXa6haTBS/QtEKkxIqztTDpoTMgka
	 OUTJ/eT2qKgSSUXSsb25uSqpAWTA2Cknp30256T8I9ByJykqWMW6EjoKBkkhEsrznd
	 d6UeWtxnL4wx+mCxsjCj4oywjbaX3ESm2W3sW0w8UKWUoy8hQ3sq/CPfjcI5O+OjCm
	 CrSK3FH7cjFL82QPtZvSc1pBWVdluOwz+gHbfhq4244dC912uIa5xx+xFahfFrnVAz
	 ZQXfLD2oLW8XQ==
Date: Thu, 26 Jun 2025 17:35:34 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: riscv: Add xmipsexectl ISA extension
 description
Message-ID: <20250626-scratch-numbness-cbf36f77d296@spud>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-1-6c7dd7f85756@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20250625-p8700-pause-v4-1-6c7dd7f85756@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============8661370086317764643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8661370086317764643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ZI8rYN+BJWGMnAI"
Content-Disposition: inline


--5ZI8rYN+BJWGMnAI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 04:20:56PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> The xmipsexectl extension is described in the MIPS RV64 P8700/P8700-F
> Multiprocessing System Programmer=E2=80=99s Guide linked at [1].
>=20
> Link: https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Refer=
ence_Manual_Rev1.84_5-31-2025.pdf
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf5347d92785dc085a011052c1aade14..de41a6f074d3af2ceaf5293df=
e75d16f43d416d6 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -662,6 +662,12 @@ properties:
>              Registers in the AX45MP datasheet.
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
> +        # MIPS
> +        - const: xmipsexectl
> +          description:
> +            The MIPS extension for execution control as documented in
> +            https://mips.com/wp-content/uploads/2025/06/P8700_Programmer=
s_Reference_Manual_Rev1.84_5-31-2025.pdf

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +
>          # SiFive
>          - const: xsfvqmaccdod
>            description:
>=20
> --=20
> 2.34.1
>=20
>=20
>=20

--5ZI8rYN+BJWGMnAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF121gAKCRB4tDGHoIJi
0qDXAP9lFJBJpCas9VE4K4zGjowGNe7GTpkhDOuvy/r+gT3FdwEAtdQbwRROiODf
HVzgWtWY4uzVByx9neOWS/Wu2utllAI=
=8x/c
-----END PGP SIGNATURE-----

--5ZI8rYN+BJWGMnAI--


--===============8661370086317764643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8661370086317764643==--

