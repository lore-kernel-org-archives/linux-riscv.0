Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282BFCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB+Cj44iOZBguQt6DSld3t/LJjtHA7aYU6c/wLfc3yY=; b=ZahZyLJenvFKsjP69kBMlBpeYK
	JJazlLYTSRZoGDXRsM/nYNzkgebAGsrF3d46+mylnxS9HqwDh2Tx2yPoVkf9+9Uv/j5AjxeAHK/Tq
	rENiSBHYUOJ/FgRcuycILSnPtYI3M8np49tmM0EmZsZTMxMGzjwJ3MMHt3u97AqlospRlwTjIfVzT
	KAJjQITQZ7EqKhYVBwR8qEHR4gpFBnCLeLVhx7/A7ACwr/B6pYs7zQPQC3w7Z1Ow+dgbzrpKcYonj
	yASQqQ0G5PILGEPgOg3Do7LtnFb8Z9zYYjgQUOTr7l0Cx6BiMsGiTLzW05TzduOy80hL6K9g1o5Ld
	iaYu3T9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN3K-009eAR-2x;
	Mon, 16 Oct 2023 12:50:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN3G-009e9T-1X
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 12:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460630; x=1728996630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QegDkNMZMRhVlJdi4RGF/B2gb0RjIiBMZVBOlKntRnE=;
  b=cNK1119pjw4agWk3gUJPv0hMzJBwsou+SlkFYFi53i0cfxQRNQg8uUUk
   wSvrmMBUGHn3FpGdYq68nuf9kD21fXnYbduXpHGzDDoD2RlERKt3a/6Mx
   jJXPSObMBW1R0tdAWr7PR+DKfXSOgXOwgiZnhjuCvPeIqy7hbsTEeaQOl
   Si5lrcfTgt7wdSrwZ3BGgJrp0bfRCz9CYkjygRCwXv1otHihBtwuG97xb
   7ouBOGIT6X1YjVj2W75eG5yZSCMq1gxz7+IWyfHVUva0etnTgTzIGCZLT
   kIjh75LUg9Ep4CLFndItLCC9LEJfRVELYg4FC5IgQprF7xmxQCPraBWXU
   A==;
X-CSE-ConnectionGUID: ITNzLPtcTWajHI2MYV7Rww==
X-CSE-MsgGUID: +uJSPN5bQBOp65OEvyXvMQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="240802253"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:50:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:50:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:50:02 -0700
Date: Mon, 16 Oct 2023 13:49:41 +0100
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
Subject: Re: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't
 depend on RISCV_DMA_NONCOHERENT
Message-ID: <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20231016054755.915155-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_055030_586173_0C31D3FF 
X-CRM114-Status: GOOD (  23.69  )
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
Content-Type: multipart/mixed; boundary="===============0116804701513279956=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0116804701513279956==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H4bRYPb5tXhOAmff"
Content-Disposition: inline

--H4bRYPb5tXhOAmff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Oct 16, 2023 at 07:47:43AM +0200, Christoph Hellwig wrote:
> RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
> helpers, which are built into the kernel unconditionally.

You surely have better insight than I do here, but is this actually
required?
This patch seems to allow creation of a kernel where the cache
maintenance operations could be used for pmem, but would be otherwise
unavailable, which seems counter intuitive to me.
Why would someone want to provide the pmem helpers with cache
maintenance operations, but not provide them generally?

I also don't really understand what the unconditional nature of the pmem
helpers has to do with anything, as this patch does not unconditionally
provide any cache management operations, only relax the conditions under
which the non-standard cache management operations can be provided.

What am I missing?

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig          | 1 -
>  drivers/cache/Kconfig       | 2 +-
>  drivers/soc/renesas/Kconfig | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d607ab0f7c6daf..0ac0b538379718 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -277,7 +277,6 @@ config RISCV_DMA_NONCOHERENT
> =20
>  config RISCV_NONSTANDARD_CACHE_OPS
>  	bool
> -	depends on RISCV_DMA_NONCOHERENT
>  	help
>  	  This enables function pointer support for non-standard noncoherent
>  	  systems to handle cache management.
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index a57677f908f3ba..d6e5e3abaad8af 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -3,7 +3,7 @@ menu "Cache Drivers"
> =20
>  config AX45MP_L2_CACHE
>  	bool "Andes Technology AX45MP L2 Cache controller"
> -	depends on RISCV_DMA_NONCOHERENT
> +	depends on RISCV
>  	select RISCV_NONSTANDARD_CACHE_OPS
>  	help
>  	  Support for the L2 cache controller on Andes Technology AX45MP platfo=
rms.
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 12040ce116a551..880c544bb2dfda 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -335,7 +335,7 @@ config ARCH_R9A07G043
>  	bool "RISC-V Platform support for RZ/Five"
>  	depends on NONPORTABLE
>  	select ARCH_RZG2L
> -	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT

FWIW, this one is already gone in linux-next, as part of fixing some
randconfig issues.

Cheers,
Conor.

> +	select AX45MP_L2_CACHE
>  	select DMA_GLOBAL_POOL
>  	select ERRATA_ANDES if RISCV_SBI
>  	select ERRATA_ANDES_CMO if ERRATA_ANDES
> --=20
> 2.39.2
>=20

--H4bRYPb5tXhOAmff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0xZAAKCRB4tDGHoIJi
0r8WAP0V7KR64e4ZUtsXTDWdQEWkorwWePw0OFIpRuGhinkaEwD/c3YYEZm7U2pY
4IztZY7Ga6qv2gPgi28lN/xhzpKvZgg=
=rZtF
-----END PGP SIGNATURE-----

--H4bRYPb5tXhOAmff--


--===============0116804701513279956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0116804701513279956==--

