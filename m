Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A202FC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2VqXBnkZucujjH5X6VCGxTRuRRKdPQzTcdqGRCoFCw=; b=qze+yybIy4Xjn/nTGx6Y2XMewI
	2HOmGnbl/q12wntR1fEEL9z4NNrS11hnuGcQVWiEsQGoYncdueP7zVcn6wYE011pFY57PrgKx0JUJ
	Powf/bmUIh85m56pl+bmWQrhOxeJHMsE8EHK8cCCdFFKMI4vVBuOkZQ6fD5bmdC18xwZJnXpljwf0
	MxVJjdD+MIVXeiiVeaC8eEO36bdJMHSiJ6aAgfJ4+UcZfJMNwSIEtQGAM8w/A2GECnGP6vJgL8FVj
	p/Rkz1BwCAMCDNZgLD2ODD6SXweV9VQ9X/SzUHQ2612N4NwWjHJ9BrLbxhcQb+KeodJKWceiieH6f
	VNQvykIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhF0S-0000000AchU-431u;
	Mon, 04 Mar 2024 20:33:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhF0P-0000000Acgb-0A5w
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 20:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B2FBCE069F;
	Mon,  4 Mar 2024 20:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223AAC433C7;
	Mon,  4 Mar 2024 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709584426;
	bh=+vUgXfLly9564GB6TAKpG+X4isiloia4IJPGxEv0M0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NThvY6bNrXVL3/dcCQa4m/D/F83UuO/S1jXhCSTc1RXQCdegroAN6Rt7/m8mjmuuy
	 blnOr0Fp5boFs5wIPF54FgzOLIo1YDfCBIEtxn23+/tBzykNemik0NQRisU4Nw/edb
	 MwD54cmY0WCMX9gMhwc7mlpi/r8N7VgbYcOeJuRTUXFRWMm6wTzs34+qoXWQJe7riQ
	 BxloNcbO5GN2OFkVfuSfXulw4QXDvrUAhsBfM0msb6MRfslFWOX6wSYqDZQ/vfzPjf
	 lVwzknc2yNuPiT5cZbHyOORbdcgq/jiHqoLGPU7x6JYV7s4zGUkrVEV7enE+IGZo1k
	 MnEx/bzuFMjqw==
Date: Mon, 4 Mar 2024 20:33:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: timer: Add Canaan K230 CLINT
Message-ID: <20240304-skinny-old-2fbbb0ee6aa5@spud>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
 <tencent_84166A6B39E6E062C4F8872436FAF1D10A0A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_84166A6B39E6E062C4F8872436FAF1D10A0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_123349_272233_BD3B53F9 
X-CRM114-Status: GOOD (  14.25  )
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
Content-Type: multipart/mixed; boundary="===============3074532846287134407=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3074532846287134407==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="amzJJAj79FLb+Rx5"
Content-Disposition: inline


--amzJJAj79FLb+Rx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 11:16:22PM +0800, Yangyu Chen wrote:
> Add compatible string for Canaan K230 CLINT.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index fced6f2d8ecb..9840a21c40ca 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -37,6 +37,7 @@ properties:
>            - const: sifive,clint0        # SiFive CLINT v0 IP block
>        - items:
>            - enum:
> +              - canaan,k230-clint

Same here, alphanumerically sorted please.

>                - allwinner,sun20i-d1-clint
>                - sophgo,cv1800b-clint
>                - sophgo,cv1812h-clint
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--amzJJAj79FLb+Rx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYwJQAKCRB4tDGHoIJi
0rECAP9gFv7OMFq/elzlpBLldmYGelbKu5hYdGkAyRIValwYFQD/atngNqIRUpkp
qzJLvCosjFdXcsD/Ab7HF4RmtsYnJQ0=
=NR9C
-----END PGP SIGNATURE-----

--amzJJAj79FLb+Rx5--


--===============3074532846287134407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3074532846287134407==--

