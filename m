Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A94C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnVJTrjG3jgQ3zpGpKmuSFbHbcrqy7louG7En9y5Gms=; b=Fgtx2NFCuuUuRIIteSND+qMMgg
	jmZ7myUoeZSakd9OweAEh8xIXHMf6SuZFBdFL5AHnyc8mLYhgLhzbb6Qx4mDoqu2oT2GI28FaKHQe
	Wxj3bXEitMEI41nDv2fp4M1R9JXTVDXaLQVTb/BRpN7yxvogXSV2ibyb+hfsKcdOlIaih4ksc47qU
	TCwSVD39LO4kxwf6EaIEqMXtUJYERECW9ojza9FtgcXvGPYMZ2SUz50BKatpNL6ct4gq2ZQQKivJU
	MqgscFgyJLiJj1ZB3EY7ESDuEFhYa5/kXHHubCNIll3n8VOgdZI4kLko/INyH5sx5364kvwuvbQS0
	hQ+61Y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzXm-00000001Hy8-3NuZ;
	Thu, 25 Jul 2024 14:34:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzXk-00000001HxO-1ja8
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99178CE0FAE;
	Thu, 25 Jul 2024 14:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EFEC116B1;
	Thu, 25 Jul 2024 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721918045;
	bh=lEZEpDvFTWSV2VSZIoUY/qg4sxnX6WaUiNUVms4Rh8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/5cTZXm0W/giFyipn0WT+M7ObbIv4K+DDS+TbjlBs0Zi3ydeR+Pm5BVk29d/VMBx
	 3AiT2q9mcnaEA/TXxinbxxGkJt0FYezj+ZZkw14GuYyAtPlR15xoWqgnPVNlqQJQdO
	 vGrpAdNLcRCf9TKg9l8MgxA/7C7O42tt0Is6jZgzPs1xxc1JCKAze9k/NaFdfCn/UW
	 C9QLYLpwgKMJ+OafwVf3bnl6bALPd4XKcmrH4wsIVIlqOGLTaooWXEkX+xJRtSf02d
	 C2jtty14cua2ffVnzI2001wn3Ye0P40KxzwrFyKKl5zzXma87KHdEsvfhaE7Qcw2mU
	 P4HHk5kyVTxrg==
Date: Thu, 25 Jul 2024 15:34:01 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/17] dt-bindings: soc: microchip: mpfs-sys-controller:
 Add PIC64GX compatibility
Message-ID: <20240725-jackpot-tapping-fae83673a04d@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-15-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-15-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_073408_648836_33BC03EA 
X-CRM114-Status: GOOD (  16.50  )
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
Content-Type: multipart/mixed; boundary="===============7326325171139558663=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7326325171139558663==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QgTWijV28ZC96G3W"
Content-Disposition: inline


--QgTWijV28ZC96G3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:16:06PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX is compatible with mpfs-sys-controller driver without additional
> feature

Bindings are about hardware, not drivers. Are you sure a fallback is
appropriate here? Does the system controller expose the same features as
it does on PolarFire SoC? For example, FPGA reprogramming: the driver
creates a platform device to which the auto update driver is bound - I
don't think that that is appropriate on a pic64gx.

Thanks,
Conor.

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
> =20
>    microchip,bitstream-flash:
>      $ref: /schemas/types.yaml#/definitions/phandle
> --=20
> 2.30.2
>=20
>=20

--QgTWijV28ZC96G3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJiWQAKCRB4tDGHoIJi
0qO/AQDHS4tIeC40U53nkW2mvlvdDVc93b6zd9C2Ij8wPVc5XAD9FE5pgk2AkakY
f2Zrj4sp+eYAE9LaRofUTAh3pniqgAo=
=Ed3R
-----END PGP SIGNATURE-----

--QgTWijV28ZC96G3W--


--===============7326325171139558663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7326325171139558663==--

