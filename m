Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF67C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANu5TTAo/Wws5ltcZuG/jSyMjcnfJlDwV32QjVLJv9s=; b=U+MRZ/dbQNf2bDvi6A6Ro+y7Lr
	WUHF+qFk4KPEasRfIfXOuSbPtEygg0gNtFgAAHzS/8SNA+2Aj70znW2lQXEABGjdRaLmyatdtG21h
	3LNZahZF5aI5rlFataO7QRq0TGxrzQei6XJF99ca0Z+fBKdW6Rtnt1DAfvx2CSc9AqDEwz2lThXlg
	pfM1eqTmhjDJjIUeaThcMbJjdTBCdIF/td5P0LkWON5nHxtaGTTHpHqNhgULfhL5G6HL1xO2fatUR
	FakC3hMWiL6G00YSxg2CImrcsXuSx8ijinWrGuSHfY7M4nPfLObYBDNo5HDyxvbyW+8boFydk5Qgv
	YpRcfX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzOX-00000001FEG-3eNH;
	Thu, 25 Jul 2024 14:24:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzOV-00000001FDl-2Eqo
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D947DCE1393;
	Thu, 25 Jul 2024 14:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF33BC116B1;
	Thu, 25 Jul 2024 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917472;
	bh=ynYqNYpFP8nF9JjVVaAwJ/O5Egn7q4qJq5uapoFKe4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNu6cctlLHj2aYXV6ZBGkUceYn+n2BjAE1KviFclbQlOzLXLhM4CNnyagJGrd73gk
	 bDJieBU+VL24KnRm46sgX4xUDxougT6COyS1xeqnHjrqsEwKw234TfqIszH1iu6h4l
	 y6PUbqkDxd4TXkGnGV3nAWYGWCH/50PlKKtHUJSv5OLLb94eGXWvG3S5XWfsIcYQSM
	 uZYTa/wijU4zEMZZoIT/7ylrpMSjkYFgjbRyDBi3Fpf7MOZPpmdLajTNMUZG88bZkB
	 ikOF88h2PxJeKc3lxlacuI9rfBdxTzlKtnZYzkuBpWROve/t7NwdkCXcyVcafHoZ+h
	 lc3YIt9Gz7kHw==
Date: Thu, 25 Jul 2024 15:24:28 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] dt-bindings: i2c: microchip: corei2c: Add PIC64GX
 as compatible with driver
Message-ID: <20240725-cycling-nature-5e0157e180e3@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-11-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-11-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_072435_769780_6A835F39 
X-CRM114-Status: GOOD (  13.65  )
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
Content-Type: multipart/mixed; boundary="===============4449155664599622028=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4449155664599622028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T4MlqbveCHqxxDay"
Content-Disposition: inline


--T4MlqbveCHqxxDay
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:16:02PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX i2c is compatible with the MPFS driver

Please don't talk about drivers, bindings are for hardware.

>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml=
 b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> index afa3db726229..4ba8a27eb8e5 100644
> --- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> @@ -18,6 +18,10 @@ properties:
>        - items:
>            - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatib=
le SoCs
>            - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c=
 IP core
> +      - items:
> +          - const: microchip,pic64gx-i2c
> +          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatib=
le SoCs

Why is an mpfs-i2c fallback required? Can't we just fall back to the
fabric IP?

Cheers,
Conor.

> +          - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c=
 IP core
>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP =
core
> =20
>    reg:
> --=20
> 2.30.2
>=20
>=20

--T4MlqbveCHqxxDay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJgHAAKCRB4tDGHoIJi
0q+9AQD//e7E3xWxJ1vAVzogdPdHSnLZd0MfwKAmbe060kXDRwD/cc9nchqUhGni
k4EVfdxZjrYvDaqv/1fHm3dxaVTrFgQ=
=lynY
-----END PGP SIGNATURE-----

--T4MlqbveCHqxxDay--


--===============4449155664599622028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4449155664599622028==--

