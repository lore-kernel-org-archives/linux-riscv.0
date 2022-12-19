Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A6CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89D+aBTb65yQ6+Z+McYWmAXWxqqcE6170XYuSq2NgE8=; b=2j3xUst2YpLOPviyufj8dsnGfL
	Yxp/lnpk+i6w8Cxc9oRTM56yBLCujcA41e4jUhJ5GMHcLrS8UPTlmsUaDwPQXr2+ziotsZE7cDun2
	v6Tt1dTCUm6JsTAce4XWPbz8kqzN7UVUj+WcGIC2MNOHEEcAeBGb3xhF0xvSDkRXGPdSkNIyKXvXa
	mrBbbYiLgwjL1Wy4Bk0PRWzW+4C/RwIemJ6u/DYunOOeEiATY2TcM4SrMJKZxScwTRZATkuyIke2G
	HsT990HW7MiHBmgiHnLxIfVsnuCevWsvQZtyGSj1jiCpfwDZuToNA0lN00HRAyP8L5QGJGH4AZy+y
	yZ0s+c5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7O06-0046QX-Tb; Mon, 19 Dec 2022 21:48:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7O03-0046NU-VG
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 21:48:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 51FD8B81023;
	Mon, 19 Dec 2022 21:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EB9C433EF;
	Mon, 19 Dec 2022 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671486521;
	bh=b8IZCi7L7rb3YwusIaJGm/PEuCetzq5mkz+7RvltxUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rY9b0uYq12vwlIR0tSBzLmzhDK3D9XECCgmzSv7MFd1NLeVz7HWeI89ilaZxs/N53
	 DvKzAvYBxHVofWUGgg8wKjggGP1FvMWhyOE32ru7mwYcwM8RpUdcqxzs8v/+0M7olR
	 JK6swqz4/En/CxOQ7gVyYG1vTa9VpYiA9ND6Zb0y8L0g9E/KVLVqyS7EKVNYM8Iv7c
	 RxtQNj3UHpK/uLjm+/4/uUqSRYndXfTcqSQod2t2SoNfjFQhiHOgDJsm6g5YMaYQtu
	 s246MsTraP9jgIxTM7oZgEWD2naCS0bUqe+0k6mD8357gAjUY1IbQD0EJjivetsBaz
	 7fmFqdfI9Qkfw==
Date: Mon, 19 Dec 2022 21:48:36 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com
Subject: Re: [PATCH v11 0/3] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <Y6DcNIOx6n1KeCfP@spud>
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_134844_324952_D631056F 
X-CRM114-Status: GOOD (  26.71  )
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
Content-Type: multipart/mixed; boundary="===============3152355504609289558=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3152355504609289558==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rB9LdUK6IMOhYuvp"
Content-Disposition: inline


--rB9LdUK6IMOhYuvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 02:21:06PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
>=20
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is on,
> and people can set it off if they don't allow kernel to detect Svnapot
> hardware support and leverage it.
>=20
> Tested on:
>   - qemu rv64 with "Svnapot support" off and svnapot=3Dtrue.
>   - qemu rv64 with "Svnapot support" on and svnapot=3Dtrue.
>   - qemu rv64 with "Svnapot support" off and svnapot=3Dfalse.
>   - qemu rv64 with "Svnapot support" on and svnapot=3Dfalse.
>=20
>=20
> Changes in v2:
>   - detect Svnapot hardware support at boot time.
> Changes in v3:
>   - do linear mapping again if has_svnapot
> Changes in v4:
>   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> Changes in v5:
>   - modify code according to @Conor and @Heiko
> Changes in v6:
>   - use static key insead of alternative errata
> Changes in v7:
>   - add napot_cont_order for possible more napot order in the future
>   - remove linear mapping related code from this patchset to another patch
>   - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
>   - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
>   - support svnapot in huge vmap on newer for-next branch
> Changes in v8:
>   - fix compilation errors in rv32_defconfig
>   - insert some lines of whitespace according to @Conor's suggestion
> Changes in v9:
>   - use alternative to avoid using static branches inside heavily used
>     inline functions
>   - change napot_cont_mask definition
>   - post test_vmalloc modification about testing vmalloc_huge
> Changes in v10:
>   - fix some nits caught by @Andrew
>   - collect Reviewed-by/Acked-by
>   - add memory leak warning in KConfig text

I got slightly confused between version as I was travelling - I saw 2
v10s so hopefully I have not missed anything. While "leak" is probably
not the right word to use here, I think the warning is a reasonable
compromise.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I have one minor wording nit in patch 1/3, but don't bother resubmitting
unless someone else asks for meaningful changes.

Thanks,
Conor.

>   - replace test_vmalloc patch link with the standard one
> Changes in v11:
>   - add more detailed warning about HUGETLBFS and SVNAPOT in KConfig text
>   - fix missing reverse-xmas tree
>=20
>=20
> Qinglin Pan (3):
>   riscv: mm: modify pte format for Svnapot
>   riscv: mm: support Svnapot in hugetlb page
>   riscv: mm: support Svnapot in huge vmap
>=20
>  arch/riscv/Kconfig                   |  21 +-
>  arch/riscv/include/asm/errata_list.h |  15 +-
>  arch/riscv/include/asm/hugetlb.h     |  34 ++-
>  arch/riscv/include/asm/hwcap.h       |   2 +-
>  arch/riscv/include/asm/page.h        |   5 -
>  arch/riscv/include/asm/pgtable-64.h  |  34 +++
>  arch/riscv/include/asm/pgtable.h     |  43 +++-
>  arch/riscv/include/asm/vmalloc.h     |  61 +++++-
>  arch/riscv/kernel/cpu.c              |   1 +
>  arch/riscv/kernel/cpufeature.c       |  15 ++
>  arch/riscv/mm/hugetlbpage.c          | 301 +++++++++++++++++++++++++++
>  11 files changed, 519 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.37.4
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--rB9LdUK6IMOhYuvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6DcNAAKCRB4tDGHoIJi
0s+aAQC+beBkAwaG9myi8ROpgKAfcrug8tpNG3Th3EcNza7VrAD/cJOnKHGsKzYi
vlgqbolaPOJp1hPDvs4EjRrJhoBdlwA=
=TojJ
-----END PGP SIGNATURE-----

--rB9LdUK6IMOhYuvp--


--===============3152355504609289558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3152355504609289558==--

