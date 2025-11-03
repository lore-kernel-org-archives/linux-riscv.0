Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E30CCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuiEq8BfL/so/T/2PEsY0h0010TI5pWb7aNJ0H/i6uo=; b=qZYNtrliro9zS/zCcxnnUIiqY4
	PVeQcufngIKjmWO3y0//VVFibiUVl6lcuHeVjXKrHjjD9ewl6eJ05wCzqOeBz0wmpu+doxLUZfUbj
	Ca4Ipchb00h/jGqSf1GW8r3plCjqoqkmVjlqRlDKN94AdALdutbtbN3QqUr9jvey7kAyzQaEXo4z4
	SXv0/HCiXABzuphxxtJAcgSY8tixQbhQDD0dLbDKWxrY7sqmSxCD2ZDn3sFtRllBJMlCQGiOLzM+8
	KnFEOxq4EhHR3utDPfqDq1ARU30QPpeHG1aCyL8icWfF5viPTyg7fxm6WISck4ke9grm1C/8OBvA4
	RcAgNXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2iT-0000000Agz9-2dSD;
	Mon, 03 Nov 2025 22:07:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2iS-0000000Agz3-05XY
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 22:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11B14601D9;
	Mon,  3 Nov 2025 22:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E24C116B1;
	Mon,  3 Nov 2025 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762207674;
	bh=2DR7h+1jxsdywkQTNzsrebtck92hsKLGJI+1GUT8xto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/UxAeHxkkfLb4MJdoxgpKHvncKyituzo9p2J2gz5bGXH2TuiKOkibybomTU0KeAc
	 Lca624f3aSpgMgFq1LfaJZTthMyQilJAh7QJO1yLKL5Yqv0Ndt4UUa8xOkWWqJZdUr
	 m+1jlvywuk/r+m3y7J1CMUVDVQtQuyZE5caTXekv1F+5IsUu+jjZ32G3DWochqPtdH
	 BKjvZSZZPguS+vdaB9VR9NoPMI0wJjDlDx3AmNoe+6CMCh5D/lVpHtLvCmpAiUQ7zF
	 nPzPArA67JVSm0UadefMUjxhIrXSVn03zbfnjdiGXNJPl0A5cgEV42a0Uf4UQtybBR
	 f2PY9UNgTujfQ==
Date: Mon, 3 Nov 2025 22:07:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chao-ying Fu <cfu@wavecomp.com>
Subject: Re: [PATCH] riscv: Update MIPS vendor id to 0x127.
Message-ID: <20251103-tabby-laurel-bc895f236a69@spud>
References: <20251103-mips-vendorid-v1-1-4fcb5f4d53fe@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20251103-mips-vendorid-v1-1-4fcb5f4d53fe@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============8498859449688267940=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8498859449688267940==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XT64vcUASahEeAk1"
Content-Disposition: inline


--XT64vcUASahEeAk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 04:05:48PM +0100, Aleksa Paunovic wrote:
> From: Chao-ying Fu <cfu@wavecomp.com>
>=20
> [1] defines MIPS vendor id as 0x127.
>=20
> [1] https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Referen=
ce_Manual_Rev1.84_5-31-2025.pdf
>=20
> Fixes: a8fed1bc03ace27902338e4f0d318335883ac847 ("riscv: Add xmipsexectl =
as a vendor extension")

Incorrect format for fixes tags!

> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  arch/riscv/include/asm/vendorid_list.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index 3b09874d7a6dfb8f8aa45b0be41c20711d539e78..55205f7938055ba2b744dba51=
18bba935bcac008 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -9,6 +9,6 @@
>  #define MICROCHIP_VENDOR_ID	0x029
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> -#define MIPS_VENDOR_ID		0x722
> +#define MIPS_VENDOR_ID		0x127

How was this ever wrong? Do devices exist with this old ID? Do we need
to support both as vendor IDs for MIPS?
Also, this was added in the wrong point in the list (it's meant to be
alphanumeric order IIRC). Sorting by the ID makes things annoying to
humans to read.

> =20
>  #endif
>=20
> ---
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> change-id: 20251031-mips-vendorid-df103aedf117
>=20
> Best regards,
> --=20
> Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20

--XT64vcUASahEeAk1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQknsgAKCRB4tDGHoIJi
0grwAP9hSkh4d4dpb6ujhlwQh+NgR7Y8Z+xjcqBOtioVXX3Q7AEAsWp8nvW8ztsF
WthfV4obgjRQtHadgx5MjdfnkxWLtw8=
=dMyF
-----END PGP SIGNATURE-----

--XT64vcUASahEeAk1--


--===============8498859449688267940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8498859449688267940==--

