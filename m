Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E369C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGMwJl2lBd5A33f2UW3Apn5O2S7jP3jL2zZXXaeZHUM=; b=DTa2slnd3mFkTfPoUJiMslHZ59
	7c6AcEvB29j538UHXI0Z4x6cRF/ptAhhV8z7C+lkCFsZG4PGA3tsouo6IplHgYksM6D5NxVCssN2p
	xVILkwbGrc3rjsLGnZpqNmXnqJqzG9O7SN5qO9+4DhmMkCsa0/Ppx4j6B1wYXBOcyG3MN0tVaf/Cn
	DTsQQnHBj8N4DTigz39bBwezgKC0bRuRgst4CBC6Tc8LUF/UpKsePaeyjRBqT+Ji05OME0YoILfAV
	ZH3dbSWD3J++KWCuFrIAJ5yi2JaNBpq8Tu+OmEIt5sAyreR0LVuGY9In8Oa7XuGBdF5cG15MS/0Vj
	zEu4LNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIUZ-002JxM-06;
	Fri, 28 Jul 2023 08:06:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIUV-002JuY-1m
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690531587; x=1722067587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SHUZYQO6I8cVTLfFfVfxEsqHEAFJj+u3PnGVlT1Z+/k=;
  b=Xap+w9feJYB1OixWw80RXB6D899OGHE1bsyR9MnSq2q5NiWORMDcxYwp
   oppQFQALMea6fVNEoR/+AujqaFrbuUvR8nKsEneDnxp6fwl5+ZrQqutkc
   AbY9upM5t9aidfuodC+JE3EJ+qso90r2+KFNzwiOfN5Hmnatqb4GtlsWy
   sI/hPRHfFvQIT00PYPCvnsH3nKnQ4u4gUTY0bcQufliRsoWddxVA54L0Y
   WyqwH9/PF2uRolDe0YWa57xZO4SYDoGWdBpu02Abx2P9qBaBj6kVuFQob
   3hCrLXLIFfsiqJY01Y6ygR64WnCTVcjoebsie1gjaicMlGClvLEcTOq4H
   g==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="225794246"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 01:06:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 01:06:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 01:06:21 -0700
Date: Fri, 28 Jul 2023 09:05:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Jiahao <chenjiahao16@huawei.com>
CC: <daire.mcnamara@microchip.com>, <broonie@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH -next v2] spi: microchip-core: Clean up redundant
 dev_err_probe()
Message-ID: <20230728-edging-undesired-8dd77cfa0330@wendy>
References: <20230728075729.3451867-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230728075729.3451867-1-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_010627_616668_6C232220 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: multipart/mixed; boundary="===============4796535728290878190=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4796535728290878190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xfgaa1yNGbNZT1OK"
Content-Disposition: inline

--xfgaa1yNGbNZT1OK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 03:57:29PM +0800, Chen Jiahao wrote:
> Refering to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
>=20
> Furthermore, platform_get_irq() will never return irq equals 0,
> removing spi->irq =3D=3D 0 checking to clean it up.
>=20
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/spi/spi-microchip-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index b59e8a0c5b97..b451cd4860ec 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -530,10 +530,8 @@ static int mchp_corespi_probe(struct platform_device=
 *pdev)
>  		return PTR_ERR(spi->regs);
> =20
>  	spi->irq =3D platform_get_irq(pdev, 0);
> -	if (spi->irq <=3D 0)
> -		return dev_err_probe(&pdev->dev, -ENXIO,
> -				     "invalid IRQ %d for SPI controller\n",
> -				     spi->irq);
> +	if (spi->irq < 0)
> +		return spi->irq;

Thanks for the update, looks fine to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> =20
>  	ret =3D devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
>  			       IRQF_SHARED, dev_name(&pdev->dev), master);
> --=20
> 2.34.1
>=20

--xfgaa1yNGbNZT1OK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMN21wAKCRB4tDGHoIJi
0sAwAQDnj0+ttqnLueX6n0q0DbDhQ3nrniPNgyvRkUcfsxXdLwEA5s97UjrOSkXE
WP007kXXp8V/t2KflZMXq/LJpjCwvgk=
=1AWn
-----END PGP SIGNATURE-----

--xfgaa1yNGbNZT1OK--


--===============4796535728290878190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4796535728290878190==--

