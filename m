Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD1EC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 06:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTuKy3VFCX6/bdykCaj2k2Zxq2dY5NRMhx2Oy8R7Ccg=; b=H9rDNdiJEQyHdVdHYhrKIpdx43
	voxiZuBIXCLhvacibIIctMTPUHYPEnaZafelwp6nfkNQhba6BUZIiNuseDKBLi31OSrpxjAjP5eFX
	0UQYxXjQRFlC0K3Mc8GVyPLEijGYwYCdHbauaG27uc4gYArdOhpfyr+NmVpEBj5iR9/vbqDViMhmd
	EKCbB3znpaT7JEUolU4QSoPTHDFLMGpxnROZ5a8V9dTgdezaSotCmrObEeTkiINSwBUb1o2nihggR
	af9v5kgr7Ri6E6dhwbTnW5atGIYjzr+SWDxeTBMMQYcYcRnl8TiC+YtKJ1ImuhWyoaZIontWrCesW
	x5hvBtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkiB-009tYG-1A;
	Fri, 21 Apr 2023 06:57:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppki7-009tWO-1m
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 06:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682060255; x=1713596255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RR/GwxIPJp1LvH/O5qzkk2jIkKJgEACvWvFh5xZ2Irs=;
  b=gMMVGeFuK3gqUrVjSE98QjJPcmlVudTEgTCo/2GdYsRjldHtxVSOFQ5n
   ceIFpqQQXZFJIds3mXtuSJf70ld0UowmsTCK9CYJePJ0CBBm3RjF4dHAW
   BP3P1DWufEn/WRrf/OuUbQmeMKWS9wkC3hTLCNHkRT6+lurIC3pcp5Byn
   pbvCqVtrZcPo3QIUfYAtGy0aLR2lW1ZcJyBdRlY4ZoXTjgJDaiYaIK8Qp
   0hMCHVEdvLIeoH8CnvNljRm1MmEkNgcVMlcnWY9QeZ5zFcyThdhSqF9rd
   O0NfAafZNkxZ3TQYl73a2sEf6+iTUCFz7Qr+HUkaTex/gJscocn189Dx/
   w==;
X-IronPort-AV: E=Sophos;i="5.99,214,1677567600"; 
   d="asc'?scan'208";a="211606888"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Apr 2023 23:57:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Apr 2023 23:57:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Apr 2023 23:57:27 -0700
Date: Fri, 21 Apr 2023 07:57:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [RESEND v2 4/6] soc: starfive: Extract JH7110 pmu private
 operations
Message-ID: <20230421-fringe-demise-606ff852ed25@wendy>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-5-changhuang.liang@starfivetech.com>
 <20230419-atypical-unbounded-99cbbff3091a@spud>
 <8ce740ac-54e9-bf31-1e03-2f3e0e9ef63c@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <8ce740ac-54e9-bf31-1e03-2f3e0e9ef63c@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_235735_655388_0820DEE0 
X-CRM114-Status: GOOD (  16.25  )
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
Content-Type: multipart/mixed; boundary="===============5962464125489055810=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5962464125489055810==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="whpq0z6G+BY+y9JJ"
Content-Disposition: inline

--whpq0z6G+BY+y9JJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 11:27:52AM +0800, Changhuang Liang wrote:
> On 2023/4/20 1:47, Conor Dooley wrote:
> > On Tue, Apr 18, 2023 at 08:56:44PM -0700, Changhuang Liang wrote:
> >> Move JH7110 private operation into private data of compatible.
> >> Convenient to expand different compatible.
> >=20
> > I prefer how the code looks in v2, thanks.
> > However, just as in the prior patch, "Convenient to expand different
> > compatible" isn't really a justification - specifically, supporting the
> > power domain controller serving the dphy is your motivation here. The
> > important difference being that it uses a regmap from a syscon and has
> > no interrupts nor the encourage features.
> >=20
>=20
> So should I expand the commit message which called "in order to add the=
=20
> aon power domain" although the patch is applied behind current patch.

Only if you have to resend for some other reason. If there is no other
reason to resend then I will do this when I apply the patch.

Thanks,
Conor.

--whpq0z6G+BY+y9JJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEIzxQAKCRB4tDGHoIJi
0uQaAP0VHFstQ10nEETQ5/V1KFvj6xugGX2GI78pPNHSxwuyBwD+J5xDyy2MKyk7
xmvBUp4E1A/MKZoezNX4Yh9wHKabpwQ=
=DdnF
-----END PGP SIGNATURE-----

--whpq0z6G+BY+y9JJ--


--===============5962464125489055810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5962464125489055810==--

