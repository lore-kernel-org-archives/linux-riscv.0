Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A33C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:MIME-Version:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHHSeStOP0C92gkbmrceSNKMmfyglTQsRKr9eSWPjsw=; b=e2EjnmnLrnUmH1zIIqUQhEipVr
	K0LcWgebudQmHwSmNxYIc/X8A9LoQd485Rn5Ow2s8o78/d9xpaQ8Z5o3Ar61JBso+zNzj0GBkxM1p
	kYyoBedL3oPkb0PAuAFXo6UtPr84YTxTps3RvhdyiMnifnC7L3lLSNlGu3Nx1UXhQwUFIwyzouHiK
	1vPQ+FZJKUwqmc2I4I7L/08D0D9MlyBTGOyIGS2TeLU6LBTgSXD/Fk9g6n6DbUBHa8qvcOS8NhgBS
	AJ8hPt3IHYleUtNvKzPehmhfGqNt9xIwkK4oFBDqb4LhyU7G/spqt3LnUTxw7Fehty8mtOSaTtR75
	D43OZe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pdD-000000075vG-09vU;
	Tue, 30 Apr 2024 15:42:59 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1pd9-000000075tZ-1X65
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 15:42:58 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240430154243euoutp01b224bf6f245cfe6cb7eb9c2f71896a0d~LGSzpJmoo3186231862euoutp01g;
	Tue, 30 Apr 2024 15:42:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240430154243euoutp01b224bf6f245cfe6cb7eb9c2f71896a0d~LGSzpJmoo3186231862euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714491763;
	bh=Ce+4NcTo+VfskyNruHgkzR4Sm5eZ4Ehrn56BefYMbfc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=rpqfKjR1r3NMoBGsgpYYgXN5E+3EJsxgaqP8Q6Jnx8NxW0mBfDKTY9eSF3oVjqN2J
	 J/o1aze1MX3z6cgqMSYVbioXN5EoooukJudORbcYUSlX0xByONuZLOwOdjT80WEWrB
	 0qISfimlF5TP4C2D3tQ2jwYSStcH79I6gOL8/nXA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240430154243eucas1p110c9423535d3b0447aa0c90a05995f5b~LGSzVT5nZ1387413874eucas1p1r;
	Tue, 30 Apr 2024 15:42:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 44.A7.09624.37111366; Tue, 30
	Apr 2024 16:42:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240430154242eucas1p16b22eed3b61c1a2ddc68ffed438d1b30~LGSyvZ_FV1872118721eucas1p1e;
	Tue, 30 Apr 2024 15:42:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240430154242eusmtrp1b461834bce5006900938109177ff6e37~LGSytjMvA1054810548eusmtrp1k;
	Tue, 30 Apr 2024 15:42:42 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-62-663111736413
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A8.48.08810.27111366; Tue, 30
	Apr 2024 16:42:42 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240430154242eusmtip2089daec2a3fedcfebdf54f1a592b20e2~LGSydXgVC2375523755eusmtip2c;
	Tue, 30 Apr 2024 15:42:42 +0000 (GMT)
Received: from localhost (106.210.248.68) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 30 Apr 2024 16:42:42 +0100
Date: Tue, 30 Apr 2024 17:42:38 +0200
From: Joel Granados <j.granados@samsung.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Nam Cao <namcao@linutronix.de>, Mike Rapoport <rppt@kernel.org>, Andreas
	Dilger <adilger@dilger.ca>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, <linux-riscv@lists.infradead.org>, Thomas Gleixner
	<tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
	"ndesaulniers @ google . com" <ndesaulniers@google.com>, Luis Chamberlain
	<mcgrof@kernel.org>, Ingo Molnar <mingo@kernel.org>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Tejun Heo <tj@kernel.org>, Krister Johansen
	<kjlx@templeofstupid.com>, Changbin Du <changbin.du@huawei.com>, Arnd
	Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240430154238.nu6pebmdlpkxnk7q@joelS2.panther.com>
