Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF3C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9Kt+QQThZTMMXoIyOzHpUrEPiXwkG0D2UHhI8hf9Sg=; b=CsEHgbEYOHakAlxEMdm+E4k6AT
	pNtykOQaGwxh3nRdAp5b/lh3zTGT1ZAnIfScZmmUlYAWnWPif4bBoakFP9SwHE+xvBd2wugfDEcRl
	jAZecKjH5wN7cr7ib/yhzarWJjMPzWAi8IKnENMEBhowI40r6gwraRl3cO+Y3wMkxom5rdegkfgFC
	JMGnXqJ8+XbDZRhZdQyEuPronxO+rFZAyXCR8v2Qn0W/rhwABvP9JJon1rPwzEfdHxkPrEi5r31fQ
	hxYXO7Hdnm6e73EfrZaj6Nijlo1xCsu418uy0AJZ72Ju6lGcAGbisitVDoPgBxy0SmsRLjWEqWqZ8
	Uk1/gsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbYW-009ZsN-Pa; Thu, 16 Feb 2023 10:32:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbYU-009ZrY-5t
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676543518; x=1708079518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+F4YCG9W6ZBi29/AlTYKJjNmWLtJall6Uk8FokYR40=;
  b=ZwqsOvMfiJX+zPD/SMw+E174RMY5eU5CUSC7/PBBMYNXXNG1p39MlEKu
   nqgJ8c5QHuhBXXA1NDBNjKYa0e9gXQPndX3jfqZCyeYE9VrH9tXf9BMwS
   WcLYhcIMEDP6hvWBqUrWyVie/6vewxSOLcSU0Q5MzxckiisML0Rt39hjD
   4J9sLhd3tRfeEKZ87w409M/d8Rxrv6LZR2+rJLb8Uh6DaqnBEuFIoO+/9
   RazkPNQqEe/k+vkw5VRQXKaKISv2pCLEUVzBwii+7mUyuzHujbCo2Ey2w
   EBKTIK76fK7q+G9X2MLHDE0coHYdQgf26N4S0pWqwpOH28+6jARFD5P6u
   A==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="asc'?scan'208";a="200876227"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 03:31:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 03:31:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 03:31:51 -0700
Date: Thu, 16 Feb 2023 10:31:25 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Shengyu Qu <wiagn233@outlook.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add StarFive MMC module
Message-ID: <Y+4F/V0ZJtWJ3290@wendy>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-2-william.qiu@starfivetech.com>
 <TY3P286MB26111053410F3F96C9C71D2798A39@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <4bb1e640-475c-8516-2f73-ddfa0a3c23e0@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4bb1e640-475c-8516-2f73-ddfa0a3c23e0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_023158_306025_5EB486DB 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Type: multipart/mixed; boundary="===============8378467975826922209=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8378467975826922209==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zXMgQ4X1gAZdpo5M"
Content-Disposition: inline

--zXMgQ4X1gAZdpo5M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 11:21:16AM +0100, Krzysztof Kozlowski wrote:
> On 15/02/2023 12:59, Shengyu Qu wrote:
> > Hello William,
> >=20
> > Are you sure changing driver is better than changing yaml bindings? All
>=20
> What do you mean - changing driver? This is new driver, new code, isn't i=
t?

Changing w.r.t. the v3 that was applied I suppose.
The v3 was dropped and patches 1 & 2 here have been applied instead, so
this request from Shengyu is moot now anyway.

Cheers,
Conor.


--zXMgQ4X1gAZdpo5M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+4F/QAKCRB4tDGHoIJi
0uRaAQDrNl3wDMBd/lA1oIl2jPYUipctYyMEyoz6RKoz0DM5+wEApPVbBskxiCoB
x+5tv90k9SFpSXj6T1oh0AvETWgOaQw=
=tuQM
-----END PGP SIGNATURE-----

--zXMgQ4X1gAZdpo5M--


--===============8378467975826922209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8378467975826922209==--

