Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3CDC63797
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSoDDxVJ/WU7bVvM0Onk3qQ/Lo1d85GPfl6rcwUr8Ho=; b=Z7JNuqFR4Sk0tBv00mHuue0kLW
	E7eh0IQNvPsPS77VLRYrc8tfs7Zi5XU95V7qQwaBRvTClyiB7cLAiyLNFFWmfxh5x+1PiDgOzmKCj
	P2WMPiydxUby8EXod6BMLCgRGsSMFh395PyGwmYoGp4QKOq4GD05t1FHKrJV7TkL6qBV/T7auF6rL
	14d+VZ95imZb+epoNTmdY91Y9Fl0nwilLUmJ+RVBXIL4VeKxWnPJ4UCBox0gCyaXQs8yuwh0cq0vU
	CTzraUOgvdnzCkTC3IfzgRXvqkmd+0D3EOxQ92qeM2sjM3yrXN/mJaTJtJpsOq4wzW06fdH1a0rZd
	lI/ya4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5S4-00HBlr-0K; Thu, 12 Jan 2023 21:49:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5S0-00HBlQ-K1; Thu, 12 Jan 2023 21:49:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF9C86218E;
	Thu, 12 Jan 2023 21:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A29CC433D2;
	Thu, 12 Jan 2023 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673560171;
	bh=FyGX2N8aLoabTK610ZZd/vvyeem2o/slSLIb7/XhtWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtSPrpnYWWixDYtTIsuM/ysEZQxEU51r/TwZkJV3ZhIeHXyh44gSWFXRI3SitsRbs
	 URnUgfWRkOaZR6hi2epr8XdXnrK+I52tuFErEcqLFbGAj5NgFSuJuA0AOlRHI+R0ZC
	 Ug13EEevVWaXyjx/9aBHNqflPjwYjoKwynwsZ90nxz8jKHT06t6JrcOvAQZFF9xrtC
	 vgwTcadoFKxbmrjzCn0nNz9TFRid4fM8bnvJkzZsa2dWk9+5T6URKUME7LZbieBdjl
	 x8DsJfhrcsh8QCZvHPP97dzdC8dsHT9Hapf4m1nnblrO0ehkyJpiPF7lxAKRQEZGqI
	 WoCgA56GmRTAg==
Date: Thu, 12 Jan 2023 21:49:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 09/13] riscv: switch to relative alternative entries
Message-ID: <Y8CAZiEnhiMmuiDK@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-10-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230111171027.2392-10-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_134932_766685_5F212F27 
X-CRM114-Status: GOOD (  25.93  )
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
Content-Type: multipart/mixed; boundary="===============7984812174388176877=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7984812174388176877==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KBYdV67AIH88VZb7"
Content-Disposition: inline


--KBYdV67AIH88VZb7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Thu, Jan 12, 2023 at 01:10:23AM +0800, Jisheng Zhang wrote:
> Instead of using absolute addresses for both the old instrucions and
> the alternative instructions, use offsets relative to the alt_entry
> values. So this not only cuts the size of the alternative entry, but
> also meets the prerequisite for patching alternatives in the vDSO,
> since absolute alternative entries are subject to dynamic relocation,
> which is incompatible with the vDSO building.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/errata/sifive/errata.c           |  4 +++-
>  arch/riscv/errata/thead/errata.c            | 11 ++++++++---
>  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
>  arch/riscv/include/asm/alternative.h        | 12 ++++++------
>  arch/riscv/kernel/cpufeature.c              |  8 +++++---
>  5 files changed, 32 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive=
/errata.c
> index 1031038423e7..0e537cdfd324 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_func(struct=
 alt_entry *begin,
> =20
>  		tmp =3D (1U << alt->errata_id);
>  		if (cpu_req_errata & tmp) {
> -			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +			patch_text_nosync((void *)&alt->old_offset + alt->old_offset,
> +					  (void *)&alt->alt_offset + alt->alt_offset,
> +					  alt->alt_len);

I left a comment on v2 that went unanswered:
https://lore.kernel.org/all/Y4+3nJ53nvmmc8+z@spud/

The TL;DR is that I would like you to create a macro for this so that
this messy operation is done in a central location, with a nice comment
explaining the offsets. If my "analysis" there was correct, feel free to
use it as a starting point for said comment.

The macro would then reduce the above to something like:
patch_text_nosync(ALT_OFFSET_ADDRESS(alt->old_offset),
		  ALT_OFFSET_ADDRESS(alt->alt_offset),
		  alt->alt_len);

Which I think is easier to understand since this "concept" will show up
in several places & is less intuitive than what we currently have.
Nothing beats having this stuff well explained in the codebase IMO.

> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 1bd4027d34ca..b6050a235f50 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -31,12 +31,12 @@ void riscv_alternative_fix_offsets(void *alt_ptr, uns=
igned int len,
>  				   int patch_offset);
> =20
>  struct alt_entry {
> -	void *old_ptr;		 /* address of original instruciton or data  */
> -	void *alt_ptr;		 /* address of replacement instruction or data */
> -	unsigned long vendor_id; /* cpu vendor id */
> -	unsigned long alt_len;   /* The replacement size */
> -	unsigned int errata_id;  /* The errata id */
> -} __packed;
> +	s32 old_offset;		/* offset relative to original instruciton or data  */
> +	s32 alt_offset;		/* offset relative to replacement instruction or data =
*/

This wording is better, but you should fix the "instruciton" typo while
you are in the area.

> +	u16 vendor_id;		/* cpu vendor id */
> +	u16 alt_len;		/* The replacement size */
> +	u32 errata_id;		/* The errata id */
> +};

Thanks,
Conor.


--KBYdV67AIH88VZb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8CAZgAKCRB4tDGHoIJi
0shtAP9YcW0IezycxZIeGPU2tI7zgPrK7D5cL+jPTDAw3FrW1gD/T/HO7bWcWRuk
60IRzPs4I2pBqCYKCgvADxQUJBaheAY=
=pQ/k
-----END PGP SIGNATURE-----

--KBYdV67AIH88VZb7--


--===============7984812174388176877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7984812174388176877==--

