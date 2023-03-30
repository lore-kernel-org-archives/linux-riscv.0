Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADFCC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/0HOLhn5oEju/BpvRMEVmNzTxdp1hK+6VEkylym3BM=; b=xFoRqdkantUHJjCGhhClE9X6Dc
	G3UJ5t2xFsPUsHmCasK9jb0+V4/dW/1JnjQJBdYWaRmnXb6lJ604H6wJxZzy/+TZBWF2tAdlSIKpO
	X30ys9I4xgxCuJamnjzQC97djPmDe0YWOc4kY90aIpq2/Ir4a3FjPYDalTsxxuQuDjJiQzZG0JwWh
	r/8f7zs5GDp8//Joo5gBY9Z9oU06E5dR5JIQJz9uie8EmkcJdDryNdpdgmXY1Deg5bkMrLF0pbDqc
	rClcncHv5rcPOJ5t7WZZgLomxnF6piZIPH0Tn/dgOPPJvhXek2MhbcMzC67ugfeXCHY7IlEyZOJlb
	V2Eu6PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phljF-002kos-2X;
	Thu, 30 Mar 2023 06:25:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phljD-002kn9-0h
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 06:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680157542; x=1711693542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5EGj2XhAyY9wzau/N0SV9k/j+g1O3v8mLGQWAMN9hys=;
  b=jJw8Zh4W1pxL79owFntosZl4SPoOX/bSkiEFXhcpj28w/NdehMmoYfNi
   c5DyYP3jl4GtD1myn04vuKt71S7nZfIDKMg0cVlvJkysHkle5Ot/i8vPF
   JbdvvnOzKgVxH747DPMPCeSh/Jrssrhz93lg9pHqAG0JIoshpA5PWsvbC
   HULdQM+htuMyu3Ez25YU7pyeG+MYD44nCEJMMM85WZp4ZJBCpshzpV3ug
   ZZdo3HtuyeZr6PxCL/auiFxqKu68SJ+l73ivygmIgWmKQdYr8dqrDniyv
   4pbj5Y3Rmr1eCsCOK3uS6LaUUyAtca3Nmqr79LmP5th9zsGPLvVjmiSrr
   A==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="218638271"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2023 23:25:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 23:25:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 29 Mar 2023 23:25:37 -0700
Date: Thu, 30 Mar 2023 07:25:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	<iommu@lists.linux.dev>, Conor Dooley <conor@kernel.org>,
	<linux-riscv@lists.infradead.org>, <geert+renesas@glider.be>
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Message-ID: <e1b6f12a-899b-4985-8725-556bcb5d0991@spud>
References: <20230330060105.29460-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20230330060105.29460-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_232543_352370_8AB854A0 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: multipart/mixed; boundary="===============4256164748998751152=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4256164748998751152==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="voV2wf9Drw69lJ6G"
Content-Disposition: inline

--voV2wf9Drw69lJ6G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Randy,

On Wed, Mar 29, 2023 at 11:01:05PM -0700, Randy Dunlap wrote:
> On riscv64, linux-next-20233030 (and for several days earlier),
> there is a kconfig warning:
>=20
> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>   Depends on [n]: IOMMU_SUPPORT [=3Dy] && (ARM || ARM64 || COMPILE_TEST [=
=3Dn]) && !GENERIC_ATOMIC64 [=3Dn]
>   Selected by [y]:
>   - IPMMU_VMSA [=3Dy] && IOMMU_SUPPORT [=3Dy] && (ARCH_RENESAS [=3Dy] || =
COMPILE_TEST [=3Dn]) && !GENERIC_ATOMIC64 [=3Dn]
>=20
> and build errors:
>=20
> riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L140':
> io-pgtable-arm.c:(.init.text+0x1e8): undefined reference to `alloc_io_pgt=
able_ops'
> riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L168':
> io-pgtable-arm.c:(.init.text+0xab0): undefined reference to `free_io_pgta=
ble_ops'
> riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L140':
> ipmmu-vmsa.c:(.text+0xbc4): undefined reference to `free_io_pgtable_ops'
> riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L0 ':
> ipmmu-vmsa.c:(.text+0x145e): undefined reference to `alloc_io_pgtable_ops'
>=20
> Add RISCV as an allowed ARCH dependency to fix these problems.
>=20
> Fixes: d286a58bc8f4 ("iommu: Tidy up io-pgtable dependencies")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: iommu@lists.linux.dev
> Cc: Conor Dooley <conor@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> ---
>  drivers/iommu/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -- a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -32,7 +32,7 @@ config IOMMU_IO_PGTABLE
>  config IOMMU_IO_PGTABLE_LPAE
>  	bool "ARMv7/v8 Long Descriptor Format"

I'm probably missing something here, but why would we want to enable
"ARMv7/v8 Long Descriptor Format" on RISC-V?
Would it not be better to make the Renesas depend on, rather than
select the option? It does seem highly arch specific, and I feel like
Geert previously mentioned that the RZ/Five (their RISC-V offering)
didn't use it.

Cheers,
Conor.

>  	select IOMMU_IO_PGTABLE
> -	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on ARM || ARM64 || RISCV || COMPILE_TEST
>  	depends on !GENERIC_ATOMIC64	# for cmpxchg64()
>  	help
>  	  Enable support for the ARM long descriptor pagetable format.
>=20

--voV2wf9Drw69lJ6G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCUrRAAKCRB4tDGHoIJi
0mUOAQC/6NyhN5R0KrNSLvgjSttTTgoOT7Q7tk3qW1ws7ymJKAD/RCBEsz++6L3M
0m6tx3tTnLt6jB6secRd7TkULa4UGwo=
=UDBy
-----END PGP SIGNATURE-----

--voV2wf9Drw69lJ6G--


--===============4256164748998751152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4256164748998751152==--

