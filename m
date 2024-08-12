Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B4FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkrm329ZyP0iJoKtI0ODac2v/8lAY1sfQmM3ee57rtw=; b=bHri9br2/WYxU2Gxv6UvKc5zxa
	CgRex3J/Ekb+jvR7Oqkf0274uRCBYD3oYdFX7f4GMIP3VLdNLy0VOmtYSnnZ/bd+KMZyOj9awNIt6
	Y0O2ExKX9hb9WwPU+1th9mZs40YGxnHmoPBybI4MtWiP7JoM5fjw4ZbLpex6tyuqGj1UcpC/Zgw1H
	4efwwfy0QU1jpiRBPD8E3dS8q632R0JoIjPg7BCG8ZhCY7sI10pbc4TqPwvO6XQrqYqmt87xZEbbU
	Mr5BKzwO1b+8fxGhjEdjmDpmNolgEgw/gBhu8ypct0aOcYrGxgeq0vsmhhRCKSQXrI9xTCwWkWKaA
	cjY5GwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWn3-00000000i1h-2aOR;
	Mon, 12 Aug 2024 15:16:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWn0-00000000i1I-3Zz9
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 15:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 502ADCE0F1E;
	Mon, 12 Aug 2024 15:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD05C32782;
	Mon, 12 Aug 2024 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723475811;
	bh=pD/+4um3c3Lin4UbxwH5WoHOz/QB/EzM+2JywSi/0O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrx0T1UG9Gy0x2bYxreE1pQjveabFgsSd4/dkUk8Hsis0iiedw+KrCVZEUqQdVnNG
	 hY7EK+UtyXvdL5hhqvz6wMXbUp4e/ftkliw8SgsfF9Ne63owqyOlrsN4NqG/i+ji4g
	 qWLG2r2rsCQhHDoQbGrTaz7QjpZ9Zj35tJEop1rhF0zDVb6C1OxHKESk3hNNjjBFRY
	 BfVGBWM6Qd8AHkrIjxRekO3aikIhWyLfHRYPgG+6tkD0E3f+z/is6S9i82Kt5FNr/M
	 GlVY5GUIRLH9cczKo+E9Lk/KgKfyTmU9n8I1Soa/lytr2e7oekC+SxmJxzXqu6Meog
	 bIMwgUFxCyopg==
Date: Mon, 12 Aug 2024 16:16:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix out-of-bounds when accessing Andes per
 hart vendor extension array
Message-ID: <20240812-viper-handed-b5fd421c73f9@spud>
References: <20240811150229.82321-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240811150229.82321-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_081655_093821_265079D5 
X-CRM114-Status: GOOD (  11.78  )
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
Content-Type: multipart/mixed; boundary="===============8974072539186710712=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8974072539186710712==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="et7i5P6lqCWValIK"
Content-Disposition: inline


--et7i5P6lqCWValIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 05:02:29PM +0200, Alexandre Ghiti wrote:
> The out-of-bounds access is reported by UBSAN:
>=20
> [    0.000000] UBSAN: array-index-out-of-bounds in ../arch/riscv/kernel/v=
endor_extensions.c:41:66
> [    0.000000] index -1 is out of range for type 'riscv_isavendorinfo [32=
]'
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc2u=
buntu-defconfig #2
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] Call Trace:
> [    0.000000] [<ffffffff94e078ba>] dump_backtrace+0x32/0x40
> [    0.000000] [<ffffffff95c83c1a>] show_stack+0x38/0x44
> [    0.000000] [<ffffffff95c94614>] dump_stack_lvl+0x70/0x9c
> [    0.000000] [<ffffffff95c94658>] dump_stack+0x18/0x20
> [    0.000000] [<ffffffff95c8bbb2>] ubsan_epilogue+0x10/0x46
> [    0.000000] [<ffffffff95485a82>] __ubsan_handle_out_of_bounds+0x94/0x9c
> [    0.000000] [<ffffffff94e09442>] __riscv_isa_vendor_extension_availabl=
e+0x90/0x92
> [    0.000000] [<ffffffff94e043b6>] riscv_cpufeature_patch_func+0xc4/0x148
> [    0.000000] [<ffffffff94e035f8>] _apply_alternatives+0x42/0x50
> [    0.000000] [<ffffffff95e04196>] apply_boot_alternatives+0x3c/0x100
> [    0.000000] [<ffffffff95e05b52>] setup_arch+0x85a/0x8bc
> [    0.000000] [<ffffffff95e00ca0>] start_kernel+0xa4/0xfb6
>=20
> This happens because we unconditionally use the cpu parameter to access
> this array. But if -1 is passed, that means we should not and we don't
> need to access this array, so simply prevent accessing the array in that =
case.
>=20
> Fixes: 23c996fc2bc1 ("riscv: Extend cpufeature.c to detect vendor extensi=
ons")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Conor Dooley <conor.dooley@microchip.com>

--et7i5P6lqCWValIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZronXwAKCRB4tDGHoIJi
0lzsAPwNYLkTFWkih6zFUZ1EtUByB/vgeCagFVu8E3p4AS71owEA0kudo8htC+3f
slCc/+K8Uw9hUBE21ADtJJRt3133Cgs=
=avO9
-----END PGP SIGNATURE-----

--et7i5P6lqCWValIK--


--===============8974072539186710712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8974072539186710712==--

