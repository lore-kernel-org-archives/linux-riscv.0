Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A07EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NduSSlSJY4EFKJOA+Lou8ZOgLXo+dW9EP3FgYchfGzc=; b=WWIbyO7uwR0YLGK969DUPZo1EO
	3GoV30mQo9UdSL56YZzTbTBtMbp4SNOgQdUT4LrRhjT/b1jsjJxqfWeMN6PlI7DiyJuLAJpEwwDn+
	3qXBsSL8L4uuKbCQNXOFJSKcFIkpcIYlnSlvsO5IZJsA7krBY8jIUIPdKjfbD/r1p8gZo2jnzD2tV
	Ut2EYyaWtBPPOf/tu1R29ens08wDEZQYhv43HCyPWuR+wP4teXNR4gTfe66HcWhGDRSdLs4py64T7
	0fVKdW834qeJpBZK+UPWADZ/PeOVrrzqv0KhdlavwCspnb6/1XAF/8jZyW/ZNkVYnftWzowkqySow
	jGTEntPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDXE-0000000GW7a-16kG;
	Fri, 12 Apr 2024 09:49:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDXA-0000000GW6S-3dFD
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 09:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712915365; x=1744451365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6owmbQFyX2Ns1f9TuwGmcwHTt0ZOyFfydguyhh8Vl7U=;
  b=VDjRHLVChYwYhzkOakV82JXDwephwD774MTFrzWyxR4Cty2b/kzokqNk
   EcvAezkfwein9Gxlin0YLfSJtozp7L5JUeec4UpdPgnNrUk7/P8yTqFOG
   PQI49MHutmGc8aF/29WBFzpCwT7AjIu0a2l007BWBRQRutGbGF85n1bIU
   dzeNVsfr5YChkaQoZShi2HwhFGoQYdO6M+OMS4GzoWd7X/uS1Pms4IWBc
   LSvKAPcYwerQ569C50/GBeKOklHPgf4MZB9LSYXhdfg+phzh2VDqGtsMp
   W6Vq9jKOgAuMNzIx/ZPZv/5CaOY1WGuR2zk8cP6AKxv+n9HmzQAF+GcYG
   w==;
X-CSE-ConnectionGUID: CriWT839Tiya/FLJiLrKhg==
X-CSE-MsgGUID: W2UCeI60TdOdUEqyUVu4cg==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20722576"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 02:49:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 02:48:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 02:48:27 -0700
Date: Fri, 12 Apr 2024 10:47:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <wefu@redhat.com>
CC: <jszhang@kernel.org>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<guoren@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 4/5] Kconfig: Enable APM X-Gene RTC for XuanTie TH1520
Message-ID: <20240412-ogle-daily-c18bc6e7ddd5@wendy>
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-5-wefu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240412080238.134191-5-wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_024924_931729_72AEF50C 
X-CRM114-Status: GOOD (  16.64  )
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
Content-Type: multipart/mixed; boundary="===============3728979684729214514=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3728979684729214514==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rrezwGm8P4r68fCr"
Content-Disposition: inline

--rrezwGm8P4r68fCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 04:01:46PM +0800, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
>=20
> This patch enables APM X-Gene RTC for XuanTie TH1520.
>=20
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  drivers/rtc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 3a89f1e6095d..b219aeef4ce9 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1880,7 +1880,7 @@ config RTC_DRV_MT7622
>  config RTC_DRV_XGENE
>  	tristate "APM X-Gene RTC"
>  	depends on HAS_IOMEM
> -	depends on ARCH_XGENE || COMPILE_TEST
> +	depends on ARCH_XGENE || ARCH_THEAD || COMPILE_TEST
>  	help
>  	  If you say yes here you get support for the APM X-Gene SoC real time
>  	  clock.

If I was configuring my system by reading menuconfig, I would have
absolutely no idea that this driver supports platforms other than the
X-Gene one. I think the Kconfig stuff for this likely needs an update to
convey that it's no longer just one SoC family that's supported here.

--rrezwGm8P4r68fCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkDOAAKCRB4tDGHoIJi
0mNyAP9KxQ4U9S5RMOVtCU2/kCBefOY/cpPKf8icvcFiSV8+zQEAtUzy/SD4CsMb
eHL+pw8s6mfIChq7hPkxKZlv8QtVrgk=
=nx9k
-----END PGP SIGNATURE-----

--rrezwGm8P4r68fCr--


--===============3728979684729214514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3728979684729214514==--

