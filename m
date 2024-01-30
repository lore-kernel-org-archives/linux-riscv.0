Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E06C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ornyv26gzzKVZHI/dn+Bb7+Y7GH77E1CF49beIK4UEI=; b=KDprhK0QSvnAuSJxF179A40Bfo
	4VbIb2bjq9by/qt82relovUMwmz1ge8ZMHAYdWSdoWcnGYtHE2eSmAm8clhCANi6A18naqua0tcOz
	MaNA7ja3Y1mY2QyHDdvL6ktX7NtUI5h1Kbps6vyiCF14vXBwiKs+hhvgn2H5k7h+xvo2x+U7lNGgt
	U+Cj5SvqzdzyfhBIhuQy/8FZ8DjC2RnBVns8n9A2XcYvO3uVgfSYUhYHhx7MLmkG8eHbPONpHe9NB
	262cnnkD9NH8p0yMhiipOFIbN/+mgipm+pvAzbyvf5C5d6ttE6ljEVFR9aJ2fMWVUGyjt3mEePiIL
	Ezw1DJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjjH-0000000FlJu-0Yjf;
	Tue, 30 Jan 2024 08:44:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjjE-0000000FlIa-2Ih0
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 08:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706604264; x=1738140264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYXuSCoKukzXJsZktTDDVdGFGywE4T8aErnrwaizOJw=;
  b=kOd7ZgMprcaSUOSy+Eq3/mNByyh7e3SrB8qwQXV87n12F1Dp1xPkZ/9v
   ljdefO1MwY9PIKXKS/Wh1DHLLhv3NIAlAzHGWNX5zjUZoDH1HhXPte5h7
   kJB4GpDat9D789HIIwXOAeOsdc9YWjlD46EDtw0E+NhuKSzmz89uNy/lH
   mgr5Z1RB/uTF7U8UZEkPPlOyOYcPlidAmryKteFKHCj/MJgXKT+YHThp8
   piCcPmwGkaqot5vrg+nygN+otBhSWgxXF+9F3YY/oMSl1Ae8hnS3sO5BK
   QQ3qjilhor1iC31ajvUVhzHDRbN7nooxbo4qGhJpToCV1lNvpdmKokiEd
   g==;
X-CSE-ConnectionGUID: oX+nB/PuTbmJKFZjlYO7pA==
X-CSE-MsgGUID: GseA+0pkQU2Yu8MOQhQc9w==
X-IronPort-AV: E=Sophos;i="6.05,707,1701154800"; 
   d="asc'?scan'208";a="15987627"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2024 01:44:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 01:43:59 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 30 Jan 2024 01:43:58 -0700
Date: Tue, 30 Jan 2024 08:43:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "sudeep.holla@arm.com"
	<sudeep.holla@arm.com>, "robh@kernel.org" <robh@kernel.org>,
	"suagrfillet@gmail.com" <suagrfillet@gmail.com>
Subject: Re: [RFC v1 2/2] riscv: cacheinfo: Refactor populate_cache_leaves()
Message-ID: <20240130-tinker-speculate-89e694c5f559@wendy>
References: <20240129075957.116033-1-jeeheng.sia@starfivetech.com>
 <20240129075957.116033-3-jeeheng.sia@starfivetech.com>
 <20240129-parrot-dropout-c4ece33a98da@spud>
 <BJSPR01MB05611B1A4DDB1F73FD9E0A829C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <BJSPR01MB05611B1A4DDB1F73FD9E0A829C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_004424_779989_CD0753FE 
X-CRM114-Status: GOOD (  43.00  )
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
Content-Type: multipart/mixed; boundary="===============5512518376389920914=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5512518376389920914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RjPP/Q2tX/ed6WHc"
Content-Disposition: inline

