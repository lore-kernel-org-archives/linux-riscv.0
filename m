Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7804CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B8xdW0BZ7nhVDPe7BCXzBpq7xT9+ajyGkXimRV0Oeg=; b=gVnh5nTiWfr2snrt8545UbRsY8
	rR7sZMXx0aONnz/z7dCtLTQ0r/6phO25vlN2qCXafJ4FWcEs6bEany/CFvKglzr5OAs/tlndQ60RY
	gjeaimF99sbyH3X15f12QCzJ8jIc6SLvFBqm5DagHMjh8z/pS1q+tsU7sKhKiL3hgtBastq7LEMN/
	YxfxG2Dhrb43WYsUzF5c2xNj5HTARUfqxM54PyQiskodavthpHiCdPubsg+dlfOeB1qJVAgz9bTW+
	nHUgM1wFCYNnNUK4v1k4fAOmII8yboCyB3XAP32wbJtI2i0a5xjjz1H6u/0RYs1lGkVFy15oIpYnr
	sXKu8Tcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN93-009eoI-1f;
	Mon, 16 Oct 2023 12:56:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN91-009enR-0p
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 12:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460987; x=1728996987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owu+iKqUzWkQLtSBTtxj1zT2rwGvuD6S/GZDMO70pg0=;
  b=YIkx0kwIhS7Mdh+oFbrpkzBiUEyDIFYS2Iq10WMA98xB+GA4BTELNQRr
   pwOqWqLW6lFUZ273ZCAUeUisUtjkMk0ZaBX7VHuAPGzWHh3AzBz/oy6X8
   NczPpudc0jWjvcyQVW1xvUiLstVeklmmx532IH6ZdhDuuDG3Dh3hHY9t5
   3U4Y4TaInT6uC+2TsWncjpSVZLgg4qQT2DJY2bi9jgRsHh8zwLsyOsM7t
   IC8ze9MyB1qvprOkHMvtmOZj3RjmPUuAh/4N659YVbG/22U0a/ZpHeero
   rOGokSHSn7R5FOyVaxiPjSqmbsVaGJA9CY/wWw151UYp8UKqKOpB3pECo
   w==;
X-CSE-ConnectionGUID: MUYjPoOnQe+6O7A6bgCR6A==
X-CSE-MsgGUID: HFcEOj/NRFqcOiHhwh4vUQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="177204000"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:56:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:56:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:56:02 -0700
Date: Mon, 16 Oct 2023 13:55:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph Hellwig <hch@lst.de>
CC: Greg Ungerer <gerg@linux-m68k.org>, <iommu@lists.linux.dev>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
	<conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
	<linux-imx@nxp.com>, <linux-m68k@lists.linux-m68k.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 02/12] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM
Message-ID: <20231016-chomp-vitally-b6c004be7809@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20231016054755.915155-3-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_055627_359312_4E9BFA2C 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: multipart/mixed; boundary="===============5826861211964480035=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5826861211964480035==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ihs0Gu2JVloYpIJM"
Content-Disposition: inline

--Ihs0Gu2JVloYpIJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 07:47:44AM +0200, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -	select DMA_DIRECT_REMAP if MMU
> =20
>  config RISCV_NONSTANDARD_CACHE_OPS
>  	bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	select RISCV_DMA_NONCOHERENT
> +	select DMA_DIRECT_REMAP
>  	help
>  	   Adds support to dynamically detect the presence of the ZICBOM
>  	   extension (Cache Block Management Operations) and enable its
> --=20
> 2.39.2
>=20

--Ihs0Gu2JVloYpIJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0yzAAKCRB4tDGHoIJi
0hjvAQCuU+lkdZEJGHqzkwUX3I/m5Rjm/NNqvKylHzOsHPnU9wD+O+V5jY/UGcxC
5Y5HrOaAn3eYO5OnNXk29wyRBjksoAU=
=pzeO
-----END PGP SIGNATURE-----

--Ihs0Gu2JVloYpIJM--


--===============5826861211964480035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5826861211964480035==--

