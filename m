Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C84C47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52pwockKXc1/5JFVdVxld7FJEmvQguu2CGrb0pdXvDI=; b=CAxnUswOEkieLw9uWWkvV7PwFI
	0nzoWrW0K6paZdIOpR8AswLiwYPwgMlbqevrEpfJ+QmJXyGXungib/U9zwrBSHo93mQK0H5X6TVWg
	hrf2+H/yQxz2vU22cNsj62sADzVOTC7BaSvroFeyXRpkvUw7Tuez2LjQzzIdlti5KrrBvylmSYsm6
	b3/URLD05Bx95k/9eZvNYc/d/NGBynYfjoaFPXfl6phzgQ0IiRjRY/ennnPHzcF5q/tHy1kJx6y3t
	apZ2qF+SQDnTGaTHxdM2b76O4smiuq6M2U9LRHyAbkhAMFsWWSmdONu7I0LJYI+S/qXT7y1qs30dX
	8ktnEJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HHw-009Qw3-Ki; Mon, 05 Dec 2022 19:38:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HHt-009Qnd-0j; Mon, 05 Dec 2022 19:38:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AFC88B811E3;
	Mon,  5 Dec 2022 19:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6CDC433D7;
	Mon,  5 Dec 2022 19:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670269078;
	bh=wSny7RERsEy+UvZ++K0y8YLBWfl7nMC8O5faKH/dK5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlXA9gT0eqmwlqDoytEbsI9VfOu37m0BZQsf89RKkm4L/X+6Mnsz9vTR0N91jBoLc
	 B3DeAOTuf5KRNarPtvhR7zFXHXsTOLczZljfJPdvFNDzwpxt1xTWBCqQWzxwo09uO2
	 7iHqvay3TvlmYZgAFzglrP6YsOUW+2ZPP2vpQwaX2tnP66jfa2qMavGglFit/xrTMi
	 Uw5Rf76NVuEjBVIPMymjBj1ZfxdXgF80x2TvkAsBmGw0lM3ZDigbbouaIn/6jVH5Sj
	 6I5KCZAKJxfkgq0IPTqM+DLbwatH8e9d0dbd1T/Y37rEy02/PX//xw7H9Q6At/IjHe
	 goPrJDaa2kJGw==
Date: Mon, 5 Dec 2022 19:37:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <Y45IkVXYshIciACY@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-6-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_113801_458211_17C1F438 
X-CRM114-Status: GOOD (  17.62  )
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
Content-Type: multipart/mixed; boundary="===============8581399205890678856=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8581399205890678856==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BmYcKwzzQlEdZjdk"
Content-Disposition: inline


--BmYcKwzzQlEdZjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 01:46:24AM +0800, Jisheng Zhang wrote:
> make the riscv_cpufeature_patch_func() scan all ISA extensions rather
> than limited feature macros.

Certainly looks like a nice cleanup. Perhaps for the changelog,
something along the lines of:

"riscv_cpufeature_patch_func() currently only scans a limited set of
cpufeatures, explicitly defined with macros. Extend it to probe for all
ISA extensions"

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/errata_list.h |  9 ++--
>  arch/riscv/kernel/cpufeature.c       | 73 +++++-----------------------
>  2 files changed, 15 insertions(+), 67 deletions(-)

> @@ -311,25 +264,23 @@ void __init_or_module riscv_cpufeature_patch_func(s=
truct alt_entry *begin,
>  	for (alt =3D begin; alt < end; alt++) {
>  		if (alt->vendor_id !=3D 0)
>  			continue;
> -		if (alt->errata_id >=3D CPUFEATURE_NUMBER) {
> -			WARN(1, "This feature id:%d is not in kernel cpufeature list",
> +		if (alt->errata_id >=3D RISCV_ISA_EXT_MAX) {
> +			WARN(1, "This extension id:%d is not in ISA extension list",
>  				alt->errata_id);
>  			continue;
>  		}
> =20
> -		tmp =3D (1U << alt->errata_id);
> -		if (cpu_req_feature & tmp) {
> -			/* do the basic patching */
> -			patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> -					  alt->alt_len);
> +		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
> +			continue;
> =20
> -			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> -							 alt->alt_len,
> -							 alt->old_ptr - alt->alt_ptr);
> -			riscv_alternative_fix_jal(alt->old_ptr,
> -						  alt->alt_len,
> -						  alt->old_ptr - alt->alt_ptr);
> -		}
> +		/* do the basic patching */
> +		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +		riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> +						 alt->alt_len,
> +						 alt->old_ptr - alt->alt_ptr);
> +		riscv_alternative_fix_jal(alt->old_ptr,
> +					  alt->alt_len,
> +					  alt->old_ptr - alt->alt_ptr);

nit:
Now that you've dropped a level of indent, can alt->alt_len move up a
line?

Thanks,
Conor.


--BmYcKwzzQlEdZjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY45IkQAKCRB4tDGHoIJi
0hVgAP0f7h5X+BsSkUkvJUlU5ALjV6I0EekLwH8GeuYfU1EEzQEA9g48tJXXGwRo
Wncokwq3bL0VVPX5RDCVCBtQ7BgoPws=
=GI0I
-----END PGP SIGNATURE-----

--BmYcKwzzQlEdZjdk--


--===============8581399205890678856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8581399205890678856==--

