Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19097CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0TsyiQXkG1+92ADtxlbWuS6+bM/irrPel5nu17FbDc=; b=TZ8mxDZAqn2v36TPLF23rEum6w
	OgQbrQLNkNNXLTxBTPn+bKKs75gkMNmpF3xdqcs4blLXnvux5C3ER06E0Pf5FLKA2I2wCcHs0gyXF
	SRJpS6X0sXK/Pn3E5XQaQPk7Ubo6EYJENzOvW1W2oda94RL1tC1AYKaz3WfHzl0AgqTXGaZnOWlDx
	5s8M+Yzu304UAUU/PO2jv2eMkdA16/t0SpyB3hs4fTs5jm2FT+OE6z8h18ylIB+UtX0V1ZavZ5dan
	4aQ3aGiDpzQX0iASQ1A+oDQQuzBmUeKnv8GM7C/f+fFYz2c8rKZAZwVQTY2RAf5nlWfx7EZKZwMra
	bEqz1g3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN6M-009eRL-1b;
	Mon, 16 Oct 2023 12:53:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN6H-009eQu-1w
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 12:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460817; x=1728996817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/Kybg4Z50Wvq30RILKgpO3v0qlhowsz9dfetjRKyrI=;
  b=je4SJ/aIWleAMd44kMTRW5egWS/m7GLCINSozzU95txeqo7KURLyBk0D
   2vWNy7W8cdJ8LNnb8RzngeY15DyFf9xT3q3p+IMMdfkpwSJj7BcU/eYHp
   3r9R4B40rBl5SuSNNak8rIpcZtJHT8FlgB79IfVcdS3Yy6m+E9TRVus5l
   O54uG7fWnW35ezEqrgwWVAB57KJt6qrQrmKsMt24sVroVSbJC2DX0tNio
   Y/Yxjklbog5nBnrSCv/LizfVchZW0iHYOCGLYfw77pZaA3FbBC1HcoMMg
   eUSuXh3PcfKnvZUGHywSHRxMuRt8TcTSCfA7Xo806et5Z37dVQQ1ZTpqB
   g==;
X-CSE-ConnectionGUID: Leh/mquETYqrSTT64nJ6KQ==
X-CSE-MsgGUID: /im/eG7oQQ2L63+JysKsNA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="240802430"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:53:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:53:22 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:53:18 -0700
Date: Mon, 16 Oct 2023 13:52:57 +0100
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
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from
 ARCH_R9A07G043
Message-ID: <20231016-pantyhose-tall-7565b6b20fb9@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_055337_684935_9D533E3D 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Type: multipart/mixed; boundary="===============5527486798180283993=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5527486798180283993==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xxo3lByE7rW+vKH8"
Content-Disposition: inline

--xxo3lByE7rW+vKH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 07:47:46AM +0200, Christoph Hellwig wrote:
> Selecting DMA_GLOBAL_POOL without the rest of the non-coherent DMA
> infrastructure does not make sense.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index f1696d3b5018d0..ea473b4150dfa8 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -338,6 +338,7 @@ config ARCH_R9A07G043
>  	select ARCH_RZG2L
>  	select AX45MP_L2_CACHE
>  	select DMA_GLOBAL_POOL
> +	select RISCV_DMA_NONCOHERENT
>  	select ERRATA_ANDES if RISCV_SBI
>  	select ERRATA_ANDES_CMO if ERRATA_ANDES

Since this Kconfig menu has changed a bit in linux-next, the selects
are unconditional here, and ERRATA_ANDES_CMO will in turn select
RISCV_DMA_NONCOHERENT.

I don't think being more explicit hurts anyone though, so
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--xxo3lByE7rW+vKH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0yKQAKCRB4tDGHoIJi
0j/bAQDgJ0nwXmtzgHU2Jl2AAhl0wDZ4qQpYml3lufvr+cf2nwD/ZKm1C9hG3Wly
LIQ9sbba3auXK4oJhcEr/7Eot4eqkAI=
=XPiq
-----END PGP SIGNATURE-----

--xxo3lByE7rW+vKH8--


--===============5527486798180283993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5527486798180283993==--

