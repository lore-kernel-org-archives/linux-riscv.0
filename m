Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D300C624D3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7VfWjySEP6VrpXzu/T7otLL+FuEzlz3R1nyIeM3h6Q=; b=BoGYzod3S+uKrI00o1Out9krI7
	HtSxjUv7xdtt/j/ODMlMWZbhaCx6aEbOdZAnGGivutC0ncIgKW7OFu7VzAMDZd0J2wsSNivaYOlUS
	Zct1DJNc7YeNemhJ85sjQNw405YT/WpmDazBQEUXVYwxRnB+01OjriTXEdRJjhl/d3YBCI4MhyS2D
	GWJ9POKklwgnLpfae274pwUmsgasodltjHOFRKnMy9TQp2TwmVVq+a7m3PeEHJ1VgjMhhG+xR9xZV
	WnAeP9uV+t0iZlgtrwCek/dhDtvxqtndYCLYLuXUkhbsLFYzQHCQwVzA6MD+l/dlHeTStS/Otg1er
	Z0IDg/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pJL-0000000FXHu-2ITv;
	Wed, 02 Sep 2026 18:03:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pJJ-0000000FXHh-3XF2
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 18:03:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E41D43C23;
	Wed,  2 Sep 2026 18:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8A41F000E9;
	Wed,  2 Sep 2026 18:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372225;
	bh=Uj9/RDwv9k2iRrF8z8+r037C19R/tl/T6HaynuHBg7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YryQdOG6rCS+CoxXuEhmKqZdD8O0bh7F0WgNxh8InFZjr/iLSM0valYUf4rdXM5E6
	 Vxe3whVlTKMY0QPvSa04XFtUlbX8YsISoVn3NrW+crTxg88qsYsTr3tnLISd4Kd8Dt
	 iYtrHEj2YTmG3kJJLChg+lb7XBELtrMweBQCCo7iZ7+muXc64rjY96EBBYmH/+R6ie
	 NwZVU3R9XH//x33Z0hYhHJPSQgGQgNRvyr5CmG+ouEnbkdMnmMRfgYhJMMsAhhnpiT
	 jMljJ/6L/ziJe6kbaA5W9kRZrJn7mcUOgv+T88DR0r/Pk39Ub4KzjoNcLcZbgbgdgO
	 1DQu/IxJCAB5w==
Date: Wed, 2 Sep 2026 19:03:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mmc: spacemit,sdhci: Add tx delay
 property
Message-ID: <20260902-crept-player-b3f30ab4e6f6@spud>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-2-4e7909cf4233@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-2-4e7909cf4233@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2506834946109195186=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2506834946109195186==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JPvI9JMjjGIUeUlx"
Content-Disposition: inline

--JPvI9JMjjGIUeUlx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 07:03:13AM +0000, Yixun Lan wrote:
> From: Long Wan <long.wan@linux.spacemit.com>
>=20
> Introduce a vendor specific property to configure the step count of TX
> delay line which should be applied before RX tuning, compensating for
> board level trace differences. The TX delay line result comes from test
> out of real board which vary from different hardware layout.
>=20
> Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Everyone seems to have their own custom delays, so what's another..
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/=
Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index f35bf7ce08dd..3399a2d076dc 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -63,6 +63,16 @@ properties:
>    pinctrl-1:
>      description: Optional pinctrl state for 1.8V UHS operation with "uhs=
" name
> =20
> +  spacemit,tx-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description:
> +      TX delay line setting applied before RX tuning, compensating for
> +      board level trace differences. This is a delay line step count with
> +      no fixed time-per-step conversion; determined empirically per board
> +      specific, used on SD/SDIO hosts.
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.55.0
>=20

--JPvI9JMjjGIUeUlx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphk/AAKCRB4tDGHoIJi
0po+AQCA6PqLcTKT7imRX8EmzXyV4cbV44EdaTRHvitAdUV6IgD/ViMPsvHGYEO1
7Ph5zn0Vyp3Oo8iHwbyKP3VfMdWVMQg=
=fS0X
-----END PGP SIGNATURE-----

--JPvI9JMjjGIUeUlx--


--===============2506834946109195186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2506834946109195186==--

