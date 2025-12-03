Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07620D12696
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOihH0+6yfiGU4vkU+/unwTlX7N7UX3d1AKHOt61wYc=; b=d4YePLtLXHY0p5FJVuZCsMzV2S
	HWzZZza9OtAmK7FvbN43BjV8CfDwH5pehktj66IHTPrMQTjW8LwoyfmTHA5P0fo06c2WWhh4LsRV5
	THlYHaorG90knfiYGprQZXWfam3ywU4kKilUFXkueM6RH8VJNHNdCxdo7Mj8Q7zXYhM/3PfRxCW6X
	TcvY0GQVu5XyK+LwQVMnnegKrF9enySkHMDbK0Sng9aVbaib5ALGQDgOgSIhfoEOI2YTWrFNw9OgP
	nOqsArbIs8DsGWMhlAuk0ZrPGVO4tssYWs2kLqfHBi6XSfBtztFllhVhTnheHUhS0WHTdG5FEpapz
	3y+m208g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjbd-00000006QZ1-2YMK;
	Wed, 03 Dec 2025 09:57:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjbc-00000006QYt-17Dx
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 504C56013C;
	Wed,  3 Dec 2025 09:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83980C4CEFB;
	Wed,  3 Dec 2025 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764755823;
	bh=7TXcT0Rxt5TH8FYE2ZYFdK42kXdlurdM+nltjM/pgV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LivCwCzCseRE8MQj2Vd+vhpsI2ucBDRp6fVGc9Z/ns26VD7ne3otPq1SfIypUC2MT
	 XFb0bDZVstaPRZvix1a8fijdGizsNawvfTWEWOJ+KgNpPqSrstpMDyO5QRPGQmme8q
	 MorOO3HaXlYE0weO72KF/z95l+854dkA5lpo9EDb0Dot66Zw7dDUHJWe2qS/aKwIxa
	 T+8I2WSJ41L19ca3NOGWPbVtx/LtdEXjViMgHPhF9mZqeDbOs96XStD6nrg4j6byyQ
	 9EPxc9f38rNauf8ofZmBq4/rN4c5fq9qmwuIicz3m9rU49gSHcxu47qBW/GD83Vvr/
	 dKJ4GCV2WyULg==
Date: Wed, 3 Dec 2025 09:56:59 +0000
From: Conor Dooley <conor@kernel.org>
To: q691800735@163.com
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: Add MMC support for Kendryte K230
Message-ID: <20251203-trapper-scorch-f3246ef45615@spud>
References: <20251203092614.219392-1-q691800735@163.com>
MIME-Version: 1.0
In-Reply-To: <20251203092614.219392-1-q691800735@163.com>
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
Content-Type: multipart/mixed; boundary="===============1156737976751467503=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1156737976751467503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqNzgeR8kogrNyT9"
Content-Disposition: inline


--eqNzgeR8kogrNyT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 05:26:14PM +0800, q691800735@163.com wrote:
> From: jybruceupup <q691800735@163.com>
>=20
> Add dedicated driver `sdhci-of-kendryte.c` for Kendryte K230's DWC MSHC
> SD/eMMC controller, enabling boot-essential external storage access.
>=20
> Enable driver in defconfig: `CONFIG_MMC_SDHCI_OF_DWCMSHC_KENDRYTE=3Dy`
> - DT-matched ("canaan,k230-dw-mshc")
> - Uses upstream sdhci-pltfm framework
> - No impact on other RISC-V platforms
> - Supports K230-based boards (e.g., CanMV DongshanPi)
>=20
> Signed-off-by: jybruceupup <q691800735@163.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index fc2725cbc..5848ec2b9 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -232,6 +232,7 @@ CONFIG_MMC=3Dy
>  CONFIG_MMC_SDHCI=3Dy
>  CONFIG_MMC_SDHCI_PLTFM=3Dy
>  CONFIG_MMC_SDHCI_OF_DWCMSHC=3Dy
> +CONFIG_MMC_SDHCI_OF_DWCMSHC_KENDRYTE=3Dy

This symbol does not exist in upstream linux, nor has any patch been
sent that adds it.

This patch should be in a series that adds the related driver changes.

>  CONFIG_MMC_SDHCI_OF_K1=3Dy
>  CONFIG_MMC_SDHCI_CADENCE=3Dy
>  CONFIG_MMC_SPI=3Dy
> --=20
> 2.52.0
>=20

--eqNzgeR8kogrNyT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTAJawAKCRB4tDGHoIJi
0t8eAP9EhcUOIl64otUND3eAtKtN1viqM5x9snyx9VikvYxG/gD/SvY3S8OMEqN9
oOanXtJBu6Z2rPNHq7bHroBU5U93EQA=
=/+UN
-----END PGP SIGNATURE-----

--eqNzgeR8kogrNyT9--


--===============1156737976751467503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1156737976751467503==--

