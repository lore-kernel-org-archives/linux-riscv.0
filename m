Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC1BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:MIME-Version:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFnhmv6V/iJ4RsgRVZjZmXmSo0taLTyn/mdUNXq3QrU=; b=GhpXvZEQm56/knQXysMjg82hPq
	Htd0yKz8Oarxh1pbmcESRXzetBAsNku9nG8Xwdy6fBAQ0N7OZJ1eF5H78NSIqm9+2YcrFNv9gjz0Z
	UZ4PlX/kJJ6BJ6bQSt9wihznKihoVokhROTbsibdeMn7/gg8yDTy74ZUPn5U7H+tR4mxuNfXGoQZD
	FCY3TFPcV+HSbtfwNyWzD6psiyhSrHS1WnyY0ENjD3tYoUB7JD9urcXnapcrEMo5tnHh1ERUgpYgY
	8Cei8ynIvaE5PhOpBpvkyRO5V3/ijwFVCyfXSqFB0KrRHtcBNO+AL5PqyrSPXMYFTuedMgLiWkPfk
	S0MiJ9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1QV0-00000002nQV-0xyn;
	Mon, 29 Apr 2024 12:52:50 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1QUv-00000002nLK-31Vz
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 12:52:48 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240429125237euoutp02be885112706353b82ce95083d2165baf~KwU-ko2zJ0762607626euoutp02i;
	Mon, 29 Apr 2024 12:52:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240429125237euoutp02be885112706353b82ce95083d2165baf~KwU-ko2zJ0762607626euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714395157;
	bh=ZpGozA/g5Y27vWcnYSjq0fcfRyzSKVOELfD+MtTbh50=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JnYNtv7R+1AVMQdMCh/td2arTQQHZchK14+ZwVfZl/7jRhXyXpXmv+/brD0zwf2di
	 lrk96ZWi2gks+YXPtIIECNGoyYVGuDe3P0L5VhTJpVnAbg2bi8brVFEt5MQwbBKED8
	 /+1FHZaUyv0Xn09OGz2yAKfPgX+mltTpRFPDN4KI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240429125236eucas1p2259a040fba43cbe4b15166274efe9234~KwU-Ti5Bs0938209382eucas1p2b;
	Mon, 29 Apr 2024 12:52:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 4F.05.09875.4189F266; Mon, 29
	Apr 2024 13:52:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4~KwU_4QlXO0725807258eucas1p2b;
	Mon, 29 Apr 2024 12:52:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240429125236eusmtrp23f0f6bea6cee94b5ea67a2c733ba577b~KwU_2j3nl2188021880eusmtrp2f;
	Mon, 29 Apr 2024 12:52:36 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-14-662f981462ff
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id DF.70.09010.4189F266; Mon, 29
	Apr 2024 13:52:36 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240429125235eusmtip2ee5e6dfc75c147ac32e12e62e05dccc6~KwU_knLdn3170331703eusmtip2B;
	Mon, 29 Apr 2024 12:52:35 +0000 (GMT)
Received: from localhost (106.110.32.44) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 29 Apr 2024 13:52:34 +0100
Date: Mon, 29 Apr 2024 14:52:30 +0200
From: Joel Granados <j.granados@samsung.com>
To: Nam Cao <namcao@linutronix.de>
CC: Mike Rapoport <rppt@kernel.org>, Andreas Dilger <adilger@dilger.ca>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	<linux-riscv@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>, "ndesaulniers @ google . com"
	<ndesaulniers@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Ingo Molnar
	<mingo@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tejun
	Heo <tj@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>, Changbin Du
	<changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240429125230.s5pbeye24iw5aurz@joelS2.panther.com>
