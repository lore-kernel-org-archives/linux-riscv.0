Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9051CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDjQIOARnCtuDvjRbTzMiHpw5Iayq8HBusHg9rS+yDk=; b=tDGsbb1ATQEWgpv6+O8G2tB0gh
	r46rMsezXDZRKBrH6dUDV1ByZUBS0VlLIQP3IabQasctwK0D831T015Ov+0weQyJmLipuH/h2fzX1
	OaieSB4SeeIPGKem7H+BNO1BnDlX/Fx10+uMsLB0rkCZvmFmhb2Gkb68i44HVN97CQWUZ+nHBF04W
	f6ltGf20m2ibAlLb8ioas9tLS8BOP+9MLAK1t4r5nPaE7UXTMiAaCMlXQe/WuKMvy8wU3d/5Wdj1j
	YyqaMe2UDPfbT5p40z7qsnrv7jm9d2rQt9dBrVQwzzM7hf+kY/5aQvhw+c7JPi/2cgxpAtajcQhjq
	bAsIdJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruD0k-00000002ZyU-0M9K;
	Tue, 09 Apr 2024 15:03:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruD0f-00000002ZvZ-3ZVZ;
	Tue, 09 Apr 2024 15:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7353CE20A8;
	Tue,  9 Apr 2024 15:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BAC433C7;
	Tue,  9 Apr 2024 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712675019;
	bh=m+H+w378Sr6HEqYhv2540iRxgWMuF296nGm682Ps7S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obPXcHZrskluMa4NU4zR6hyOUW6yg9wkgtvhiK1C1xzCihA+aWVZaHizaG8r5H5h6
	 83HyPuJ7U2EXKxxbxHWXHTZ3O2hhMvPXMwc7E53xGT1bCvTi2hW24caQgA0/+9Kq37
	 ThZVynd+PN/jdw+FbYCtGhfvkmeU2USeeja7ZNYwWcjsT2iw8krkYZ/QHCaSvBA9+z
	 Hrd9MznNbHJg+ih4vrvoM6HneFpmZm8JPzjxWajwCuDoRQrfk0VvK1TFZfu2JLVfOP
	 jGWdy0xxUFOwAvPgaW7UBh7mqEqoO8vd4Myc6oD5IiKh2GIj1ODxqevGDr3hK54j2e
	 XiukDYTxb3flQ==
Date: Tue, 9 Apr 2024 16:03:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Eric Lin <eric.lin@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: cache: Document the
 sifive,perfmon-counters property
Message-ID: <20240409-underrate-armless-697047fd61cc@spud>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-2-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240216000837.1868917-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_080342_098517_45B92B3B 
X-CRM114-Status: GOOD (  16.12  )
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
Content-Type: multipart/mixed; boundary="===============0991661215687046286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0991661215687046286==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nDzQsaP24507Oliz"
Content-Disposition: inline


--nDzQsaP24507Oliz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 04:08:13PM -0800, Samuel Holland wrote:
> The SiFive Composable Cache controller contains an optional PMU with a
> configurable number of event counters. Document a property which
> describes the number of available counters.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml =
b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> index 7e8cebe21584..100eda4345de 100644
> --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> @@ -81,6 +81,11 @@ properties:
>        The reference to the reserved-memory for the L2 Loosely Integrated=
 Memory region.
>        The reserved memory node should be defined as per the bindings in =
reserved-memory.txt.
> =20
> +  sifive,perfmon-counters:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    description: Number of PMU counter registers

I think this should be restricted to devices that actually have it,
given we've already gone pretty hard in this binding with specific
requirements.

> +
>  allOf:
>    - $ref: /schemas/cache-controller.yaml#
> =20
> --=20
> 2.43.0
>=20

--nDzQsaP24507Oliz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhVYxgAKCRB4tDGHoIJi
0mzBAQDysCqijpDedJMkSHubXyNjqiZS55GKu1YasR4ei55rswD+MW0xgiNKPVjO
XNXWQPiUaaqF25hlCEW4n/5lW/MwtwQ=
=9dlT
-----END PGP SIGNATURE-----

--nDzQsaP24507Oliz--


--===============0991661215687046286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0991661215687046286==--

