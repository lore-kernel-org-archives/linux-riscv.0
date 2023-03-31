Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D479EC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hL7h+vVFfjcmZtxDGrD8oey8zsT+avdHu97/GnfiJ28=; b=jwXf0tSNYIv42o8adfP8M11BlT
	hUr6zAWlTa5fRyu++6zoq/veTd9TpZXKtpzxLPLrzoUJGV54sLH/J/JyRoQ7Nzj3Lx9Jil/N6m/iK
	LVnqxgxV8yTPmVg5ZgdtR0TJv5DF9JpT1cHXjqPgiT+m0VAkWOviylA+P+uTu0fCQALrCeVWT+ama
	9VvzZdPdL/5l0CDN3Oh7QYLncLDqdMA8fHs5+T3RGOzsS+SZgR31asolddYElDPR3pDCSgXZWtCfd
	nfEroOMkUaSP7JqaecVwQ3EeBuKmwdaxrMQe+rmy5iiKASkivVgmbXM9H7uyOMOvTs1IFy8R2INpR
	hQVQW5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9bN-006FQg-0V;
	Fri, 31 Mar 2023 07:55:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9bI-006FOx-2G
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680249308; x=1711785308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G06WLXOVFAFnLBBUsp6Jlr0u7jQcjZ+I3gaWkuDCem4=;
  b=edKMwGFar8ioxxHgrSOanZhFrdU4zLo3oB+f4F5xYI1+/AuXw0cVs6fV
   RYWD7dH5dQ9SJoFR7XOr0oMw4O4HA2z1B2G1m0efbLEtWeEj+5VJMVO+l
   llVxWizHn/6tOThoYJcPe6CKHISwINlsExvqmIJKNAIi3d32LOso0Kcn5
   tOkcbjgl0VEmcV4/JdlG4fbjLWIc/R53uR6Mi5E4/YjlHGoAIdfBVLlPg
   xTavGRNlZe7C9t1GUYCiVfex93/1PWNazxmcM2hPhgoF+mGBZBAlYW0ce
   tEcwiqrzQbUFbjK/tz5jtwQS+WkZkuPxpYu49e2Z2BwWvZGKV/skgX0OK
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="asc'?scan'208";a="208206452"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:55:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:55:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:55:04 -0700
Date: Fri, 31 Mar 2023 08:54:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Heiko =?iso-8859-1?Q?St=FCbner?=
	<heiko@sntech.de>, guoren <guoren@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel
 Holland <samuel@sholland.org>, <linux-riscv@lists.infradead.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <c63bace6-1046-4428-97ba-6f12fd119dc6@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_005508_865526_D60B9771 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============1664847207670495840=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1664847207670495840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3+eEFpkaOtz7KiLx"
Content-Disposition: inline

--3+eEFpkaOtz7KiLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 11:34:02PM +0200, Arnd Bergmann wrote:
> On Thu, Mar 30, 2023, at 22:42, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > +#ifdef CONFIG_ERRATA_THEAD_CMO
>=20
> I would rename this to not call this an 'ERRATA' but
> just make it a driver. Not important though, and there
> was probably a reason you did it like this.

I think what was discussed in a prior iteration was that we'd leave
refactoring the T-HEAD bits into a driver for a subsequent work.

--3+eEFpkaOtz7KiLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCaRuwAKCRB4tDGHoIJi
0henAQDzrAo67Su8ED56Dq3c08Eyq7o64Jv8WJBe/+zTzHdyxwEA9bnQTwb2UDwF
/2XfB1c09QrVeBENyd3hleXb77tXbgo=
=4qUu
-----END PGP SIGNATURE-----

--3+eEFpkaOtz7KiLx--


--===============1664847207670495840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1664847207670495840==--

