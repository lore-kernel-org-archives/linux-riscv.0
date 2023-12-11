Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EA3C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuucUzreTkYX55RIhilyhui2ERqI1yey2XbB6ZGM1/8=; b=4QeWOjXoiuKQyk7QroNUa6pHNn
	MLzN6r19Rf1bFblF3ONcpPFVdhbm+S+ERSKJ5ukoVfQQFVjeAfRi1dA45my0sUQXVWcqtUdEg/97d
	2eguDTRSDZLf1+fEhpcJKlL4IAFfB8zxmS09N9U5VQ3isJG6/NbCM69p8PHNCn2lXis/47jQrcQnd
	pwIb/gNwhI056IemkeJxBpU2hFGMaQAktG+W9/QNOZTZOyI+mAOW3XOY3e1hoKLbTtS1ANo2nD+BM
	RSd/jn3mr2ry2mfpn6E6d2U9fAWhlUjAXn4og/SzbVpjM3Fs/5Vk9OV42970kMJDu3D8QDLrEywom
	QtlPXVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgh8-00518f-09;
	Mon, 11 Dec 2023 13:51:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCggy-00517f-06
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 13:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702302687; x=1733838687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EPnk+1iTwI7AC2x+0wS4hbR6+o+OWWfoPlltROH9p3Q=;
  b=maEgQGju1q63GwzUgD7Vp8AwOxEaLwVoamuABwvGEZl+TG6Lt+LCBmaY
   UgvoCFDDEnS/DNcGsIgyU7CEICVKnnv14mBFvLs+kaBJrNfKqZf33vdC0
   0n7BClb28yNnttg1ql6Uw1rIOujJcLCUSrQKGmUuaesKzJQUhkusE95sA
   azphHIyuPAaH0Mhm6roqHj06hQEi+tfoBDpYdLfOVHRfh5CEnE2Vb56Jf
   1jmLlCnlM/9GN1gRcZmz6d3FRcXYy2ZIVOCSqXhaewVt70Mtik/hXDN3S
   lNXPhSWYEUILtQ8Ry19A+ZV0B2Rypt6S3n4o7IWgfcGEKQhkoXUC23NyH
   A==;
X-CSE-ConnectionGUID: 022W40a+Tn+gRAO+g//8+A==
X-CSE-MsgGUID: d4MnW3q3SBu85cF5m2EhcA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="asc'?scan'208";a="180280039"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Dec 2023 06:51:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:50:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Dec 2023 06:50:43 -0700
Date: Mon, 11 Dec 2023 13:50:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Nam Cao <namcao@linutronix.de>
CC: Jia Jie Ho <jiajie.ho@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20231211-grumble-haphazard-e95ab97e0e57@wendy>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
 <20231128102722.fQizGKfo@linutronix.de>
 <20231128-grandma-guru-4fc6e6950a75@wendy>
 <20231211143611.5d0248bf@namcao>
MIME-Version: 1.0
In-Reply-To: <20231211143611.5d0248bf@namcao>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_055128_438498_7C751BF8 
X-CRM114-Status: GOOD (  28.60  )
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
Content-Type: multipart/mixed; boundary="===============5362684900218454956=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5362684900218454956==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/CfqRG+3NaUoxF3y"
Content-Disposition: inline

--/CfqRG+3NaUoxF3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 02:36:11PM +0100, Nam Cao wrote:
> On Tue, 28 Nov 2023 10:59:44 +0000 Conor Dooley <conor.dooley@microchip.c=
om> wrote:
> > On Tue, Nov 28, 2023 at 11:27:22AM +0100, Nam Cao wrote:
> > > On Thu, May 25, 2023 at 02:18:36PM +0800, Jia Jie Ho wrote: =20
> > > > Selects ARM_AMBA platform support for StarFive SoCs required by spi=
 and
> > > > crypto dma engine.
> > > >=20
> > > > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > > > ---
> > > >  arch/riscv/Kconfig.socs | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > > index 1cf69f958f10..381cd46e6373 100644
> > > > --- a/arch/riscv/Kconfig.socs
> > > > +++ b/arch/riscv/Kconfig.socs
> > > > @@ -29,6 +29,7 @@ config SOC_STARFIVE
> > > >  	bool "StarFive SoCs"
> > > >  	select PINCTRL
> > > >  	select RESET_CONTROLLER
> > > > +	select ARM_AMBA
> > > >  	help
> > > >  	  This enables support for StarFive SoC platform hardware. =20
> > >=20
> > > I'm considering sending this to stable trees. Without this, it is not
> > > possible to configure the kernel with SPI driver for the starfive boa=
rd.
> > >=20
> > > I just want to check with you first, in case I miss something obvious.
> > > Any objection to backporting this patch? =20
> >=20
> > Personally I would be okay with that, otherwise the driver is dead code
> > in those stable versions. Just be sure that the rename of some pl011
> > variables (I think that's what it was) that was a pre-req for this being
> > merged is in said versions of stable. An allmodconfig should flag
> > whether that has happened pretty quickly.
>=20
> Thanks for the info. I think I found what you are talking about:
> a1a5f2c88725 ("dmaengine: pl330: rename _start to prevent build error")
>=20
> It's been a while and no one else said anything, so I am going forward wi=
th
> this.

Yeah, that's the one. Sorry that I did not recall correctly.

--/CfqRG+3NaUoxF3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXcTlAAKCRB4tDGHoIJi
0tSPAP0fomHmi7YWds0F/oHh3hVM4oN/K4hsf7KhyN6R6KXa7wD9FjJRHv9kYkrc
Hg2vmv/mB1FHAe7vdrFoRjf7hzLJYQc=
=+aPE
-----END PGP SIGNATURE-----

--/CfqRG+3NaUoxF3y--


--===============5362684900218454956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5362684900218454956==--

