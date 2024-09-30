Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5976FCE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFwxOpIitcCE0QK7agveuPjmvSSlbI7d2ad7cL9LyHA=; b=OsiEGGNdbpBzNPFH1rRkgqk8bu
	FdpPNpOLuRdwZSOXI5xsjnac37O2d7i/BTol8LqJZ6DGI4zINdxRPQhHLWoQMD2faxKdKgmqyB67d
	lkz764sp6awenwL4E8XJWV5TWwYbtzdgFXhUnVkF8fmlKgBQ3N1Kg5Gp8VcfHX8CO3/KloITr+JJT
	+c5blAcWSvU5bQkOsViE8PtwXKxPaQBtsMyvt/kLR3ZjYuf3t3IVpv8UjnW8ysH0JkjQplhmSVJWW
	NjmS3369HSAO2dH8Yn4igIVKWQL4WncXS8gmzf0YGWJa+yiagViVr8tlNvhtU/mbBRl49r9vi/rTN
	V5ZRZtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAD-0000000HSvI-2TJS;
	Mon, 30 Sep 2024 14:14:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGk0-0000000HMxN-34sj
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0A73A410E9;
	Mon, 30 Sep 2024 13:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3786C4CEC7;
	Mon, 30 Sep 2024 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704027;
	bh=ziv26nKdeGHyeDvoebEHZtakmkZCrhTwBfu3X0oREtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2TqyLHwPaml91v43oa1uhJ6COrdhQdrNvWFZrF/KDnz1jqFeG7dzsmRkOvJiigzM
	 0OI9S7FCm1jUuahKVUhEkA3ex+zYv2/mChNJeh0tw0MPHPJqCW2QX7coYn/UAerff5
	 1fRZPwjzbXhsw7RA/S1+iqN6XXEaBv9ktMTNRem/Pro+U+zMMjUXnFakEl5stwu8Xy
	 On4kM65Lt12N5IcEadaXGRUKkEONBEIudKiyf7w/94tyMFoRAtzjlPndVfzWtsghVM
	 eLtNoW+bvlXpibSPW69aqB7hfDzd3YSplcFxzTV6s/6WXl7bR7IwfTx70xfpJFrnKQ
	 gl752ELo9iW/Q==
Date: Mon, 30 Sep 2024 14:47:03 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 06/20] dt-bindings: cache: sifive,ccache0: add
 a PIC64GX compatible
Message-ID: <20240930-ploy-outpost-9d16f9573c20@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-7-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-7-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064708_864717_58B9786C 
X-CRM114-Status: GOOD (  14.87  )
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
Content-Type: multipart/mixed; boundary="===============0186084624826474616=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0186084624826474616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cuCIrOF2wBq4Nn+p"
Content-Disposition: inline


--cuCIrOF2wBq4Nn+p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:35AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> The PIC64GX use the same IP than MPFS, therefore add compatibility with
> MPFS as fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml =
b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> index 7e8cebe21584..9d064feb2ab1 100644
> --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> @@ -47,6 +47,11 @@ properties:
>            - const: microchip,mpfs-ccache
>            - const: sifive,fu540-c000-ccache
>            - const: cache
> +      - items:
> +          - const: microchip,pic64gx-ccache
> +          - const: microchip,mpfs-ccache
> +          - const: sifive,fu540-c000-ccache
> +          - const: cache
> =20
>    cache-block-size:
>      const: 64
> @@ -93,6 +98,7 @@ allOf:
>                - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
>                - microchip,mpfs-ccache
> +              - microchip,pic64gx-ccache

Is this required? Shouldn't the fallback activate it?

> =20
>      then:
>        properties:
> --=20
> 2.30.2
>=20

--cuCIrOF2wBq4Nn+p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqr1wAKCRB4tDGHoIJi
0ieYAP4l09p3b+zq6wwEW+eJRsKgHwmoFiyLk7Qy4SxEFLq3IAD/TdV7wnajZ/7Y
s49CAKjLjWev5IgQkHS698tDluAONAU=
=oUfe
-----END PGP SIGNATURE-----

--cuCIrOF2wBq4Nn+p--


--===============0186084624826474616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0186084624826474616==--

