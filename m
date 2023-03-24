Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E27DC6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHUYwZH7paWZ1NACw2YIk9GX8TRv4P3VVFdydkvKgv4=; b=ocK88+T8dxIhht698Ho9AdYTtl
	ZqEiOLoiLGMtcy1S1YVt9373dN8aWfpU+EifLUK6DqUwl8rhgYXExGHpiQtcCiAnI6/rty7boZZ5Y
	ItB+Rm3feiZF/cVkLaxgunhefTdJyroHhs2I1a6VtGl3FRipP46oVmqKI2bYxKO1PvT4mKulQxtea
	Ih4nsjOL7Gmi5UViAwAGgONvRJWxowfcs7mlYtTJpayHiNz7PItj3REwkhUjWr8vZ0bN2xVdTCdc4
	U/grdY9T6is0Muk/Y9FEbgrycxSa0lo5/I2/hkZIpmaANYkRC1AW4Fc3Bcz6jcsXcPGBKQlwNVP5Q
	7MxO3r/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pffjm-004GFm-2o;
	Fri, 24 Mar 2023 11:37:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pffjj-004GET-34
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 11:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679657855; x=1711193855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IYX2yiBdi+H5GU+DmapKpR5UJVC8Y6HTCJ/8rFnvS8Q=;
  b=gTGaRChwicXzi2KX0jRD2EWY5Pp8WXhcTGst8xaRIbzqD/BLVI6xGts3
   6eAKZExsVc0uGkHlH98bdJs1kTve+ERQF4CgMZL4xoOm0WKDRWvpzsde0
   jPrpfXMSZCSjfdPG03zpBH3ooDX2mSciWob+cD/KND67L3/1UGi8CycwV
   bFC64dFHChNUVtcIfQLUPVIGdGfijYQww6T5IkegFPplydVb3sn2oUHiv
   VMuAnTR1j8ZTYSTtWgm5KhVwFimzqTsW+dAnFwIWmHv5BEtcnEd9osIS6
   wxaXXZW8X+6UpqaLHU72suPFXLqk2KxgNFpWdezve44Pc/L/0QYvYDCsl
   g==;
X-IronPort-AV: E=Sophos;i="5.98,287,1673938800"; 
   d="asc'?scan'208";a="143714944"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2023 04:37:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 04:37:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 24 Mar 2023 04:37:24 -0700
Date: Fri, 24 Mar 2023 11:37:05 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <palmer@dabbelt.com>, <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup
 Patel <apatel@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>, "Jason A
 . Donenfeld" <Jason@zx2c4.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] RISC-V: Fixes for
 riscv_has_extension[un]likely()'s alternative dependency
Message-ID: <e7a93223-54e4-4c97-b121-5d1be3af0d65@spud>
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
 <20230324113107.djp4ejnlpzn3qzrb@orel>
MIME-Version: 1.0
In-Reply-To: <20230324113107.djp4ejnlpzn3qzrb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_043736_094134_73A39E28 
X-CRM114-Status: GOOD (  28.52  )
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
Content-Type: multipart/mixed; boundary="===============5528348445811697380=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5528348445811697380==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ny1hFZsdzoiIlIxz"
Content-Disposition: inline

--ny1hFZsdzoiIlIxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 12:31:07PM +0100, Andrew Jones wrote:
> On Fri, Mar 24, 2023 at 10:05:37AM +0000, Conor Dooley wrote:
> > Here's my attempt at fixing both the use of an FPU on XIP kernels and
> > the issue that Jason ran into where CONFIG_FPU, which needs the
> > alternatives frame work for has_fpu() checks, could be enabled without
> > the alternatives actually being present.
> >=20
> > For the former, a "slow" fallback that does not use alternatives is
> > added to riscv_has_extension_[un]likely() that can be used with XIP.
> > Obviously, we want to make use of Jisheng's alternatives based approach
> > where possible, so any users of riscv_has_extension_[un]likely() will
> > want to make sure that they select RISCV_ALTERNATIVE.
> > If they don't however, they'll hit the fallback path which (should,
> > sparing a silly mistake from me!) behave in the same way, thus
> > succeeding silently. Sounds like a
> >=20
> > To prevent "depends on !XIP_KERNEL; select RISCV_ALTERNATIVE" spreading
> > like the plague through the various places that want to check for the
> > presence of extensions, and sidestep the potential silent "success"
> > mentioned above, all users RISCV_ALTERNATIVE are converted from selects
> > to dependencies, with the option being selected for all !XIP_KERNEL
> > builds.
> >=20
> > I know that the VDSO was a key place that Jisheng wanted to use the new
> > helper rather than static branches, and I think the fallback path
> > should not cause issues there.
> >=20
> > See the thread at [1] for the prior discussion.
> >=20
> > Cheers,
> > Conor.
> >=20
> > 1 - https://lore.kernel.org/linux-riscv/20230128172856.3814-1-jszhang@k=
ernel.org/T/#m21390d570997145d31dd8bb95002fd61f99c6573
> >=20
> > CC: Paul Walmsley <paul.walmsley@sifive.com>
> > CC: Palmer Dabbelt <palmer@dabbelt.com>
> > CC: Conor Dooley <conor.dooley@microchip.com>
> > CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > CC: Andrew Jones <ajones@ventanamicro.com>
> > CC: Anup Patel <apatel@ventanamicro.com>
> > CC: Jisheng Zhang <jszhang@kernel.org>
> > CC: Andrew Jones <ajones@ventanamicro.com>
> > CC: Jason A. Donenfeld <Jason@zx2c4.com>
> > CC: linux-riscv@lists.infradead.org
> > CC: linux-kernel@vger.kernel.org
> >=20
> > Conor Dooley (2):
> >   RISC-V: add non-alternative fallback for
> >     riscv_has_extension_[un]likely()
> >   RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels
> >=20
> >  arch/riscv/Kconfig             | 12 ++++----
> >  arch/riscv/Kconfig.erratas     |  6 ++--
> >  arch/riscv/include/asm/hwcap.h | 50 ++++++++++++++++++++--------------
> >  3 files changed, 38 insertions(+), 30 deletions(-)
> >=20
> > --=20
> > 2.39.2
> >
>=20
> LGTM, but if it was based on for-next then it could also immediately be
> applied to zicboz. For the series,

Hmm, I did it on top of fixes since this needs to go into v6.3.
Perhaps I can create a standalone patch for Zicboz and Palmer could merge
these two into both fixes & for-next, with the standalone applied on
top?



--ny1hFZsdzoiIlIxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZB2LYQAKCRB4tDGHoIJi
0lyGAP41T7BFcI8gpNw9Enx+WARRH/LnHpRTEIp5DD90xctutwEA/0H/s+TCAH2W
54dRVB1P9vR5Fb4nrt/k06p8ZHDa3wg=
=4buk
-----END PGP SIGNATURE-----

--ny1hFZsdzoiIlIxz--


--===============5528348445811697380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5528348445811697380==--

