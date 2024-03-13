Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B51C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQKMkVpD9ZHq0u8XcJmWLnI9Sn0Z13kMn1KJVrrfKNo=; b=TEfHa3Tq6SeNr/k6hZqm1x/QUo
	YgAJdRRY9O/lQX05E2QfxsAlP/FnX3nL8Kqg37xXhXRIMkaY4gMVIV/nQEwrlF3kSxBKExxFfc6Jw
	GP6Bq+wYyIVcvZ0U5cO0waaOYWZB8UXdSrxJApqFA7T5LJpWK65sv7sU3e2h+W0xom/6ZfJpTZMCP
	SpqbjJXyGLxnmg8WXTVQW5cyXv5EDM4S9cZH3rPV+DwC67Ih0lxStyph8hEy73nLa5UauViIxnXSE
	gmHvpemXti/rq6nB5rGp+eUj/mf0OX7kDzmczvzqx0ZcDNTmXXQJGRqsURVt+bL6aiyL1CzobIupV
	hzGDVpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLIT-00000009ZW1-0lq8;
	Wed, 13 Mar 2024 09:53:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLIP-00000009ZVF-0yjG
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 09:53:15 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240313095307euoutp025f3f4db690707523ec2c6a6486f0030a~8Sj3BJHB_2837728377euoutp02b;
	Wed, 13 Mar 2024 09:53:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240313095307euoutp025f3f4db690707523ec2c6a6486f0030a~8Sj3BJHB_2837728377euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1710323587;
	bh=twD9X6b2N7TF3Fe5GB+h6K+adTw3hNbDCpRsQcdCuFA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=V/SrGobbnUD9mI9jzZAYoLz6gJYGS0cRE7QGvy5vfRwAOnQU6Y1xXV9tr2HW0KVnC
	 Y5PVkZ71wa3HfAErLeE8YmxBRrtKs5VkKglUBAxMRK6bxwUBSVBLuShIQXcirEvuNv
	 mFdu6qyZa8Dk548hiU5y+s2Uazvn2RY1lzKpWMv0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240313095307eucas1p18346c1bd3ef097124552be288b8b7c5a~8Sj20JFHB2936929369eucas1p1F;
	Wed, 13 Mar 2024 09:53:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 92.5C.09539.38771F56; Wed, 13
	Mar 2024 09:53:07 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240313095306eucas1p2c8d60a1b31fa653c0fb33756ea92f6f9~8Sj2RrKQx1296312963eucas1p2w;
	Wed, 13 Mar 2024 09:53:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240313095306eusmtrp2442f185fb78856d99aaaf1b193f5ce4e~8Sj2QVpL10152101521eusmtrp2a;
	Wed, 13 Mar 2024 09:53:06 +0000 (GMT)
X-AuditID: cbfec7f2-515ff70000002543-14-65f177838a63
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 4B.0F.10702.28771F56; Wed, 13
	Mar 2024 09:53:06 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240313095306eusmtip2049f747f64a192e44d8f39bcf0929347~8Sj17EnlL2880828808eusmtip2O;
	Wed, 13 Mar 2024 09:53:06 +0000 (GMT)
Received: from localhost (106.210.248.173) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 13 Mar 2024 09:53:05 +0000
Date: Wed, 13 Mar 2024 10:53:02 +0100
From: Joel Granados <j.granados@samsung.com>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [v1, 6/6] riscv: vector: adjust minimum Vector requirement to
 ZVE32X
