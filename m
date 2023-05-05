Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E8C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l80i5sFHRgdZua/96WKuMARism2uO8YfXLv9cdxYNQc=; b=Gw1eDFGYpQVJ4oXGgA9ByHXtN8
	R+IYeONk9K27r8fqCAfQk3R1WONE7hLZXi5lLrzLoMnsshBeGgzUEYPmOZPhs/EaL3JPZ58arqbT6
	VUJ2apGvT7633nVsHHkYNBIrOdoI2GH6PRITpYMqq0ug6U2CJGpRpeyYz+3tlTaCZeexEf9+iS3Vh
	1pj8X8YG0Bo2kmi4e2QOf0duwOfeBA/1yTZ9HZzqKNfa7B/g6ANtg05YxACGGal5VAlFF/ePyQgoZ
	9wKUoabtRoNm+zmirBuGcqjdUuVkEAdiT7r2jnzNTuKMYdvwimf+WUmBkvL7Dx+6r0Fk1L40U/LM1
	nmNcL+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvfi-00B0hy-2O;
	Fri, 05 May 2023 13:40:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvfX-00B0fi-1L
	for linux-riscv@bombadil.infradead.org;
	Fri, 05 May 2023 13:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4A8qfmfgHkV4HpBaPUQw2Th7wm6xDdN6ZmbR60capD8=; b=cQQIGWHlDtl9vRpr54El3sqlmo
	ksI1IomA3kzQtSWniahEBCQstqcoE0ImwID9a57lYdPXbGmyWBrNR5/7e4DWBRxABWNht/81cW/0f
	12hNFJX+dBMZov4abO1zsw7dJZ8WP9UGz8bQQ/i0rhzgAwPgeCJNDv1sGIi4dUnZFXhK8MxjbR91b
	C0B8Uu4Lwkd45jFNXx2c2aJveLtT18/zuPkauVtKhdTMjrQtB9bEbnHUx25/QkCe31IEba6BJCN1H
	d66/mCCpDkpDgHLGnZIbU9xA43p1PG+Ls8dzMgrV07ds2Y8igR0MagZ6brhEsmM0c+49/jIDFf09T
	zd7cakRg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puv7X-003Fnm-2m
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 13:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683291911; x=1714827911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T/9gFDeWQ47Y6P/kadtWn2nJ14pxD7djZ+yJ5JOrPgg=;
  b=Ath/+aqPw4qKSRJU1Wm2MN3h9Qdie4RXqeZ8CejJ4ibl2KucuXLLGpT8
   LNunml12rfT6OIJ14/lqJ6m+1NdmqMJhl+I0ImoELf8FaWpsTtSs9r5xk
   A+mcRnzFSd5ySb+jnrFIbwuVKivNd5w3lMwdMpBJ+G7rLLxq4s9+MzcQO
   T/m43zqz3GfjMUq/RPO0gYr5OEUx3Nc610dkCoQ3IHtey3NJ0V8bJiDAF
   Ps6j9ZAjFjclbR/xj2P+Fjlb6VVzcnIzOdlDnaXuH0rVR8zmefrG7oIYf
   Paxb8LqaE5spsVroNJpbfn5hNn7wRq0PYT038FbjRke1YGJ89xCcMamxr
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,252,1677567600"; 
   d="asc'?scan'208";a="213886724"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 May 2023 06:04:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 5 May 2023 06:04:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 5 May 2023 06:04:44 -0700
Date: Fri, 5 May 2023 14:04:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <conor@kernel.org>, <ajones@ventanamicro.com>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 4/7] RISC-V: validate riscv,isa at boot, not during
 ISA string parsing
Message-ID: <20230505-rural-polymer-b3db3f951aa8@wendy>
References: <20230504-sultry-frostlike-9dbf19333725@spud>
 <tencent_3385F6B8E304EE4B8C4BC858E3369F97A006@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_3385F6B8E304EE4B8C4BC858E3369F97A006@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_140512_326089_52B94E64 
X-CRM114-Status: GOOD (  25.54  )
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
Content-Type: multipart/mixed; boundary="===============0789410045104608007=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0789410045104608007==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SY5PJMplTQujjuD8"
Content-Disposition: inline

--SY5PJMplTQujjuD8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 08:40:22PM +0800, Yangyu Chen wrote:
> On 5/5/23 2:14 AM, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Since riscv_fill_hwcap() now only iterates over possible cpus, the
> > basic validation of whether riscv,isa contains "rv<width>" can be moved
> > to riscv_early_of_processor_hartid().
> >
> > Further, "ima" support is required by the kernel, so reject any CPU not
> > fitting the bill.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpu.c        |  8 +++++---
> >  arch/riscv/kernel/cpufeature.c | 12 ++++++------
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 7030a5004f8e..b0c3ec0f2f5b 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -63,10 +63,12 @@ int riscv_early_of_processor_hartid(struct device_n=
ode *node, unsigned long *har
> >  		pr_warn("CPU with hartid=3D%lu has no \"riscv,isa\" property\n", *ha=
rt);
> >  		return -ENODEV;
> >  	}
> > -	if (tolower(isa[0]) !=3D 'r' || tolower(isa[1]) !=3D 'v') {
> > -		pr_warn("CPU with hartid=3D%lu has an invalid ISA of \"%s\"\n", *har=
t, isa);
> > +
> > +	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
> > +		return -ENODEV;
> > +
> > +	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
> >  		return -ENODEV;
> > -	}
> > =20
> >  	return 0;
> >  }
>=20
> What about reducing the compare string to "rv32" and "rv64" only?

I explicitly wanted the "ima" to rule out harts that might've been
left enabled but we cannot run on.

> Linux kernel is able to run on RV32IA or RV64IA CPUs theoretically as
> someone did before[1]. In this case, M extension is not required here.
> Although it's an invalid DT for now, reducing the compare string will
> make the porting easier. And M extension does not provide additional
> ISA-level registers that need the kernel to care about during context
> switch.
>=20
> In my opinion, we should concern about if someday linux will support
> RV32E or RV64E. It's not necessary to validate if "ima" presents here
> for better forward compatibility.
>=20
> [1] https://www.facebook.com/groups/riscv.tw/posts/1611033709104137/

I had a look, and as expected, this requires a makefile change to remove
the M extension from -march.
If that change ever lands in mainline the check here could be modified
too, but otherwise I don't think we need to be concerned about what some
out of tree code is doing.

Cheers,
Conor.

--SY5PJMplTQujjuD8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFT+2QAKCRB4tDGHoIJi
0umHAQDN1yH4QMEypKxDG9yaBoRlfabHrE44IalKVufo+YBjDgD+ItV07+li+xbV
OviU0HsXs7LES9xGhEJJXEmOE5UOFAA=
=PQ9J
-----END PGP SIGNATURE-----

--SY5PJMplTQujjuD8--


--===============0789410045104608007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0789410045104608007==--

