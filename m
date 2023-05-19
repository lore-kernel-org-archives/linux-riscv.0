Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207E6C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvIWTAqptEdp7plX96VArKvSo/bSLpynhRFndS8gz8=; b=KBxVa+jS/uDjm6zIw8y3yDGbUt
	mXJlKOg4iAQMxvdft4/0nNtH1SYwfj8C3eoJtyw3CiSErJMbV+SkYleSBMtdn9YK3hn9VB+XbgYpW
	3uVtsv8+xH275TAq0PjNlgIcXQ7ZI9Cw5yXTPRRM7GIxWxzyWezQgoSv315VyjJYuRca7w9H2c89Q
	FJ8e+ECRuQ5mNoJkbKDp3j4TxugSEPkI4s2OK6o5bGGCG4fnoxnsviwQt+3gurXuHUkBDG1CUjqZ5
	59gQam642jtfMUTbi4X4C/3qlnSXoqTpU+VdFTM6tqU4Y1F1vEdH+PCwoNamFVV+xXpUZDzEOm8Ta
	oDz4thsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q00Za-00GQfj-2p;
	Fri, 19 May 2023 13:55:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q00ZX-00GQdn-1c
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 13:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684504507; x=1716040507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFnwP/vyGrDIlPPr2daJemFKu+u/gI6MTNacrNW4jKs=;
  b=qG18eouKqCH0qVm5B1bn61Ku08MfKi4PXxhutBlrsgzFAefOpvWZHk4+
   IGvsdinSOMEeR6HPEvTbN4p/MylyTNtaT5QPKABAKP5tYMG2nN9RsnlUV
   pQ+D4G7TaQ5YDEGK4KMT6sjRws9UZ619jOnYtlc2IN86uPDMbPT4cm2Gy
   dFlD8RdbC2yNEQY3PR8DvxHSpO/F6KCqVYrU3W3gixVOMKNYeL2BrhoLO
   sA9E9j9WyQNWxu+wTh+YCq0oevZRnFFAICjhyFk4+EQgjc8HM3kVmjB70
   /kpQdNdqAnx9qqydxq3dNBL73i5t3myBZgZdr55RJ9hi3Q/6iq+r5UFwT
   w==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="152970577"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 06:54:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 06:54:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 06:54:53 -0700
Date: Fri, 19 May 2023 14:54:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes] riscv: Fix unused variable warning when
 BUILTIN_DTB is set
Message-ID: <20230519-backhand-overbid-1df4d90f7da8@wendy>
References: <20230519131311.391960-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230519131311.391960-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_065507_633732_4B5F5DB0 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7875458338646600998=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7875458338646600998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aPJ+XWcPL1J5bSvX"
Content-Disposition: inline

--aPJ+XWcPL1J5bSvX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 03:13:11PM +0200, Alexandre Ghiti wrote:
> commit ef69d2559fe9 ("riscv: Move early dtb mapping into the fixmap
> region") wrongly moved the #ifndef CONFIG_BUILTIN_DTB surrounding the pa
> variable definition in create_fdt_early_page_table(), so move it back to
> its right place to quiet the following warning:
>=20
> ../arch/riscv/mm/init.c: In function =E2=80=98create_fdt_early_page_table=
=E2=80=99:
> ../arch/riscv/mm/init.c:925:12: warning: unused variable =E2=80=98pa=E2=
=80=99 [-Wunused-variable]
>   925 |  uintptr_t pa =3D dtb_pa & ~(PMD_SIZE - 1);
>=20
> Fixes: ef69d2559fe9 ("riscv: Move early dtb mapping into the fixmap regio=
n")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Alex.

--aPJ+XWcPL1J5bSvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGd/mAAKCRB4tDGHoIJi
0h2IAPwLAxCJ/+0IRNhP4m6vQWaDwze4VcB5EC2wibqTlCYvYwEAyzyVVdDhAhwW
JYlxPuibr/SjwKVsvC8sLseZIFPboAA=
=WuyF
-----END PGP SIGNATURE-----

--aPJ+XWcPL1J5bSvX--


--===============7875458338646600998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7875458338646600998==--

