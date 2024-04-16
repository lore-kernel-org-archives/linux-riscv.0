Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC64EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufDBQhjk4c3tAQ/8BpmeFs8VwabujFrz7VnnYz3C3eQ=; b=MvQ1CBSpJhNNXk3rr93hjh6kkh
	5SB6HqFkhSVfpx7ErBkX9DXhbRPc4PCo4KwgWZr0mtPihpIztnY86NdCoW12CqNIpAJv5Y3KOkIvC
	57XnOtEnqRhZhmuRfQHalITfWdLeEOMgSTWYGXCiBG45Lp4lrx45M5FDTKXIM5UhaL7kF4J9e/fC5
	wRxnv1G1Vimxz0QSADINQcg+Am3wPrJt6rYpXW+2t7yXcbtLtI8eG7zScFXDxq5kEuSbYLUKd7oh6
	htpIE7x+YTt0GO4wczwZuxTytpLmeAKlkg7/u4WwmdX7BrFzYa8L7MnF/D9hksUTiAEPs8VgMWKGC
	4bIP9bJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkNT-0000000Cfla-3JOp;
	Tue, 16 Apr 2024 15:05:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkNK-0000000Cfi6-1Gxi;
	Tue, 16 Apr 2024 15:05:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CB0F61226;
	Tue, 16 Apr 2024 15:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4437C32786;
	Tue, 16 Apr 2024 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713279933;
	bh=O9p4OJelM8j5ChKW6+ZnGM3uSLJaoJ69DKouPYKRqlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qeXYVayMoFa9mEbIWXY9ZBGlRgib//9BkGwkvOXQc5ScFPvJWcyFuzBpZcXy6lmVV
	 R1UhVDdenW8hJS1bVLytbNm8Me0gheegQtCoE6g2LrJF615lVPFdplSs+V25UXlFe3
	 +fV6CmblloXgOY2hh0sHrjI9RFLZUuXKCknAa02JsFiIUXG4dypxmNKLEDcFzTAbBI
	 djrdXqCeqtQx3OmyUnf/pPiOCqJ3CCd/YhDD7HHzj3wXRMEr6N/ulunG+fAiCF79tR
	 Xu967LvfUwGz4YmxeEbhuKiu3sT4utLWKjldeb1lxX25lwpdlp4zswvSmg7aybUJ9P
	 UOBikzQmbzqRw==
Date: Tue, 16 Apr 2024 16:05:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 03/17] dt-bindings: riscv: Add vendorid
Message-ID: <20240416-cavity-afar-d25eaac5fb03@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-3-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-3-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_080534_508062_D83BB7B2 
X-CRM114-Status: GOOD (  17.25  )
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
Content-Type: multipart/mixed; boundary="===============9023639738753485529=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9023639738753485529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wMBbbKu9mXXkxQXp"
Content-Disposition: inline


--wMBbbKu9mXXkxQXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 09:12:00PM -0700, Charlie Jenkins wrote:
> vendorid are required during DT parsing to determine known hardware
> capabilities. This parsing happens before the whole system has booted,
> so only the boot hart is online and able to report the value of its
> vendorid.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

If we are gonna add these, I think we may as well add all 3. I'd also
tie them together, so that either you have none or all 3.

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index d87dd50f1a4b..030c7697d3b7 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -94,6 +94,11 @@ properties:
>      description:
>        The blocksize in bytes for the Zicboz cache operations.
> =20
> +  riscv,vendorid:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Same value as the mvendorid CSR.
> +
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
>=20
> --=20
> 2.44.0
>=20

--wMBbbKu9mXXkxQXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6TtgAKCRB4tDGHoIJi
0sLCAP9GK5EvwG7exqhsRC6YBSqncpF7d0Ozytay1vZqdS4XsQD/RpbWEV4Jsg1B
lsL0MHoKzJIL7pb7I+XCv8Ff59aiCwA=
=6uQe
-----END PGP SIGNATURE-----

--wMBbbKu9mXXkxQXp--


--===============9023639738753485529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9023639738753485529==--

