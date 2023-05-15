Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8CBC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+K1/U1Gt4wqwze0dl8o+DaS6eAvJEVchVKSt3a5jx4=; b=QDf5+A8sSCTY0wjhHrRzzZcGem
	18ARmWNjEsPecbBIoMJnpU0MvnaDSRPIM5i8rp4/p3ciRSdQeCuDG4eNXqrueD3l98x/XocW2SyCb
	qBMbwPgFAJlE/h/D1QtrolHkywzRgLGVT1QDwzMVBvcXPwc4t+DPMYKT4Ig0kbzia/fH6fGuEHi0I
	wIO8+UF1+PQzUzT4q0KigmDv9WZD6tnJ7fPaehOXYr82EzQdB7ky1FUc8hp9ZAsACeFyiiL4xck6O
	DHq42/Vk9kcQ7+F8q8fAaXhXZ/cwiweH2tO3g25Iq8UNawoYbubbw2W/NQPSoBB/QdsxINPT12LZM
	aDKSdQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWj6-0022Lb-0m;
	Mon, 15 May 2023 11:50:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWj0-0022Ib-1R
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 11:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684151446; x=1715687446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DX6tv6WQutpB5flncSiEbjSZHpG+HWaxN1Bzd2leoV4=;
  b=Df1CGqAlSxBWHXrvIz7INCyf86adYAPz52dlT7C1aZRLnq0hb6+2E/9Z
   z3+oA6XSg2R3O10iBrAZyGIuqyoUBEZcNA1HIRJpskMB7R6pSFUQ/pGgO
   mH2QMTwTcnQe3bHuTKf4PAQwk3foCAkLRWc8pgDLejkILOu96ortrgCEt
   I7Unnj7CKb7K+Nxg3nnBiRmoXXygoTmhIaLqEHxciCSrceC9838LG0O6m
   0LxA3ELCbvjza9d6QQAhbTU6O5X7pQXHg7GxE2qndvYaC+f5hlcLUPiNz
   BshAKAbsSofas1IdMmf4PPV/+MHyyBuaVy+lIhw08gNeYCYAd/PQ/EnRo
   A==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677567600"; 
   d="asc'?scan'208";a="211285495"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2023 04:50:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 04:50:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 15 May 2023 04:50:34 -0700
Date: Mon, 15 May 2023 12:50:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?utf-8?B?5p2O562x5LqRKOadjuetseS6kSk=?= <lixiaoyun@binary-semi.com>
CC: paul.walmsley <paul.walmsley@sifive.com>, palmer <palmer@dabbelt.com>, aou
	<aou@eecs.berkeley.edu>, conor <conor@kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, =?utf-8?B?6LCi5oyv5pawKOiwouaMr+aWsCk=?=
	<xiezx@binary-semi.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVEM=?= =?utf-8?Q?H?= v2] riscv:
 optimize ELF relocation function in riscv
Message-ID: <20230515-colonial-broaden-9e51f71209c4@wendy>
References: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
 <20230512-morbidly-supremacy-9cdb519107d1@wendy>
 <e35abb9c-7b0b-4a2e-83c7-d5e6fc950c94.lixiaoyun@binary-semi.com>
MIME-Version: 1.0
In-Reply-To: <e35abb9c-7b0b-4a2e-83c7-d5e6fc950c94.lixiaoyun@binary-semi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_045046_712429_2501AC46 
X-CRM114-Status: GOOD (  47.61  )
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
Content-Type: multipart/mixed; boundary="===============5995259993294867683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5995259993294867683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5aY+RIppu+VfpkMR"
Content-Disposition: inline

--5aY+RIppu+VfpkMR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 05:58:35PM +0800, =E6=9D=8E=E7=AD=B1=E4=BA=91(=E6=
=9D=8E=E7=AD=B1=E4=BA=91) wrote:
> Hi Conor=EF=BC=8C
>=20
> On Fri, May 12, 2023 at 04:51:53PM +0800, Amma Lee wrote:
> >> The patch can optimize the running times of "insmod" command by modify=
 ELF
