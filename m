Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67355C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 16:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lsN9jsNIviJHtM4hWKs9Z4hZ5PNHxc8WCtGMrVAdBs=; b=cxz2hMrOdoETzcnZ2gGkwryh6k
	qx0PFqVh44gaNGkmjUcVJXCByka7ULz1Tz5PKOTuuQfPjY/aoKl6C7F4GM+1RajW2G+R+LWbGrMGa
	N79X8k/E0aUlJ7rgha+OrRQs1IcLWAp1U2Tpt+6Flyb5c4EkewaCj1bn92CScua6NJHInkpsOZloJ
	4BuPH6aQZR4cf3PbVTUeOomBzfFIQEH0aIIr8JSaTy1RkQA3pH1vSByi87Rc+KILpURRettjur5bS
	wJ03YInMa9cmWQfE36CycTqFZt89fankM6KGnvuCUdbATugPIRLWlHYpnSJ7SCLu+sRU8Gqvi4yuU
	ExXfRaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyP0-004sNv-1s;
	Mon, 24 Jul 2023 16:27:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyOw-004sN5-2e;
	Mon, 24 Jul 2023 16:27:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3386261209;
	Mon, 24 Jul 2023 16:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABA8C433C7;
	Mon, 24 Jul 2023 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690216033;
	bh=9aa3PmiCd+sptTxJkg15gaoL4dmn6mDQ1zVXOb2LYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVG4bEqd7lEHk/ejkE8ansdxj+lL4isqXXoQ2eDRL4PPFlav4u4JPP/ZAI2OAnP+c
	 DgnYbRZfjwYAWKzb5WuoAWF177QNvsJmKWStlWUAV14lcO901wnvHES3g3cPDgE9kW
	 ycuDDqRPSRbXThN12Jh+ytagRYkEwyKaae1c8nnjY6XS7IwzRrBoDsrP+hArd4Ptc0
	 7Le/Rr2OrZ2dyoHwKLZ0mxUaud5juFemZdatFlxCD7WWc3RMBPNUEQ7nW/dpnOVUrK
	 9v6SooVHPKPS3yGveJcGcUkD6MORGNv+0i+RCaFkcJO32TAzLHEkukKIRD/C1Qtxna
	 lu00UN2JBRj6Q==
Date: Mon, 24 Jul 2023 17:27:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: riscv: Add smstateen entry
Message-ID: <20230724-skeletal-magnify-dd76ad7aeacb@spud>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
 <20230724142033.306538-3-mchitale@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230724142033.306538-3-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_092714_908876_8FD845AE 
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
Content-Type: multipart/mixed; boundary="===============8033701218514281938=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8033701218514281938==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LfipDMf8aZ4B9Q+O"
Content-Disposition: inline


--LfipDMf8aZ4B9Q+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 07:50:28PM +0530, Mayuresh Chitale wrote:
> Add an entry for the Smstateen extension to the riscv,isa-extensions
> property.
>=20
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..36ff6749fbba 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,12 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
> =20
> +        - const: smstateen
> +          description: |
> +            The standard Smstateen extension for controlling access to C=
SRs
> +            added by other RISC-V extensions in H/S/VS/U/VU modes and as
> +            ratified at commit a28bfae (Ratified (#7)) of riscv-state-en=
able.
> +
>          - const: ssaia
>            description: |
>              The standard Ssaia supervisor-level extension for the advanc=
ed
> --=20
> 2.34.1
>=20

--LfipDMf8aZ4B9Q+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL6mXAAKCRB4tDGHoIJi
0ucUAPwMTNY5v7t7Ugeg/KFRggTzn8Oqe3iZi8xFlCkTVyRFWwD/UJj8/RVhkbiu
L04HEJ/dKFXxKVfVLOuD3n9lAoyJJww=
=c+k+
-----END PGP SIGNATURE-----

--LfipDMf8aZ4B9Q+O--


--===============8033701218514281938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8033701218514281938==--

