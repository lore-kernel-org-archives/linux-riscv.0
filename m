Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E326C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 22:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N97goYvmeS66WVExJhY49zIOR8p9FCUlPe6TU/327TA=; b=SvcY3VElkwtBFM3uJAcDjJ63hj
	bn3dR7De724ECe8Tj2lpnMEI8c6jLlfxRVXa1wO7/4sO/zuZGhzEWMCEzyUxSLfpHNCxB3nzwlDD1
	vMH+Aivsqf0MSq48Hp+9+bac4p0XNozrBaYrahhCfDLPQkrzP4evJqkOpA9wJdwY5l7LkSibtqoYT
	GdYU2NlU6+dQm3mJtlKU0/n67OIP3b+mVCFfd+5YfKf7i2ESc45/kyotsvrIr0yT5nSAxEu4ZlLmv
	xJcW11cuyadFKR7D+kqWxHruEFq8KLhGWdMHsjzGUsHLGGeH8/lK5392AiAfn7PXZph0AvWIAnPO0
	cpM+XShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seMS0-00000008Rtu-2sDX;
	Wed, 14 Aug 2024 22:26:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seMRx-00000008RtB-1ydU
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 22:26:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73A8CCE1B21;
	Wed, 14 Aug 2024 22:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C963C116B1;
	Wed, 14 Aug 2024 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723674394;
	bh=/ev7QCuOLeF1lnYSvn4BubTgvgqIJVaNow7skyZz3x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aAXAWXzun1RciKPEGpCpDV2IGY85v1I6a+F4jKCwSSmc67gWUyXzZsu+A3wiJ1U5e
	 RNBEppKXsP86JKxVA5LxwCgF5j1blUH/rx5o4qPzORqjm8JoxOlO6/zR4EhyD/kPjn
	 jVt6FTgZ9k4jfHCzv6in46SJFd3vUiPl+3S9RYmT1CqwpxLjyFoqAZAIN7vd+T9KMY
	 +pHZcCBqYdutf4nb4poolDQYht/tjtdYgZXjMunqm468TNeuNVP7YpGjgZ/XsuYvts
	 66PCQIlF5j1LbpPtoczK675DGJium5W9xG97xRTxa2wg3Bq67hUdOVLTARqBvhCtr0
	 t0ZCKrF0a7iKw==
Date: Wed, 14 Aug 2024 23:26:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2] riscv: Fix out-of-bounds when accessing Andes
 per hart vendor extension array
Message-ID: <20240814-overexert-baffling-1abf9a80c7b0@spud>
References: <20240814192619.276794-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240814192619.276794-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_152637_884118_CB095F61 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: multipart/mixed; boundary="===============0164748816582214516=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0164748816582214516==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2WckljnaeUer3GVg"
Content-Disposition: inline


--2WckljnaeUer3GVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 09:26:19PM +0200, Alexandre Ghiti wrote:
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
> The dereferencing using cpu should actually not happen, so remove it.
>=20
> Fixes: 23c996fc2bc1 ("riscv: Extend cpufeature.c to detect vendor extensi=
ons")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---

You're missing a changelog here, which is doubly important when you drop
tags provided to you on an earlier version.

>  arch/riscv/kernel/vendor_extensions.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/ve=
ndor_extensions.c
> index b6c1e7b5d34b..a8126d118341 100644
> --- a/arch/riscv/kernel/vendor_extensions.c
> +++ b/arch/riscv/kernel/vendor_extensions.c
> @@ -38,7 +38,7 @@ bool __riscv_isa_vendor_extension_available(int cpu, un=
signed long vendor, unsig
>  	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
>  	case ANDES_VENDOR_ID:
>  		bmap =3D &riscv_isa_vendor_ext_list_andes.all_harts_isa_bitmap;
> -		cpu_bmap =3D &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
> +		cpu_bmap =3D riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
>  		break;
>  	#endif
>  	default:
> --=20
> 2.39.2
>=20
>=20

--2WckljnaeUer3GVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZr0vFgAKCRB4tDGHoIJi
0mB+AQCcii4hZUx8zB75c5EsWMRUDn1M+ZGtmR1DLapyGuhBGQD8CbsaIrgPi1zP
2msCLpBPps1IC1HoBJ8XLXf7PspTWww=
=b/13
-----END PGP SIGNATURE-----

--2WckljnaeUer3GVg--


--===============0164748816582214516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0164748816582214516==--

