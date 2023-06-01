Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152F6C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzcTx/AFDY8g1OP2W4aCQUfAejO/OTsljDVag5pidyI=; b=tYm3x5HQidnxQOp7oGi8UzE6Cw
	7L3XQGypc29vpAwXiYCiTJEWN69yBNp5mUxXc1Fr712gd9jIPZXAh3/p2C3+mWSRKL3IKg+0DFLd7
	LSn6yjYR9BWe0xxfMBn2ropxubSgQTFPCXgzr3hK+E2rlt5mpoalctYNHd2lSK8HdPXzqHW+gjhV6
	Z+EjBGCrbRxok7wZz1JXVT8jytVPK24Y6ykW4rgznLoHnVvdMG9mHCui/DR3ulPKB71NFXi61T2kM
	tA8f9uVCPCsdoOZvDh2lpPepUQsRTvsliUJSnMRmFCjKI8mdBFTAOqpqMIBEPmw+7BAP4AU6JoOVi
	FY+ipQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4mBx-004Qtz-2U;
	Thu, 01 Jun 2023 17:34:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4mBv-004Qsr-3A
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 17:34:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0F9261089;
	Thu,  1 Jun 2023 17:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F8DC433EF;
	Thu,  1 Jun 2023 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685640866;
	bh=NLd5rE4WJi/QMXLKsa2Ce3607NEbnjCF2lgw/E4Ilrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFNBX6d5uMMdF/EJtBaNz9XDKPIY4Hwf+NtRvr23KUZW0AdM3dBhxs2js0P6gFgTr
	 vKXeLsDOhpOGQFEYDpC7pO0IEFblRaIQDP4dbvtf6sfeohyVa4pbAetThmI+nHtm4z
	 Ghim2VhR6ACJeiPRPhvq9oapSHjPY2wOdhWFdkWqAXsyAABO/aKLIRvdAsI+htOO9K
	 sRQG4DD0WUoXEpTDnNDKUJdhurHWQ4jBkqKV/4usG4gM9QYseaDetzDGKGcegNtLa1
	 4R2l6IvsTu1IiRgYHMJ49HvsAbMmWq3PvTngIZ4rjvg7MvPLYKGGw/BHyB/OnbMP4P
	 lgxohBw8vW3kA==
Date: Thu, 1 Jun 2023 18:34:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Joan Bruguera =?iso-8859-1?Q?Mic=F3?= <joanbrugueram@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alyssa Ross <hi@alyssa.is>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] riscv/purgatory: Do not use fortified string functions
Message-ID: <20230601-connected-unbolted-cf708c6da4a1@spud>
References: <20230601160025.gonna.868-kees@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230601160025.gonna.868-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_103428_065468_C0EF9EAB 
X-CRM114-Status: GOOD (  14.35  )
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
Content-Type: multipart/mixed; boundary="===============5993048293433487288=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5993048293433487288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gTf3B7hbVc2YnwMI"
Content-Disposition: inline


--gTf3B7hbVc2YnwMI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 09:00:28AM -0700, Kees Cook wrote:
> With the addition of -fstrict-flex-arrays=3D3, struct sha256_state's
> trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
>=20
> struct sha256_state {
>         u32 state[SHA256_DIGEST_SIZE / 4];
>         u64 count;
>         u8 buf[SHA256_BLOCK_SIZE];
> };
>=20
> This means that the memcpy() calls with "buf" as a destination in
> sha256.c's code will attempt to perform run-time bounds checking, which
> could lead to calling missing functions, specifically a potential
> WARN_ONCE, which isn't callable from purgatory.
>=20
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/lkml/175578ec-9dec-7a9c-8d3a-43f24ff86b92=
@leemhuis.info/
> Bisected-by: "Joan Bruguera Mic=F3" <joanbrugueram@gmail.com>
> Fixes: df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3D3")
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the quick update Kees,
Conor.

--gTf3B7hbVc2YnwMI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHjWiwAKCRB4tDGHoIJi
0kIWAP4veZuc8tWugVZu2IOiEMZz7rzMOFo6ZJkp3tl6YRkuVAEA632MtlL3l8y6
KzIVgnx4OmDbCYnaIi/5WDzQtqJwOQ8=
=YraL
-----END PGP SIGNATURE-----

--gTf3B7hbVc2YnwMI--


--===============5993048293433487288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5993048293433487288==--

