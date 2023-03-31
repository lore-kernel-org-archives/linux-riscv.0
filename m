Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AD6C6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tLkfcHIvFPvoY9WWMBEpIYJ68itwWssvcHMIgp6Cig=; b=lYiggTCQLm4awNut0fcyUUj2hz
	yX7n+MX8xMRBdB8opPDG/0NaOXaDiH0PlzHlVS5Bw7J4pc55kYVIXPVlrvJl52Ahtgbx8+d+34LHx
	ccVaUEmAmm5mis4bdyqD9ZtRKESLw1HmROT8gILuSbvKhM0l+j+QT2u+sDs1WDlGW70swogkZS4m4
	ljBqmonSzxIa87fVhL79urwrd4gtU7ytC/YVUHtcLqtzJYtTR7Nkq8OSlaWZHrPUl4XzGWXhcVs8a
	wMl4x96xwN9qmvef7gvjWtC63yRQm3VRGPV+HjTCwk7EXbWWRduvv6Y50IM+MN51IKWBaBFVISoNG
	xCZd3PnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piDoW-007GXq-31;
	Fri, 31 Mar 2023 12:25:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDoT-007GV6-1M
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 12:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680265501; x=1711801501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZC2TiUJ6vJPwXEcNjYqansieGSLZd4+5qeXsm1kRXw=;
  b=nG+fDVzvlJ81X7n5P3iaGir9/spOnztuRSuMhb6+v4S9pJPmvIRgRPAo
   ApKJZOtZ/0jQJsFaU5Kh8ID6DqVxQHu3ZfUP6ITnvjvuC2pxXFcY6slRf
   cE3duNYpgLksb4OL4PWsKRyIR3AdbA7eMLUJ7tOQ4hlwVlCYd4kGZcLvB
   vNpnu1zJ3BECqBTDESMR7kWWrr41B64057yIDWWGiibPzuQgAGtia8NS0
   E+jUY6qrWcEdpCXiMBCCO9lGD9iG52/YYcx5FCqc4Ew/XzzGS3adTKc94
   HGTILF+Kr8wb2wowzDoCie9D/+bz6MadThkED/nY2diQPmx2lgi3X0UJY
   A==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="asc'?scan'208";a="207583725"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 05:24:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 05:24:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 05:24:54 -0700
Date: Fri, 31 Mar 2023 13:24:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <f12f9773-77b5-4ba6-9e9e-adbc67ca0110@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_052501_552122_DBA0E8CA 
X-CRM114-Status: GOOD (  22.42  )
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
Content-Type: multipart/mixed; boundary="===============3055527506789499899=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3055527506789499899==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NYzJoNNExCmWWzsp"
Content-Disposition: inline

--NYzJoNNExCmWWzsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

I think most of what I wanted to talk about has been raised by Arnd or
Geert, so I kinda only have a couple of small comments for you here.

On Thu, Mar 30, 2023 at 09:42:12PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Currently, selecting which CMOs to use on a given platform is done using
> and ALTERNATIVE_X() macro. This was manageable when there were just two
> CMO implementations, but now that there are more and more platforms coming
> needing custom CMOs, the use of the ALTERNATIVE_X() macro is unmanageable.
>=20
> To avoid such issues this patch switches to use of function pointers
> instead of ALTERNATIVE_X() macro for cache management (the only drawback
> being performance over the previous approach).
>=20
> void (*clean_range)(unsigned long addr, unsigned long size);
> void (*inv_range)(unsigned long addr, unsigned long size);
> void (*flush_range)(unsigned long addr, unsigned long size);

So, given Arnd has renamed the generic helpers, should we use the
writeback/invalidate/writeback & invalidate terminology here too?
I think it'd be nice to make the "driver" functions match the generic
implementations's names (even though that means not making the
instruction naming).

> The above function pointers are provided to be overridden for platforms
> needing CMO.
>=20
> Convert ZICBOM and T-HEAD CMO to use function pointers.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v6->v7
> * Updated commit description
> * Fixed build issues when CONFIG_ERRATA_THEAD_CMO=3Dn
> * Used static const struct ptr to register CMO ops
> * Dropped riscv_dma_noncoherent_cmo_ops

> * Moved ZICBOM CMO setup to setup.c

Why'd you do that?
What is the reason that the Zicbom stuff cannot live in
dma-noncoherent.[ch] and only expose, say:
void riscv_cbom_register_cmo_ops(void)
{
	riscv_noncoherent_register_cache_ops(&zicbom_cmo_ops);
}
which you then call from setup.c?

> v5->v6
> * New patch
> ---
>  arch/riscv/errata/thead/errata.c         | 76 ++++++++++++++++++++++++
>  arch/riscv/include/asm/dma-noncoherent.h | 73 +++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h     | 53 -----------------
>  arch/riscv/kernel/setup.c                | 49 ++++++++++++++-
>  arch/riscv/mm/dma-noncoherent.c          | 25 ++++++--
>  arch/riscv/mm/pmem.c                     |  6 +-
>  6 files changed, 221 insertions(+), 61 deletions(-)
>  create mode 100644 arch/riscv/include/asm/dma-noncoherent.h

> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +
> +#define ZICBOM_CMO_OP(_op, _start, _size, _cachesize)				\
> +	asm volatile("mv a0, %1\n\t"						\
> +		     "j 2f\n\t"							\
> +		     "3:\n\t"							\
> +		     CBO_##_op(a0)						\
> +		     "add a0, a0, %0\n\t"					\
> +		     "2:\n\t"							\
> +		     "bltu a0, %2, 3b\n\t"					\
> +		     : : "r"(_cachesize),					\
> +			 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> +			 "r"((unsigned long)(_start) + (_size))			\
> +		     : "a0")
> +
> +static void zicbom_cmo_clean_range(unsigned long addr, unsigned long siz=
e)
> +{
> +	ZICBOM_CMO_OP(clean, addr, size, riscv_cbom_block_size);
> +}
> +
> +static void zicbom_cmo_flush_range(unsigned long addr, unsigned long siz=
e)
> +{
> +	ZICBOM_CMO_OP(flush, addr, size, riscv_cbom_block_size);
> +}
> +
> +static void zicbom_cmo_inval_range(unsigned long addr, unsigned long siz=
e)
> +{
> +	ZICBOM_CMO_OP(inval, addr, size, riscv_cbom_block_size);
> +}
> +
> +const struct riscv_cache_ops zicbom_cmo_ops =3D {
> +	.clean_range =3D &zicbom_cmo_clean_range,
> +	.inv_range =3D &zicbom_cmo_inval_range,
> +	.flush_range =3D &zicbom_cmo_flush_range,
> +};
> +
> +static void zicbom_register_cmo_ops(void)
> +{
> +	riscv_noncoherent_register_cache_ops(&zicbom_cmo_ops);
> +}
> +#else
> +static void zicbom_register_cmo_ops(void) {}
> +#endif

I think all of the above should be prefixed with riscv_cbom to match the
other riscv_cbom stuff we already have.
Although, given the discussion elsewhere about just falling back to
zicbom in the absence of specific ops, most of these functions will
probably disappear (if not all of them).

Cheers,
Conor.

--NYzJoNNExCmWWzsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCbRCAAKCRB4tDGHoIJi
0iABAP0Trlhgk1WaIkkfLh4tD9+60uHDfVxoza/L6pLJeFjFHQEA3/A12eco/Ys/
47yBDYcaX9uUeMwY1iHDMykWNK0fCQM=
=fsaO
-----END PGP SIGNATURE-----

--NYzJoNNExCmWWzsp--


--===============3055527506789499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3055527506789499899==--

