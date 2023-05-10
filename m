Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30C3C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ab003B6oQK6gtMkNxKm8my+3jCj8MA18NJAC1UlLRLI=; b=tmX5jqBSwUOINW0fwY4bvn2bE6
	DO4YYZfEiSKqq9dCdfqAHNRcR0wneQU6Knw4umiQFkFIhzKRr6X6+zXitZK/gG/qsBbDODpkLEBTt
	ayWc8oKC8BJIak5MjWfMi6n9VyTtLYmEHLbidaFEo4P9SoPn136Ey0aZ/LM6kT1HrbHCoLa89rxjM
	8e0HWXX4aU++m6e4tCsETHD9RXblYJHGCEea+uN+juA7iiFag+07nK0pHdNe0b48cGSXj0K2Df6/k
	lL0O9Oje0i9amFZ+CSqRy90mIdy169Hz1kYJD8RyUpAGwx88YVwLSDXFXU/0bKVYIHaD3yf0gzugO
	978PRwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgzq-005l74-0a;
	Wed, 10 May 2023 10:24:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgzm-005l5q-0x
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 10:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683714271; x=1715250271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/dKuhBAooiK7NxI6ZJD57YCt/AXZDva/ko2oLS9g9Q=;
  b=u0nQr0DYAgUniMKaQu8Ur5j0nRel6jyv0bBvfclp3QHNxJR023/fFK3d
   EnaHUdsPgKZ1BpK0DgJ8zdEnfKY6biHPK7PDz1G/cg/f4J1JidcztdYB+
   5tZF0vnforv/wF03040g/zUhI2EEOvVVMybSlH6cuJU0ys2wvkuJ/GTj3
   Wc3WQ5WIWZTFI5gLw/wvx+42FBcbiUOIgA21yYKbtw99RECaX71OmVcgI
   uW+IM5rJ/AeiSybj/ZZ/lHvCXlEcQQ5nI2B4AZui2SrkB83b5EmQk7Y27
   otWUBG1AkP+AMOmluRct3XzU4/9HwazeeavN6CnjjzC9Jd10M+zYqFOY4
   w==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="213245200"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 03:24:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 03:24:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 03:24:22 -0700
Date: Wed, 10 May 2023 11:24:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Atish Patra
	<atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Anup Patel
	<anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<iommu@lists.linux.dev>
Subject: Re: [PATCH v3 00/11] Linux RISC-V AIA Support
Message-ID: <20230510-parchment-saxophone-f91f9d96156c@wendy>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_032430_452773_23B851FA 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Type: multipart/mixed; boundary="===============1663277339357856411=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1663277339357856411==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="drOWBx1kyE087zJ+"
Content-Disposition: inline

--drOWBx1kyE087zJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Mon, May 08, 2023 at 07:58:31PM +0530, Anup Patel wrote:
> The RISC-V AIA specification is now frozen as-per the RISC-V international
> process. The latest frozen specifcation can be found at:
> https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interr=
upts-1.0-RC1.pdf
>=20
> At a high-level, the AIA specification adds three things:
> 1) AIA CSRs
>    - Improved local interrupt support
> 2) Incoming Message Signaled Interrupt Controller (IMSIC)
>    - Per-HART MSI controller
>    - Support MSI virtualization
>    - Support IPI along with virtualization
> 3) Advanced Platform-Level Interrupt Controller (APLIC)
>    - Wired interrupt controller
>    - In MSI-mode, converts wired interrupt into MSIs (i.e. MSI generator)
>    - In Direct-mode, injects external interrupts directly into HARTs
>=20
> For an overview of the AIA specification, refer the recent AIA virtualiza=
tion
> talk at KVM Forum 2022:
> https://static.sched.com/hosted_files/kvmforum2022/a1/AIA_Virtualization_=
in_KVM_RISCV_final.pdf
> https://www.youtube.com/watch?v=3Dr071dL8Z0yo
>=20
> The PATCH3 of this series conflicts with the "irqchip/riscv-intc: Add ACPI
> support" patch of the "Add basic ACPI support for RISC-V" series.
> (Refer, https://lore.kernel.org/linux-riscv/20230508115237.216337-1-sunil=
vl@ventanamicro.com/)

This series does not apply for me (or the patchwork automation) on top of
v6.4-rc1, which was released prior to you sending this & contains the AIA
definitions this series relies on.
You note here that there is a *conflict* with Sunil's series, but what
you actually did, as far as I can tell, is base your series on top of
theirs?
If you're going to do that, at least point it out so that reviewers
don't have to figure out what your intention was :( Better yet, for the
sake of our automation in particular, don't do it at all.

Thanks,
Conor.

--drOWBx1kyE087zJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFtwwwAKCRB4tDGHoIJi
0t1JAQDg/nff4RAapk5rR40Fc9M7gbVoPtea9uxe8wNvwzKrFgD8DzIxMd1/AHTL
9YZT8pbRkIczFFTrwTSfcWJL2zf7Rg4=
=T9IK
-----END PGP SIGNATURE-----

--drOWBx1kyE087zJ+--


--===============1663277339357856411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1663277339357856411==--

