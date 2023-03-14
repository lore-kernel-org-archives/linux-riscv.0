Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A30C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxLEB40ulM/SE6NmSWj3qr4uDZCvTKjxbUMW4T2eCzs=; b=vj8LQKxVH39p8/DdQ0Lowitrw0
	ec5bW8+o1lVHFjAdts8M4F1LPYXmOXxBUJxeZTFF2Z4g3NJuQNwfPznegZQD6W3mLxg5tNIhZNX6U
	abK4NenT+vp0HyfIKhAQz0sWYi9W3DLLhTLH9muFc9dV++7ug5R4ELltnOruyOKZ8IRjy+2rMZzr6
	aj0lINXgrBSdlNRxm3Jr4ZOq9dRSfu6yWsys1AYVxQD8CQwU9f0B6M8p49Z0XxHB/yTznrLOyWiOg
	yX70tgXu0rypojIQdM8xEiVpo8APkVIPUxuDdHKxtvWlXYKAysQFwLYGmdXDxNdyN8QVMOXN8aGP5
	cirPUN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcA8l-00BIuQ-0Z;
	Tue, 14 Mar 2023 19:16:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcA8h-00BIth-2k
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 19:16:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00BFB61967;
	Tue, 14 Mar 2023 19:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E773C433D2;
	Tue, 14 Mar 2023 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678821410;
	bh=g5ExXGMpe5aA0ybHCj45LLR+H6d/mL5sQpeLaLedFFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGWU/8WrtAPcZroK2jVynlM0r7OLqTNPvAdSF3GikUYpp6LrrRaZg1vZtx3xMAMsm
	 UCD5VWqcAP9Ky0VHu4e2g0cY7AHm8ha5NigGUZmYh3U7kNE+yZlRvXzkjpGEfErKZR
	 oVg29tSyoJ7RWsPT7XYSFvOA/Ri+0rCd69r2doMuj6ggxb1i/2hqnzaj3h+4YYjeAE
	 rXGbHa+tbJ0CgVuZQqjqV+RYN/rcvwoq8dNwuduuxewoOu3XVVNw5+4zmnp5iYCL5H
	 IoVFmkY35WylmqYKT9Ft6AnhZZREys5hIpPdh+FxucBaJOWUeCuUizxl83HF4QAWUY
	 hM/CNUOWRohrg==
Date: Tue, 14 Mar 2023 19:16:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Message-ID: <ae9dc316-dac9-40c2-a84c-ce27d7535745@spud>
References: <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
 <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
 <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
 <debe0a4a-126f-2308-d40c-32ed2d9f91e3@opensource.wdc.com>
 <dd45cdec-55d2-1a46-520d-e1468597c18a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dd45cdec-55d2-1a46-520d-e1468597c18a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_121651_990648_8542FB68 
X-CRM114-Status: GOOD (  32.63  )
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
Content-Type: multipart/mixed; boundary="===============1083404990489197892=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1083404990489197892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6y262otodfLglAj"
Content-Disposition: inline


--A6y262otodfLglAj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 02:35:39PM -0400, Jesse Taube wrote:
>=20
>=20
> On 3/7/23 23:11, Damien Le Moal wrote:
> > On 3/8/23 12:46, Jesse Taube wrote:
> > >=20
> > >=20
> > > On 3/7/23 22:42, Damien Le Moal wrote:
> > > > On 3/8/23 12:23, Randy Dunlap wrote:
> > > > > > > OK, I don't know how it happened. I cannot reproduce it now.
> > > > > > > The failing .config files has CONFIG_MMU is not set (for RV32=
I), which
> > > > > > > appears to be impossible.
> > > > > > These patches add `CONFIG_MMU is not set` (for RV32I).
> > > > > > But no worries it seems to be a non issue=A0 now.
> > > > > >=20
> > > > > > Your thoughts Damien?
> > > > > >=20
> > > > >=20
> > > > > Thanks for reminding me.
> > > > >=20
> > > > > With these 3 patches applied to linux-next-20230307,
> > > > > I still get this build error.
> > > >=20
> > > > Does this help ?
> > > >=20
> > > > diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
> > > > index 2527cf5757ec..7796c5f1d109 100644
> > > > --- a/drivers/soc/canaan/Kconfig
> > > > +++ b/drivers/soc/canaan/Kconfig
> > > > @@ -4,7 +4,8 @@ config SOC_K210_SYSCTL
> > > >           bool "Canaan Kendryte K210 SoC system controller"
> > > >           depends on RISCV && SOC_CANAAN && OF
> > > >           default SOC_CANAAN
> > > > -        select PM
> > > > -        select MFD_SYSCON
> > > > +       select COMMON_CLK_K210

Ideally this would be depends on, rather than select, so that we avoid
selecting user visible symbols like that.

> Ok so this has nothing to do with my patch-set actually and will happen on
> 64BIT as well.
> the commit that brought in this bug is:
>=20
> RISC-V: stop directly selecting drivers for SOC_CANAAN
> 3af577f9826fdddefac42b35fc5eb3912c5b7d85

Ah right, because the select in Kconfig.socs enforced that if the
conditions were correct for the system controller driver to be enabled,
the clock driver would always be present.
In converting the select in kconfig.socs to a default "on location", I
preserved the default behaviour but not the dependency.

> I have tested the patches Damien here they work on 64BIT and 32BIT.
> The change to drivers/clk/Kconfig is not strictly necessary but makes sce=
ne.
> I don't think they need to be tested on 32bit so we can omit COMPILE_TEST.
>=20
> If needed i can submit the patches, which I will author under Damien.

It probably does need fixing to satisfy the randconfigs, submit away!

> As far as I can see there is nothing holding back this set as the issue
> found has no relation to this set.

Yup. You're currently in the queue on patchwork.

--A6y262otodfLglAj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBDIHAAKCRB4tDGHoIJi
0ncJAQCl53w8QAJ7W1kAbcYatfiYjs8cN169SAlvwotyW/ClRAEAyOPRKV5ktL+W
u79IRkgFSC+dClqKFwTv/uRyNQbtUgI=
=tU5S
-----END PGP SIGNATURE-----

--A6y262otodfLglAj--


--===============1083404990489197892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1083404990489197892==--

