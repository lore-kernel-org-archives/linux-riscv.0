Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E84C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urQQoXft19osCuNY87IXSsEWCM4h+Tr98C51NzG5ELo=; b=b4qXyyl8xgJs6zRgDCpj+ULqm0
	RUpS+Oc4F/tEyGpAm08SxlkLdCpPGTwgj3R1HXAcz91qmO+R3upcb2E13KNA18EifWv6+VNzt998I
	4fqofon+c6pJw1zDflkH12++GnqS/CvBE2+F7LE1i9oCs3rVInXk6zKdSxELl+weaBcH8BFCMm5Sa
	vBmbYEJJg1235uA1FI0SRJH6xJcToJH6jJmCSE+40tlc6cWr3uoRNIOKMTcc7FE2RMeoZTk/6FOVP
	vvjtqOfYQvfqu9EN8BUTLcpRSZbVJgM1JphPgcOMGgQQ9oLk2tMxXSdI47mv6fh8a4g+keq5GT+uY
	nAoe8erQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYQ8-004mC0-RR; Mon, 30 Jan 2023 17:58:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYOr-004lTN-Oc
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 17:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675101421; x=1706637421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Czf/YBL+D6Dyg2RaowmFYj1S+DBEIS4soS9huRGqHSs=;
  b=ZErnrTSAnRsORsg2lGMSPXiVFFAes5CT3y1q7R+3qVf1I517VTkSI2YZ
   lLok2gOWlhmN1VmdrF/wBxpXDoLaH08Pe42APvVupUTfrKinvmM4FDhyJ
   pEdDzQn5e+rUgn1c5M9j+W7kjk/wsDVtT9NB4YNtQmg4E/F1gipDfZ1I+
   eXh7odrtxs1UHCDFDQbiHKuPnGDAPk6VHIFR5JM2tkHCaX5O1cwjpv0fT
   k+Oft6761vCH6oC9EBrkXyY2eSwLVJflcNEc+XyfZ8EtspBqU8EmecJsU
   7tjlGFE4ybSkjD87Jhy1VThfte1HN1ifAvf06ldveatsZ0uc2MyUdn8Pm
   w==;
X-IronPort-AV: E=Sophos;i="5.97,258,1669100400"; 
   d="asc'?scan'208";a="209809235"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jan 2023 07:53:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 07:53:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 30 Jan 2023 07:53:37 -0700
Date: Mon, 30 Jan 2023 14:53:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Liao Chang <liaochang1@huawei.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko.stuebner@vrull.eu>, <ajones@ventanamicro.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jszhang@kernel.org>,
	<vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
Message-ID: <Y9fZ2ZxdMmXgO5aB@wendy>
References: <20230129094242.282620-1-liaochang1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230129094242.282620-1-liaochang1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_095701_873841_48959E39 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Type: multipart/mixed; boundary="===============8497049091451617175=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8497049091451617175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AzdEm1gDjGAuOQcP"
Content-Disposition: inline

--AzdEm1gDjGAuOQcP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Sun, Jan 29, 2023 at 05:42:42PM +0800, Liao Chang wrote:
> Add header include guards to insn.h to prevent repeating declaration of
> any identifiers in insn.h.

I'm curious, did you spot this "by hand" while doing other work, or do
you have a tool that found it for you?

> Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")

Heh, I appreciate you going back to the file's original name to find the
correct fixes tag!
I figure that it's probably worth adding a fixes tag for the rename too,
so that the stable bots don't get confused? That would be:
Fixes: c9c1af3f186a ("RISC-V: rename parse_asm.h to insn.h")

Probably overkill when you have Drew's already for something so trivial,
but:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/include/asm/insn.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 25ef9c0b19e7..22c7613bfda3 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -3,6 +3,9 @@
>   * Copyright (C) 2020 SiFive
>   */
> =20
> +#ifndef _ASM_RISCV_INSN_H
> +#define _ASM_RISCV_INSN_H
> +
>  #include <linux/bits.h>
> =20
>  #define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
> @@ -365,3 +368,4 @@ static inline void riscv_insn_insert_utype_itype_imm(=
u32 *utype_insn, u32 *itype
>  	*utype_insn |=3D (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
>  	*itype_insn |=3D ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
>  }
> +#endif /* _ASM_RISCV_INSN_H */
> --=20
> 2.25.1
>=20
>=20

--AzdEm1gDjGAuOQcP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9fZ2QAKCRB4tDGHoIJi
0jcTAQCHHURF4z6oLYFKaGltvgSzuPy9uEujy8ANEz83DTBUPwEAw9mBDZLjxIxY
UyY2jby9nKah10WaHWzGUtn7AOofUgY=
=wEl5
-----END PGP SIGNATURE-----

--AzdEm1gDjGAuOQcP--


--===============8497049091451617175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8497049091451617175==--