MIME-Version: 1.0
In-Reply-To: <20240418102943.180510-1-namcao@linutronix.de>
X-Originating-IP: [106.110.32.44]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7djPc7oiM/TTDH51alosO/mIyWLO+jVs
	Fn8nHWO32Pp+FYvF0TeyFncmPWe3mDt7EqPFxh0zmSwu75rDZrHtcwubxY0JTxktVv87xWix
	d/8eZosPE/4zWRxZv53JYsHGR4wWmzdNZbb4tfwoo4OQx+9fkxg9vt48x+TRsrncY+JZXY8F
	m0o9Wo68ZfXYtKqTzePduXPsHidm/Gbx2Lyk3mPVkzXMHp83yQXwRHHZpKTmZJalFunbJXBl
	vFo+g6XgmF5F24te1gbGZRpdjJwcEgImEq8vP2HpYuTiEBJYwSgxsXEvI4TzhVHi06P3rBDO
	Z0aJa8tamWBa9vxbC9WynFFi/4kH7HBVT7tWMkE4mxkl9k44zgjSwiKgKrGxaQMbiM0moCNx
	/s0dZhBbREBJ4sDL32wgDcwCS1klGmceAmsQFnCTmLekHWgHBwevgINEw7sAkDCvgKDEyZkg
	13IC1VdI3OjoZAMpYRaQllj+jwMkzClgLfFn/1pmiEsVJb4uvscCYddKnNpyC+w2CYG5XBL3
	zn1hg0i4SNz7uwHqNWGJV8e3sEPYMhL/d86HapgM9Oa/D+wQzmpGiWWNX6E6rCVarjxhB7lC
	QsBR4tnfKgiTT+LGW0GIO/kkJm2bzgwR5pXoaBOCaFSTWH3vDcsERuVZSD6bheSzWQifQYR1
	JBbs/oQprC2xbOFrZgjbVmLduvcsCxjZVzGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSm
	3dP/jn/Zwbj81Ue9Q4xMHIyHGFWAmh9tWH2BUYolLz8vVUmEN2OifpoQb0piZVVqUX58UWlO
	avEhRmkOFiVxXtUU+VQhgfTEktTs1NSC1CKYLBMHp1QDk7c1o+qD7EXxp0RDt/qWbFnfuTTu
	yl/ZdWanDpdbLU2te+sZeXKF2bWgfav3LN/zzOFKv2TO65NL2ctuep3byzi7zDRc18xe45GL
	iYm3kTp3DKucvKWK3bz9C58bPpxdGPnc4yV/d+7qpZo2GrvFVts5Xpp2at79Bp1li+/nVf+f
	ov+jb+qnPwvun/dMzFl56/4Sg5W/4lxlHkStX/ZP6/XKwAnZOXuK/xw2Wr09Z05p131mBm5e
	nvDOZT9lfxZLKTH2qpzjucAtJZXjddrqpHdeWd3M5/PiIwRjL/DZnHxfNPmu0K51zJ1Mcqeu
	q2QpXX32LTXRSvz8vJ+XYryqGueZ29uZvptrK5BbL/3cTImlOCPRUIu5qDgRAEnd2aI2BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsVy+t/xe7oiM/TTDOYeY7NYdvIRk8Wc9WvY
	LP5OOsZusfX9KhaLo29kLe5Mes5uMXf2JEaLjTtmMllc3jWHzWLb5xY2ixsTnjJarP53itFi
	7/49zBYfJvxnsjiyfjuTxYKNjxgtNm+aymzxa/lRRgchj9+/JjF6fL15jsmjZXO5x8Szuh4L
	NpV6tBx5y+qxaVUnm8e7c+fYPU7M+M3isXlJvceqJ2uYPT5vkgvgidKzKcovLUlVyMgvLrFV
	ija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLODR7PmPBEb2K/vYO1gbGJRpd
	jJwcEgImEnv+rWXpYuTiEBJYyigxa+NGdoiEjMTGL1dZIWxhiT/Xutggij4ySsw89wPK2cwo
	ceTGOhaQKhYBVYmNTRvYQGw2AR2J82/uMIPYIgJKEgde/gZrYBZYyirRsfsxI0hCWMBNYt6S
	dqBmDg5eAQeJhncBIGEhASuJU4vngvXyCghKnJz5BGw+s0CZxNedK9hBypkFpCWW/+MACXMK
	WEv82b+WGeJQRYmvi++xQNi1Ep//PmOcwCg8C8mkWUgmzUKYBBHWkrjx7yUThrC2xLKFr5kh
	bFuJdevesyxgZF/FKJJaWpybnltspFecmFtcmpeul5yfu4kRmHq2Hfu5ZQfjylcf9Q4xMnEw
	HmJUAep8tGH1BUYplrz8vFQlEd6MifppQrwpiZVVqUX58UWlOanFhxhNgYE4kVlKNDkfmBTz
	SuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYlPMqpTifzDMqNlqZ
	8LNsZZjdVnfxjG99f9S6WgTUD0TYi0tHf4mZfnPVPdePPZdV12Ys5Ni/dEaefKZbpue9dz7z
	vj45LqZz4u/X338Ocx20t1s2s92QJeFm5G2GhhNbnOfZb8o6fseV8XfljDXnPMzcK16KGVpI
	HeU1iFm20i++7ETCg8vZp23Nt/zK1//fWf/j7umd69+75J2K7LXRODflu/arIwxf9ihyzQ9W
	P5lssSGI+7IFsy37+V7FyJa5oWseOMhU20zdudHj+IcVyWySXjrsMo2mTXzz05f9Ujt578DT
	QIdJ1vHzF58NPLRl5UNDXpd3kg6lgiL7PG+8j+tIu3w56QaH+PyUa757lViKMxINtZiLihMB
	R+F7G9IDAAA=
