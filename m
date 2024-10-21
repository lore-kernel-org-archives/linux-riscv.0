Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668CD0E6D4
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imNrBKLBaUkII9JIAORapqYSRSi0ZDXmKCgmIlwx0Uo=; b=RZxglqrvU3fk3GpqM1Rj/bUeIX
	ZVKh8f971hR6Ep+mUzxGjnlpzubIYvIh60Qpj14JJYFGSYkt4RWNPsLtuMZMa/K79AjBu1BQzrXSv
	ZLQtVsP8cPTfE0VfvRhB+ta0E/Yq2P5TPa5sbU4Z/soKweDbfc3vvT5fD4HhLetF8jqMAC+F2pGiR
	pdL6rz9i9YenC5VamJKBMBEv8sGSjG4N4BGSeSxczAk4owfBXFtaO6Cka61xcZNVsqFIqGDt4pZ3V
	Zab3i+MOOhQOROe0+5jC0rDnXbUpGGIV/NV82QDDyAd/zv+EsICOOpS5g/v71tiO8if0baOmVDuhz
	7U5bQApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oAV-00000006cqD-3zf8;
	Mon, 21 Oct 2024 08:53:39 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o9f-00000006chx-2SVE
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 08:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729500767; x=1761036767;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=KNa0CDt5hAs5PcllatEa5gYmNjWVk13nA+som17lvEw=;
  b=nAcz9g7tzbmDMYzl5ljSzMeXJKHPgmcCHN7A4fFZzKwlj7xyaSsBWAyL
   EP4lcj152EqlZq/wan8bqSyrVVHo5DqPSps4CrWiQk5t4jX+w56VjZYzx
   dbm8zovKyFII3tPSl8dU7pr7fpSZKFcP0P75hdsULHV1+X7H988OdhbCT
   7BoGD4DPgZQqFAqSq8Wm1VqpJKoylyzgWy9+Kfzuh6BxM5xsByfPo/kmr
   tHuQnSIehC3s8jByFasjLjL4mTstKnk1d1QDy5aFn6kymVYHhm294KFhM
   HYWPum4ccqbqbNZ78AKP58mUIxh+1HYjHLhyryhyxWT9fhooNCni1Xt6b
   Q==;
X-CSE-ConnectionGUID: g/akxsZ1S4a5HkEWPgxAmQ==
X-CSE-MsgGUID: xi7v5Z5XQ7yNllyGIVqOog==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="16604866"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="16604866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:52:47 -0700
X-CSE-ConnectionGUID: lYTVu2RJSu+j3md2eBbt4w==
X-CSE-MsgGUID: U9eAezjBT1u8LdoFbVn67A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="102782076"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:52:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Oct 2024 11:52:38 +0300 (EEST)
To: Inochi Amaoto <inochiama@gmail.com>
cc: Chen Wang <unicorn_wang@outlook.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] serial: 8250_dw: Add Sophgo SG2044 quirk
In-Reply-To: <20241021072606.585878-3-inochiama@gmail.com>
Message-ID: <29d8e2a6-d0e7-0f74-1f5c-4f285ec1e9ee@linux.intel.com>
References: <20241021072606.585878-1-inochiama@gmail.com> <20241021072606.585878-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-804874517-1729500492=:1065"
Content-ID: <a56336c7-de7f-8f28-b067-e7ff9bf5772d@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_015247_657896_52F9933E 
X-CRM114-Status: GOOD (  16.08  )
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

--8323328-804874517-1729500492=:1065
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <c4d9adfb-df42-a5c8-e914-7775c0394366@linux.intel.com>

On Mon, 21 Oct 2024, Inochi Amaoto wrote:

> SG2044 relys on an internal divisor when calculating bitrate, which
> means a wrong clock for the most common bitrates. So add a quirk for
> this uart device to skip the set rate call and only relys on the
> internal UART divisor.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

I wonder though does this mean the numbers userspace can read from kernel=
=20
are bogus and if something can be done about that?

--=20
 i.

> ---
>  drivers/tty/serial/8250/8250_dw.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index ab9e7f204260..51894c93c8a3 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -750,7 +750,7 @@ static const struct dw8250_platform_data dw8250_renes=
as_rzn1_data =3D {
>  =09.quirks =3D DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
>  };
> =20
> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data =3D=
 {
> +static const struct dw8250_platform_data dw8250_skip_set_rate_data =3D {
>  =09.usr_reg =3D DW_UART_USR,
>  =09.quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
>  };
> @@ -760,7 +760,8 @@ static const struct of_device_id dw8250_of_match[] =
=3D {
>  =09{ .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_octeon=
_3860_data },
>  =09{ .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_armada=
_38x_data },
>  =09{ .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_rzn1=
_data },
> -=09{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_starfive_=
jh7100_data },
> +=09{ .compatible =3D "sophgo,sg2044-uart", .data =3D &dw8250_skip_set_ra=
te_data },
> +=09{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_skip_set_=
rate_data },
>  =09{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);
>=20
--8323328-804874517-1729500492=:1065
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-804874517-1729500492=:1065--