--RjPP/Q2tX/ed6WHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 06:24:44AM +0000, JeeHeng Sia wrote:
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Monday, January 29, 2024 8:31 PM
> > On Sun, Jan 28, 2024 at 11:59:57PM -0800, Sia Jee Heng wrote:
> > > Refactoring the cache population function to support both DT and
> > > ACPI-based platforms.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > ---
> > >  arch/riscv/kernel/cacheinfo.c | 47 ++++++++++++++-------------------=
--
> > >  1 file changed, 19 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cachei=
nfo.c
> > > index 30a6878287ad..f10e26fb75b6 100644
> > > --- a/arch/riscv/kernel/cacheinfo.c
> > > +++ b/arch/riscv/kernel/cacheinfo.c
> > > @@ -74,36 +74,27 @@ int populate_cache_leaves(unsigned int cpu)
> > >  {
> > >  	struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
> > >  	struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
> > > -	struct device_node *np =3D of_cpu_device_node_get(cpu);
> > > -	struct device_node *prev =3D NULL;
> > > -	int levels =3D 1, level =3D 1;
> > > -
> > > -	if (of_property_read_bool(np, "cache-size"))
> > > -		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > > -	if (of_property_read_bool(np, "i-cache-size"))
> > > -		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > > -	if (of_property_read_bool(np, "d-cache-size"))
> > > -		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> > > -
> > > -	prev =3D np;
> > > -	while ((np =3D of_find_next_cache_node(np))) {
> > > -		of_node_put(prev);
> > > -		prev =3D np;
> > > -		if (!of_device_is_compatible(np, "cache"))
> > > -			break;
> > > -		if (of_property_read_u32(np, "cache-level", &level))
> > > -			break;
> > > -		if (level <=3D levels)
> > > -			break;
> > > -		if (of_property_read_bool(np, "cache-size"))
> > > -			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > > -		if (of_property_read_bool(np, "i-cache-size"))
> > > -			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > > -		if (of_property_read_bool(np, "d-cache-size"))
> > > +	unsigned int level, idx;
> > > +
> > > +	for (idx =3D 0, level =3D 1; level <=3D this_cpu_ci->num_levels &&
> > > +	     idx < this_cpu_ci->num_leaves; idx++, level++) {
> > > +		/*
> > > +		 * Since the RISC-V architecture doesn't provide any register for =
detecting the
> > > +		 * Cache Level and Cache type, this assumes that:
> > > +		 * - There cannot be any split caches (data/instruction) above a u=
nified cache.
> > > +		 * - Data/instruction caches come in pairs.
> > > +		 * - Significant work is required elsewhere to fully support data/=
instruction-only
> > > +		 *   type caches.
> > > +		 * - The above assumptions are based on conventional system design=
 and known
> > > +		 *   examples.
> >=20
> > I don't think this comment matches what you are doing.
> >=20
> > For example, the comment only requires that split caches cannot be above
> > unified ones, but the code will always make a level 1 cache be split and
> > higher level caches unified.
> >=20
> > The place you took the comment about the split caches from does not
> > enforce the type of cache layout that you do where the 1st level is
> > always split and anything else is unified.
> Correct, I meant to say 1st level is always split and anything else is un=
ified.
> But, do we agree with the statement?

That the first level is always split and anything else is always unified?
No, but I think the assumption /in the comment/ is reasonable however.

This is your patch, you need to justify the changes you are making
here, not ask me if it is okay after I noticed that your comments and
code do not match.

> > populate_cache_leaves() only gets called in a fallback path when the
> > information has not already been configured by other means (and as you
> > probably noticed on things like arm64 it uses some other means to fill
> > in the data).
> >=20
> > Is there a reason why we would not just return -ENOENT for ACPI systems
> I don't think that we should return -ENOENT otherwise the cacheinfo
> framework would failed.

If you don't have a way to determine the cache layout, what makes
-ENOENT worse than making something up?

Why does your system not get information from its ACPI tables?

> > if this has not been populated earlier in boot and leave the DT code
> > here alone?

> This function is shared by both ACPI and DT.

I don't see how that answers my question.

Why should the DT systems stop trying to parse for the information?

Why must ACPI and DT do the same thing here?

Thanks,
Conor.

> > > +		 */
> > > +		if (level =3D=3D 1) {
> > >  			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> > > -		levels =3D level;
> > > +			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > > +		} else {
> > > +			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> > > +		}
> > >  	}
> > > -	of_node_put(np);
> > >
> > >  	return 0;
> > >  }
> > > --
> > > 2.34.1
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

--RjPP/Q2tX/ed6WHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbi2owAKCRB4tDGHoIJi
0lO2AQD0A3/H7hh5AG3sDLHfZ9gkTS0mjtoKVg57zYoHoM3nOAD+KK+eRU9gg16t
GkduSQZiXWd2+tOyFY7jz75qEMTTvAY=
=qfNW
-----END PGP SIGNATURE-----

--RjPP/Q2tX/ed6WHc--


--===============5512518376389920914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5512518376389920914==--

