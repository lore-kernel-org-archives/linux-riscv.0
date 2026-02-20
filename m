Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A7AC55170
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueSHZouAZrgurw3feOemnPcpukzk60j6dnFNS2fPPYw=; b=IMCBCsoH7sbVqCNxpZ5VvPqF/K
	3/vwLvcaNLEm05i8y5i3FILcMSSe/lFC0MC4u589pThltwyyCVbRk3XMmcU5YeBo6iFBdiiRPSp+M
	Pdgh8Bp89dEXaPTvmEI/yBS8aPSbgUm+8s2DTJIL92Tp/VIAaVGF1oXVz8vBQvPYoorVIULmx1U9P
	e+HnjLx3c/8lERwFGRpKb5QYYIabSiZuMmKsmjurq3xSKoeC0UHR0hMzt+wYFFajuyh8DcdVxcihG
	vooIBm6RQeeU/GW7/MVEYd/feka6LLp5mMkbpIx6NVaZdwz+L6k8h47ysiVKfUOdWPHC+Jy0iZVhO
	PduFXsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMjP-0000000DTS2-2Djo;
	Fri, 20 Feb 2026 09:23:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMjN-0000000DTQy-35FF
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 09:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCDD160054;
	Fri, 20 Feb 2026 09:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E031C116C6;
	Fri, 20 Feb 2026 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579404;
	bh=ZVuv+x9tPz+fDZyhArJNw6i1SChHYu51WPdKwBP8+Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hyv6KPsNMuwhEbvzZUJbwLNH0LcFZBIWp64TFIMsMaQcjJy2M3zCIwNREfnyporKy
	 kFOOZRxjAoYtnAIlYeyS3+fcuY8pRih7PfL5ZR7k5dF8WBDEAwzpVdC80pnPTO2s0O
	 6RbqyrKQlnKidPOjyuTTJjrxlZs8vnLZQE13kiuTrjkAtXmZeR8fQK6ZGp/0IhW6SW
	 tg/csmgsV1lSz/gBE91qjXkaAKxDJRe0C6m9z5gnN4lL4RBXPp7WJXnZ5vPoxg8KVW
	 j/OG3ZcT6rvz/BoDP+YvC/BTT8fOGozqViAdbfj7ABjxoC/LrO+AyTdRY4hGiY9QKU
	 nh3IEhKMLGkvw==
Date: Fri, 20 Feb 2026 09:23:18 +0000
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
Subject: Re: [PATCH 2/5] dt-bindings: interrupt-controller: Add SiFive
 FU740-C000 PLIC
Message-ID: <20260220-contest-ambiguity-1a4099520bdf@spud>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
 <20260220-fu740-v1-2-c8af54130c58@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260220-fu740-v1-2-c8af54130c58@sifive.com>
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
Content-Type: multipart/mixed; boundary="===============1272031671342282753=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1272031671342282753==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mSZIL8+HAWfjN46u"
Content-Disposition: inline


--mSZIL8+HAWfjN46u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 04:27:06PM +0800, Max Hsu wrote:
> Add the SiFive FU740-C000 PLIC compatible string to the binding
> documentation.
>=20
> This follows the SiFive IP versioning scheme which requires SoC-specific
> compatible strings for proper hardware identification, even when the IP
> blocks are functionally identical.

So do the general rules for devicetree bindings, that's not something
SiFive specific FWIW.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml     =
 | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index e0267223887e..351d26ab1956 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -63,6 +63,7 @@ properties:
>                - eswin,eic7700-plic
>                - microchip,pic64gx-plic
>                - sifive,fu540-c000-plic
> +              - sifive,fu740-c000-plic
>                - spacemit,k1-plic
>                - starfive,jh7100-plic
>                - starfive,jh7110-plic
>=20
> --=20
> 2.43.0
>=20

--mSZIL8+HAWfjN46u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZgoAgAKCRB4tDGHoIJi
0iyBAQD6/QrKP5wWk8N0yZGMywRDF9hJKlEcvyWXA/wDi+YeYgD+NOLhtmQyyOmQ
LB+WDVS88sSEEulhWbQdhniOZQPG/gc=
=DGDe
-----END PGP SIGNATURE-----

--mSZIL8+HAWfjN46u--


--===============1272031671342282753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1272031671342282753==--

