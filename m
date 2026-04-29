Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73B4FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU8sKhG/Y55CEzBHkX9j8Ls8CjiXmqvC4imJLp6cCHQ=; b=siG4wOA2LEHLuL2VxcuidBsHSd
	nnbVjlM9YLlHewmYK3R5RmGKC/GxYj1J8xqpI1Cd/Kyi1UmJdJlIzaD43JzrPHCVG96vizzoASnj8
	cSJV0TzWghxhGdJAfyrf0kvj1PVr4Ccc3HN8DYiQv5tOCSFYcn345HfwGsuR4SfhlFlUguBR+3+RQ
	gnMVpkvRt+e5jM+6+uYZv/0OhSs/vky10cLuC2JjJjZBJnz7g+trVVxWVjANmTLr+0NicdWO2HqLX
	45rs/ipE/erCGAymW0eNQ9U0w4Y8bCqVR6Bn7lvy2JeUWMe8kxnMAo4tbOdOWPb+8vRjfEwqz8/+l
	z3GWxZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Zi-00000003UPa-25QZ;
	Wed, 29 Apr 2026 10:55:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Zf-00000003UOz-3JfJ
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 10:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777460124; x=1808996124;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QANXounuzkuFspZS0EBxjHhEE3xoQ7mCoC1U0Ehjids=;
  b=MmF7ZXf5eJeKPsHpGdbNDlmSxuRBGPE7eB+BFz55gvEm0y0iXj2iTv2o
   hiFNSqFtD/A7tp6k5eVvYbR6/J3e4Kg9ZpBNaXYAWYzf1abRIH45HG1Lf
   lQCj+GEnJrfYTLODQeCgXBVic1DimH7qO69d9HvmQfHIspfiJamVpyQpl
   G/Y2ki2SVS1gzEJl+VKtVOAoPNxwPLL1fFMFGp4anvtBBVMyyJNovejPn
   gevqC1Ap4GIAfJ3r7tTmozzUcbfmBo8KzYa4GZxuadLsNPY2ozRxKVQ+p
   w/Q7nQnOdi5tJ/ztD3TjgOTnfB1i9a3V6xUTzTCQP6rGGGRDpb9WkGRko
   A==;
X-CSE-ConnectionGUID: Wdi6Tt1CTk6iRljCKp7ULw==
X-CSE-MsgGUID: FKLQ4GDLQXOe9sbXQX5c2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="101047261"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="101047261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:55:12 -0700
X-CSE-ConnectionGUID: 2ov17KlCQWKWvrNs5yz2kg==
X-CSE-MsgGUID: ny0tfrM2RY+zSF/08m4Y4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="229887480"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.212])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:55:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 29 Apr 2026 13:55:03 +0300 (EEST)
To: Jia Wang <wangjia@ultrarisc.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 4/4] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
In-Reply-To: <20260429-ultrarisc-serial-v7-4-e475cce9e274@ultrarisc.com>
Message-ID: <66f322a7-70c5-13f9-3e97-6d0b18193f91@linux.intel.com>
References: <20260429-ultrarisc-serial-v7-0-e475cce9e274@ultrarisc.com> <20260429-ultrarisc-serial-v7-4-e475cce9e274@ultrarisc.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-392823364-1777460103=:966"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_035523_868065_9FF8DCC6 
X-CRM114-Status: GOOD (  16.92  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-392823364-1777460103=:966
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 29 Apr 2026, Jia Wang wrote:

> The UltraRISC DP1000 UART does not provide the standard CPR register used
> by 8250_dw to discover port capabilities.
>=20
> Provide a fixed CPR value for the DP1000-specific compatible so the
> driver can configure the port correctly.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 480f82d89856..55e40c10f46a 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -959,6 +959,15 @@ static const struct dw8250_platform_data dw8250_intc=
10ee =3D {
>  =09.quirks =3D DW_UART_QUIRK_IER_KICK,
>  };
> =20
> +static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data =
=3D {
> +=09.usr_reg =3D DW_UART_USR,
> +=09.cpr_value =3D FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
> +=09=09     DW_UART_CPR_THRE_MODE |
> +=09=09     DW_UART_CPR_DMA_EXTRA |
> +=09=09     DW_UART_CPR_FIFO_MODE_FROM_SIZE(32),
> +=09.quirks =3D DW_UART_QUIRK_CPR_VALUE,

Thanks for all the effort you put to this series,

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Unrelated to this patch, I suppose we wouldn't strictly need to have=20
DW_UART_QUIRK_CPR_VALUE in this driver as non-zero .cpr_value should be=20
enough to decide if the CPR quirk should be used or not (if the code is=20
adapted, obviously).

> +};
> +
>  static const struct of_device_id dw8250_of_match[] =3D {
>  =09{ .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
>  =09{ .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_octeon=
_3860_data },
> @@ -966,6 +975,7 @@ static const struct of_device_id dw8250_of_match[] =
=3D {
>  =09{ .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_rzn1=
_data },
>  =09{ .compatible =3D "sophgo,sg2044-uart", .data =3D &dw8250_skip_set_ra=
te_data },
>  =09{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_skip_set_=
rate_data },
> +=09{ .compatible =3D "ultrarisc,dp1000-uart", .data =3D &dw8250_ultraris=
c_dp1000_data },
>  =09{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);
>=20
>=20

--=20
 i.

--8323328-392823364-1777460103=:966
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-392823364-1777460103=:966--

