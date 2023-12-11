Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145D9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 22:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdhspIdQoHpU0QZjSd55zJDz6rZTlWe9kb3VXATwFWE=; b=1NxTvo7SBxdjQiuSDliFrg48Ye
	w25AhguLRr8rMLkgdFrf4Je87QzKM/zeQRXxzGBYSwtgWEdoDNoG7IYVIY/afJn3Ku4O6QDrwmwUz
	983s8qmfyhQTYuATN5onlwT+SkKDhy/gOiJnM1v8MAje2DCFoh0bJ9Nb+kULxEzmRAQWQskGBQKW1
	JpW6H6YdH2gjMYLm6obxb0Y7hB+ZB3fydwwA5QziqXi3KLURnLJjDdGao6gXpGxyP9+mNeWGDGzsV
	C8ub//mupcEA6JoWF1ie6rwWyqJVL8tgCM7N0bwh0I+bL5olZwbBPWizIImZIPV19Y0yQxw+dSwJa
	alueN8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCp7J-009Mcf-25;
	Mon, 11 Dec 2023 22:51:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCp7G-009MaA-1v
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 22:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C75E8CE1323;
	Mon, 11 Dec 2023 22:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8466DC433C8;
	Mon, 11 Dec 2023 22:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702335068;
	bh=1CCbYByQIoadE0Uqf+KApKn4LZFBzrE7oNUkmsRIU6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKyFYFp7TmGl8P5u1cOH6e1xl0twZ/fGEwcbqiBlg+eu26ORfM8M5fUCw1B3zVKbC
	 BibBHwVGke8ZxpIUuqtOU/hv5CiZ98o9L9un7oxm3l+k3SKDzspADXq3SKuiRIdciu
	 6iNKRQLi2yJxAsz0sLVFQHrKizQIvEclvjfJEq+ZYZvMi6adbQ3Hb8VBhBOIOX71Gj
	 wscoNoMiOTxH6qQ3kFcoulQj6Rso+RzvT792sjeFp/Dv0l3H+rpKX3fncXEM0WkL8r
	 umtVd2NfTO/NF8SYYGXon7pb3b93iTUWK2QW7IcP3lIOAyg0ey+aLLqgpJwTVC+Qec
	 u/l3UbwNUFUvw==
Date: Mon, 11 Dec 2023 22:51:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Subject: Re: [PATCH -fixes] riscv: Fix wrong usage of lm_alias() when
 splitting a huge linear mapping
Message-ID: <20231211-deviancy-uncooked-6a24328f6200@spud>
References: <20231211141929.74027-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231211141929.74027-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_145110_811320_B74D9891 
X-CRM114-Status: GOOD (  19.46  )
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
Content-Type: multipart/mixed; boundary="===============6726365308471861829=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6726365308471861829==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3GQRIqzq/daVXmBi"
Content-Disposition: inline


--3GQRIqzq/daVXmBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 03:19:29PM +0100, Alexandre Ghiti wrote:
> lm_alias() can only be used on kernel mappings since it explicitly uses
> __pa_symbol(), so simply fix this by checking where the address belongs
> to before.
>=20
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() =
by splitting huge linear mappings")
> Reported-by: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-riscv/000000000000620dd0060c02c5e1@=
google.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

=2E./arch/riscv/mm/pageattr.c:311:14: warning: variable 'ret' is used unini=
tialized whenever '&&' condition is false [-Wsometimes-uninitialized]

> ---
>  arch/riscv/mm/pageattr.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index fc5fc4f785c4..f5f8aa1d38d6 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -304,9 +304,16 @@ static int __set_memory(unsigned long addr, int nump=
ages, pgprot_t set_mask,
>  			if (ret)
>  				goto unlock;
>  		}
> -	} else if (is_kernel_mapping(start) || is_linear_mapping(start)) {
> -		lm_start =3D (unsigned long)lm_alias(start);
> -		lm_end =3D (unsigned long)lm_alias(end);
> +	} else {
> +		if (is_kernel_mapping(start)) {
> +			lm_start =3D (unsigned long)lm_alias(start);
> +			lm_end =3D (unsigned long)lm_alias(end);
> +		} else if (is_linear_mapping(start)) {
> +			lm_start =3D start;
> +			lm_end =3D end;
> +		} else {
> +			goto unlock;
> +		}
> =20
>  		ret =3D split_linear_mapping(lm_start, lm_end);
>  		if (ret)
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--3GQRIqzq/daVXmBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXeSWAAKCRB4tDGHoIJi
0sVlAP0T5/oaW6j/LkQ397MBYUvh8Eco7FXATW3thQaTZIN6qgD/XGQBW9AY5sDC
2YwV/oLkT6RTgaar8D58YdjsAjmF+g0=
=g9/e
-----END PGP SIGNATURE-----

--3GQRIqzq/daVXmBi--


--===============6726365308471861829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6726365308471861829==--