MIME-Version: 1.0
In-Reply-To: <0049995a-07d0-4aaa-abc7-5bfc0dc22ace@ghiti.fr>
X-Originating-IP: [106.210.248.68]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSfUxTVxjGd+69vb1tUr2UbhwRNCvIFsanIeOSMeMMcbcbi6hhyb4yGrkt
	DijYK4JEMkeYww5JaYcgA1IWpIyKjLYr+DUQ21pKBLI6P4nLGAPGcFU+FoFZR71lM9l/v/d5
	3+ec5z05BCo24aHEftVBRq2S50lxIWZzLo3EskGJioQuTQjVNjiOUI1dZ3BqcmyRRz3WOfnU
	994OjHLMhlNjuik+1fS1DlDdvacQynO+Eads8xU4dUv7G6BMPjegLvVdRKkH2icIZe/qQShD
	9zigLOZalFo2OsD2YHplWQfoxdvDCF1hKabvuU7y6JprsbTBXERX2O/zaHPHcZz+c3iYT7vq
	VzDa0vop3TFxBqXnzZsyRO8LU7OZvP2HGHX8tixhjmfSgxZ2Rpb01J7jHQUnN2mAgIBkEvyx
	exnXACEhJtsB7Kuy8rliAUCPthJwxTyAPdcu4msW/dJawwig+5fTyL9TDt9YoGMF0Djj4mkA
	QWDkFljbnuB342QMHJkdQ/2yhIyA5+wR/nGUdPBg/9SVpzcEkzthc+sXmJ9F5HZ4pbof5TgI
	Dp6aeKqjZAnsb9MD/zkouREafYRfFpCp0G1wBoJK4Yn6JoTjMui23gnwt0J4+8skjtNgy4lO
	PsfBcOaqNcBhcEhfhfmzQVK/+i6+B3yuMAHY9tli4KTXYMX1Cb4/BCTfgJOPSzlcB2/dD+Ji
	roM6Wx3KySJYeUzMGaOg6d4spgURDc8s1vDMYg3/LcbJMdBwYQ7/n/wKbGv5A+X4dXj2rBcz
	AH4HCGGK2HwlwyaqmOI4Vp7PFqmUcfsK8s1g9Q8P+a7O9YKmmYdxAwAhwACIXDWPf2caBaGY
	qkDFSCWir1riFWJRtvxwKaMu+FhdlMewA2AjgUlDRFuyNzNiUik/yOQyTCGjXusihCD0KLJj
	Lj1Moe2xZ0n2Hjmv2EvffdPhWRiMskyTxY/2lSm9W8vJ0nxgTSlf+ealfsExr05f8twGnrjw
	vbupEltz48vJyp+38nyjufIfPpJ4arDJ9HAEr+/D64Jrn0RHKW/y25M9Za3j6//KJKKzDBEX
	UqarXDfQXMmOjEy01X25fIhZlj2/PqbOdpzOe6j923loM4t9MvLBO67RMNmNzA/jNhhNKXm2
	wrec1btCserLlvTmxqje6zLp2+Eawe8ZSS/uvLNbYN/me0GbUnmz/d1diK3mpz3SgiXZIwv1
	63SkPSyWVohEowd2r5QciO/UJEtzpnisbOrVSyMLad7DRxLSPpdibI48MRpVs/J/AAvuHsE+
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsVy+t/xe7pFgoZpBiuOaFosO/mIyWLO+jVs
	Fs/ufGW1+DvpGLvF1verWCyOvpG1uDPpObvF3NmTGC027pjJZHF51xw2i22fW9gsbkx4ymix
	+t8pRou9+/cwW3yY8J/J4sj67UwWCzY+YrTYvGkqs8Wv5UcZHYQ9fv+axOjx9eY5Jo+WzeUe
	905MY/WYeFbXY8GmUo+WI29ZPTat6mTzeHfuHLvHiRm/WTw2L6n3WPVkDbPH501yAbxRejZF
	+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmzTnxkK1it
	UjHz7U72BsYpcl2MnBwSAiYSk392MHYxcnEICSxllNhw5gULREJGYuOXq6wQtrDEn2tdbCC2
	kMBHRokL07whGrYwSvQdfgrUzcHBIqAqMXWFAUgNm4COxPk3d5hBwiICyhI7jyiDlDMLHGWV
	WHD8HSNIjbCAm8S8Je1gu3gFHCQO9x1ghpi5kEli69z7UAlBiZMzn4DZzAJlEs/vTGECGcos
	IC2x/B8HSJhTwEbi1IJjbBB3Kkn0zpjLBGHXSnz++4xxAqPwLCSTZiGZNAthEkRYS+LGv5eY
	wtoSyxa+ZoawbSXWrXvPsoCRfRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgMtp27OfmHYzz
	Xn3UO8TIxMF4iFEFqPPRhtUXGKVY8vLzUpVEeKcs1E8T4k1JrKxKLcqPLyrNSS0+xGgKDMSJ
	zFKiyfnANJlXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cDEu8Jn
	+7aKLy6TbrV19JucOLNXMZnj2iaGzR5s8k7Cvm/m/HjZKF+iEr8/hTF7nUaY7fE+yTnlE25u
	3t059ee/tdf+qrbHXeKMOFlT+vbQxHkSkx/qBz8MnHtvyx197/9eko4bjjhfFZyuvkv2Mptc
	7ce5Los8Qt4F/9U3rD5xhW8y79yk5WdOnBS+sPIKw4Ee/2Wtq86fUWDjLVitWqyk06AtUM+T
	/2NPU/fHhh8nPt1L33vVKdWwvGt735TuGq3L5QruvaoHlmlvutdcn7JKsiZ3w9w/bjemTWNq
	KH64v+v1y1OmfxNU79eqF25hSVxuXsZ42Su1Mkmzt+jdhp/Z2y7N69wpIfh+zvJ7pQsElViK
	MxINtZiLihMBQ0zW49sDAAA=
