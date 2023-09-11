Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ED4EE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eid+xGwZV1diLwhKrzPrEuvQQ9k3OM89l8rGuzU+e60=; b=DFCqsl9xFrvDxXbhmS/Sc9cMdK
	UwGZ2a/yGnSciiJsAMhBcaICr+iKyfR6QOZVasrmgvxtD3A+WPbAYipWRBG4YR7y1CVY+NP64m2wk
	gWgId8TxKgqMgh7wkBHA47wqsd/cgYcx2I/211YRxo8lp7zh8mv8Tl5K1lkMm/okDSHPv4JgWemun
	fEvXUN4SKjsEUvAefRSGuF0tl3sQfJMCMZIiEiHjk7HE+f1gzn/ue1l8aoIM4qAf8W/zskcgLPyzA
	zu2pMpWk/qaUDm90GfHYQrGeI7cx94xyeUYArZqhlnvlfhKRN0AI4Gps5/InxOLIH1UoL+LbBR+KG
	iGtv5NCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgbY-000YyR-0T;
	Mon, 11 Sep 2023 13:05:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgbV-000YxV-2j
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694437525; x=1725973525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMSvAIK8f24bxto0iuALkwzOXDi8ggcjv/HOf5OUMyk=;
  b=W63P0lmeUeArusRnJ7+fnBndRyA6BbSYc639cS7NHTu0obSWyMRc+bj9
   iVBG2AnOoADwflxYEsaR1QmLb2z5+DJUzsMI5SAoc5MUFEePR9rFCffGf
   hXwdpavggnuQBshoCfPR5VQGP74W8E5oW3po+GdTWcS3ekN7FCnG9Bg4D
   klB9gERsheXPJ01kQ9dB0cphcnBBftum8GZNk2gM8Z957dLIgspaaQrRD
   FVHVn91grmliesGsMtbDoPD2DsIcCCZuCf+FsrSYcG6QZW+kWzhljnqR+
   BRuDuxyKSKwNokLY+/ltCqFKqNmFVASXnLcb8quyD8uTM6EurVDO0fOou
   g==;
X-CSE-ConnectionGUID: VDayhyd4Rw2TIoz7MS5k0Q==
X-CSE-MsgGUID: 1DSYGvUiRcaFtXRwQG1SZw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="asc'?scan'208";a="3886195"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2023 06:05:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 11 Sep 2023 06:05:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 11 Sep 2023 06:05:21 -0700
Date: Mon, 11 Sep 2023 14:05:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jinyu Tang <tangjinyu@tinylab.org>
CC: <william.qiu@starfivetech.com>, <hal.feng@starfivetech.com>,
	<palmer@dabbelt.com>, <apatel@ventanamicro.com>, <ttjjyystupid@163.com>,
	<falcon@tinylab.org>, <wangjiexun@tinylab.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: defconfig : add CONFIG_MMC_DW for starfive
Message-ID: <20230911-uneaten-shuffling-27c862d5fb10@wendy>
References: <20230911125955.8937-1-tangjinyu@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230911125955.8937-1-tangjinyu@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_060525_943861_B75DB9F9 
X-CRM114-Status: GOOD (  16.71  )
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
Content-Type: multipart/mixed; boundary="===============5667722881700507505=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5667722881700507505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5zK+w15ftwOdzKYN"
Content-Disposition: inline

--5zK+w15ftwOdzKYN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 08:59:55PM +0800, Jinyu Tang wrote:
> If these config not set, mmc can't run for jh7110, rootfs can't
> be found when using SD card. So set CONFIG_MMC_DW=3Dy like arm64
> defconfig, and set CONFIG_MMC_DW_STARFIVE=3Dy for starfive. Then
> starfive vf2 can start SD card rootfs with mainline defconfig and
> dtb.
>=20
> Signed-off-by: Jinyu Tang <tangjinyu@tinylab.org>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab86ec3b9..0664b92d1 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -170,6 +170,8 @@ CONFIG_MMC_SDHCI_PLTFM=3Dy
>  CONFIG_MMC_SDHCI_CADENCE=3Dy
>  CONFIG_MMC_SPI=3Dy
>  CONFIG_MMC_SUNXI=3Dy
> +CONFIG_MMC_DW=3Dy
> +CONFIG_MMC_DW_STARFIVE=3Dy

Is this where savedefconfig puts them? The order here looks different to
the arm64 defconfig.

Thanks,
Conor.

>  CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_SUN6I=3Dy
>  CONFIG_DMADEVICES=3Dy
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--5zK+w15ftwOdzKYN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP8QgQAKCRB4tDGHoIJi
0u/kAP0VaymayQ4ZAvwWzzzA6lrwMVpsmhM3WvJUeveCP5FEAgD+O6xt7cT5wC+X
dKTvwNOFq60zyYKn/kFF3XNdxk6l8Ag=
=Dg11
-----END PGP SIGNATURE-----

--5zK+w15ftwOdzKYN--


--===============5667722881700507505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5667722881700507505==--