Message-ID: <20240313095302.ard2tpxufhedkvzj@joelS2.panther.com>
MIME-Version: 1.0
In-Reply-To: <20240312123627.9285-7-andy.chiu@sifive.com>
X-Originating-IP: [106.210.248.173]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0xTZxjGcy7tOYDAoWD4hizMApqIw7Fh/MicY5sxJzE6zMQRMjM7OKIB
	irTchDlLitxWcdwGtJncxbVYActNIG7AWp1MiODoOkHXMaCAg17INFUY5WBmsv+e931+z/u9
	7x8fifGsXB/ytDCFEQkFCXyuM96hfXbvTWm6mXnrupmChpLt8M9sHQILJDYuNHwt5cKcpb85
	sN0uJ+Bv3zbj8LHhAgrbF5U4fKKfQ+Bk8T84rL0TA8vaughY252HwcGyffBBUxac7cvGoc54
	E4c2/QoHrhrnOXDmr2Qo1V7nwg5rDheaRmUYzJW7w6IFNQZV98ZwWKGcxWDjT0UoHH6h48Bb
	MwNEuB9d1HgZpb+fVRB0uX0Ip6dNpShtubaJXjCZcHog30bQ3fIJgq7vNaF0m7KAS3f/EUbf
	aDhPP3zaiNB6eRR9XzpO0J2/XsYieNHOe2OZhNNpjGjXvhPOp7TKMuxMNj+j2WDBJUi9byHi
	RAIqFCjudnIKEWeSR11FwNDA7wRb2BBwSabkOCgeZUXAaJ3Ly0SVVIKxUNMa1Du1kViDzDNt
	G047AqrzZ9YcksSpQGAx7nWkudROMLzwEHNoLyoAtC49X+cxKs8JGIpXCYfhSX0ChlUt65Ar
	FQ4eFRegrPYAd6qmcIfGqAwwUqxBHfMxagtoWiEdbScqDOgn1Ti7qT9YLjFzWX0O/KwxoI63
	AJXvAkabH61nAbUfmBQMy3iCOZ2GYLUvWO2u3uBLEXBrZYlgCxUCrmQvoyz1LsgZm9pIfADk
	NgWXHeoG9E882D3dQElHBca2XUF+Lo+ltwHV5AL+DeIvf+Uy+SuXyf+7jG3vBDU9Fu7/2kHg
	Su08xur3gFq9iNcghBLxZlLFiXGMOETIpAeLBYniVGFccExSYhuy9hfurugsXch3c+bgfgQl
	kX4kYC1sbFGNID64MEnI8L1cv9pqZniusYKzmYwo6XNRagIj7ke2kDjf2zUw1o/hUXGCFCae
	Yc4wopcuSjr5SFCvCuyXA/eTcVuDWvzD2yMTIkRadWTat5N/Mb8cyOA1rb0xNCulv1J0HJCT
	LT2VH28uPXD4aOLZ4LS4jksNXbZBwrrpdSLl/XmP8Tw606wxb54+1+c/FI5HZVbGLGQZrTq/
	F4uyZsXFw/ob8WNzua9tfXZoIOw89VHNwSCpffBYTNXVepna7UsXhfFkctD+0l6j9PntkIjo
	8U9ltXUpE1U7/D98o3CiVVkSaI88FOCX8cVuzcF3jvQt76FuRx6PLdw+L/GM6N0tce8J/7E6
	rXngQpf18R6Te3lX+rB39tDJXTcVHLTV1BLlYY/n5Vnytj09URcYqkrWRmvJz0Bk9AMNHxef
	EoTswERiwb/P6r7AhgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2VSf0xTZxTN996jfTVrfONH9gXI1A6nUyyUH93XDRgzRJ9mTt2y6FwWbOAF
	HLRlfS24EWYF5EfdCAhsoTpHw4BRoGAdKAOiwwEh6CAKrkApGzqgAkJLNzRIXaEuM9l/5557
	zrk3N5fEvYs5/uQJuYpRyqWpAs4Got/Va92VnWFnQi2529HouW3o3ulegAo1Tg4aPZvDQbmL
	D71Qy4qOi0a+biDQ76NnMNSyYCDQvPkBQNaSZQLp+xJQmekqF+nb8nH0S1kMGq7NRDOdpwnU
	O/kTgZxmlxd6Ojnrhab//BTl9DRxUOtSLgfZ7nyJozzdRlQ0Z8RR/a9DBPrGMIOj6u4iDA2s
	9nqha9M3uLGb6KLqixhdN3OeS5ev3CToKVspRjsaX6DnbDaCvlHg5NJtunEuXdVhw2iToZBD
	t/0hoS9/f4q2PKoGtFl3lL6d8xuXvnL3In7I+5gwSqlQq5jNyQpWFS34SITChCIJEoZFSISi
	8Nc/fiMsUhASE5XIpJ5IZ5QhMceFyY0X9Hja0y0ntSMyDdAHagGPhFQErMjR4FqwgfSmqgE0
	ll7API1AeMk57OXBPvDJXS3HI7ID2LFqwjxFC4CP+pfdKpIkqK3QMRm1ZuBQwXBgzoKvYV8q
	CF5afLI+AafyefBWi2U91Yd6Hw7UN6+L+FQsnCgpfBbaDuDy0Mqzxouwr+I+sYZxKh1eLrGs
	D8OpAFjrItdoHiWBZquR8Gz6CvzrnJ3jwVlwaXUKFAMf3XNJuueSdP8leegd0OyyYf+jd8Ia
	/SzuwdHQaFwgKgHXAHwZNStLkrFhQlYqY9XyJGGCQmYC7nds7Xn841VQ98Au7AIYCbpAkNs5
	2Vw/CPwJuULOCHz5X2yxM978ROlnnzNKRbxSncqwXSDSfcUS3N8vQeH+bbkqXiQOjRRFiCWh
	kRJxuOAl/r60Aqk3lSRVMSkMk8Yo//VhJM9fg7FRuXkFZXGmBj9dp/TtgFvlpmP6D0RmGEjN
	36sITnd9p83cE3I7uzLjzFvqGrH5usQZsufViDh7vpxdGClPGt7X0L5RNXbq8Ce2b9t54ftN
	fjOJYZuZPN7ZvcEqx9z1ptE7acOt79GjJl3hijB1/E11dOy7koHD8ZpdQbvNdUv9L89k+gUc
	4h/cXuN6LfvxkXkHebB4d7wtvWqo1Hr8WvTRjkr9pitjnT1B+IH04G4+O+jTt//kO3unbqbo
	s8wT2iMWHh2XkoVLQkd+4Pbcb0U/O50jGVtD+7vHHmp3GnI/dM5uy8PZaXqC39DsMMxZm2q/
	Elf9rRm35sWzi42DQwKCTZaKduBKVvoP6V7g/yMEAAA=
