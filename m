Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EF9C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS3HTg6Pq8EburANxVBJCn72KD/KbJeshfNTXWlJugw=; b=e+4KMpVTdnre3eRIM5fHzVBQIO
	p2JAkhZovK/+kqGRNBsB/rSRddg3t2E91N2w+r+E4PW2KZYcHpO8Yv4sjI4+zJStntwCZlDMS7uX1
	zR67e5Mg4Nt2G4ernpqcW3evmVymLCyLV2AZV1JmHth5K9Na3PiiaeTpStwqWRVkgOBmJbKXODl3u
	Psl5K2/+4nwJSdN5ZYBrtl22ou+0PcLXYCwZ7uyiPlJ8PSOvbMXrDrRmn0PD3k5J6kKXyd1YGAzGy
	NoIpAUFyimFBOy3nXwZkttmFHkJgU1SIXWtuohgXsFMxwZ0zrxXpflYHPslAT/MHNB1dMOFkRQOtv
	yBvl/jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwbj-004cH2-13;
	Mon, 24 Jul 2023 14:32:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwbg-004cGU-1r;
	Mon, 24 Jul 2023 14:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690209136; x=1721745136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8lSqctVplAIarKGMJtl03N2iVLoJAxL48zKohtkfpEY=;
  b=hGyInZdYiL5N5jRwYfD3YPZLhCX7yFyWtW9nYglME8CYpO728h5yd0qZ
   dZn1MQGHVbZ7RP+xbGGSoKIUfvgAcj9vNgoZsGESFQOiIY7ZxAzgjQcAn
   d+YQZ5z/KJYMBbCDcppImGrzHuBABkVcwa3HVdULnrPh6BRZc9dNkxK63
   mNJrw9fk7R0pH/sFKeXFewEG++zOATOdR3x5Avf2WHKB0/IO7xSv20/Vi
   Nncerj3u0enx3ALGouLVuMSovRB3c8ow+jIXWzjbNlgrjeDlroV3fdl0t
   j9osetJ33hBRZgsAnNkfA4LoBCvJ7ji2qqoQ8gKwy9MMq1Fcpkflh13X4
   w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="162903015"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 07:32:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 07:31:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 07:31:35 -0700
Date: Mon, 24 Jul 2023 15:31:01 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel
	<ardb@kernel.org>, Kees Cook <keescook@chromium.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-efi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 0/5] riscv: Introduce KASLR
Message-ID: <20230724-sanded-dental-c9125c76ad74@wendy>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230722123850.634544-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_073216_677947_79CF422B 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Type: multipart/mixed; boundary="===============4873181912754023224=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4873181912754023224==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xtSbObKEFv5fOwOJ"
Content-Disposition: inline

--xtSbObKEFv5fOwOJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Sat, Jul 22, 2023 at 02:38:45PM +0200, Alexandre Ghiti wrote:
> The following KASLR implementation allows to randomize the kernel mapping:
>=20
> - virtually: we expect the bootloader to provide a seed in the device-tree
> - physically: only implemented in the EFI stub, it relies on the firmware=
 to
>   provide a seed using EFI_RNG_PROTOCOL. arm64 has a similar implementati=
on
>   hence the patch 3 factorizes KASLR related functions for riscv to take
>   advantage.
>=20
> The new virtual kernel location is limited by the early page table that o=
nly
> has one PUD and with the PMD alignment constraint, the kernel can only ta=
ke
> < 512 positions.

I gave this all a go today, it seems to do what it it says on the tin,
and crashing my kernel does dump out an offset etc.

Tested-by: Conor Dooley <conor.dooley@microchip.com>

I'll hopefully get some time later in the week to go through the code.

Cheers,
Conor.


--xtSbObKEFv5fOwOJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL6LJQAKCRB4tDGHoIJi
0rUmAP434IQTNV26JB6nzkQMeniT7xYLVBw5Vtp0L980VphnTAD/UnQM8ZUEwq2o
p+omBnMci+/NF3PBemZTOQee5NYREwg=
=PcHz
-----END PGP SIGNATURE-----

--xtSbObKEFv5fOwOJ--


--===============4873181912754023224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4873181912754023224==--

