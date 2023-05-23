Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB600C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eQGDSCDvUleQklQ0wp5LAxa+ZiQ4mKc2VHkQ42OPNU=; b=xRKqZeWdOIdbUalWtnkjtCoR9A
	aFHk7+I+h6P47n/gb8orXVpt3EbpcBkDp01/I0rSAMflat5UyIT018lfaTX9g6FLPVuknehOu1/kz
	Yn5aY34YFIAs1/KVuNsfSrg/UxvyHT5/iGa6zZ48nCUs20EfYM2dNmj40ioDBDlwsVPMjRte+54qE
	FTRlIvxzGDNp8thPcm0hz2QHYx031njYgSAMGYky5y+baL4/VkuK4kZmttgubCPyY5gNcUaV5/rEp
	eI33Q3o6bbWRWn0lVHyQsR+X5sZAZqce6GVp/DlUcJOR8UpG3DXKEsdxQp//o4VQ1Qhpya/+brgmb
	XJMBKs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Lo7-0097Ic-2Y;
	Tue, 23 May 2023 06:47:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Lo3-0097Gh-0h
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 06:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684824459; x=1716360459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gVWbWiw/ZDPW0HOBd+nK8L6v2Q4lPpGLd6wth1TKIO8=;
  b=BnAdoDey7xvfxlD+62c1Wl0yaGtTmY58JnsKRqag/Y5V86dGRY/U7VT5
   37FBtNibksUyByisjCSwyB7RUyR/URPyKgZcbwUzLXTKkAmPfDN6squfS
   UjBmR0I80gHWAU36hqwlrBljxzIiChJ2BcqNSfEIRwO/BzxLb8/X4BCAY
   knUpP4I8G2FdDtRdLKKrmcdScbJ3BPmEvODq2jCM0zSxh2tHuTMFYgmS7
   ei3ECrIWGwjoQt0SeZ5TdKFGxiYUrXLXa97NfoRy8M0ven5T2jIL0U9T1
   iXXhB9UvntlO2eFuBwTy4zySK4E/gpfPrybAIFQ1VFwmxkyD8/w52Qm++
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="asc'?scan'208";a="216790503"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 23:47:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 23:47:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 23:47:27 -0700
Date: Tue, 23 May 2023 07:47:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Jaswinder Singh
	<jassisinghbrar@gmail.com>, Jaswinder Singh <jassi.brar@samsung.com>, Boojin
 Kim <boojin.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell
 King <rmk+kernel@arm.linux.org.uk>, Vinod Koul <vkoul@kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dmaengine: pl330: rename _start to prevent build error
Message-ID: <20230523-lushly-purr-9a93ea9f3573@wendy>
References: <20230523000606.9405-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20230523000606.9405-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_234739_443331_421AA8CF 
X-CRM114-Status: GOOD (  13.74  )
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
Content-Type: multipart/mixed; boundary="===============3892273390201996972=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3892273390201996972==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z31axD9H5YaGMLWg"
Content-Disposition: inline

--Z31axD9H5YaGMLWg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Randy,

On Mon, May 22, 2023 at 05:06:06PM -0700, Randy Dunlap wrote:
> "_start" is used in several arches and proably should be reserved
> for ARCH usage. Using it in a driver for a private symbol can cause
> a build error when it conflicts with ARCH usage of the same symbol.
>=20
> Therefore rename pl330's "_start" to "_start_thread" so that there
> is no conflict and no build error.

_start_thread() seems pretty generic to me too, but there don't appear
to be any users & it is certainly better than the one causing build
issues!

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> drivers/dma/pl330.c:1053:13: error: '_start' redeclared as different kind=
 of symbol
>  1053 | static bool _start(struct pl330_thread *thrd)
>       |             ^~~~~~
> In file included from ../include/linux/interrupt.h:21,
>                  from ../drivers/dma/pl330.c:18:
> arch/riscv/include/asm/sections.h:11:13: note: previous declaration of '_=
start' with type 'char[]'
>    11 | extern char _start[];
>       |             ^~~~~~

--Z31axD9H5YaGMLWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGxhZQAKCRB4tDGHoIJi
0rdIAP0Wabw96Kn9nVf+19fFM6AKRhl6z6gMm92JhKoWeudwbgEA7e0bLMA81R1s
DRBqxN4TNE5YBg3iPigE5gMne6P0KQ4=
=sBDX
-----END PGP SIGNATURE-----

--Z31axD9H5YaGMLWg--


--===============3892273390201996972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3892273390201996972==--