X-CMS-MailID: 20240430154242eucas1p16b22eed3b61c1a2ddc68ffed438d1b30
X-Msg-Generator: CA
X-RootMTR: 20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4
References: <20240418102943.180510-1-namcao@linutronix.de>
	<CGME20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4@eucas1p2.samsung.com>
	<20240429125230.s5pbeye24iw5aurz@joelS2.panther.com>
	<20240430073056.bEG4-yk8@linutronix.de>
	<0049995a-07d0-4aaa-abc7-5bfc0dc22ace@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_084255_682960_C468E164 
X-CRM114-Status: GOOD (  39.92  )
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
Content-Type: multipart/mixed; boundary="===============2661814468865564464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2661814468865564464==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="xorqn2blaq43v63q"
Content-Disposition: inline

--xorqn2blaq43v63q
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 10:37:59AM +0200, Alexandre Ghiti wrote:
> Hi Joel, Nam,
>=20
> On 30/04/2024 09:31, Nam Cao wrote:
> > On Mon, Apr 29, 2024 at 02:52:30PM +0200, Joel Granados wrote:
> >> On Thu, Apr 18, 2024 at 12:29:43PM +0200, Nam Cao wrote:
> >>> There is nothing preventing kernel memory allocators from allocating a
> >>> page that overlaps with PTR_ERR(), except for architecture-specific
> >>> code that setup memblock.
> >>>
> >>> It was discovered that RISCV architecture doesn't setup memblock
> >>> corectly, leading to a page overlapping with PTR_ERR() being allocate=
d,
> >>> and subsequently crashing the kernel (link in Close: )
> >>>
> >>> The reported crash has nothing to do with PTR_ERR(): the last page
> >>> (at address 0xfffff000) being allocated leads to an unexpected
> >>> arithmetic overflow in ext4; but still, this page shouldn't be
> >>> allocated in the first place.
> >>>
> >>> Because PTR_ERR() is an architecture-independent thing, we shouldn't
> >>> ask every single architecture to set this up. There may be other
> >>> architectures beside RISCV that have the same problem.
> >>>
> >>> Fix this one and for all by reserving the physical memory page that
> >>> may be mapped to the last virtual memory page as part of low memory.
> >>>
> >>> Unfortunately, this means if there is actual memory at this reserved
> >>> location, that memory will become inaccessible. However, if this page
> >>> is not reserved, it can only be accessed as high memory, so this
> >>> doesn't matter if high memory is not supported. Even if high memory is
> >>> supported, it is still only one page.
> >>>
> >>> Closes: https://lore.kernel.org/linux-riscv/878r1ibpdn.fsf@all.your.b=
ase.are.belong.to.us
> >>> Signed-off-by: Nam Cao <namcao@linutronix.de>
> >>> Cc: <stable@vger.kernel.org> # all versions
> >>> ---
> >>>   init/main.c | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/init/main.c b/init/main.c
> >>> index 881f6230ee59..f8d2793c4641 100644
> >>> --- a/init/main.c
> >>> +++ b/init/main.c
> >>> @@ -900,6 +900,7 @@ void start_kernel(void)
> >>>   	page_address_init();
> >>>   	pr_notice("%s", linux_banner);
> >>>   	early_security_init();
> >>> +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE); /* reserve last page=
 for ERR_PTR */
