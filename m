Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB73C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV7Cku5OKID8lZ3FDn6tSQrFyve7Vhh828Wmu9Ios1k=; b=cvJgRQqArk7iOu53ajrxmvfymI
	Dp4srY3PUbSBQvuI7OjYlC8YR5yvI+CKMqBMD8WaE5jn33CXpqqJDrsqhX2N2xHFhaTNp3kZV+p8u
	iuuOL34w1S8ImkLdPjSl0mkl9nNc8EgEubayhH6a05Vah+2pre1DpE3bBGQfzYp6jf7s+oVEbukCn
	XsSP9VYz3324ppvhdQYGz3XV5/cD9JDrSbNR2dYOy21WLqroDz6uGRxWdMeu9fZbVwSrYMi1Wh9or
	cPfp51fnlMb2jJhDv8hfrDBRJZtSB4WFXd/hD+VTBBM7usLTw3dZQ1MzarLXdMIE4ISZJqYF6Qrqp
	f9AsvJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0jWr-003xsK-1T;
	Sun, 21 May 2023 13:55:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0jWo-003xrq-0A
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 13:55:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D65060CF5;
	Sun, 21 May 2023 13:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4273AC433EF;
	Sun, 21 May 2023 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684677315;
	bh=pBCLLi539NwV8+/W4KsfZGUmhSMDLjN83ORiIGsKyD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cK/ec9CWGi3yDybEdGIX95PeMdA5wkUw3wyv9C1tGRMVsm4jLQTJGRk8vN45t6DMk
	 gDy/AHrj628jCljwwcfoFfp2Tik+BvnFDfub90nmcKrLdIOdDhqbxLl6GEQq2119tt
	 te+xml+FGGJceSPUkNja7qe+J4F3waEdhq1STW5I6QCri9KjAMZJZSK1sDXdkH7av+
	 Ky0wWMiToEkdtTEW1YKuHfQxsEIXfPNDGaBJSgbMOoOpA5qsw3QKRxwYMhJ2zLXj1u
	 6ML7cx178L1/n3gb78O9xsmX5vMzQ0a37czOvSk4L7xL6q9uN5NT/OZv96P/h+0Jkg
	 TT3SPPqHKP00w==
Date: Sun, 21 May 2023 14:55:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: vendor-prefixes: add bouffalolab
Message-ID: <20230521-dribble-brook-7dd1ad2096bb@spud>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-2-jszhang@kernel.org>
 <a45c9193-aa63-650f-dbb3-14b6c3f74eeb@sholland.org>
 <ZGneH+ApaQVvv3SW@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZGneH+ApaQVvv3SW@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_065518_201006_A5EFB475 
X-CRM114-Status: GOOD (  25.10  )
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
Content-Type: multipart/mixed; boundary="===============1102171569078055218=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1102171569078055218==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FMaHoBVJWJuve3oJ"
Content-Disposition: inline


--FMaHoBVJWJuve3oJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2023 at 05:02:23PM +0800, Jisheng Zhang wrote:
> On Thu, May 18, 2023 at 09:53:12PM -0500, Samuel Holland wrote:
> > Hi Jisheng,
> >=20
> > Thanks for updating this series!
> >=20
> > On 5/18/23 10:22, Jisheng Zhang wrote:
> > > In the following commits, we will support bl808 SoC which is from
> > > Bouffalo Lab Technology (Nanjing) Co., Ltd.
> > >=20
> > > Add bouffalolab vendor prefix binding.
> > >=20
> > > Link: https://en.bouffalolab.com/
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 82d39ab0231b..3566346f2f9e 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -200,6 +200,8 @@ patternProperties:
> > >      description: BOE Technology Group Co., Ltd.
> > >    "^bosch,.*":
> > >      description: Bosch Sensortec GmbH
> > > +  "^bouffalolab,.*":
> > > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> >=20
> > Have you thought about using the "bflb" abbreviation as the vendor
>=20
> I did think about bflb vs bouffalolab. Here is what I thought: I came
> across "marvell" vs "mrvl" sevral years ago, I got an impression
> "marvell" vendor prefix is preferred if I read the discussions
> correctly.
>=20
> As for Bouffalolab vendor prefix, I have no preference, maybe DT
> maintainers can provide inputs here.
> Rob, Conor, Krzysztof, what's your opinion?

I had a look through the blame for vendor-prefixes.yaml since I had no
clue how easy it would be to find the marvell discussion - the commit
for gateworks' deprecated entry (done by Krzysztof says "Favor the
longer one (more descriptive)" & I think the same point is valid here.
I would have no idea what "bflb" was if I came across it in isolation!

Cheers,
Conor.

--FMaHoBVJWJuve3oJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGoivQAKCRB4tDGHoIJi
0nKuAP4hnuFH5NcKfffzyLkN8Barhu7GOpkz3/pxDVaBdSmPawEA7NUtHlY90ReQ
o+9cvTiUjzAl5IcXBx3fNh+I9wjCzw4=
=1Q15
-----END PGP SIGNATURE-----

--FMaHoBVJWJuve3oJ--


--===============1102171569078055218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1102171569078055218==--

