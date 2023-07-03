Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9518CC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 13:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rUc3pQoMBKd/SVjKYPppkPf4mNasID0QVCidFeNTp4=; b=FbDNxsHF02HaIl0v2cAkMi/5yV
	S1TSpKmfSVE6h5HJPg5nZZHZ3KrDibwZxrqx4ia4xPcTNdunqKaJsXwcv+WVZOMmB3d3cFumHZukQ
	/xvmuo4S2tu632x3lWRFrplG+7x7vG87d8IltPFBmwoTeYFHpQIoqu5NU97kpEMHcWeZf9fIK5GOX
	iobwO9Jxo8Bp0FvFDaLFKzH7dbNkbxWUJLK5x5tZNJDZfrdJ6VWF56E8GC4szC+mFknBlyXeqqDzo
	+74hYWASKBy5vX4Fhi4DBq2UdUsaiZIvVS6Wn96F5/qH+6mT14nVholnWBjR/QjJ9yGfsq1QfLl1g
	okrBIR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJCt-00AZie-3C;
	Mon, 03 Jul 2023 13:03:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJCr-00AZiB-08
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 13:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688389384; x=1719925384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JKDOENosKmEiL2k4tBZQmuXWBUtv1K4FuCfUPDPb270=;
  b=RBVMA+7/YD5TQF2fmMiOeeUCNouhjysPpTbtwl6+FH8D7XrcgZgHQQeg
   XrEXlrTE3YEC9SZ5SYQL0PUfnYgSyzarmZ8ihsX4w9rF5PCfYBtyIoMXP
   ULLzM/+vY0KZsPnR8d0JUcxHllrlPoO8uKCY9zBILnhCZJ5Wr1JxFicX6
   7Q6bnTCrPy5y/5sBci5m2odpFw7go/sUY5HMibPBiCQjiIbnHsyFFL6Oo
   d2nWiayBQO3sqEqkAsNF9cHrv8mLEuMAhvrwwopKu9mMNZgYbYHFiKM3Z
   glm4ZVs5w6oICr339Bbu4O4OoFRbX1ytS5QSIrzO0DzspixQ/ScNrIkVD
   w==;
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="asc'?scan'208";a="221065931"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 06:02:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 06:02:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 06:02:45 -0700
Date: Mon, 3 Jul 2023 14:02:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
CC: Conor Dooley <conor@kernel.org>, <ardb@kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <rminnich@gmail.com>,
	<mark.rutland@arm.com>, <lpieralisi@kernel.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <jdelvare@suse.com>, <yc.hung@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <allen-kh.cheng@mediatek.com>,
	<pierre-louis.bossart@linux.intel.com>, <tinghan.shen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<geshijian@bytedance.com>, <weidong.wd@bytedance.com>
Subject: Re: [External] Re: [PATCH v2 2/3] firmware: introduce FFI for SMBIOS
 entry.
Message-ID: <20230703-patrol-paced-76cd5e24db6b@wendy>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230702095735.860-2-cuiyunhui@bytedance.com>
 <20230702-collide-rumor-f0d915a4f1b2@spud>
 <CAEEQ3w=CMSMnYmfprYS4ydsA=EBJtLhQQHWky754EC-iifcYtg@mail.gmail.com>
 <20230703-rebuff-smashing-6b2c6f80ba05@wendy>
 <CAEEQ3w=-1Zns_pZRSeM0+Wv46y6RttcT5jFy_ENnq--RptYp2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3w=-1Zns_pZRSeM0+Wv46y6RttcT5jFy_ENnq--RptYp2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_060305_130797_60D12003 
X-CRM114-Status: GOOD (  28.34  )
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
Content-Type: multipart/mixed; boundary="===============7068481865851707509=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7068481865851707509==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uht1cacpbtCJeEos"
Content-Disposition: inline

--Uht1cacpbtCJeEos
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 08:41:30PM +0800, =E8=BF=90=E8=BE=89=E5=B4=94 wrote:
> On Mon, Jul 3, 2023 at 4:36=E2=80=AFPM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> > On Mon, Jul 03, 2023 at 04:23:53PM +0800, =E8=BF=90=E8=BE=89=E5=B4=94 w=
rote:

> > > > > +FDT FIRMWARE INTERFACE (FFI)
> > > > > +M:   Yunhui Cui cuiyunhui@bytedance.com
> > > > > +S:   Maintained
> > > > > +F:   drivers/firmware/ffi.c
> > > > > +F:   include/linux/ffi.h
> > > >
> > > > Are you going to apply patches for this, or is someone else?
> > > Yes,  it will be used by patch 3/3.
> >
> > That's not what I asked :(
>=20
> Sorry,  ok,  what do you want to ask?

Who is going to apply patches for drivers/firmware/ffi*?

> > > > >  static void __init dmi_scan_machine(void)
> > > > > @@ -660,58 +686,22 @@ static void __init dmi_scan_machine(void)
> > > > >       char __iomem *p, *q;
> > > > >       char buf[32];
> > > > >
> > > > > +#ifdef CONFIG_FDT_FW_INTERFACE
> > > > > +     if (dmi_sacn_smbios(ffi.smbios3, ffi.smbios))
> > > >
> > > > "dmi_sacn_smbios"
> > > >
> > > > > +             goto error;
> > > > > +#endif
> > > >
> > > > Does this not mean that if FDT_FW_INTERFACE is enabled, but the pla=
tform
> > > > wants to use EFI, it won't be able to? The `goto error;` makes this=
 look
> > > > mutually exclusive to my efi-unaware eyes.
> > >
> > > If you have enabled FFI, then if something goes wrong, you should got=
o error.
> > > Just like the origin code:
> > >         if (efi_enabled(EFI_CONFIG_TABLES)) {
> > >                 if (dmi_sacn_smbios(efi.smbios3, efi.smbios))
> > >                         goto error;
> > >         } else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBAC=
K)) {
> > >                 p =3D dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, =
0x10000);
> > >                 if (p =3D=3D NULL)
> > >                         goto error;
> >
> > Does this not make FFI and EFI mutually exclusive Kconfig options?
> > Suppose you are on a system that does not implement FFI, but does
> > implement EFI - what's going to happen then?
> > AFAICT, dmi_sacn_smbios(ffi.smbios3, ffi.smbios) will fail & you'll do a
> > `goto error` & skip the EFI code. What am I missing?
>=20
> Code is not intended to be mutually exclusive, get the correct value and =
return,
> The code is going to be changed to this:
>=20
> #ifdef CONFIG_FDT_FW_INTERFACE

Ideally, these would be IS_ENABLED() instead of #ifdef - but if you copy
what EFI does, then you don't need either, as there will always be an
ffi_enabled() defined.

>         if (ffi_enabled(FFI_CONFIG_TABLES)) {

I don't know what this function is, but this code seems like a step in
the right direction.

>                 if (!dmi_sacn_smbios(ffi.smbios3, ffi.smbios))
>                         return;
>         }
> #endif

Thanks,
Conor.

--Uht1cacpbtCJeEos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKLG1wAKCRB4tDGHoIJi
0p4CAP9UFrVTshkvkiDgNgv0fkaJeO/6lTdr5tKFaGdb9LpN5gD9HCH4Z3GCfUq8
vJfacU093Un2qeuoIdVM+04hLm4hnQ0=
=/UOt
-----END PGP SIGNATURE-----

--Uht1cacpbtCJeEos--


--===============7068481865851707509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7068481865851707509==--

