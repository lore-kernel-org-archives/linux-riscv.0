Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69068C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3S+bK5iX8+naitRBuWZP2UvhsKJN5txt0n31vQc5GA=; b=Sesxahvapj/0MhWg3NoxrT/BDy
	QgjpT5WFAmjHYmpYkWqeV/9ZflF9LDXBWcfuExYjtnb52iw3/XLRmvTu4bv0frITtCGBiNy9CdWwn
	27om8kLDzx22aeae3XoXsWTdfS3itdzMDtPCDklLC/u7I0n9ePOLsLBoNZ7fvWRUQsxD24jcIvEdu
	34UwJvlaFPTFQmKyR2jatmMNgJLcDRNlBeMfT6lBuhw7/ftr56sQ+1CnOCBn8wjsRJ59lm4hAZAdb
	LFBliUw6HLkOYY6NbtLWZc7E8VBiVyv4JFkg2N17Cy7x2iEcjI7dXGnCdrhkWDydRbUSU6YSzzDNu
	eSi6dTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kys-004FWI-0J;
	Wed, 08 Nov 2023 16:00:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0k1Z-0047nq-24
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 14:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1BB96B811FB;
	Wed,  8 Nov 2023 14:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67CFC433C7;
	Wed,  8 Nov 2023 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699455559;
	bh=rADyy5yr7+H2mZjnMvdRbduD7lwAsCfnNVr4XTzxvPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOouj4dWsfpzr7uI3jxC/aKkHDlSoefrYgRLHG21Aw4jKD+yk6+xED90b/4JBfL/L
	 7PTh+vFsRqMi/x30EjFg64dOrfpTwGWdVicx4fpNwaoQY+5ET1azdTK38QR7T+Ff/G
	 ozx+5nw8ZflmPwrlXXj1dngTr5myZusiD9aIwEKa1sW0WZ9x5DB/C2IL5Mngm4jeIM
	 8aHj3NqUFG1AkIwkkxs81gZsr3BWcd+OdsbrQeIBqkZRU1ULdOaF1oLWaRuoapKabm
	 cwx/SqgrQ2rAkLgVoFEcBNXnJN8vZ+aHOjlvYURgPb8+HXGB+zLCE9JaNucDkL0H2x
	 GxuI/gGwx3PXw==
Date: Wed, 8 Nov 2023 14:59:14 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v3 20/20] dt-bindings: riscv: add Zfa ISA extension
 description
Message-ID: <20231108-basics-delete-710d0682bf0e@spud>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-21-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231107105556.517187-21-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_065921_847801_6D6A6F13 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Type: multipart/mixed; boundary="===============4062393191688062220=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4062393191688062220==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JkYUf/ZcAWjBoFXV"
Content-Disposition: inline


--JkYUf/ZcAWjBoFXV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:55:56AM +0100, Cl=E9ment L=E9ger wrote:
> Add description for the Zfa ISA extension[1] which can now be
> reported through hwprobe for userspace usage.

FWIW, hwprobe is not relevant for the dt-bindings.

> Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/v=
iew [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 87c7e3608217..dcba5380f923 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -214,6 +214,12 @@ properties:
>              instructions as ratified at commit 6d33919 ("Merge pull requ=
est #158
>              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmani=
p.
> =20
> +        - const: zfa
> +          description:
> +            The standard Zfa extension for additional floating point
> +            instructions, as ratified in commit 056b6ff ("Zfa is ratifie=
d") of
> +            riscv-isa-manual.
> +
>          - const: zfh
>            description:
>              The standard Zfh extension for 16-bit half-precision binary
> --=20
> 2.42.0
>=20

--JkYUf/ZcAWjBoFXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUuiQgAKCRB4tDGHoIJi
0llOAQCViniwIMqamKiIXGkYgPVn8XIdcV77SvS/CGDxg7coMgEA0h28x+pWr9FN
yF1FraJ1KQm8FDdMDJdiNn511fAr8wI=
=q5Lh
-----END PGP SIGNATURE-----

--JkYUf/ZcAWjBoFXV--


--===============4062393191688062220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4062393191688062220==--

