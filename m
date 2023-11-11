Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB51C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Nov 2023 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOa2wB+1GfLBNDLGeIExGk7D3gUgEqPJBP/08g+HQkc=; b=DIGPr9h7sTL4HVzWG+1RXGi7lU
	IIEF7PJ34Irzm+0sFhlJ5Mf51VxOj6z4dT1QC+hhCJ7p1ytpdH9Ce4iONrpJcbHU8o+mSkF19vzMS
	aSH+jPM228Fwy//6vxTE8bmXzx2M9A12HJHmwaEWaipnhpBd739/RsyiXj6TvuKI3bHVvY1nC/1t2
	rskmYZCY/VlY0qzjcdz7vhXzI5umN0kVIXFY9+b7Ha8AZeigARdLZ/Ns99pioMq+3F1IGif8FxETR
	EFbAF7BkAsCXQOwUWmlpa0nsbvV+8Ptx056CYBdyD4vAbPxoIQ4tj/NbOCCFk08ftObVtnWPUoznM
	1t1jG3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1qSg-00B9JY-3C;
	Sat, 11 Nov 2023 16:03:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1qSd-00B9J1-27
	for linux-riscv@lists.infradead.org;
	Sat, 11 Nov 2023 16:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2F1ECE02C7;
	Sat, 11 Nov 2023 16:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4472C433C8;
	Sat, 11 Nov 2023 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699718623;
	bh=rpNPoQ24eN3PTIOZs660xUVvCjufD0Rys8d82O5HFiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I34THfnMFVOTz58KdzG5zIm5JERjmBu9rmt3nRlGw7p43wQoilTcKt+hpnaIUj32I
	 Ott9KdMRqRFYAozg3jrCZI9DfxmFxLnQ99LR+jrK0r6enf0FZ0s07fy+CKWXqaY61J
	 MQDnUW54kCMK/Q72rQyXmlrAPNFxwqoHhHwuueFFXnW6nJCepY8oevR3Pv85QDpBXA
	 JqkyJDkODCh1eqCeb6kPOSx05L4P0orbNGCVjUGgE3DE1jMtltsoyC/Tt7Bmo74Jpe
	 5qH/J/yh5UWcnTGW6GtfI6UZXmGNvhqOdnCAjSju/QESkS6O+5w0mrg7abKfu39P+J
	 rPzTbCY2gC2UA==
Date: Sat, 11 Nov 2023 16:03:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Remove the removed single-letter extensions
Message-ID: <20231111-hangup-persevere-a097c83115be@squawk>
References: <20231110175903.2631-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231110175903.2631-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_080352_060210_07764E78 
X-CRM114-Status: GOOD (  15.93  )
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
Content-Type: multipart/mixed; boundary="===============3319421736628941590=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3319421736628941590==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O1VtQAgkbENaZJiM"
Content-Disposition: inline


--O1VtQAgkbENaZJiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 09:59:03AM -0800, Palmer Dabbelt wrote:
> There were a few single-letter extensions that we had references to
> floating around in the kernel, but that never ended up as actual ISA
> specs and have mostly been replaced by multi-letter extensions.  This
> removes the references to those extensions.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Getting the jump on your talk on Monday?

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h | 6 ------
>  arch/riscv/kernel/cpufeature.c | 4 ----
>  2 files changed, 10 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index fe6656af967a..d0a5804c7d78 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -14,19 +14,13 @@
>  #include <uapi/asm/hwcap.h>
> =20
>  #define RISCV_ISA_EXT_a		('a' - 'a')
> -#define RISCV_ISA_EXT_b		('b' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
>  #define RISCV_ISA_EXT_f		('f' - 'a')
>  #define RISCV_ISA_EXT_h		('h' - 'a')
>  #define RISCV_ISA_EXT_i		('i' - 'a')
> -#define RISCV_ISA_EXT_j		('j' - 'a')
> -#define RISCV_ISA_EXT_k		('k' - 'a')
>  #define RISCV_ISA_EXT_m		('m' - 'a')
> -#define RISCV_ISA_EXT_p		('p' - 'a')
>  #define RISCV_ISA_EXT_q		('q' - 'a')
> -#define RISCV_ISA_EXT_s		('s' - 'a')
> -#define RISCV_ISA_EXT_u		('u' - 'a')
>  #define RISCV_ISA_EXT_v		('v' - 'a')
> =20
>  /*
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 7aeba01dcfd4..bb0d1f242f24 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -158,10 +158,6 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
> -	__RISCV_ISA_EXT_DATA(b, RISCV_ISA_EXT_b),
> -	__RISCV_ISA_EXT_DATA(k, RISCV_ISA_EXT_k),
> -	__RISCV_ISA_EXT_DATA(j, RISCV_ISA_EXT_j),
> -	__RISCV_ISA_EXT_DATA(p, RISCV_ISA_EXT_p),
>  	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> --=20
> 2.42.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--O1VtQAgkbENaZJiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU+l1wAKCRB4tDGHoIJi
0pAgAP0Suzq7CqqI+e0XJlNRp8Zp/x73F4Y/FGQ5wpLtUmwHagD/eEt1G4A89NOr
iIi5WBjkqPCoEGOdB5LhIWv1+5/jvwY=
=aBkR
-----END PGP SIGNATURE-----

--O1VtQAgkbENaZJiM--


--===============3319421736628941590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3319421736628941590==--