X-CMS-MailID: 20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4
X-Msg-Generator: CA
X-RootMTR: 20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4
References: <20240418102943.180510-1-namcao@linutronix.de>
	<CGME20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_055246_127001_3C975E77 
X-CRM114-Status: GOOD (  30.49  )
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
Content-Type: multipart/mixed; boundary="===============1308000220279914248=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1308000220279914248==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="s6e23wdofaldi5z4"
Content-Disposition: inline

--s6e23wdofaldi5z4
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 12:29:43PM +0200, Nam Cao wrote:
> There is nothing preventing kernel memory allocators from allocating a
> page that overlaps with PTR_ERR(), except for architecture-specific
> code that setup memblock.
>=20
> It was discovered that RISCV architecture doesn't setup memblock
> corectly, leading to a page overlapping with PTR_ERR() being allocated,
> and subsequently crashing the kernel (link in Close: )
>=20
> The reported crash has nothing to do with PTR_ERR(): the last page
> (at address 0xfffff000) being allocated leads to an unexpected
> arithmetic overflow in ext4; but still, this page shouldn't be
> allocated in the first place.
>=20
> Because PTR_ERR() is an architecture-independent thing, we shouldn't
> ask every single architecture to set this up. There may be other
> architectures beside RISCV that have the same problem.
>=20
> Fix this one and for all by reserving the physical memory page that
> may be mapped to the last virtual memory page as part of low memory.
>=20
> Unfortunately, this means if there is actual memory at this reserved
> location, that memory will become inaccessible. However, if this page
> is not reserved, it can only be accessed as high memory, so this
> doesn't matter if high memory is not supported. Even if high memory is
> supported, it is still only one page.
>=20
> Closes: https://lore.kernel.org/linux-riscv/878r1ibpdn.fsf@all.your.base.=
are.belong.to.us
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: <stable@vger.kernel.org> # all versions
> ---
>  init/main.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/init/main.c b/init/main.c
> index 881f6230ee59..f8d2793c4641 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -900,6 +900,7 @@ void start_kernel(void)
>  	page_address_init();
>  	pr_notice("%s", linux_banner);
>  	early_security_init();
> +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE); /* reserve last page for=
 ERR_PTR */
>  	setup_arch(&command_line);
>  	setup_boot_config();
>  	setup_command_line(command_line);
> --=20
> 2.39.2
>=20

I received a similar(ish) report recently
https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com/
regarding RISC-V in init/mail.c. Here is the meat of the report in case
you want to avoid going to the actual link:
"
=2E..
   riscv64-linux-ld: section .data LMA [000000000099b000,0000000001424de7] =
