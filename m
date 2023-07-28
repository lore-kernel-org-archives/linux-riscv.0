Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16471C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnywoUYQ81NWOzIhpW1DqK9VJD3x8BRcrof+8QctaXs=; b=gUsk97xNFW0pwM75mntz2O6Ym7
	hE7kovcVkDfWvjIdMQe3Xwr6wCQED+IdMQF0TyroZS9i320x5XIdVtdOfPCIJiYHmmHJS7YM69U/k
	TX6NPzR3/yiuJZR7s6tTSLRkJb4q32Nx3jbesLxMBe4lM0BGJ8he+6+oHFydmCRJTjm7CW6jY4/LY
	aUhQzAEijzynnA0jAS8JsLm9JHZ8eT0VuIrjFeRS8EFYE2qG3NS/5iQExDM6FELtWDfsDkItOz0Io
	AcVgGcylmRTvYSCTa7KSPkF/D8XLmFYAbyXjXWqm/WG0o3lFPt3DIpHMO+3G6xsAoGJmegq0bxYTn
	IAb47cdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNtA-003Zqi-2h;
	Fri, 28 Jul 2023 13:52:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNt7-003Zq6-37
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690552333; x=1722088333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=13yUOGGfMfswl4RW/YVIRSa8RvBKZJkyMPeM4Uwztbc=;
  b=e6736ybDF52saJEtkI1Nv+VCrxASeBeCyw9HzplhRlqxGy5xKPlO0cgD
   +H2X3xUy6XZE5FI+GaAFa2uNEiJi1OG0zEIjwiRsQhvFguwlwiS3dMpH/
   puXOyQZCWSbBVM1n1mkw5QYHNv2mJFr31rYjeLF4EGX4WSidY3lptM7jX
   JyZZapClJMqb3LW4JoW3o5bYIMXjd+wrjApsqe0Kw3M5bR4EPqDsh7KME
   KwZa+YlCyg38kmJJ1iMuEYAx/BXH1hHaJ3hyx6ovgwSYoQbMRPrWwUV2V
   W90g0BJkMhCw5VgskiH9TvX25kxS00ekyCduniQr3K2bF8W6oy5Qp4cHI
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="asc'?scan'208";a="163744085"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 06:52:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 06:52:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 06:52:06 -0700
Date: Fri, 28 Jul 2023 14:51:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton
	<akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent
 Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] riscv: Make __flush_tlb_range() loop over pte
 instead of flushing the whole tlb
Message-ID: <20230728-snout-defiance-082befdeaa51@wendy>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
 <20230727185553.980262-4-alexghiti@rivosinc.com>
 <20230728-f2cd8ddd252c2ece2e438790@orel>
MIME-Version: 1.0
In-Reply-To: <20230728-f2cd8ddd252c2ece2e438790@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_065214_092317_BEEA69DB 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Type: multipart/mixed; boundary="===============1210394378860370593=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1210394378860370593==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="avaIEXfS61g8yoTO"
Content-Disposition: inline

--avaIEXfS61g8yoTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 03:32:35PM +0200, Andrew Jones wrote:
> On Thu, Jul 27, 2023 at 08:55:52PM +0200, Alexandre Ghiti wrote:

> > +	else if (size =3D=3D (unsigned long)-1)
>=20
> The more we scatter this -1 around, especially now that we also need to
> cast it, the more I think we should introduce a #define for it.

Please.

--avaIEXfS61g8yoTO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMPH4wAKCRB4tDGHoIJi
0pcKAP98p/ImDQ/uxeHvVZf6GCqG6+uNVE4h+qEzQF4LDzyZJAEAu/5LBu9gRRSH
/J59XOyZqO6G+WA6CW2Eh+46AhRzmwc=
=3/WE
-----END PGP SIGNATURE-----

--avaIEXfS61g8yoTO--


--===============1210394378860370593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1210394378860370593==--

