Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C4DC55170
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVqKHV1cg4OrMQkgYS21i2N6x1yTiuduFty/jHKnaPM=; b=qKInFK6h0chX6QJU4v8GZxv7PC
	nFZwpTzo/JNOfm9oXPSD9dnboK61lPHyv5fTk5/Q+z0ktzRwwZhMKILhzSedrZpDzyYrUwdgctT4v
	g/jnJxAIGFX69/EptHfNV6rvz6dhfS3kbT9v8OnzDuGfCKxAB33POYbF/wfqU8/W+7q9ArGGqE2/L
	34OI+6G05Ramozp9gonoAolMDSA32p8rUhURmRcLi1SI9nEHRppDtT7Huf/MTITssXu/+SBCuZl+Y
	HkEU5QBK50IpH7LVPxJ3Elvbrx4PSgR2lUfH4zh4IkIW6mz/pMuVPmXBxsH1YF9xTlLUewi9a80hy
	1ahAwTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMpP-0000000DWT0-19hs;
	Fri, 20 Feb 2026 09:29:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMpM-0000000DWSS-0qd0
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 09:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88F1D435E7;
	Fri, 20 Feb 2026 09:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BABC116C6;
	Fri, 20 Feb 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579775;
	bh=1I7Qtp/lo2yxzhdgjzwU99gB6b79DwIjAoM2q/13oPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+xa95bOKq4vStUjKCEvRwSYMjU4F2npiVuz0zgivxI2r31Qnp+4m+c6bRTPl5B4t
	 pUetHqghAyPri7Pudi9Yfd/jEnJ9TlZUM5P7PD7Utoj2YbXpDpHSPn21LGs04MFNRz
	 LgeqUansSyoXgnYxO+iNuIjkQIRvi57h0flp7GL5uSXdk3hPPVU6bVOiVAIJKdKdDn
	 BssoAX+eR+kJcZGkMj9LJEZKX07nuZgYs4gnidiV/y/QhfjGq+eMnmSo0a/si9PbMC
	 SIOwfMDpCubSpy36VN4XjwfPdy+qHcFbxpGtEuL3cbE4fuCvh02QjMihTfhqGiaraz
	 F5gxbtIn/QfPw==
Date: Fri, 20 Feb 2026 09:29:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Max Hsu <max.hsu@sifive.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/5] dt-bindings: net: macb: Add SiFive FU740-C000 support
Message-ID: <20260220-repeal-glitter-acb73cc75564@spud>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
 <20260220-fu740-v1-1-c8af54130c58@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260220-fu740-v1-1-c8af54130c58@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_012936_279875_9AF63B4E 
X-CRM114-Status: GOOD (  19.97  )
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
Content-Type: multipart/mixed; boundary="===============0748290846058263016=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0748290846058263016==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5HKymcCcP91liaN3"
Content-Disposition: inline


--5HKymcCcP91liaN3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 04:27:05PM +0800, Max Hsu wrote:
> Add the SiFive FU740-C000 ethernet controller compatible string to the
> Cadence MACB binding documentation.
>=20
> The FU740 ethernet controller uses the same GEMGXL management block as
> the FU540, which is tightly coupled with the Cadence MACB IP. This
> follows the SiFive IP versioning scheme which requires SoC-specific
> compatible strings for proper hardware identification.

Your rationale for this change is misguided, as this is not a SiFive IP,
so that document does not apply. On the other hand, the general rules
for devicetrees require this so this just means a change in the
rationale provided.

>=20
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Docum=
entation/devicetree/bindings/net/cdns,macb.yaml
> index cb14c35ba996..b46dde1da170 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -63,6 +63,7 @@ properties:
>            - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
>            - raspberrypi,rp1-gem       # Raspberry Pi RP1 gigabit etherne=
t interface
>            - sifive,fu540-c000-gem     # SiFive FU540-C000 SoC
> +          - sifive,fu740-c000-gem     # SiFive FU740-C000 SoC

I don't think this is right, since it is identical to the one on the
fu540 (as evidenced by how it has worked until now and the contents of
your driver change). I think you should add the fu740 with a fallback to
the fu540, like the devices from Microchip that fall back to the
microchip,sama7g5-gem. The rest of the changes to the driver and binding
can then be dropped as they'll be redundant.

Thanks,
Conor.

pw-bot: changes-requested

> =20
>        - items:
>            - enum:
> @@ -74,7 +75,7 @@ properties:
>      minItems: 1
>      items:
>        - description: Basic register set
> -      - description: GEMGXL Management block registers on SiFive FU540-C=
000 SoC
> +      - description: GEMGXL Management block registers on SiFive FU540/F=
U740 SoCs
> =20
>    interrupts:
>      minItems: 1
> @@ -181,7 +182,9 @@ allOf:
>          properties:
>            compatible:
>              contains:
> -              const: sifive,fu540-c000-gem
> +              enum:
> +                - sifive,fu540-c000-gem
> +                - sifive,fu740-c000-gem
>      then:
>        properties:
>          reg:
>=20
> --=20
> 2.43.0
>=20

--5HKymcCcP91liaN3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZgpeAAKCRB4tDGHoIJi
0irpAP0SUJFhZrfZ7GbhicinRgZw5rR0S2wuNO2cdDCESgQOogEAr+OAoDbIw4nq
Etix2x3W8zaNk0pHyVg5KDRHTDlkfAU=
=jna2
-----END PGP SIGNATURE-----

--5HKymcCcP91liaN3--


--===============0748290846058263016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0748290846058263016==--

