Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A58D10F20
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwfnHpAeFJNDGHfd70H+dJQ8rnTvIPlkfFi3/YF3tnc=; b=EMpewpq0zq+motp2aWfdIBmFYV
	v2OgveId90IevzTodLxHA935FwWkuuoEJcWErOmVR7Ktt4JttLfPA04UMYZkWOPX9tlnA1TcbTe6l
	9iQcbKZBJnZTY5Vzjwh66gTRHkBFTop7dOk1eJSYPZdV85E5kFBVPne9c6VWUKRRaP24g5t3hvVr/
	frFCeo4MyB2FgNYvqVxaPII7NRzRmfESXEk8kvyD9I7l3llNXUgcYWtcYIzwsTaRaqtN8ypOPixde
	ia+jenmTmizANA73kRmG8qgJcZduxHt+h0GM0n7zQclnzDT4p8cUtxNKlcyr92QOEt7R2Rc7WHSRf
	8/YJRQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOChg-0000000EmN3-0qiS;
	Wed, 26 Nov 2025 10:24:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOChd-0000000EmMQ-1yey
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 10:24:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOChX-00022C-6h; Wed, 26 Nov 2025 11:24:43 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOChW-002aUK-3C;
	Wed, 26 Nov 2025 11:24:43 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BC06D4A895B;
	Wed, 26 Nov 2025 10:24:42 +0000 (UTC)
Date: Wed, 26 Nov 2025 11:24:42 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [net-next v2] dt-bindings: can: mpfs: document resets
Message-ID: <20251126-famous-hummingbird-of-fruition-13a9ac-mkl@pengutronix.de>
References: <20251121-sample-footsore-743d81772efc@spud>
MIME-Version: 1.0
In-Reply-To: <20251121-sample-footsore-743d81772efc@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_022449_533436_1198B492 
X-CRM114-Status: GOOD (  25.41  )
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
Content-Type: multipart/mixed; boundary="===============0112841494718734181=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0112841494718734181==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3sfs5o3fx6m5g7n"
Content-Disposition: inline


--g3sfs5o3fx6m5g7n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [net-next v2] dt-bindings: can: mpfs: document resets
MIME-Version: 1.0

Hello,

can I get a review from the DT people?

regards,
Marc

On 21.11.2025 13:42:30, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The CAN cores on Polarfire SoC both have a reset. The platform firmware
> brings both cores out of reset, but the linux driver must use them
> during normal operation. The resets should have been made required, but
> this is one of the things that can happen when the binding is written
> without driver support.
>
> Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN contr=
oller")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This is the second mistake in this binding, both spotted because of the
> driver being written (although this one sat downstream for a while for
> w/e reason). I wish I could say that I'd send the driver soon, but I am
> busy upstreaming things I wrote and therefore understand at the moment,
> so a driver that I'd have to go understand and review before sending is
> low priority, sorry!
>
> v2: update the example too...
>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Marc Kleine-Budde <mkl@pengutronix.de>
> CC: Vincent Mailhol <mailhol@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-can@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can=
=2Eyaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> index 1219c5cb601f..519a11fbe972 100644
> --- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> @@ -32,11 +32,15 @@ properties:
>        - description: AHB peripheral clock
>        - description: CAN bus clock
>
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - resets
>
>  additionalProperties: false
>
> @@ -46,6 +50,7 @@ examples:
>          compatible =3D "microchip,mpfs-can";
>          reg =3D <0x2010c000 0x1000>;
>          clocks =3D <&clkcfg 17>, <&clkcfg 37>;
> +        resets =3D <&clkcfg 17>;
>          interrupt-parent =3D <&plic>;
>          interrupts =3D <56>;
>      };
> --
> 2.51.0
>
>
>

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--g3sfs5o3fx6m5g7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm1WcACgkQDHRl3/mQ
kZzBVgf8Dk5jGCTiZqW6mNooZiWfVobVmrJXKGeWxn9ru6xMAj1vqqiPtaGtAc6+
PLHtSpw1qfMJ3yxq5W/8gjwRpTUW6rSFceNnd1YLEAMcgEuj0KrrVUvUfam/vHrN
FJ+J5qPkVJ41C6BWyo2QIl7ctfoWnja87nAvUSmHb/ry+EUYqZW8X83nRAClM6Ge
jByCkpixKaWkEkk55HhYzHd2PmRNxk7GQavXtbth0OtA+zfFYjNPWAUzlszC0Ugk
yLM5YIGE1jCvuzpz/DzFoHk8WAURWMiiwFT0umzrzAElEBccJnTLjKFQe7CNIcRJ
Au3+x63iuzSQiJSBiy1MrGraXUc6Fg==
=WFeS
-----END PGP SIGNATURE-----

--g3sfs5o3fx6m5g7n--


--===============0112841494718734181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0112841494718734181==--

