Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102DBEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6ZxquaprlHYsSwlglZz03TccPg10CmEPCThYyV3cLE=; b=TPgkpyW5576WdLqTo9/C7GmpCG
	nodU/50xIe8abZmyNBAVarGURvSQlCqr9jDj4ynKfSAhk3Jfv3CpQDobZelyP6YwZkA3PP9R/yMX1
	1uGOPqq18nKFK6uzBD9bbfElXpdEe0BQxc2GhXBKWAvv6lQvuznKLpxuJuP7IHvRBDJKYhiXg5iE5
	zg4dUD1wJo/bNiRaiSzp2EDk6Wmwky1CsF5NJ2L3EcRl4mlusVzPdKjHhgcnLEeW7jGPWXgmnusUd
	6B5XKRO6nNNERf2kl3ogWICaYhPHKq3lbumvK4DQx041aXbM4HSoAtNGVHzfEwSgBTMQYSUg/W1wj
	CZ+80sDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFE2z-003kye-0T;
	Fri, 30 Jun 2023 13:20:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFE2x-003kx6-0K
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 13:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688131223; x=1719667223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EaJ77L8/k3Hf0KmA9VK9enDoW0KMpkjzS7BilECDl2A=;
  b=o0LzK4k6ddgz4qTxH02Aw7VCv1QN6rRi5pImS9B4nRNoE2G5sr4huuK+
   TwoDdWaX05/edx9u1SVCsWJIvtjmlb90C17UOrsKACHeGG0Z/7cKRGaHR
   QHjka/CdzG3uRnDCzQQ1rRVHfOj0lPYYI3R0baAEljxzBLp1crHT5+ghN
   NxDCYG1e9hyoxXXFblkAk5b9kaRHz5/125W9VSfRG5NAOAmbUxMtRNDC0
   M7DhSFK9rw2ItHRimUXo02bhaVT1VfJKW1IsYhQrI/VQPvqOvGhBoeUqu
   eeRH4rlbE6MBbnO5PZ9z+oCFMxwYwQwdsumCcuMLlfsnE6fpCw2CNn8hF
   A==;
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="asc'?scan'208";a="221422464"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2023 06:20:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 30 Jun 2023 06:20:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 30 Jun 2023 06:20:15 -0700
Date: Fri, 30 Jun 2023 14:19:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230630-urgency-emission-882cd52a7a27@wendy>
References: <20230629-landed-popsicle-ab46ab3b46d9@spud>
 <mhng-f060b5c8-aa99-4952-b1e1-ee85a92e6b07@palmer-ri-x1c9a>
 <20230629-angled-gallantly-8fe7451a25fa@spud>
 <20230630-7d0f6fe66c9415315d491f15@orel>
MIME-Version: 1.0
In-Reply-To: <20230630-7d0f6fe66c9415315d491f15@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_062023_150948_7C2C39EA 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, robh+dt@kernel.org, Conor Dooley <conor@kernel.org>, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============7839964902572103792=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7839964902572103792==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o4a1LRPZt0ieGy5D"
Content-Disposition: inline

--o4a1LRPZt0ieGy5D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 09:46:48AM +0200, Andrew Jones wrote:
> On Thu, Jun 29, 2023 at 10:44:18PM +0100, Conor Dooley wrote:
> > On Thu, Jun 29, 2023 at 02:16:49PM -0700, Palmer Dabbelt wrote:
> > > On Thu, 29 Jun 2023 13:20:55 PDT (-0700), Conor Dooley wrote:
> ...
> > > > +bool __initdata riscv_isa_fallback_cmdline =3D false;
> > > > +static int __init riscv_isa_fallback_setup(char *__unused)
> > >=20
> > > Maybe it's better to support =3Dtrue and =3Dfalse here?  Not sure it =
matters,
> > > we're already down a rabbit hole ;)
> >=20
> > Dunno, not implemented a cmdline param before. Seemed "cleaner" to check
> > for presence, don't really care so I'll adapt to w/e.
> >
>=20
> I don't have a strong preference here, but to throw in more food for
> thought, I see this DT-v1 vs. DT-v2 choice to be a bit analogous to the
> DT vs. ACPI choice. The 'acpi' command line parameter, for RISC-V, can
> be 'off', 'on', and 'force', where
>=20
>   off -- disable ACPI if default was on
>   on -- enable ACPI but allow fallback to DT
>   force -- enable ACPI if default was off
>=20
> So, if the default of the isa fallback command line option will depend on
> Kconfig, then we may also want a 'force'.

I'm not sure that I understand what "force" would give us.
There's 4 cases:
- CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option is present:
  cmdline option is ignored, fallback is taken if needed.
  crash if neither are present.

- CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option is not present:
  cmdline option is ignored, fallback is taken if needed.
  crash if neither are present.

- CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option is present:
  cmdline option takes priority, fallback is taken if needed.
  crash if neither are present.

- CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option is not present:
  fallback is never taken
  crash if new properties aren't present.

I don't really see the value in having an equivalent to acpi=3Doff,
because the order of precedence is, to use your naming, "DT-v2" falling
back to "DT-v1" & the default value concerns the use of the fallback.
For ACPI, it is the other way around & the option controls the use of
"DT-v2"'s analogue. Trying to slot in that logic:

- CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option "=3Don":
  cmdline option is ignored, fallback is taken if needed.
  crash if neither are present.

- CONFIG_RISCV_ISA_FALLBACK is enabled, cmdline option "=3Doff":
  cmdline option is prioritised, fallback is taken if needed.
  crash if new properties aren't present.

- CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option "=3Don":
  cmdline option is prioritised, fallback is taken if needed.
  crash if neither are present.

- CONFIG_RISCV_ISA_FALLBACK is disabled, cmdline option "=3Doff":
  fallback is never taken
  crash if new properties aren't present.

I think I prefer the behaviour of what I currently have & I don't really
get where the "force" option is supposed to fit in either?

Cheers,
Conor.

--o4a1LRPZt0ieGy5D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ7WZwAKCRB4tDGHoIJi
0gMcAQChwEuzvhSORcS7/4Mm0GXlyvRmOlOfWOHtGmwWRFmLMgD+JzMMaxJwKmej
f/W/6SoUrX44MMben0skWQdfEYtTNQo=
=N0ZM
-----END PGP SIGNATURE-----

--o4a1LRPZt0ieGy5D--


--===============7839964902572103792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7839964902572103792==--

