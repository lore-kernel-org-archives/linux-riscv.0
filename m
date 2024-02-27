Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282E8C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7f6n2sT/28aDfo0mTZOUK4VZhca9R1tckn06Juws/T4=; b=VAmlxVrREyEsS0weS0h4MYgxEh
	2sbiEv9/hyM7tZEqITNGU0KJmtTMjkh+yrqrs/vEkmEEwv8kSisKZl0W4enEvcvlUjgX59KV6K+Gp
	aeReZNaknVwEbSNb0FjMCEdH9Cb41JCD5B4YL58/MvRXh/IOiiB/gNVf0bV6OIVNl9DK5n4OXApwj
	RCD6OPJCTLH2jCkn1lxOfSXMdxD35KD/g67pKQHcq15PKK2gQwJUnnuFkP9SwkmOJn1nvi2XLYKON
	5l71RXfEgwAadKSM1wv1w8M3ovdet8U2cMhjihJW9S79HiBDyRpbwxmIOSyKMFSfrATrrJ3FntyWv
	dNzpIpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewMZ-000000057d8-2tgO;
	Tue, 27 Feb 2024 12:15:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewMJ-000000057Sh-443F
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Feb 2024 12:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=77Bq2jOnqM0lJEjXQ9w5yraQAp1L7LHW/ihqVcm9RPo=; b=lOiQiXZR0B9h1cujqsYaNJ5t5L
	U4CLeRbk3OXS6PnjadtlHnw0tvsfWjhXHkWj6Y5TUfYQQnjcAnEgtffYNrd38NfyfL0JKq65/jol3
	/ou6igY19GSgsT5iW9bqik/aV38vlcoArPXUxdNHGNpuyWBHdRMEqgpl3SiA+WpxelWocqYW6CrXH
	p28H/6UYUao1AdrX0qtqvGLDMfldvuLhCem/I466Mt8c1Yc60yDdobaf0JN/lojFKOPquA2CpEq6B
	wD1NqwJTJxHN3QAmcA+WIeneFZZfXDTVCkj3Mrgxf6QN+HvNq42lvn317XuI2weLoS4V0EPulX2pZ
	JVf4D1OA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewMG-00000001jsE-1m13
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709036092; x=1740572092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fSrXRCpTEpQRkMIDKSjqJaiu1Qp1gr1z2GJ9vNCAs4U=;
  b=ksraICjaTEBh3HbfZH3vMA8/emppzS6paAKMjLnGcPjvvHKm/QtpVpIz
   t73KrQZrKOupLnZlqLlUaDcmVT0bClvKUd0kO55N9Hi42qiQYwnzYjILJ
   aDj5R0xgZTlj9O8YgIzCBUWscjdI7s86dD3dmWre/9XfwJrq3b6I9rHsH
   js+MU5Q3xYHpkEBMDEenNItKmvKLcyhNo4b/VXVhSGZbBfOydrhfkcKR/
   zveol4FFI76b7xHhsz82uSP714f2O4nkOnjpNPVvGM9wncLolM4NLsxZ8
   fNlcNS5eQuJcBAtS4FxOWiAcC95SxBG0CnInhv2+BywILiWvKrVHmSq9m
   g==;
X-CSE-ConnectionGUID: EC6mGCUkTgeb01x5BvwdWA==
X-CSE-MsgGUID: AaXkTeu7TIif8MCz6FcBNA==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="16882459"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 05:14:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 05:14:28 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 05:14:28 -0700
Date: Tue, 27 Feb 2024 12:13:45 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] riscv: 64-bit NOMMU fixes and enhancements
Message-ID: <20240227-footage-porridge-949a43ee8ecb@wendy>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_121453_015632_06569C9B 
X-CRM114-Status: GOOD (  14.22  )
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
Content-Type: multipart/mixed; boundary="===============1851690337237279508=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1851690337237279508==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CO1sGIa2Mft349oV"
Content-Disposition: inline

--CO1sGIa2Mft349oV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 04:34:45PM -0800, Samuel Holland wrote:
> This series aims to improve support for NOMMU, specifically by making it
> easier to test NOMMU kernels in QEMU and on various widely-available
> hardware (errata permitting). After all, everything supports Svbare...
>=20
> After applying this series, a NOMMU kernel based on defconfig (changing
> only the three options below*) boots to userspace on QEMU when passed as
> -kernel.
>=20
>   # CONFIG_RISCV_M_MODE is not set
>   # CONFIG_MMU is not set
>   CONFIG_NONPORTABLE=3Dy
>=20
> *if you are using LLD, you must also disable BPF_SYSCALL and KALLSYMS,
> because LLD bails on out-of-range references to undefined weak symbols.

That's not new to these patches though, right? IIRC that's an existing
issue.

Cheers,
Conor.

>=20
>=20
> Samuel Holland (4):
>   riscv: Fix TASK_SIZE on 64-bit NOMMU
>   riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
>   riscv: Remove MMU dependency from Zbb and Zicboz
>   riscv: Allow NOMMU kernels to run in S-mode
>=20
>  arch/riscv/Kconfig               | 17 ++++++++++-------
>  arch/riscv/include/asm/page.h    |  2 +-
>  arch/riscv/include/asm/pgtable.h |  2 +-
>  arch/riscv/mm/init.c             |  2 +-
>  4 files changed, 13 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.43.0
>=20

--CO1sGIa2Mft349oV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3R+QAKCRB4tDGHoIJi
0n0qAP4husn7Rq5mjuLx/yxtyV7nKMyhO3tT1JDLr71TEIcUmAD/a+xbAGs6K7dA
FvSbJPEadfhLnQI2kFIU0j/68ieDFwM=
=prhB
-----END PGP SIGNATURE-----

--CO1sGIa2Mft349oV--


--===============1851690337237279508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1851690337237279508==--

