Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A1C54E94
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGdIspoR6rR4YwSUxtA1oR1iwAfQUaCpsafnq+7aYd8=; b=2x5W3fkd3SKCzhf/Q943xBuMyM
	I8V8gMtM7W/Wthx6HO8iOXW52lqc02GOkV7nhbnpKcVA0SOjHeiGu4eW8nGavdfCmUWypruoT7yXG
	79kH7rBvuJOPNsQIxcjyF23dxXqnWScn5EzuNiiOTuCjFHU43UZjZA0bICKJDHTa29cpOsu319N6R
	UYUgOchK+F6LgAZVuCISRqkI3jIW4+fC4gk+yAfF7Jl7xSimbaf1GGlW5+hH1mMDo5ccq+wv/URBe
	sZvSP1AFxyXwwmPz+UCg6KDAx1qmsjQ2+CfZ23d8JnWZSTMnopHu7+AaCGJTZJVbB75cXP5cTgBld
	SA4nexGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxVE-00HWS1-Ux; Mon, 23 Jan 2023 14:08:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxVA-00HWP3-Q0
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 14:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674482929; x=1706018929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ObvRqVylT5Y0CrgMD6U+JwuzhIio+nMTbmkoUPgXik=;
  b=ZyeNTGrgJXXRb5ib+5DBmnKYHtVlDSBKjNVNFrOkbi7ghdK3xwqitP3V
   ETihKAz0NZy+x1OkYWXPoubHONnTETtl7/OQrrGXnMKYc3mM5wuzRdraq
   hGQWx5aOXox4tNo4JUDmjlUIDXYJmu1jw2/A0vhBVRtCPc0MXpnJF5ky7
   wPVIobmIrLBAqTYM7emX32dehE48UvADJAzswLhYoJ1O5OIECVgnCJD2P
   iL1b0O6EfHU+IwUbCL6wk81if0gugo8pzIM3iUV7jmDHhFPPAyEc7X3UQ
   7/59RR6xOMlIYrMZ5lQXoxAVvmEpovDDI4ID1JLWVbNPXt5Ql51NqSwqE
   A==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669100400"; 
   d="asc'?scan'208";a="197739226"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jan 2023 07:08:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 07:08:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 23 Jan 2023 07:08:43 -0700
Date: Mon, 23 Jan 2023 14:08:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v3] riscv: Allow to downgrade paging mode from the command
Message-ID: <Y86U1OUqlo05Co+2@wendy>
References: <20230123104841.813999-1-alexghiti@rivosinc.com>
 <Y851L2KgfIF3V6of@wendy>
 <95d81c9a-11de-7f92-cb76-e4492e9faba8@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <95d81c9a-11de-7f92-cb76-e4492e9faba8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_060848_924546_FC9C83CD 
X-CRM114-Status: GOOD (  28.74  )
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
Content-Type: multipart/mixed; boundary="===============4250390896865734736=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4250390896865734736==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UiaEVa5YDx4RQv/n"
Content-Disposition: inline

--UiaEVa5YDx4RQv/n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 02:39:35PM +0100, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On 1/23/23 12:53, Conor Dooley wrote:
> > Hey Alex,
> >=20
> > On Mon, Jan 23, 2023 at 11:48:41AM +0100, Alexandre Ghiti wrote:
> > > Add 2 early command line parameters that allow to downgrade satp mode
> > > (using the same naming as x86):
> > > - "no5lvl": use a 4-level page table (down from sv57 to sv48)
> > > - "no4lvl": use a 3-level page table (down from sv57/sv48 to sv39)
> > >=20
> > > Note that going through the device tree to get the kernel command line
> > > works with ACPI too since the efi stub creates a device tree anyway w=
ith
> > > the command line.
> > >=20
> > > Also, as those params are treated very early in the boot process and =
we
> > > use standard device tree functions that may be kasan instrumented, we
> > > only enable them for !KASAN configurations.
> > >=20
> > > Reviewed-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > A changelog would be nice here, especially since this is a resend.
>=20
>=20
> I think you may have commented the wrong patch, this one is wrong, hence =
the
> resend!

Oh, sorry about that Alex! For some reason the resend never landed in my
mailbox (I had just seen that there were two on patchwork).

> > >   .../admin-guide/kernel-parameters.txt         |  9 ++-
> > >   arch/riscv/mm/init.c                          | 72 ++++++++++++++++=
+--
> > >   2 files changed, 74 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docume=
ntation/admin-guide/kernel-parameters.txt
> > > index 6cfa6e3996cf..fd647412ec91 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -3578,8 +3578,15 @@
> > >   			emulation library even if a 387 maths coprocessor
> > >   			is present.
> > > -	no5lvl		[X86-64] Disable 5-level paging mode. Forces
> > > +	no4lvl		[RISCV] Disable 4-level and 5-level paging modes. Forces
> > > +			kernel to use 3-level paging instead.
> > > +			Note: On RISC-V, this can't be used when KASAN is
> > > +			enabled.
> > > +
> > > +	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
> > >   			kernel to use 4-level paging instead.
> > > +			Note: On RISC-V, this can't be used when KASAN is
> > > +			enabled.
> > >   	nofsgsbase	[X86] Disables FSGSBASE instructions.
> > For the improved descriptions & commit message:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
>=20
> Thanks for that, would you mind adding that to the resend patch?

Yah, no problem.



--UiaEVa5YDx4RQv/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY86U1AAKCRB4tDGHoIJi
0imrAQDr67fpe2CRsNEFP9GsTsQ0z2nPPr0ABLhuiUAxIx7oSQEA7Hc3dTb6PuoN
cjZOoZgwfZCavRbAR0WI1222Xo1v5gE=
=74yN
-----END PGP SIGNATURE-----

--UiaEVa5YDx4RQv/n--


--===============4250390896865734736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4250390896865734736==--

