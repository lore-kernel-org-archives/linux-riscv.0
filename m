Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E38C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqvcrKYb5jKaAfFSkrKoRuTOiy3Z2w6QOH2GYrXEnrg=; b=Mb/SSFknWdr9MOMdyx8XMby9hC
	Ix+9WbOFwtsyYW5LmPtjya499gv1HJ8gORaHFTb8HPjwdGQJARd+hm0r6h0NNkjcEDb8xAYVOZB3A
	eqBIIstwbgmhKEHkEL4REWd1m8HtMVjWCFDyiFOeoJhk4Z+9x+YcV0dukdRGe/uE0vk1/48zaIbsC
	J/8K9h8eNjfoZTunX5saH+tkQoXTrOGXtWpYk+ZEkXaFBlYMtRHF0H2/Rs4glke+FS3V3m4+TDJH2
	hdqsHK846a30RD/MJLJ/5ok29yNNW2HbnXG58Zb23wntf1Q/ZAQp316sA+h66jAhF90LIkj3JqFbv
	Z7kffUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvOZ-00H0vi-1a; Mon, 23 Jan 2023 11:53:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvOW-00H0uk-0P
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 11:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674474829; x=1706010829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XOKFYtVwSuo7NbceUr8gbJ4il7bdjARy4NJ/Z6J55HI=;
  b=cgxw2Y0bszo7LGxlSz5rBqq++lLLDfaddaTfviT5J6OD5qKPfI5BbofK
   Q8HlkgZN7GcONLx6zUrlLnu7CLavHVbEce26PPUsMEdmhzMjv0e0oHkKo
   MDp1hLJshxyvE0BvA6Dg+JHpSK545svV64aAuWhOyVKqquqGnEClGORmN
   FH4G88XXzgcJfr7kSFqUwFOAqCu0R2mg3kZus3dSnw6D8ZGYCcaigasaE
   RFblmjsIA9ZBnDRCS571Z2VE/uabJnHGT1roosDWMmH8f0Wibe8KMAkFi
   DpvmqVnO5y31G3tMXPsPakJCYlxjW9CRnwRQsOMDosxk81ncv4EWmDDrp
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669100400"; 
   d="asc'?scan'208";a="193427985"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jan 2023 04:53:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 04:53:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 23 Jan 2023 04:53:42 -0700
Date: Mon, 23 Jan 2023 11:53:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>
Subject: Re: [PATCH v3] riscv: Allow to downgrade paging mode from the command
Message-ID: <Y851L2KgfIF3V6of@wendy>
References: <20230123104841.813999-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230123104841.813999-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_035348_147295_E0E79E17 
X-CRM114-Status: GOOD (  19.39  )
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
Content-Type: multipart/mixed; boundary="===============1910546728168962296=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1910546728168962296==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XcFxwQIDKAyigG7z"
Content-Disposition: inline

--XcFxwQIDKAyigG7z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Mon, Jan 23, 2023 at 11:48:41AM +0100, Alexandre Ghiti wrote:
> Add 2 early command line parameters that allow to downgrade satp mode
> (using the same naming as x86):
> - "no5lvl": use a 4-level page table (down from sv57 to sv48)
> - "no4lvl": use a 3-level page table (down from sv57/sv48 to sv39)
>=20
> Note that going through the device tree to get the kernel command line
> works with ACPI too since the efi stub creates a device tree anyway with
> the command line.
>=20
> Also, as those params are treated very early in the boot process and we
> use standard device tree functions that may be kasan instrumented, we
> only enable them for !KASAN configurations.
>=20
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---

A changelog would be nice here, especially since this is a resend.

>  .../admin-guide/kernel-parameters.txt         |  9 ++-
>  arch/riscv/mm/init.c                          | 72 +++++++++++++++++--
>  2 files changed, 74 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 6cfa6e3996cf..fd647412ec91 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3578,8 +3578,15 @@
>  			emulation library even if a 387 maths coprocessor
>  			is present.
> =20
> -	no5lvl		[X86-64] Disable 5-level paging mode. Forces
> +	no4lvl		[RISCV] Disable 4-level and 5-level paging modes. Forces
> +			kernel to use 3-level paging instead.
> +			Note: On RISC-V, this can't be used when KASAN is
> +			enabled.
> +
> +	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
>  			kernel to use 4-level paging instead.
> +			Note: On RISC-V, this can't be used when KASAN is
> +			enabled.
> =20
>  	nofsgsbase	[X86] Disables FSGSBASE instructions.
> =20

For the improved descriptions & commit message:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--XcFxwQIDKAyigG7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY851LwAKCRB4tDGHoIJi
0l53AQCQBy900mmtPk9mKM2S57CvkHVjvKm4ZRfqIL0OzE1p/wD9EENKG8gQAyvL
Ul0Q3WPbMqxqHndNJMtEyr2dDYBQkAI=
=gpGS
-----END PGP SIGNATURE-----

--XcFxwQIDKAyigG7z--


--===============1910546728168962296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1910546728168962296==--

