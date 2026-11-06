Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF1606A337
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dEWuBxhE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KavtPbl8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EMFi2PjRGQ+mAp0DvltyOMe+bddUG4ZelZx91tR7jT4=; b=dEWuBxhElGg0rZVUrr7FaEkb7m
	XkPmB8TTNHsmsq86T/KCJaYQUgSlk+LT4MSIESbUXjdeyCx+Epg+Pua1kE+C1vgS7OPCvA+gOgQeH
	Vt2WUDs6awK9h0adlantSn40ojV8fFZyIXzniL0V+GA1whlE1KKyHBZck8IZbBRRDUEYnZ9b2JstW
	87z6Hxj7PcwgaccxqfCbPqlExCvtRmqUo2cPogtaQrOYmQbS97cq/r9cSevIsJlbVI6uFIIPFCeNK
	rzmqg+QefHlYAs9XxquojOiUdz/c9SniJsxcP3TmS/mucH5ycyaZ5RPNmFkTY++zatUdU093KFZeb
	YFpK1tYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUm-0000000DNGu-0iKq;
	Fri, 06 Nov 2026 18:17:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOUk-0000000DNFa-3JQI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:16:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD55260052;
	Fri,  6 Nov 2026 18:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598931F0089F;
	Fri,  6 Nov 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793989017;
	bh=w0VSteOSDHzDJMMZlPVFDnksNQwbIiA9tfmca7n6AqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KavtPbl8UnPg1FIv7HRBd0pFzHPrSUQlTt90GE6CtORA4iOosOZ5mR/hdZk1+l/qi
	 jageRticCNg+PWLnKMivdGaCUSOJIOipCBa6IBGCjd+nb+xP8+WAzNHfGLuyuqf/qg
	 irUJtFT/yD4Epb5flnuVNtRdQodXHsR9RayaC40lLQJb3QBWlhalqflcPgNrZOiws1
	 gHMrMvr7a8cNj+i1gZxHfPrDMMlH5TnQLIcavAoF3g5NLuA1R+LQyAz+Aj/K0vkYzK
	 WdjA0pjHLtAA+VCHmYn8XnZ0W+RW6IGux+BKponKdsIErmvZyNzoEmoykp0z0ntVtA
	 iHc/LHte9UBYA==
Date: Fri, 6 Nov 2026 18:16:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add StarFive JH7110 RTC
Message-ID: <20261106-skyline-elaborate-1d30d5e99de5@spud>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
 <20261106175600.3877614-2-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106175600.3877614-2-oo.hehir@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1329782465925559939=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1329782465925559939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y+/7ryyc8QG4aH7I"
Content-Disposition: inline

--Y+/7ryyc8QG4aH7I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 05:55:58PM +0000, Owen O'Hehir wrote:
> Describe the RTC in the always-on domain of the StarFive JH7110 SoC.
>=20
> Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
> ---
>  .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110=
-rtc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
> new file mode 100644
> index 000000000..95edddea1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Real Time Clock
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>

Really, this should be you or someone that actually cares about the rtc
on this device, not the subsystem maintainer.
pw-bot: changes-requested

Otherwise, this looks fine.

Cheers,
Conor.


> +
> +description:
> +  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts =
BCD
> +  time and date from a 32.768 kHz clock and has an alarm, a frequency of=
fset
> +  adjustment and millisecond and one-second pulse outputs.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Millisecond pulse
> +      - description: One-second pulse
> +      - description: Alarm and calibration events
> +
> +  interrupt-names:
> +    items:
> +      - const: ms-pulse
> +      - const: sec-pulse
> +      - const: rtc
> +
> +  clocks:
> +    items:
> +      - description: APB bus clock
> +      - description: Calibration reference clock
> +      - description: 32.768 kHz counter clock
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: cal
> +      - const: 32k
> +
> +  resets:
> +    items:
> +      - description: 32.768 kHz counter domain reset
> +      - description: APB bus reset
> +      - description: Calibration reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    rtc@17040000 {
> +        compatible =3D "starfive,jh7110-rtc";
> +        reg =3D <0x17040000 0x10000>;
> +        interrupts =3D <10>, <11>, <12>;
> +        interrupt-names =3D "ms-pulse", "sec-pulse", "rtc";
> +        clocks =3D <&aoncrg JH7110_AONCLK_RTC_APB>,
> +                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
> +                 <&aoncrg JH7110_AONCLK_RTC_32K>;
> +        clock-names =3D "apb", "cal", "32k";
> +        resets =3D <&aoncrg JH7110_AONRST_RTC_32K>,
> +                 <&aoncrg JH7110_AONRST_RTC_APB>,
> +                 <&aoncrg JH7110_AONRST_RTC_CAL>;
> +    };
> --=20
> 2.43.0
>=20

--Y+/7ryyc8QG4aH7I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4ZlAAKCRB4tDGHoIJi
0u3QAP9iXmVACPlMqrsukwxvGGlu7UXlmHrZIe49uW1XNeip+wD/cF9fDbYx11SI
XVeLyV4S0JyXiW6UQiLkHm7vFH/qVQc=
=uLvR
-----END PGP SIGNATURE-----

--Y+/7ryyc8QG4aH7I--


--===============1329782465925559939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1329782465925559939==--