X-CMS-MailID: 20240313095306eucas1p2c8d60a1b31fa653c0fb33756ea92f6f9
X-Msg-Generator: CA
X-RootMTR: 20240312123723eucas1p2c6d051495af8a49cadfe441eb8267df7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240312123723eucas1p2c6d051495af8a49cadfe441eb8267df7
References: <20240312123627.9285-1-andy.chiu@sifive.com>
	<CGME20240312123723eucas1p2c6d051495af8a49cadfe441eb8267df7@eucas1p2.samsung.com>
	<20240312123627.9285-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_025314_090868_F545482F 
X-CRM114-Status: GOOD (  25.58  )
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
Cc: guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Haorong Lu <ancientmodern4@gmail.com>, Anup Patel <anup@brainfault.org>, Ben Dooks <ben.dooks@codethink.co.uk>, greentime.hu@sifive.com, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jerry Shih <jerry.shih@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Xiao Wang <xiao.w.wang@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, Evan Green <evan@rivosinc.com>, palmer@dabbelt.com, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/mixed; boundary="===============0165090391740310521=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0165090391740310521==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="u6vkdr7omoemprmb"
Content-Disposition: inline

--u6vkdr7omoemprmb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 08:36:27PM +0800, Andy Chiu wrote:
> Make has_vector take one argument. This argument represents the minimum
> Vector subextension that the following Vector actions assume.
>=20
> Also, change riscv_v_first_use_handler(), and boot code that calls
> riscv_v_setup_vsize() to accept the minimum Vector sub-extension,
> ZVE32X.
>=20
> Most kernel/user interfaces requires minimum of ZVE32X. Thus, programs
> compiled and run with ZVE32X should be supported by the kernel on most
> aspects. This includes context-switch, signal, ptrace, prctl, and
> hwprobe.
>=20
> One exception is that ELF_HWCAP returns 'V' only if full V is supported
> on the platform. This means that the system without a full V must not
> rely on ELF_HWCAP to tell whether it is allowable to execute Vector
> without first invoking a prctl() check.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/switch_to.h     |  2 +-
>  arch/riscv/include/asm/vector.h        | 21 ++++++++++++++-------
>  arch/riscv/include/asm/xor.h           |  2 +-
>  arch/riscv/kernel/cpufeature.c         |  5 ++++-
>  arch/riscv/kernel/kernel_mode_vector.c |  4 ++--
>  arch/riscv/kernel/process.c            |  4 ++--
>  arch/riscv/kernel/signal.c             |  6 +++---
>  arch/riscv/kernel/smpboot.c            |  2 +-
>  arch/riscv/kernel/sys_hwprobe.c        |  5 +++--
>  arch/riscv/kernel/vector.c             | 15 +++++++++------
>  arch/riscv/lib/uaccess.S               |  2 +-
>  11 files changed, 41 insertions(+), 27 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 7efdb0584d47..df1adf196c4f 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
<--- snip --->
> =20
>  long riscv_v_vstate_ctrl_get_current(void)
>  {
> -	if (!has_vector())
> +	if (!has_vector(ZVE32X))
>  		return -EINVAL;
> =20
>  	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
> @@ -246,7 +249,7 @@ long riscv_v_vstate_ctrl_set_current(unsigned long ar=
g)
>  	bool inherit;
>  	int cur, next;
> =20
> -	if (!has_vector())
> +	if (!has_vector(ZVE32X))
>  		return -EINVAL;
> =20
>  	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
> @@ -296,7 +299,7 @@ static struct ctl_table riscv_v_default_vstate_table[=
] =3D {
> =20
>  static int __init riscv_v_sysctl_init(void)
>  {
> -	if (has_vector())
> +	if (has_vector(ZVE32X))
>  		if (!register_sysctl("abi", riscv_v_default_vstate_table))
>  			return -EINVAL;
>  	return 0;
Not really sure why I got this, it probably has to do with this line :)
I don't see any changes that can affect sysctl here.

Acked-by: Joel Granados <j.granados@samsung.com>

> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index bc22c078aba8..bbe143bb32a0 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -14,7 +14,7 @@
> =20
>  SYM_FUNC_START(__asm_copy_to_user)
>  #ifdef CONFIG_RISCV_ISA_V
> -	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CO=
NFIG_RISCV_ISA_V)
> +	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32=
X, CONFIG_RISCV_ISA_V)
>  	REG_L	t0, riscv_v_usercopy_threshold
>  	bltu	a2, t0, fallback_scalar_usercopy
>  	tail enter_vector_usercopy
> --=20
> 2.17.1
>=20