overlaps section .text LMA [0000000000104040,000000000213c543]
   riscv64-linux-ld: section .data..percpu LMA [00000000024e2000,0000000002=
6b46e7] overlaps section .rodata LMA [000000000213c580,000000000292d0dd]
   riscv64-linux-ld: section .rodata VMA [ffffffff8213c580,ffffffff8292d0dd=
] overlaps section .data VMA [ffffffff82000000,ffffffff82a89de7]
   init/main.o: in function `rdinit_setup':
>> init/main.c:613:(.init.text+0x358): relocation truncated to fit: R_RISCV=
_GPREL_I against symbol `__setup_start' defined in .init.rodata section in =
=2Etmp_vmlinux.kallsyms1
   net/ipv4/ipconfig.o: in function `ic_dhcp_init_options':
   net/ipv4/ipconfig.c:682:(.init.text+0x9b4): relocation truncated to fit:=
 R_RISCV_GPREL_I against `ic_bootp_cookie'
   net/sunrpc/auth_gss/gss_krb5_mech.o: in function `gss_krb5_prepare_encty=
pe_priority_list':
>> net/sunrpc/auth_gss/gss_krb5_mech.c:213:(.text.gss_krb5_prepare_enctype_=
priority_list+0x9c): relocation truncated to fit: R_RISCV_GPREL_I against `=
gss_krb5_enctypes.0'
   lib/maple_tree.o: in function `mas_leaf_max_gap':
>> lib/maple_tree.c:1512:(.text.mas_leaf_max_gap+0x2b8): relocation truncat=
ed to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `ma_dead_node':
>> lib/maple_tree.c:560:(.text.mas_data_end+0x110): relocation truncated to=
 fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mas_extend_spanning_null':
>> lib/maple_tree.c:3662:(.text.mas_extend_spanning_null+0x69c): relocation=
 truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mas_mab_cp':
>> lib/maple_tree.c:1943:(.text.mas_mab_cp+0x248): relocation truncated to =
fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mab_mas_cp':
>> lib/maple_tree.c:2000:(.text.mab_mas_cp+0x15c): relocation truncated to =
fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mas_reuse_node':
>> lib/maple_tree.c:3416:(.text.mas_reuse_node+0x17c): relocation truncated=
 to fit: R_RISCV_GPREL_I against `mt_slots'
   lib/maple_tree.o: in function `mt_free_walk':
>> lib/maple_tree.c:5238:(.text.mt_free_walk+0x15c): relocation truncated t=
o fit: R_RISCV_GPREL_I against `mt_slots'
   lib/maple_tree.o: in function `mtree_lookup_walk':
   lib/maple_tree.c:3700:(.text.mtree_lookup_walk+0x94): additional relocat=
ion overflows omitted from the output
=2E..

"

Could the fix that you have posted here be related to that report?
Comments are greatly appreciated.

Best
--

Joel Granados

--s6e23wdofaldi5z4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmYvmA0ACgkQupfNUreW
QU/TcAv/R+pAjTDoAeoU3WyOOx6zyEtWCvRsTNWxaadNCk5n4YLTRmFZRke/ETZo
A4yKXDjtCXhcwL7pDR0BicIVEJQa0MujxGb2Re0S5ijajV93/KtJ4UXZri1Ij1la
zBbc0UEhVO39bgFkmtyWFR+4Ln+ugL6hOOO0rN2FQ76i2W6X+stesxjBydf9cmil
fYsHn/UHLBXgsP2wHt6nP6/qT+RvXDG/cfRhYmHUOOAphed5HuK+TKekNGDr2Dxw
VDzxzPleawaT0O8bfKwfGH9qi+AbfK0LanHBJIsTdSAPUbot7K1P5f7IDLgnDUgk
pw6GipBbpEKuSJL5fFrok10uI5Z+6lfiocfI91xRluVUoSJf9ZsvT9l4jTGVmcRU
+gjX/LRFZP4iuVjeiAOZdER7+42QQtxyPWZvnPM/xZ3vOJQ5DmsPYzxDMQqxq2i0
dhWobw9vNWAQMCdqt3kqE52WswbMKFMQNZdxN1/BFIOPCjeZQRkJ/sgz/G1+VsJM
saTJu/RZ
=UHv0
-----END PGP SIGNATURE-----

--s6e23wdofaldi5z4--


--===============1308000220279914248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1308000220279914248==--

