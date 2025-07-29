Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D71AC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 17:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLuQkVmxQg6CTomTymOUgwSuGprTl7psXu5f9VK9AUM=; b=gkesyidc2+kh+mJw1y2Ooastcp
	G5n7zDba66J7kCeXThOR1wZgkkwkOamli6BbnCQ+f/Zu0/QhYYC+jOTgX1H6NMSyXxnQUrELcfwNj
	qHvlHwt25FWjKSJLTL+VDk/+9I5l1NQmcI7PKof9OWone8eBzZ4MAQh/AbFQIlJkXAbbVSyX4hFrM
	MmYPkXuDDMyryU/Q7wisDcxo0sMcRsGBdebXAi/IrOln4SbraUHr8jxngiUA3AnVPxzK+/wWX/fd5
	JiSavgZcVUOOHA+WXGnd/RDyCHWnTecGJHyoD0Wn5TxUxd1woqnHBo1BLBMAZ1LPZ90Xm3eHRn+AN
	KKtZnXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoMk-0000000HNp4-0UJJ;
	Tue, 29 Jul 2025 17:43:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoMg-0000000HNnj-2sQy
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 17:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03C27A5482E;
	Tue, 29 Jul 2025 17:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A72C4CEF4;
	Tue, 29 Jul 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753811029;
	bh=/l0RfM32IYqNTyOacg15yW0ba6BjISJEK6fBJdD4dNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dR+CXQy2bNMOjZG/aIMfPdIyqxlqxyxLczcZUheXTXI4zDTc0Mlqui7Hwcwd1MyRK
	 pEsSNLS20jY6cX0FN8x7YkwRHq1UIaE9P7+nDNJ0qS7PaPlRiCmyfTjfVFa6XrQQco
	 UIfJBNyFj9O+A4G1CWum4EgSNyJ70zz2PtbSNxjoWnap8EZ3yaDo9p7lyxcTil50rP
	 /cizQHxnZKkeMDHyTXwZWWfMFxavaKd0Xc/lEpfYsYCCbpNcNiDx3XpykDv8d+matB
	 F/iGay/UesKo9Mlysa6vMtCme2trqgLR4Zp5MIyeX40XZ9xca1KZeBtq1UxyLut+VX
	 ElELx7L/IDPlg==
Date: Tue, 29 Jul 2025 18:43:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/3] dt-bindings: net: thead,th1520-gmac: Describe
 APB interface clock
Message-ID: <20250729-canal-stimuli-492b4550108c@spud>
References: <20250729093734.40132-1-ziyao@disroot.org>
 <20250729093734.40132-2-ziyao@disroot.org>
MIME-Version: 1.0
In-Reply-To: <20250729093734.40132-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_104350_856833_876A63E8 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: multipart/mixed; boundary="===============6445199710877365204=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6445199710877365204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8Ed6Kl6zSmD8JUqy"
Content-Disposition: inline


--8Ed6Kl6zSmD8JUqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 09:37:32AM +0000, Yao Zi wrote:
> Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> requires one more clock for configuring APB glue registers. Describe
> it in the binding.
>=20
> Though the clock is essential for operation, it's not marked as required
> for now to avoid introducing new dt-binding warnings to existing dts.

Nah, introduce the warnings. If the clock is required for operation, it
should be marked as such. You've made it optional in the driver, which
is the important part (backwards compatible) and you've got the dts
patch in the series.

>=20
> Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml=
 b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> index 6d9de3303762..fea9fbc1d006 100644
> --- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -59,14 +59,18 @@ properties:
>        - const: apb
> =20
>    clocks:
> +    minItems: 2
>      items:
>        - description: GMAC main clock
>        - description: Peripheral registers interface clock
> +      - description: APB glue registers interface clock
> =20
>    clock-names:
> +    minItems: 2
>      items:
>        - const: stmmaceth
>        - const: pclk
> +      - const: apb
> =20
>    interrupts:
>      items:
> @@ -88,8 +92,8 @@ examples:
>          compatible =3D "thead,th1520-gmac", "snps,dwmac-3.70a";
>          reg =3D <0xe7070000 0x2000>, <0xec003000 0x1000>;
>          reg-names =3D "dwmac", "apb";
> -        clocks =3D <&clk 1>, <&clk 2>;
> -        clock-names =3D "stmmaceth", "pclk";
> +        clocks =3D <&clk 1>, <&clk 2>, <&clk 3>;
> +        clock-names =3D "stmmaceth", "pclk", "apb";
>          interrupts =3D <66>;
>          interrupt-names =3D "macirq";
>          phy-mode =3D "rgmii-id";
> --=20
> 2.50.1
>=20

--8Ed6Kl6zSmD8JUqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIkITgAKCRB4tDGHoIJi
0s21AQDDnogQVz1heV93wFEUee+EeHPjK4d6lAcPQOYd21HVkAD+M13qwek9DiWx
oGRpnMWXsj9s2GrbkbTgiGGiHXOYWQk=
=EOvL
-----END PGP SIGNATURE-----

--8Ed6Kl6zSmD8JUqy--


--===============6445199710877365204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6445199710877365204==--

