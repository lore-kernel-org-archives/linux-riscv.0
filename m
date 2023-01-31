Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A5DC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 19:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJR40Tl1BUVjDcXeI7a0NfJfPGGi1AICm0mTfVhC5e0=; b=buXDwhhX4UV28Fv7tQ/xb/LwtN
	7jNY7jdpZl8ZixZV78Mo/4brFvngz+8sJTsVketwJY1d/R0c8RRzoaQTFfS2AhbFBPY4bnc5WHZZt
	yWEgTB4PI3CJE6iOBO7Cz9DneyOZri9ywq+rSGAMHRF2ysvK/V7E5a/wj7r3nzjIyKfhg8kh0vEHr
	6O3xyz8KBMkLJdSJYORCrQKevP8OtTOxSysKExAve/1Q83NszJEMrbvr2MbbXp7Q0okaIyC3HcJcU
	vIB7iq0tnIvseqa4rnA7Gwb+vN0ThHMptErWYr6HTBRG+SwU4+EAFrEC0ekwYV4KCskLBWSWwqAWp
	52ksb5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwFg-009747-VO; Tue, 31 Jan 2023 19:25:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwFa-00972Z-72
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 19:25:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD617616D5;
	Tue, 31 Jan 2023 19:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDE9C433D2;
	Tue, 31 Jan 2023 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675193099;
	bh=Usq/qChe2TB94lautIipeNYeRg/tKGhE2z4UOGHJcX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKgqHeEnxvJYKo4a0AOCwbNQJqX/0a+666YQLKyzsHnSruZvclUbmL92Lj3V8dy9y
	 wNCZN84wYg8RzExJ948+qiqzp2fAPFJzGxxDEDPpIVIGQQTPqx2KDRWWHdJr+nonDE
	 Z7QGiBEzetzq5mbRpNUVKPFGf0vnNMswwqmsufvg7bWrEpbu0Dc1CSfMuUcoBdzU4a
	 uuRBMZgshu9LNKl0mG2ozX+2gGt35kVJCrbLn70bnZl+D667D48ZuZf/fPBvCi6bb4
	 UCTr5b0c1Xq2ILDxuq6HGKPLLFSoFXf3ZPt+5Sx+0RSgK531DaRxoeeImSpSHP+wwe
	 CKRv9fnl5QppA==
Date: Tue, 31 Jan 2023 19:24:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <Y9lrB+RUBk1Njhaq@spud>
References: <20230131151115.1972740-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230131151115.1972740-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_112502_362176_0954BDA7 
X-CRM114-Status: GOOD (  21.74  )
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
Content-Type: multipart/mixed; boundary="===============6025645626767614347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6025645626767614347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="caGKd7o6+JAz/98x"
Content-Disposition: inline


--caGKd7o6+JAz/98x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Tue, Jan 31, 2023 at 04:11:14PM +0100, Alexandre Ghiti wrote:
> This new version gets rid of the limitation that prevented KASAN kernels
> to use the newly introduced parameters.

What's the base commit for this version?
Fails to apply for me on top of for-next, fixes, rc1, and linux-next :/
I also tried it on top of your KASAN series, but no luck there either!

Thanks,
Conor.

> While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> functions very early in the boot process with KASAN enabled by simply
> compiling a new version of those functions without instrumentation.
>=20
> I had to change the handling of the command line parsing to make the
> code self-contained in kernel/pi/cmd_early.c to avoid calling too many
> __pi prefixed functions from outside this file.
>=20
> I'll use this approach like arm64 to handle the extraction of the random
> seedi from the device tree for KASLR.
>=20
> @Ard: I copied the "pi" name but I have to admit I don't know what it
> means.
>=20
> Alexandre Ghiti (1):
>   riscv: Allow to downgrade paging mode from the command line
>=20
>  .../admin-guide/kernel-parameters.txt         |  5 +-
>  arch/riscv/kernel/Makefile                    |  2 +
>  arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++++
>  arch/riscv/kernel/pi/cmdline_early.c          | 52 +++++++++++++++++++
>  arch/riscv/lib/memcpy.S                       |  2 +
>  arch/riscv/lib/memmove.S                      |  2 +
>  arch/riscv/mm/init.c                          | 36 ++++++++++---
>  7 files changed, 126 insertions(+), 7 deletions(-)
>  create mode 100644 arch/riscv/kernel/pi/Makefile
>  create mode 100644 arch/riscv/kernel/pi/cmdline_early.c
>=20
> --=20
> 2.37.2
>=20

--caGKd7o6+JAz/98x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9lrBwAKCRB4tDGHoIJi
0gfGAQCENcv+3hKs/6TXI0FLA0kreZMihuI32sRzt84sGUGHIQEA/uU1ZjoXVe2E
ZyLE2YYl1Osh/cmRboDUYwy3r6oGNQE=
=/x1y
-----END PGP SIGNATURE-----

--caGKd7o6+JAz/98x--


--===============6025645626767614347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6025645626767614347==--

