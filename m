Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE74C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQKjj0rvAyuToUufIByvbvyBlfHvtbKmYIVqr7Ro9vw=; b=Wip/59ZVm/goX7ZBdKz7ewv+R/
	t0Gnw35LFtBJp4rJ8IoQtiUA/oFnPpJLbmWEnUq6gElIr0yuAasBEe6Xz6SSK1hkmeI/W6W9ZPXtp
	eYXhciTthwWzHjABkV71zlg/i8q0N9KycOcqzdwJ8fzIvY+o3frw/mGgkvMughtT/iL9uesGtqX19
	jylywn9t8rihDkJO7PbVYw9PTTdgTzwvQkorNLqhCSC6CQOLfCA8ww0TTj6brnAL5xjBc7OfvqgXp
	2sMS/kLp2GXmW9ZopVmqgLZD/GNMHl61/2aVjEv5K4FMFqqj/HtpZOZs6NUILY6fyOfdZBpGW3HCf
	e5PuXlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rza6z-00000003kXm-2XBV;
	Wed, 24 Apr 2024 10:44:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rza6w-00000003kX7-434C
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C49ACE136A;
	Wed, 24 Apr 2024 10:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B97BC2BD10;
	Wed, 24 Apr 2024 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713955460;
	bh=pxcrTqMySGCVkz1+SW4pSfn2o4/wRsYgarTqYSbPgQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RreylLs9xzJy/N92arsIpcrRr9Eft5sVAPuRoXNMRC+wsHuoXbZKtd9NrNegHaxq5
	 C1PlsMzOzln2xI+/S2iCTQM+/Y88ByW97BworA81gprotEl5e1G/ZaMSu+5LPbNkUY
	 yBO+o3CardxQqod2+v+poeXCR5CUs/hKoDtgJIbl5sEmWepjoVz4U6txp8swtxQbjv
	 4mVbxj6wFF+xbx5cBSqmh2lhshM2AVyTRS9WtZgprvysx2mf5lBfWpYI2Wq1wMP2E3
	 y1jsgSm31soPp0PZPLMtpEa8UeiqRZ9jCgmTU/bKy+gIXLRD6INAyUL77berQa3Dun
	 efbB6mBoXIKsA==
Date: Wed, 24 Apr 2024 11:44:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] riscv: Simplify text patching loops
Message-ID: <20240424-cranial-punch-27b38726d3f7@spud>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
 <20240327160520.791322-5-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240327160520.791322-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_034423_248044_EAC43CB0 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Type: multipart/mixed; boundary="===============2495724725044849372=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2495724725044849372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="McmlA8K/qaTnrTZf"
Content-Disposition: inline


--McmlA8K/qaTnrTZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 09:04:43AM -0700, Samuel Holland wrote:
> This reduces the number of variables and makes the code easier to parse.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
> Changes in v2:
>  - Further simplify patch_insn_set()/patch_insn_write() loop conditions
>  - Use min() instead of min_t() since both sides are unsigned long
>=20
>  arch/riscv/kernel/patch.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 9a1bce1adf5a..0d1700d1934c 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -155,22 +155,24 @@ NOKPROBE_SYMBOL(__patch_insn_write);
> =20
>  static int patch_insn_set(void *addr, u8 c, size_t len)
>  {
> -	size_t patched =3D 0;
>  	size_t size;
> -	int ret =3D 0;
> =20
>  	/*
>  	 * __patch_insn_set() can only work on 2 pages at a time so call it in a
>  	 * loop with len <=3D 2 * PAGE_SIZE.
>  	 */
> -	while (patched < len && !ret) {
> -		size =3D min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched),=
 len - patched);
> -		ret =3D __patch_insn_set(addr + patched, c, size);
> -
> -		patched +=3D size;
>  	}
> =20
> -	return ret;
>  }

Weren't these actively wrong before, if a non-ultimate
__patch_insn_set() failed we'd just ignore the error?

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--McmlA8K/qaTnrTZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijigAAKCRB4tDGHoIJi
0q57AP0UAhx5QNtAbU133ScLNzELZcym+MIXcLM8EZQCAH/skQEA2EtGNG7wt3yz
kRcpFCV6rRc3Ypqb47F4ogt+DiOoCA8=
=FbM0
-----END PGP SIGNATURE-----

--McmlA8K/qaTnrTZf--


--===============2495724725044849372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2495724725044849372==--