> >>>   	setup_arch(&command_line);
> >>>   	setup_boot_config();
> >>>   	setup_command_line(command_line);
> >>> --=20
> >>> 2.39.2
> >>>
> >> I received a similar(ish) report recently
> >> https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.=
com/
> >> regarding RISC-V in init/mail.c. Here is the meat of the report in case
> >> you want to avoid going to the actual link:
> > This issue doesn't look like it has anything to do with this patch: this
> > patch is about overlapping of dynamically allocated memory, while I thi=
nk
> > the issue is about overlapping sections during linking (maybe something
> > wrong with riscv linker script?)
> >
> > Also, FWIW, this patch is not going to be in mainline because of a
> > regression.
> >
> > Nonetheless, I will have a look at this later.
>=20
>=20
> The config shows that it is a XIP kernel that comes with its own=20
> limitations (text is limited to 32MB for example), so I'm not surprised=
=20
> to see those overlaps.
>=20
> We already discussed the removal of randconfig builds on XIP configs,=20
> but IIRC it is not possible.

I just tested this going back until "2023-09-20 602bf1830798 (HEAD)
Merge branch 'for-6.7' into for-next  [Petr Mladek]" and I still saw the
overlapping errors.

Is this just something that happens always?

Best
--=20

Joel Granados

--xorqn2blaq43v63q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmYxEW0ACgkQupfNUreW
QU942wv+PegN4ocDUt7R0rNacgIze/O0l1ZR4dEWWoEDBLwjAosk4+VHvBeyXNcm
PGXMZICtzweMuwOH4u650xq1pvTBtrT6WCGS34KLj74oFuLU4lX783gm6ORd1vCi
UQNdx4Vd65rD7FwEliU4dL5UlGkjuPYrwtv1bCrSDWebL9bYMunGGUVpBqkSKhmU
Bp30/WRj0UpnwqgH/p7c3WiYeyKOOBZJE8EupU8i++tObmX6L2GtOYJ+6ioCH40V
ipf+LVUUY+c2hldGLuM5nk8CImi+HAQUp3EmieAV6QKpLAgZvlubvbxXRkOeKjX3
buMWof7DT9+pbnqYw5VVwQSmRm1umKkLlD+oU+2kgkf0QWdRGwuptSLVvuBHiRBF
lIPNU1X7dwOGhuUOj0JQ6q7EIb4buXssSGXw3H/U8v05NE1COkDV27yDXoUzqTAK
Pn0dkbrzj5zsIJG3ACS1F/1xJe9OdFn0EXaaBarndByvAfJgxQmMNpEYKQxN8nm/
ItMMPaoX
=f44l
-----END PGP SIGNATURE-----

--xorqn2blaq43v63q--


--===============2661814468865564464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2661814468865564464==--

