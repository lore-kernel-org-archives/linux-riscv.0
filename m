Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F2DC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNLXPNwvQKiL2OQzoLMN54HXAgH8BzPjgPQlwqZ1JkI=; b=Ob/tTjeYyz1nH0hsfJ8jGafkhV
	jgae9GpCcTtjJcVrDAZQja3g+On3OuWia1qVdTTGnHGSdTHBYjJhoCz+88eUergbC1cYRzXV+efC+
	J0PdFbXweNo5mIFksSwsQ0Z1/VxCfzUhEnKas7zeWcdYDoOoMEShiGIoG7CUT10k5OWj5wnK/4eGU
	4AMDqvUYrnpvV/dtObZea8LyZYlfoIjKBCcovw9THpMksjz6AADJaYyP8Bo2FznwomIlmZH3hyXGt
	W7HQLWi/jpJ+XWbphhWX2ZggZNScLxivzKj3yNkdy6hfmf+SWI+5MzfxF0lTP+bMnmrgWQ6wttDzy
	JiwyNdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ1P2-000O39-4t; Thu, 09 Feb 2023 07:31:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ1Oy-000O2g-18
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 07:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675927888; x=1707463888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b8JKsHGr6crAn/azbbJAVKaJKTvy/S84AWZB0sH22hM=;
  b=gikFvCah044Iv8JQD1KwLWbUJO1u80b5WB/Cqez0HSgOIbJgiTem3U5g
   0gxHAmBczlw5CYGkAhy37exWD1OATIiyZzUO3L5O9AYaHYPsCfFbKS1Ok
   4sKIY/uU9Sgy4tX2g5uN/FwrmQwUVqSFtnwK/KUB7FB50S5vpvNQ5+UBP
   3VLrd8P/0fVqCAUjU+/cgH3YS/NQkW4C4Z8EChmON+HLn3L+zWeJMI+zp
   +i2mi7n6pubVxm0QpWKtyZZ/EEJ53kLRTJMqkI+fgm8EFlu4RHbxYy0rA
   ZOjY60MDHwV5KMNooPYnJ80uqQhymM3PlD0axrrAlqHvNDasQ5qPeU0iF
   w==;
X-IronPort-AV: E=Sophos;i="5.97,281,1669100400"; 
   d="asc'?scan'208";a="200201144"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 00:31:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 00:31:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Feb 2023 00:31:16 -0700
Date: Thu, 9 Feb 2023 07:30:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v12 0/3] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <Y+ShK27/hnApM89n@wendy>
References: <11ea7918-00db-3f30-2504-53692936aaae@iscas.ac.cn>
 <a1cdf5e6-a6d8-654c-1af2-adb9f0b260c3@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <a1cdf5e6-a6d8-654c-1af2-adb9f0b260c3@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_233128_146078_31B2C8FE 
X-CRM114-Status: GOOD (  28.59  )
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
Content-Type: multipart/mixed; boundary="===============8212149760146611087=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8212149760146611087==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W0HmUdb+72mgfE20"
Content-Disposition: inline

