Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B94C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AriMsnsNiBu2GuhwT4WTAsiHSDcZhZnho+MmdnCWqpg=; b=gKBUGo8rs0p220CJ0/uvE8214H
	RHW1j1ULAAPUgVUbBuNQjIFy7CbZeX/cK3BoH6H0NEWvTnNar6hfVfSHdgCV7UFfIjrhnKpbnbRYF
	l/Ns4rLF2kKMqLEKvpgH++SGM1HYMWQTNSFJj8wQq5LCpORXCYMRXYJ6RjtuJdrwothJb6EaW4zMJ
	MrYJTB7A/o538B2HwWCEhkFfAYjwt4L/h126t7PrnYlllXiaq5WAjOVT+GtzhkB5sxDArHzCtj1+W
	A3w/f420ITAvQBJkpLl4pEAYvU3bi1hJFNFcJ0CpXi2Po52h07UM9GCsnEd34R2Y2nznj5amJEHgV
	bk4rD2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPLj-004vx2-0k; Fri, 10 Feb 2023 09:05:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPLc-004vqj-Sc; Fri, 10 Feb 2023 09:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676019936; x=1707555936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x1ueiwval8cl8Z4+kb9IAqIUc/rwrhIv8nwOqAkA6ys=;
  b=OSpIc+piGVibBsojiKe0na1DsuMoK05HFYeZD50VD4sN8fdSZPpIiLEJ
   HoUXA11p+wPIbNYn9+kLfof4UstPcJMnwRjd5Doe7Ujf+3wq9fdKlq17x
   bTCDBkICEBMEIsaQP433CjmHYxsn2+aIgM79mb560HemDJAql4y8D/U5M
   o8dfRzBBpBhtgYYdW921WN0/wQqF0KTVoZt4yCYTrGZMldiPuDJpW7ihI
   QSHxezNVnnCkmQy4IhxURx9RifFKeT0vxKX5RFDROStdwDUxa5/pHUJ+7
   /y0yRGHB+HAQRI5Kic4KqnIOROrMdVU7ot06xX72P42S3hqWzT00xooES
   w==;
X-IronPort-AV: E=Sophos;i="5.97,286,1669100400"; 
   d="asc'?scan'208";a="136513523"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Feb 2023 02:05:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 10 Feb 2023 02:05:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 10 Feb 2023 02:05:24 -0700
Date: Fri, 10 Feb 2023 09:04:59 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 'Anup Patel '
	<apatel@ventanamicro.com>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Paul
 Walmsley ' <paul.walmsley@sifive.com>, 'Krzysztof Kozlowski '
	<krzysztof.kozlowski+dt@linaro.org>, 'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>, 'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <Y+YIu0tqF4N3SA4d@wendy>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <Y+VFAUZ2smkKO0EZ@spud>
 <20230210080515.lbguxxg4efxudjzg@orel>
MIME-Version: 1.0
In-Reply-To: <20230210080515.lbguxxg4efxudjzg@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_010537_038501_E621B8DB 
X-CRM114-Status: GOOD (  31.50  )
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
Content-Type: multipart/mixed; boundary="===============1570987457712549631=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1570987457712549631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XCPAK6ABA6EgBiz8"
Content-Disposition: inline

--XCPAK6ABA6EgBiz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023 at 09:05:15AM +0100, Andrew Jones wrote:
> On Thu, Feb 09, 2023 at 07:09:53PM +0000, Conor Dooley wrote:
> > On Thu, Feb 09, 2023 at 04:26:26PM +0100, Andrew Jones wrote:
> > > Using memset() to zero a 4K page takes 563 total instructions, where
> > > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > > takes 169 total instructions, where 4 are branches and 33 are nops.
> > > Even though the block size is a variable, thanks to alternatives, we
> > > can still implement a Duff device without having to do any preliminary
> > > calculations. This is achieved by taking advantage of 'vendor_id'
> > > being used as application-specific data for alternatives, enabling us
> > > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > > loop and continue after 4K if the page size would be larger)
> > >=20
> > > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > > only loop a few times and larger block sizes to not loop at all. Since
> > > cbo.zero doesn't take an offset, we also need an 'add' after each
> > > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > > is small enough to not cause icache misses.
> > >=20
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index 74736b4f0624..42246bbfa532 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
> > >  #ifdef CONFIG_RISCV_ALTERNATIVE
> > >  static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> > >  {
> > > +	switch (feature) {
> > > +	case RISCV_ISA_EXT_ZICBOZ:
> > > +		/*
> > > +		 * Zicboz alternative applications provide the maximum
> >=20
> > I like the comment, rather than this being some wizardry.
> > I find the word "applications" to be a little unclear, perhaps, iff this
> > series needs a respin, this would work better as "Users of the Zicboz
> > alternative provide..." (or s/Users/Callers)?
>=20
> Right, "applications" is an overloaded word. "users" is probably a better
> choice. "callers" isn't quite right, to me, since it's a code patching
> "application" / "use". Do you think the function name should change as
> well?

I was initially going to suggest that too, but then couldn't really
think of something better. s/application_check/check_applies/ maybe?

> > > +		 * supported block size order, or zero when it doesn't
> > > +		 * matter. If the current block size exceeds the maximum,
> > > +		 * then the alternative cannot be applied.
> > > +		 */
> > > +		return data =3D=3D 0 || riscv_cboz_block_size <=3D (1U << data);
> > > +	}
> > > +
> > >  	return data =3D=3D 0;
> > >  }

--XCPAK6ABA6EgBiz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+YItwAKCRB4tDGHoIJi
0uV0AQCvfYqTdTBqVQEowccSoNd1jnp/XZ69WO+ZxI1VngaakgD/VRfoZf7v+r2v
3HJcny3VbnNGQ/lJRRCl4xoxpn41vgg=
=mwIz
-----END PGP SIGNATURE-----

--XCPAK6ABA6EgBiz8--


--===============1570987457712549631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1570987457712549631==--