--=20

Joel Granados

--u6vkdr7omoemprmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmXxd34ACgkQupfNUreW
QU8n1Qv/dzhmej9pMVtZkUW+g2h27IomlDaHGh1aUs+pwa/IZ5R6RuOAeY8H4skx
cthifRw2s1jaCYYFL0p7UkWDhftUFNmd3T+jDTl0ioCXJI+r39g/IbFK4GCPndXJ
BSHsScGU5JE6WSMRyT1Z10CopxoNr8IETrUVDV7CQWc1SXDmIrYi9BOE4p7qeqoi
r1k0kEUlimZKzSGnQZUOu7+y33Phbjv0pAC8TL/JIWBW5Iojo2CIQn2a9gAAxieh
q/CvyHdwiwvJc3ENwn2cA1soGYAsXRsDDW2U7yc5uubQqqVGe0IGBu37eY9s4XyD
Ss9uaSlsKJCj2B/HoAv2B/qRh6cWAGHtJJ/rie7DPlgLvviHgrOIma011cAiUcwV
V0gCAoGheSRJblet5CwKr2d90SdAgFTuHP1F1TFE0bhJJv7saXGcwu4Uv7S1SNfW
6SIxJhhBgpcga8vK400LXS4MBCJdMKbFR4bpbjmuH2lZFE/T5YV2UFuqMMAqGC/f
V96xzuKv
=72aR
-----END PGP SIGNATURE-----

--u6vkdr7omoemprmb--


--===============0165090391740310521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0165090391740310521==--

