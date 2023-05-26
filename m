Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6766DC77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jjui3npiK6UrO6s37o4KdaoyLtXVGMDb7sRi+K1Xjm8=; b=mZWxvKVchFt1U8XPEZvN+sFOVD
	NAHbunofUcRY43YhrmSR96KNftAMCKI0nCoE25biQ+PzTWrqYDSvnlgl6m4bTq6hf77AuVIuobmJ4
	XkXL+RECWDFsGYGkJuYccCagFKsYjOpeJXrLwxFe/3/eHp8vckniXM6igxxTbz+a/wi3WtUculDiM
	pkWZJhkdcyZRsH9Wa49Ee640IBB1PjN4Z2XmXWH8mwX3AESwmH0E8UIUZk19MiL8me4aiZjUSIFuu
	ZZhJVlsrvbCL/oYAQwujPfvMopZX9gfXDnfIpv1luLvYrbcE1LJJ5TlrKcS443FqSqDr761lApgUh
	jPb+TwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XHL-002bVW-0A;
	Fri, 26 May 2023 13:14:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XHG-002bSt-3D;
	Fri, 26 May 2023 13:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685106882; x=1716642882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TaKFmPvcaWxL63IETqF5z2dA8t53A2LsdWOk3sZfXkU=;
  b=QslJjpR/7l2NttuUCGUD5GQM2czS3f/a+XdqPwtiCVnjGWkomCUVnpiq
   r7lLVfyIaDC0atwNxhbZHcK1E2uwtrmGe5RqhRQK/nQYQOueQ3X62c4pv
   xV6SXl5qNyQH8CF0aEdrJD1Ku5ggSyIL5rG0ToplPbL/WUX7Ci/mEtVqS
   ZhpHawkIqjrIfhIQlIwNF/9VJ/CdgrG1QD4RdAEWiPSDwKheGCQB/ME5C
   eTN/2Wxktf/USZLdV2ikzGhiwaIyEIniFQ20UJMGoTgAm/dkCjsdhD46Z
   0N/SqWePDBJLQZVugkt8/bNMvz9bJJ0ArlIJEOmwpDw3j1vdh1Rg5/FPx
   A==;
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="asc'?scan'208";a="217467764"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 06:14:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 06:14:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 06:14:12 -0700
Date: Fri, 26 May 2023 14:13:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak
	<pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter
 Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v6 5/7] dt-bindings: usb: Add StarFive JH7110 USB
 controller
Message-ID: <20230526-grain-cubical-e0af96202007@wendy>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-6-minda.chen@starfivetech.com>
 <20230525-shopper-handbrake-27fc06aede32@spud>
 <5124e6a8-8ca6-71a5-19d6-8c15e954c458@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <5124e6a8-8ca6-71a5-19d6-8c15e954c458@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_061443_118094_78384D62 
X-CRM114-Status: GOOD (  13.08  )
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
Content-Type: multipart/mixed; boundary="===============7427674727881057221=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7427674727881057221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Bn+39uGEqQUGUUq"
Content-Disposition: inline

--2Bn+39uGEqQUGUUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 06:24:48PM +0800, Minda Chen wrote:

> >> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD contr=
oller
> >=20
> > I think you told Krzysztof you'd rename this to "StarFive JH7110 Cadence
> > USBSS-DRD SoC controller"?
> >=20
> The previous title describe whole USB controller for previous dts node is
> merged. Now the dts node is split.=20
> "starfive,jh7110-usb" just contain starfive wrapper layer dts configurati=
on.

Okay, I must have misunderstood the conversation on the previous
version. Sorry about that.

> > Otherwise, it looks like all the stuff from him and Rob have been sorted
> > out, so other than $title this is
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--2Bn+39uGEqQUGUUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHCwjgAKCRB4tDGHoIJi
0mgJAQClJBlPXs7N2vOvkTGSfZFOb6z47yAgyiaqavdIEp2UTQD9EB9gGDPr2W/F
lNVtNtC8iRhO7w0elIt9BCJHjRITMwc=
=AQaH
-----END PGP SIGNATURE-----

--2Bn+39uGEqQUGUUq--


--===============7427674727881057221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7427674727881057221==--

