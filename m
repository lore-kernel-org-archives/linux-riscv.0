Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07750E77362
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOTVwV3P4S3gC6H+7HJBuLlKMT1AxLDtNT7rVX98T7c=; b=HXD8ubTV+IGPF212ti4K+H6/DF
	YzFq47ebn8dH0LXb0g9Gb+UMbjvtjGe4iWYxVD5TgWac3R2SZmLluGtShF7qvK5rlGam0MhVQ+46H
	g1AGeqeK0biw9FO9Drf6JAdPlCcAWOyyH3PZGRDWXg/k6fzPZYbO1fCdRylNtvQQ7gqeGHt0zSZ7z
	ghWtKA2DrNO9PCz6xCmSr1xBnTrXGrEPIlnJzl23/5Cb9NkzYcS0zVFn6vEUZXMF+wpChz1uRrrQz
	h1SnywgWQ0G5nt6WZTgQ6VaeS+S8avddZPaOa7JhA4y45dnqWMv6g1Adu/xETQB2UCApc3VQU+PXd
	rdO4YwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmWCs-009Ef0-32;
	Sat, 30 Sep 2023 09:24:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmWCq-009EeY-0P
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 09:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF699CE24D3;
	Sat, 30 Sep 2023 09:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFBBC433C7;
	Sat, 30 Sep 2023 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696065843;
	bh=kDNia0WmJ1Icu03VHc1VXn0QbQl9HCIniijZGfUBKUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P58ubrG8nh4/GOZLvc6HMcH8CTfrM2pxRvOY+nOhDCYrFmFFi5eU9rGaBrX6pC8IN
	 tiky509onDqrpoR1kbEWD4hJvHlH5fH1BSC5YYngCwEh9KNO22RHDEkw41q0GR4DxO
	 LiS7DshG2o6PcDxGYd6U8SssEIUfHD9JvJuodwxYnOgshHxk3DZ0B4nL/mXCgojyZo
	 nWH/+ZNpbwRBiGZXG2+LXyOTYOapZMe0tV0jF5M/49wG8Hw8inBr08O4fBrCGo0Mvd
	 e741caPlxL6CWf3Oh/q7WFLk3cYKLxQCbkYpCA/QuBtNdR6ISuGChqbkE7GvHNm4ih
	 fRKSJhV0YVhoA==
Date: Sat, 30 Sep 2023 10:23:58 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Topel <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Message-ID: <20230930-patchy-curdle-ef5ee6e1a17c@spud>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_022412_552327_A4CF8E3F 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Type: multipart/mixed; boundary="===============0820825789487506799=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0820825789487506799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PInAC6LI+1uRW4CY"
Content-Disposition: inline


--PInAC6LI+1uRW4CY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 05:03:09PM +0200, Cl=E9ment L=E9ger wrote:
> Since commit 61cadb9 ("Provide new description of misaligned load/store
> behavior compatible with privileged architecture.") in the RISC-V ISA
> manual, it is stated that misaligned load/store might not be supported.
> However, the RISC-V kernel uABI describes that misaligned accesses are
> supported. In order to support that, this series adds support for S-mode
> handling of misaligned accesses as well support for prctl(PR_UNALIGN).
>=20
> Handling misaligned access in kernel allows for a finer grain control
> of the misaligned accesses behavior, and thanks to the prctl call, can
> allow disabling misaligned access emulation to generate SIGBUS. User
> space can then optimize its software by removing such access based on
> SIGBUS generation.
>=20
> Currently, this series is useful for people that uses a SBI that does
> not handled misaligned traps. In a near future, this series will make
> use a SBI extension [1] allowing to request delegation of the
> misaligned load/store traps to the S-mode software. This extension has
> been submitted for review to the riscv tech-prs group. An OpenSBI
> implementation for this spec is available at [2].
>=20
> This series can be tested using the spike simulator [3] and an openSBI
> version [4] which allows to always delegate misaligned load/store to
> S-mode.

Some patches in this series do not build for any configs, some are
broken for clang builds and others are broken for nommu. Please try to
build test this more thoroughly before you submit the next version.

Also, AIUI, this series should be marked RFC since the SBI extension
this relies on has not been frozen.

Cheers,
Conor.

--PInAC6LI+1uRW4CY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRfpLgAKCRB4tDGHoIJi
0gjVAQC9Fx8Nsb4L0O1OJEH1rh93DACoHcszIy+Nk51MwLmJzwD/efGr2z7a6NM/
JvCBcINOdxE3OTtc4dn2+/DGMu5DUA0=
=wwCm
-----END PGP SIGNATURE-----

--PInAC6LI+1uRW4CY--


--===============0820825789487506799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0820825789487506799==--

