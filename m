Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A90C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt+xY7an7ozHR1QR6PYR7s0bCgpyQQ0hxDx2QykAeOs=; b=CILEHrxkuWMhE8tGArFJL+pKjF
	epeaI9yTZ8b+Xas/QBaZag7cyJjdhVF8NNJy5H+k1mIlTqsxLXIio5wBb94a6+Zi7kvaX8v9uGub4
	ZMRzHmrUgUFlBkjqZQWg5OCcAE50BnvbhwxEW0NVfg5Pvz4tLS2GkR6Z4eByUkJPJS+9k56r1fST3
	XGOolD+aCxZ8i92M/oSYrLCA5QLFpyyZCjXcQUjVDr4FXF2Y8FpxwfGqYsMYm/Sx46skaSgHGVSPJ
	Z1pEqC5TVMWs+9D0QHgaJ+gXnoHfDUV/RV/eAVw6aHwiqLlJv1P8RSsC1DedymmfVVcAPNZlLIw2R
	CI2iUKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYBJ-0000000H7r7-3XJK;
	Mon, 24 Aug 2026 17:09:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYBJ-0000000H7r1-15Zn
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E898742A29;
	Mon, 24 Aug 2026 17:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B490A1F00A3A;
	Mon, 24 Aug 2026 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591396;
	bh=FwmTQgduIcESVM14ioF4YCJ2FYEmLMqGqgTSkuep9b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KBE4zd6god5alO0ShtW7GkVbW2bSx08dA6sgkajjGqtJDJMdqBhppvL3/AAmYh7uY
	 aFqnh+QUazqvPsdVBAswvmlh4AyFhXUQ1AkzPgJlHGXmWbjpaatrszxSdcp9sKwEDp
	 N+jVv8V3zL1ZHJXvRUN2XjSNBEPkjHvdb4GhnFBpS8i81zAKYZfkHZe17rNg3afUr8
	 4eGiNf62laEB6aBRCozDokoSUqPCZnZbHHxDbkOEjZZuHEcJTjlmFqoskco0VFmqLC
	 PHhqx1p837AmjA7rcv9u5A+ATtHL99hRHdLtx0hgtrXvN1xLsES/yoJ/71YCAY8cNZ
	 /0DZei7eWWKSw==
Date: Mon, 24 Aug 2026 18:09:48 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 08/12] dt-bindings: net: snps,dwmac: Add compatible for
 UltraRISC DP1000 SoC
Message-ID: <20260824-bride-food-052b313e4b76@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-8-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-8-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============2821194762216310348=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2821194762216310348==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67g/wgnDkPTAfNY1"
Content-Disposition: inline

--67g/wgnDkPTAfNY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 01:54:21PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
>=20
> Add the SoC-specific compatible string for the UltraRISC DP1000 GMAC
> controller to the DesignWare MAC binding.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

The dts may not be right, but I am also a bit concerned here.

This binding permits 100s of combinations of properties, of which only
a very limited set can be correct for your device. Just adding the
compatible permits all of this variation.

Please add some restrictions.

pw-bot: changes-requested

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28..2ed4564ae99d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -119,6 +119,7 @@ properties:
>          - starfive,jh7110-dwmac
>          - tesla,fsd-ethqos
>          - thead,th1520-gmac
> +        - ultrarisc,dp1000-gmac
> =20
>    reg:
>      minItems: 1
>=20
> --=20
> 2.34.1
>=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--67g/wgnDkPTAfNY1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox63AAKCRB4tDGHoIJi
0nLRAQDinWB+XfM2/QTXUk4Ody64yC5jV6BrjL3lw7bW3tgNPAEA9v9bujPOE9gS
y6K7xdapP5bKe9eVLZuBpEH8dYS52wQ=
=xtCe
-----END PGP SIGNATURE-----

--67g/wgnDkPTAfNY1--


--===============2821194762216310348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2821194762216310348==--

