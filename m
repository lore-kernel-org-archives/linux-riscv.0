Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7569C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwjDGMgc9f3aFST2k1BtA8H3vwpIxa1AVqFjrLTTPiQ=; b=jUwIGg9EQDoDbBhj8y4XNn8boS
	zvZc2ClC5ux8BdojxhGoEActdcvhXy14RMjSzdJu+YIbEvmnfr92BMlJg9tMr0ce56Na6fVghUQs3
	ogUiYDYUAuaKlou0pHcbDkqtdychAFNzTCPQBnCaLuTIzyuthZCvd4pv074BPTbnIVy7/ZaLTrYTL
	fZLP6205bRWptBIfEG/Ss1ut6hMLIDPQUMhnGi+P0nPK2nWwBXLpvAxVuMxIeWSOzjvEYBOLRUhoU
	w2Sqk3VRIPe5Dg934ZpE5vBFcMFhLxK/XYepKqteOQ0109IDDNt1YR6EQqUVqD6agvbX/jpZdox+R
	NAfWjkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puqEv-009xa8-11;
	Fri, 05 May 2023 07:52:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puqEr-009xZL-0V
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 07:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683273144; x=1714809144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xQa4Y8wHGXtUj8jtB36AqMy2Sj9fEv+9cp3uMFKx+8E=;
  b=ekdzS3hwfN6NvRgI4D9q2rZUR5ZWH0STG8PqfCm2NYN9JkKqyB3+cd3L
   lwFSeuoKUjj6DhLFe1Y+XCXLY8/8nLjQ41PVpjiJC7YRqnbdfb3IQVWq1
   NXMsdG29jGaGmUfNUdam914gY/rx4i47ihypS6YE/3yL8qPJv494YvYEp
   OR1ICjATTKUm3BwC0vg+IXLMUxZqYZU/GYHTSqei5M26RUt4ppe2py2PF
   aYAbZbd1K3o3Id9zqIstgKyQ1Z+BlHqBIynK/I1USp3PcL051rY4L8lEz
   ydZK968BSz63wLE9xO+gPT3o39CzQDjPCh9kpzqEJUk031Z5WzOkgU69c
   g==;
X-IronPort-AV: E=Sophos;i="5.99,251,1677567600"; 
   d="asc'?scan'208";a="212030088"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 May 2023 00:52:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 5 May 2023 00:52:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 5 May 2023 00:52:18 -0700
Date: Fri, 5 May 2023 08:51:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 4/7] RISC-V: validate riscv,isa at boot, not during
 ISA string parsing
Message-ID: <20230505-division-antler-9beaf112477c@wendy>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-sultry-frostlike-9dbf19333725@spud>
 <20230505-b0000d4928c8eedff2ae1f8d@orel>
MIME-Version: 1.0
In-Reply-To: <20230505-b0000d4928c8eedff2ae1f8d@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_005225_328066_F9E82743 
X-CRM114-Status: GOOD (  29.24  )
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
Content-Type: multipart/mixed; boundary="===============3867858972209332169=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3867858972209332169==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k34rdV1i7X0SFuIK"
Content-Disposition: inline

--k34rdV1i7X0SFuIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 09:40:22AM +0200, Andrew Jones wrote:
> On Thu, May 04, 2023 at 07:14:23PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Since riscv_fill_hwcap() now only iterates over possible cpus, the
> > basic validation of whether riscv,isa contains "rv<width>" can be moved
> > to riscv_early_of_processor_hartid().
> >=20
> > Further, "ima" support is required by the kernel, so reject any CPU not
> > fitting the bill.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpu.c        |  8 +++++---
> >  arch/riscv/kernel/cpufeature.c | 12 ++++++------
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> >=20
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
>=20
> 'ima' matches the DT binding pattern requirement and the order required
> by 27.11 "Subset Naming Convention".

Aye, perhaps I should have mentioned it in my commit message that those
particular orders are required by the dt-binding. If the ACPI series
lands before this one does, since I'll have to rebase anyway, I'll add a
mention of the ACPI spec's position.

> If the spec ever squeezes more single
> letter extensions into the front of the ISA string, then we can cross
> that bridge when we get to it.

Perhaps by then we have evolved beyond needing the ISA string!
(A boy can dream)

> >  		return -ENODEV;
> > -	}
> > =20
> >  	return 0;
> >  }
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 3ae456413f79..a79c5c52a174 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -130,12 +130,12 @@ void __init riscv_fill_hwcap(void)
> >  			continue;
> >  		}
> > =20
> > -		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
> > -			continue;
> > -
> > -		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
> > -			continue;
> > -
> > +		/*
> > +		 * For all possible cpus, we have already validated in
> > +		 * the boot process that they at least contain "rv" and
> > +		 * whichever of "32"/"64" this kernel supports, and so this
> > +		 * section can be skipped.
> > +		 */
> >  		isa +=3D 4;
>=20
> When we add RV128 support this will need a tweak, but that's for another
> day.

Yeah, adding 128-bit is so far off that it's not worth considering, but
easily handled in this particular location.

> Since all ISA strings must start with rvXX per the spec, then this
> works for ACPI too, which states the isa string in its ISA string table
> must conform to the unpriv spec.
>=20
> > =20
> >  		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
> > --=20
> > 2.39.2
> >=20
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks!

--k34rdV1i7X0SFuIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFS1lAAKCRB4tDGHoIJi
0sLYAQC0MDUbIwjDlPXiztHtt3oLN4e0tNqqJqCFE3liZhRZ6QD/for1s/2KG3vM
1EFRrM8t0bXhojx2hJvkxWtXwEnE7go=
=bced
-----END PGP SIGNATURE-----

--k34rdV1i7X0SFuIK--


--===============3867858972209332169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3867858972209332169==--

