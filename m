Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFA4C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDCarOY3XF8mnQEUsumV1e9qJlKbGffpalr5BR3XlaE=; b=xTax0Vlg8FJwL2iBOT4UOG8Nf7
	ECuRCdcuQPBNWt7uZZMf3PclgmqyICV/aRwo8KxaxyaiGmRcQ5JBRmuFYD2D/vLonO1nQDqPsMabj
	9X4ZGgWx4IHeKSddw2tz41o/TPkars4FZ23ay0s2cirZOugAtQXARo+/HVFmTiicZERAD8kPbYNjr
	WuD6gp6q1mrZOQ/NLn1uPPLLvDRpG9T78wDfRB949iq8cutejZ1lT8FyWcbjTp8FCYXGsIV5Bft3e
	6sp3jSIDwm7h4C1h1/GrYIC9gKR/UuU6MlLlwT6PQ7Q/Hx0LdZ3GQR8yA0Qfx2146B1wZEvKk96nl
	whCS2xpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTC3-00C4RB-2b;
	Fri, 12 May 2023 13:52:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTC1-00C4QF-1T
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 13:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683899541; x=1715435541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WxliiXbCw/BWsrfyQfSnn4cwbh6x+dsWlLN0pMI+WF8=;
  b=RteQgORltFJWja4AnEC/erchS4kYf8UybdEZVXCXH0dEvP1DkIct9qMe
   Vnz21ihAOqEAleBB8hW/v3TEqIIDfvUa8inR6Db731q9xXZMHLwHkHFf5
   yf+lDautLuAsKsEW7Qri/YOr4EgkNSbGSLPd31p7KYbXimK1VJBla8Bk6
   EoDITqm3SZDa4PTVFjCpthvy6/IVuEItgDnDziYtYPj0AxWKRQD0ezFDs
   rSUaAWdXh0FZHNl3UUYMxaTe0zt4KUl1HiuArwT9emvxU/6gis2S76QUV
   st4TJ/kwrSA83c0RHjdgHeVJcWKzuRMpmPIWlJLg56AXpJFSvW9y17UuC
   w==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="215095542"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 06:52:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 06:52:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 06:52:16 -0700
Date: Fri, 12 May 2023 14:51:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 1/4] riscv: vmlinux-xip.lds.S: remove .alternative section
Message-ID: <20230512-lunar-overbook-e34b468dda65@wendy>
References: <20230511141211.2418-1-jszhang@kernel.org>
 <20230511141211.2418-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230511141211.2418-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_065221_597024_C4DDE928 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Type: multipart/mixed; boundary="===============8373479583345185091=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8373479583345185091==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KkOtcrj+AD9/k7Ew"
Content-Disposition: inline

--KkOtcrj+AD9/k7Ew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 10:12:08PM +0800, Jisheng Zhang wrote:
> ALTERNATIVE mechanism can't work on XIP, and this is also reflected by
> below Kconfig dependency:
>=20
> RISCV_ALTERNATIVE
> 	...
> 	depends on !XIP_KERNEL
> 	...
>=20
> So there's no .alternative section at all for XIP case, remove it.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Just to note, this series doesn't apply on top of -rc1 - what is the
base that you used?

Cheers,
Conor.

> ---
>  arch/riscv/kernel/vmlinux-xip.lds.S | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmli=
nux-xip.lds.S
> index eab9edc3b631..50767647fbc6 100644
> --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> @@ -98,12 +98,6 @@ SECTIONS
>  		__soc_builtin_dtb_table_end =3D .;
>  	}
> =20
> -	. =3D ALIGN(8);
> -	.alternative : {
> -		__alt_start =3D .;
> -		*(.alternative)
> -		__alt_end =3D .;
> -	}
>  	__init_end =3D .;
> =20
>  	. =3D ALIGN(16);
> --=20
> 2.40.1
>=20

--KkOtcrj+AD9/k7Ew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF5EewAKCRB4tDGHoIJi
0qKNAP9aitzYq7AlSofj+QbNcfXCXhkwYqHc/PfL9wm6T+7L/AEAxM1sVUTR6Q5X
ZQQVS36s/TbfTTqMRH5b95PAfeWIzQo=
=W6hv
-----END PGP SIGNATURE-----

--KkOtcrj+AD9/k7Ew--


--===============8373479583345185091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8373479583345185091==--