> >> relocation function.
> >> When install the riscv ELF driver which contains multiple
> >> symbol table items to be relocated, kernel takes a lot of time to
> >> execute the relocation. For example, we install a 3+MB driver need 180=
+s.
> >> We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
> >> items relocation function and find that there are two for-loops in this
> >> function. If we modify the begin number in the second for-loops iterat=
ion,
> >> we could save significant time for installation. We install the 3+MB
> >> driver could just need 2s.
> >>
> >> Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> >> Reviewed-by: Conor Dooley <conor@kernel.org>
>=20
> >I did not provide this tag. Do not add tags that you were not explicitly
> >given by people.
> >
> >Also, you didn't actually even implement all of the things I pointed out
> >either :(
>=20
> I'm sorry. I will delete the "Reviewed-by" line. And in the patch v2, I
> changed the name as "Amma Lee" and add some comments before the
> modified code. Is there other content I need to modify?

Perhaps, I have not examined the actual implementation here.
Hopefully someone that understands the code better will do that.
I was mainly pointing out low-hanging items that our automation caught.


> >> ---
> >>  arch/riscv/kernel/module.c | 53 ++++++++++++++++++++++++++++++-------=
---------
> >>  1 file changed, 35 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> >> index 55507b0..1683c1d 100755
> >> --- a/arch/riscv/kernel/module.c
> >> +++ b/arch/riscv/kernel/module.c
> >> @@ -385,9 +385,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const c=
har *strtab,
> >>
> >>    if (type =3D=3D R_RISCV_PCREL_LO12_I || type =3D=3D R_RISCV_PCREL_L=
O12_S) {
> >>     unsigned int j;
> >> -   /*Modify the j for-loops begin number from last iterates end value=
*/
> >> +
> >> +   /*
> >> +   * In the second for-loops, each traversal for j is
> >                        ^^
> >Comment in passing here, we align the *s in comments.
>=20
> Do you mean that there is no blank in '*' and the key?

In my plaintext editor, the ^^ was aligned with the *.
Please read the kernel coding style documentation for more information:
https://www.kernel.org/doc/html/v4.10/process/coding-style.html#commenting

> >> +   * starts from 0 to the symbol table item index which
> >> +   * is detected. By the tool "readelf", we find that all
> >> +   * the symbol table items about R_RISCV_PCREL_HI20 type
> >> +   * are incrementally added in order. It means that we
> >> +   * could interate the j with the previous loop end
> >> +   * value(j_idx) as the begin number in the next loop;
> >> +   */
> >>     for (j =3D j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++)=
 {
> >> -   /* Modify end */
> >>      unsigned long hi20_loc =3D
> >>       sechdrs[sechdrs[relsec].sh_info].sh_addr
> >>       + rel[j].r_offset;
> >> @@ -420,22 +428,30 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const =
char *strtab,
> >>       break;
> >>      }
> >>     }
> >> +
> >>     if (j =3D=3D sechdrs[relsec].sh_size / sizeof(*rel)) {
> >> -    if(j_idx =3D=3D 0){
> >> +    if (j_idx =3D=3D 0) {
> >>       pr_err(
> >>        "%s: Can not find HI20 relocation information\n",
> >>        me->name);
> >>       return -EINVAL;
> >>      }
> >> -
> >> -
> >
> >^^ and this is one of the checkpatch complaints I mentioned last time,
> >no double blank lines please.
> >
> >Also, this version of the patch doesn't actually apply for me to
> >v6.4-rc1 anymore, but the file has not been modified in upstream since
> >29/01. Not too sure what you have used as the base for this as a result
> >:/
> Thanks, I will delete the double blank lines. We found and fix the issue -
> insmod drivers operation takes a lot time which contains multiple symbol
> items to be relocated in the kernel version 5.10. Then we compare the
> 6.4 new code and 5.10 kernel, find the insmod process(5.10 version in
> the kernel\module.c and arch\riscv\kernel\module.c, 6.4 version
> in the kernel\module\main.c and arch\riscv\kernel\module.c) never be
> changed. So we guess that the kernel version 6.4 has the same issue.
> May I commit the patch in 6.4 kernel?

In fact, you *must* do your development against the 6.4 version of the
kernel. If you want to fix it for 5.10, you must first either:
a) fix the problem in 6.4, or
b) show that there is not a problem in 6.4 & figure out where it was
   introduced

The stable maintainers won't take the fix for 5.10 unless it is already
in mainline or not a problem in mainline.

Also, this email was in html form. Please don't send html mail to the
mailing list. I had to jump through some hoops to be even able to reply
to it on my current setup :(

Thanks,
Conor.

--5aY+RIppu+VfpkMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGIcdQAKCRB4tDGHoIJi
0locAQChzQLnCbiH2zHWIA4DZKPquyY89jsI8Jy94+I0s5BSlgEAnHxGdyOhvOti
XNv1bsNkrklG+2x3TuvHOMq4k5FP9gE=
=awwW
-----END PGP SIGNATURE-----

--5aY+RIppu+VfpkMR--


--===============5995259993294867683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5995259993294867683==--

