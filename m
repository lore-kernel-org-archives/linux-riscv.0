Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA8C25B50
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0c3nCyP3zmG77elgTRtDsIjGKG7g1WucxjhtjluFr8=; b=rUOfLEHW09QCT6xRd/DrLxHAxY
	H7edg60w2zti87ZT5+SAjqdFWSRUtwFPdzvEB+ydG2R4RAKHwk50uVwBloaC9r1eQ+Qsc5qVkJHfX
	i0zdDfzTf+dKEK/0CUAt9kYuhAF4cpC/bNnUCJqR6+N1dcmgdgNqXBxRoZKPQHI/JBIHntfqnuyo2
	bv4SIcOxuQSHey5jb0sHm+HGy1Xi7psyCXaMO2sG8rEuWaJ7aMQxs9PllQ8SKwggmMd6TcSELvR2c
	VRPBPeT3oFfN1ZTb71kj4b1GZL3z/WlT3mjkc1WTCATuGQVcgsgdBmXJMHrjYJtnBdoGCfxq3lNOP
	nL/gk4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImJi-008ugz-Mq; Fri, 20 Jan 2023 08:00:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImJb-008udy-Fy
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674201599; x=1705737599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jpyof8guJ12KkRZFQStUtNOohsq/r/JPUTfiWJHH+7s=;
  b=t1946D6PPRFyt9L4K5lQoCZKuAM8U2UYJCW0hHZR+GTmq/BfKNmLThux
   49OdNNzEN+6l7TPytpW6p7+5ASsByv/7mhux8sdOniayar4iqf9uTpt4K
   cKeeMyGss0ZQ4UdlwjHqObHqqDiU7CheqI65GBZ958A8hyO4bleEvwnJP
   PlyqdV6qjpZQOMn/faum9/nifySdG4MGfZ/40pyZfUK3wBeIfuL7KqgW4
   4ihnEPnWsjSbjpcJEMkbc8ZGUcK0yK8tCep8v2Ch3lYAMRlayd9YDncdT
   4S5Eim/ngrYUcRl2MQwzjStnPQryCe2NRBARaMfKmhplQk/ak28yk2yVV
   g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669100400"; 
   d="asc'?scan'208";a="197425432"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 00:59:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 00:59:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 00:59:55 -0700
Date: Fri, 20 Jan 2023 07:59:31 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jesse Taube <mr.bossman075@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Yimin
 Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <Y8pJ4y7FyBDQPqIT@wendy>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_235959_583405_09ABE0BB 
X-CRM114-Status: GOOD (  16.86  )
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
Content-Type: multipart/mixed; boundary="===============0822055170034905641=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0822055170034905641==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbTIlntymQsP/HCi"
Content-Disposition: inline

--kbTIlntymQsP/HCi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

Since you'll have to re-submit, making sure that allowing !MMU on rv32
doesn't break the build due to canaan k210 drivers being enabled despite
relying on 64-bit divisions, I've got some nits for you.

On Thu, Jan 19, 2023 at 12:26:41AM -0500, Jesse Taube wrote:
> From: Yimin Gu <ustcymgu@gmail.com>
>=20
> Some RISC-V 32bit ores do not have an MMU, and the kernel should be

 s/ores/cores

> able to build for them. This patch enables the RV32 to be built with
> no MMU support.
>=20
> Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
> CC: Jesse Taube <Mr.Bossman075@gmail.com>
> Tested-By: Waldemar Brodkorb <wbx@openadk.org>

And the automation complains that this tag is not "Tested-by:"

Thanks,
Conor.

> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  arch/riscv/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 59d18881f35b..49759dbe6a8f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -163,8 +163,8 @@ config MMU
> =20
>  config PAGE_OFFSET
>  	hex
> -	default 0xC0000000 if 32BIT
> -	default 0x80000000 if 64BIT && !MMU
> +	default 0xC0000000 if 32BIT && MMU
> +	default 0x80000000 if !MMU
>  	default 0xff60000000000000 if 64BIT
> =20
>  config KASAN_SHADOW_OFFSET
> @@ -262,7 +262,6 @@ config ARCH_RV32I
>  	select GENERIC_LIB_ASHRDI3
>  	select GENERIC_LIB_LSHRDI3
>  	select GENERIC_LIB_UCMPDI2
> -	select MMU
> =20
>  config ARCH_RV64I
>  	bool "RV64I"
> --=20
> 2.39.0
>=20
>=20

--kbTIlntymQsP/HCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8pJtAAKCRB4tDGHoIJi
0v8hAQCg6NogRf0JH3QdHCaCxBlrL7fsKxZip4ENRHkEh4G2tAD+Pcys/xq+pyND
ccOwmR8ujVh1aJspaKZJXPguL85k0Ak=
=BVpA
-----END PGP SIGNATURE-----

--kbTIlntymQsP/HCi--


--===============0822055170034905641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0822055170034905641==--

