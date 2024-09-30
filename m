Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE526CE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQMpb/HK6p0TPDijfJOVaf3AZwY3rj+PuBtmpxZiF9s=; b=WeXNjjg3a84hN+VlXc0AcJ0oV9
	sIfkODw2N1UFG0LgHnKvoG+Y64VSueVlfyuMxfI3OcQy3YztNh+g8B5PbKOSGhsfSDgiMdSuzHv9c
	q+kp2wGyeVsdpvA0gtiBXCsrAooQuwWdM5Bd52eVaeYsIQQWan1NPZGkXsk5kQabtzEW0G4f1J0gP
	tVqdhZjcn26TybIrTFMg39t+Yf1IRR4oIBPVytvHhvsr2O284EtkAOwUAZ4XgiV1jrHmEFs9l5Fxh
	wU5HxKQJbab5E0IpdinC9oARk7kVqunvjTyLpeeXvwNJbH+1Tv++BeNh1+zLmO19ZxJLpIyP2Ab90
	Q2uiaVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAS-0000000HT8W-2BwP;
	Mon, 30 Sep 2024 14:14:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGqe-0000000HOsl-3D4p
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A943EA42574;
	Mon, 30 Sep 2024 13:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20DFC4CEC7;
	Mon, 30 Sep 2024 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704439;
	bh=pCgtNUlDws28YKTzJDQZoNSiw0mc+bFIyJBWjYcPoK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WysnG83CKIrIeBANzf2lJRzkrWWTNiiMDY7duwnOsKgmgmCSbRxlRRx2xiKF6PuNO
	 Nv/pq7bpYHa/MKtowGJTbtjI3MEOVqCqNGnRkg04RrBkGNLZiJqFChPzdauKe6UrmC
	 dPnCq+OX2vZiCWuXOXsfurSiF8qhcErbQrwt6+IuqhW5yQonZWRZLU7KZ07r26m4+j
	 c6/3YsNSscp+mnLbZVGiDooEGd07YyubftQXk1NuslGKgC2q+7sKO26XDWW26x3WJI
	 xuK/oUoJ+Td0I8GWnjArW5kd1T5jc+Lk91UO3/9pybt1iUbYd4jzoKROwNA2IcbVBu
	 /hJyaQkf7kqQg==
Date: Mon, 30 Sep 2024 14:53:55 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 14/20] dt-bindings: soc: microchip:
 mpfs-sys-controller: Add PIC64GX compatibility
Message-ID: <20240930-patio-portly-cd5d3c95152d@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-15-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-15-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065400_915372_217A26F3 
X-CRM114-Status: GOOD (  14.62  )
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
Content-Type: multipart/mixed; boundary="===============3777289896890747685=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3777289896890747685==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Hf2aEzpa7rylryo"
Content-Disposition: inline


--/Hf2aEzpa7rylryo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:43AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX is compatible with mpfs-sys-controller, without additional
> feature
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-sys-controller.yaml        | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mp=
fs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/mi=
crochip,mpfs-sys-controller.yaml
> index a3fa04f3a1bd..af89d5959747 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-=
controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-=
controller.yaml
> @@ -24,7 +24,11 @@ properties:
>      maxItems: 1
> =20
>    compatible:
> -    const: microchip,mpfs-sys-controller
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-sys-controller
> +          - const: microchip,mpfs-sys-controller
> +      - const: microchip,mpfs-sys-controller

NAK, v1 commentary has not been implemented here.

> =20
>    microchip,bitstream-flash:
>      $ref: /schemas/types.yaml#/definitions/phandle
> --=20
> 2.30.2
>=20
>=20

--/Hf2aEzpa7rylryo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqtcwAKCRB4tDGHoIJi
0of3AQClj5XAcu2rD37lVMgv2I7vxtKm1S4Djn4z1U4mVytKFwEAwwLrP0ODJjQb
IbOg/VwrTyRSuKT94PEUetB5QCDLMQU=
=UBFn
-----END PGP SIGNATURE-----

--/Hf2aEzpa7rylryo--


--===============3777289896890747685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3777289896890747685==--

