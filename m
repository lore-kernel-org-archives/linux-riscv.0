Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F49C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQGcReb9UpntQ/GJktdyHIM8YbEuf1VLVuEQ15wwVkk=; b=OHWfs/s1pIsb3dM9+7cL43BBwr
	2hNs47SVYX+vc3e7dJ2ki2996hy/DVxkVF62R2Igq2kgxrUkd8AFuFiW1yqYbGGL4yY6F+0HieybT
	SDkPTT9ZGQQysOVwNN9GEwymSE+SxsDfCyllDNJyJiLO9ie5+o/zbMlTtAqDtBB8eikpd4GDw7oJo
	0EkwkQ6Ms1S36P8Uk+pLby3O2CecX7bJCzBobOTv8Tdq5J9DzgO95dvwS/YPoHh/f6fITSmxRThgH
	eAHLv+TaYTWaWCwIJANbWqsMRgGNgztrufZQOuYtViQHgoP27e4yjrQNE2HbF28qEwzAPqBstsvyb
	sYSQ0hIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPov-00BZhG-1y;
	Fri, 12 May 2023 10:16:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOgm-00BPaS-01
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683882227; x=1715418227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcHYREBwGpJMPtTyUBAT9YdL1pOBPSeKhPfj/sCyYOY=;
  b=Rq5nxmQnleBqMvLK+Pon7vERMZp6KI+yTRmr4VUWjNmbt6NPJCL1NQT3
   7CVzQ6+V8WQE/drsTFV65a08xQhO2SllBhvZxziZZzmutznylmFTHHbaY
   X5G27gJZ3dKYeLG8AQ2/BXIJNmAV6ZDBraMHclv3tkbZJS4xG/X0P2Bnz
   PaQgSUbRGAn/27iRi8hYvWdecrZy7cf6fURhEC4QUcPQn7ZS3SznAzCHX
   oCiMVafpMDos+/0lpKCgQzvAPuyJnJh7wLm6q3CLqVyWlsatMgYSqBrs/
   8VIbFSec72wprKoAJGdzx74+JtD0mp3+w1cken7npBOMOCzpqW4UCG6/n
   A==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="213025948"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 02:03:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 02:03:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 02:03:39 -0700
Date: Fri, 12 May 2023 10:03:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Amma Lee <lixiaoyun@binary-semi.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <xiezx@binary-semi.com>
Subject: Re: [PATCH v2] riscv: optimize ELF relocation function in riscv
Message-ID: <20230512-morbidly-supremacy-9cdb519107d1@wendy>
References: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
MIME-Version: 1.0
In-Reply-To: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_020348_177487_F6A73A22 
X-CRM114-Status: GOOD (  28.84  )
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
Content-Type: multipart/mixed; boundary="===============7157654945115428386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7157654945115428386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tP+IIUGPs57ZcuZy"
Content-Disposition: inline

--tP+IIUGPs57ZcuZy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Amma,

On Fri, May 12, 2023 at 04:51:53PM +0800, Amma Lee wrote:
> The patch can optimize the running times of "insmod" command by modify ELF
> relocation function.
> When install the riscv ELF driver which contains multiple
> symbol table items to be relocated, kernel takes a lot of time to
> execute the relocation. For example, we install a 3+MB driver need 180+s.
> We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
> items relocation function and find that there are two for-loops in this
> function. If we modify the begin number in the second for-loops iteration,
> we could save significant time for installation. We install the 3+MB
> driver could just need 2s.
>=20
> Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>

> Reviewed-by: Conor Dooley <conor@kernel.org>

I did not provide this tag. Do not add tags that you were not explicitly
given by people.

Also, you didn't actually even implement all of the things I pointed out
either :(

>=20
> ---
>  arch/riscv/kernel/module.c | 53 ++++++++++++++++++++++++++++++----------=
------
>  1 file changed, 35 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 55507b0..1683c1d 100755
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -385,9 +385,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char=
 *strtab,
> =20
>  		if (type =3D=3D R_RISCV_PCREL_LO12_I || type =3D=3D R_RISCV_PCREL_LO12=
_S) {
>  			unsigned int j;
> -			/*Modify the j for-loops begin number from last iterates end value*/
> +
> +			/*
> +			* In the second for-loops, each traversal for j is
                        ^^
Comment in passing here, we align the *s in comments.

> +			* starts from 0 to the symbol table item index which
> +			* is detected. By the tool "readelf", we find that all
> +			* the symbol table items about R_RISCV_PCREL_HI20 type
> +			* are incrementally added in order. It means that we
> +			* could interate the j with the previous loop end
> +			* value(j_idx) as the begin number in the next loop;
> +			*/
>  			for (j =3D j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
> -			/* Modify end */
>  				unsigned long hi20_loc =3D
>  					sechdrs[sechdrs[relsec].sh_info].sh_addr
>  					+ rel[j].r_offset;
> @@ -420,22 +428,30 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const cha=
r *strtab,
>  					break;
>  				}
>  			}
> +
>  			if (j =3D=3D sechdrs[relsec].sh_size / sizeof(*rel)) {
> -				if(j_idx =3D=3D 0){
> +				if (j_idx =3D=3D 0) {
>  					pr_err(
>  						"%s: Can not find HI20 relocation information\n",
>  						me->name);
>  					return -EINVAL;
>  				}
> -			=09
> -			=09

^^ and this is one of the checkpatch complaints I mentioned last time,
no double blank lines please.

Also, this version of the patch doesn't actually apply for me to
v6.4-rc1 anymore, but the file has not been modified in upstream since
29/01. Not too sure what you have used as the base for this as a result
:/

Thanks,
Conor.

--tP+IIUGPs57ZcuZy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF4A1wAKCRB4tDGHoIJi
0irwAQDXn6gMCQZLdhE/PL1bweyYVfuZ433ld7TQDL6lYx5XeQD7BTqZMSx7jAAJ
eSUcHx80p8CbMfxrXNZntncAdOt85QE=
=wlVR
-----END PGP SIGNATURE-----

--tP+IIUGPs57ZcuZy--


--===============7157654945115428386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7157654945115428386==--