--W0HmUdb+72mgfE20
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Thu, Feb 09, 2023 at 12:00:32PM +0800, Qinglin Pan wrote:
> Hi all,
>=20
> Sorry for bothering :(
>=20
> This patchset has a bit of a formatting problem.
> Please use another one:
> https://lore.kernel.org/linux-riscv/20230209035343.15282-1-panqinglin00@g=
mail.com/T/#t

If you're resending, please either mark as RESEND or increment the
version number so that tools don't get confused.
In this case though, tools found some issues with both version
unfortunately:
https://patchwork.kernel.org/project/linux-riscv/patch/20230209035343.15282=
-2-panqinglin00@gmail.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20230209035343.15282=
-3-panqinglin00@gmail.com/
(if you click on the descriptions you should get more information on
what is wrong)

You can fix those up and send a v13 and it'll all be clear then ;)

Cheers,
Conor.

>=20
> Thanks,
> Qinglin
>=20
> On 2023/2/9 11:13, Qinglin Pan wrote:
> >=20
> > Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-=
4K
> > page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
> >=20
> > This patchset adds a Kconfig item for using Svnapot in
> > "Platform type"->"SVNAPOT extension support". Its default value is on,
> > and people can set it off if they don't allow kernel to detect Svnapot
> > hardware support and leverage it.
> >=20
> > Tested on:
> >  =A0 - qemu rv64 with "Svnapot support" off and svnapot=3Dtrue.
> >  =A0 - qemu rv64 with "Svnapot support" on and svnapot=3Dtrue.
> >  =A0 - qemu rv64 with "Svnapot support" off and svnapot=3Dfalse.
> >  =A0 - qemu rv64 with "Svnapot support" on and svnapot=3Dfalse.
> >=20
> >=20
> > Changes in v2:
> >  =A0 - detect Svnapot hardware support at boot time.
> > Changes in v3:
> >  =A0 - do linear mapping again if has_svnapot
> > Changes in v4:
> >  =A0 - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> > Changes in v5:
> >  =A0 - modify code according to @Conor and @Heiko
> > Changes in v6:
> >  =A0 - use static key insead of alternative errata
> > Changes in v7:
> >  =A0 - add napot_cont_order for possible more napot order in the future
> >  =A0 - remove linear mapping related code from this patchset to another=
 patch
> >  =A0 - refactor hugetlb code for svnapot according to thanks @Andrew @C=
onor
> >  =A0 - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing pr=
ogram
> >  =A0 - support svnapot in huge vmap on newer for-next branch
> > Changes in v8:
> >  =A0 - fix compilation errors in rv32_defconfig
> >  =A0 - insert some lines of whitespace according to @Conor's suggestion
> > Changes in v9:
> >  =A0 - use alternative to avoid using static branches inside heavily us=
ed
> >  =A0=A0=A0 inline functions
> >  =A0 - change napot_cont_mask definition
> >  =A0 - post test_vmalloc modification about testing vmalloc_huge
> > Changes in v10:
> >  =A0 - fix some nits caught by @Andrew
> >  =A0 - collect Reviewed-by/Acked-by
> >  =A0 - add memory leak warning in KConfig text
> >  =A0 - replace test_vmalloc patch link with the standard one
> > Changes in v11:
> >  =A0 - add more detailed warning about HUGETLBFS and SVNAPOT in KConfig=
 text
> >  =A0 - fix missing reverse-xmas tree
> > Changes in v12:
> >  =A0 - rebase on the new ISA extension API [1]
> >=20
> > [1]https://lore.kernel.org/all/20230128172856.3814-5-jszhang@kernel.org/
> >=20
> > Qinglin Pan (3):
> >  =A0 riscv: mm: modify pte format for Svnapot
> >  =A0 riscv: mm: support Svnapot in hugetlb page
> >  =A0 riscv: mm: support Svnapot in huge vmap
> >=20
> >  =A0arch/riscv/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 21 +-
> >  =A0arch/riscv/include/asm/hugetlb.h=A0=A0=A0 |=A0 34 +++-
> >  =A0arch/riscv/include/asm/hwcap.h=A0=A0=A0=A0=A0 |=A0=A0 9 +-
> >  =A0arch/riscv/include/asm/page.h=A0=A0=A0=A0=A0=A0 |=A0=A0 5 -
> >  =A0arch/riscv/include/asm/pgtable-64.h |=A0 34 ++++
> >  =A0arch/riscv/include/asm/pgtable.h=A0=A0=A0 |=A0 39 +++-
> >  =A0arch/riscv/include/asm/vmalloc.h=A0=A0=A0 |=A0 61 +++++-
> >  =A0arch/riscv/kernel/cpu.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=
 1 +
> >  =A0arch/riscv/kernel/cpufeature.c=A0=A0=A0=A0=A0 |=A0=A0 1 +
> >  =A0arch/riscv/mm/hugetlbpage.c=A0=A0=A0=A0=A0=A0=A0=A0 | 301 +++++++++=
+++++++++++++++++++
> >  =A010 files changed, 493 insertions(+), 13 deletions(-)
> >=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--W0HmUdb+72mgfE20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+ShJwAKCRB4tDGHoIJi
0sX3AQCMqDmceoGnPhvWITgWqSlm8En3dvz5ana23uHAM0k9lwEAgriZh2rn3nbS
vzOsuNcSYl7nS23BpcbuRYtC1HZxSQw=
=V17X
-----END PGP SIGNATURE-----

--W0HmUdb+72mgfE20--


--===============8212149760146611087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8212149760146611087==--

