Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3431C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 23:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txfXI0OhkD8VX+s5rpteIMuGhGyVUyW5FQEFbymDKMs=; b=wxefIliXyYmOArk/4yf+Syd2GJ
	b8Ahy/0fagx4AkZSYFPOGwLA2IwQT4ZucEMGPJq3u28wVMgpfPc4etECFvifrK+5sJFnKDO8xcVev
	jGYlQMqpvbSUfj4VXQuSPCqRGCQK7ebZdI2tIavp7TUG8uQ3rkmxH0+SGAaN4o5SK1s18P9ftnPjG
	bM0pEWJ2CbNdnbr6+HMjia1T22WnQSyomkyOqT7H9qBw7GA3552iEreNd5TPRBifRiPbQnktp49Of
	k2zTENRbrI7ezyyvk7RjQafJe6TG9rTfGYIxX58JUQ7NEVMy6N2bi3qQJzLCxoXeVbpeE5zHb31PY
	1SZ3UyFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ydv-00BiJH-6J; Sun, 04 Dec 2022 23:43:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ydr-00BiII-Om
	for linux-riscv@lists.infradead.org; Sun, 04 Dec 2022 23:43:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 166BE60F22;
	Sun,  4 Dec 2022 23:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4E2C433C1;
	Sun,  4 Dec 2022 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670197406;
	bh=e8lcvA/l7oxDnrim3J5FGBNlXm6BJxcdxOGUGtxs6+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzhgCtQPYszq1w125z1UuCDvOvAaI/DZAp+ydf+2a2ZhS+5njBm3EJ40EyaraVgY4
	 FS6M8OCGVoWwQiRzL/wkWAubs23LTYT5NGheUfXIU7QBME0OAwnW3f55F3JAw0jhHX
	 sLGcXhMDXMOovYY7W871stR8jdxcBrZ8G1q60YQK7cZ0mOdi58wUN5VTsnn6+7tl74
	 fezsGN1ULo8XVnpdZBKX1q3JQtkAvZB+UBynXHSmDdXg529bLYMxgPBDk19Y17yyiY
	 n1I0FzsmEs1FnWoDuQew9jlMO+jiIcaVluyWZ1EUN2icS6OCiMzOS1K3LGGnuHmQ8i
	 BnwXlsvGTtqGw==
Date: Sun, 4 Dec 2022 23:43:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [PATCH RFC v2 1/3] riscv: add support for hardware
 breakpoints/watchpoints
Message-ID: <Y40wmUcqMQWQLBsI@spud>
References: <20221203215535.208948-1-geomatsi@gmail.com>
 <20221203215535.208948-2-geomatsi@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221203215535.208948-2-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_154327_866583_0513784B 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: multipart/mixed; boundary="===============4508879659887632717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4508879659887632717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uMjV2SnuoiE65GZo"
Content-Disposition: inline


--uMjV2SnuoiE65GZo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 04, 2022 at 12:55:33AM +0300, Sergey Matyukevich wrote:
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>=20
> RISC-V backend for hw-breakpoint framework is built on top of SBI Debug
> Trigger extension. Architecture specific hooks are implemented as kernel
> wrappers around ecalls to SBI functions. This patch implements only a
> minimal set of hooks required to support user-space debug via ptrace.
>=20
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 2a0ef738695e..ef41d60a5ed3 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -31,6 +31,9 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST =3D 0x53525354,
>  	SBI_EXT_PMU =3D 0x504D55,
> =20
> +	/* Experimental: Debug Trigger Extension */
> +	SBI_EXT_DBTR =3D 0x44425452,
> +
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START =3D 0x08000000,
>  	SBI_EXT_EXPERIMENTAL_END =3D 0x08FFFFFF,

This is an RFC for something I know nothing about, so was just scrolling
mindlessly... This caught my eye as odd - There's an explicit comment
about the range for experimental stuff but you've not used it? I guess
there must be some reason for that?

Confused,
Conor.


--uMjV2SnuoiE65GZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY40wmQAKCRB4tDGHoIJi
0p/FAP46KqMJj6R9BTzZwIRwNPeVc8agmyBqGWfMHkYoVNXm5QD/TwUq0t9YfU4I
r1JI/fZrDBXWkqJ8n2xUAnTvN/DgVg0=
=wQBm
-----END PGP SIGNATURE-----

--uMjV2SnuoiE65GZo--


--===============4508879659887632717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4508879659887632717==--

