Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0776ACDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn/W+brGHNoYaoSpXieKOYhtIzbosj4NYfABvkp4bJA=; b=yWG7bonnrAhmWKId6prgQwhFaS
	sB+5phMsKLAWTXtqpY7/ojhIyaPyzIL/ZDyoGr8n8AdEi2sS9kukUOduIM9VYkYLiyXqXe7azP/23
	WA5C2BCRzpXx3s7a2wHWsylfJ1dYtQvjsX/8xupgXNb0Adel/CNBBU9qcylmqJdOC9x+KhNbEAwp/
	zYGXKfU4TWSqZsMEwR+5m3phJDq+ryPTyclmI9t6NN1AFRsJ0bxQKyjurnZOOaC0VIG1w+sR0T9pI
	7CRFv5FkF8ujlDAXyx0XzePNLKprS7tw7sgwDyqbwvlcSvXdyY7HZSmQ8aducgaXfVetpoKgQnXv/
	JdSt+1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN73-009eX1-0P;
	Mon, 16 Oct 2023 12:54:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN70-009eWe-2j
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 12:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460863; x=1728996863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLMiq+CYDlC0gAXaIFVVJ2NuWge91yyg38CIhL86Fh4=;
  b=0foPNeQsfOntrre0AWBBS2SfTdNjECe1LvBh+7e7V6T1zvsldaToBaQd
   y5Y2ra6XJcNAIet78FpRekYAH8W11HDMOx1uTOllJHky65IIje/YWv6Cs
   RWsmz6dlUVeg+gG+Q6julnaEWIkkC/XOLXgQ2I+KdGQitUGpG4X2J+etA
   mOPjZykkrDLgXsG5CK+mmQ7UED2StMa9GYKSUyEDafMpx8z38mFs5nTKt
   3EjyFJL+qNekvEmZTfMxt86ddWR8S+KkY+z/gvk1PABuT3Vwd+6GPPYwp
   dOvysmtz+ngHB+G3uWY2r3f52X5oW/rH9c9+3CnVjBfDmdIMYDeRKFN32
   Q==;
X-CSE-ConnectionGUID: LdlmstcRQjaYoGh4b3JylQ==
X-CSE-MsgGUID: vn8ezhGBR7anL6QYf1/YXg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="10148319"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:54:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:54:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:54:12 -0700
Date: Mon, 16 Oct 2023 13:53:51 +0100
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
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on
 !RISCV_ISA_ZICBOM
Message-ID: <20231016-decay-handgun-17cb857e616b@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_055422_891617_E4FA9DB7 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: multipart/mixed; boundary="===============3509334504145616787=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3509334504145616787==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kcVUeI7sXt5WFgxU"
Content-Disposition: inline

--kcVUeI7sXt5WFgxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 07:47:45AM +0200, Christoph Hellwig wrote:
> ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent
> allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
> Add a proper dependency.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 880c544bb2dfda..f1696d3b5018d0 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -334,6 +334,7 @@ if RISCV
>  config ARCH_R9A07G043
>  	bool "RISC-V Platform support for RZ/Five"
>  	depends on NONPORTABLE
> +	depends on !RISCV_ISA_ZICBOM
>  	select ARCH_RZG2L
>  	select AX45MP_L2_CACHE
>  	select DMA_GLOBAL_POOL
> --=20
> 2.39.2
>=20

--kcVUeI7sXt5WFgxU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0yXwAKCRB4tDGHoIJi
0jD2AP416cQb/GlbEFTwIX1JWQKl4+CzJCSGBVU+nMPi+xyLVAEAngvHkO5YQO4H
Fe2wrrFFVo5Ko7FTICOLVHKThrfRZQ8=
=XUzZ
-----END PGP SIGNATURE-----

--kcVUeI7sXt5WFgxU--


--===============3509334504145616787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3509334504145616787==--

