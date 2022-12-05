Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A02C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 18:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucm2pDcf0yZwUPd17SQz/8lzNjX4gJgPUMKL4DvycGo=; b=boTxvJ31UR99mT0Z09y62DtkpR
	ePWwO1x6wY0ldr6GolxWZ4viA2H/MKLPsCU12iywFzOXmxngSzLFL47U05UBEI0j5endlc7ZTe2qs
	70szbA2oFOIFPfoTZ7HyAYyf2/NRgA9PZYfuX2oFLn3TXn5o0K6FbsxtZ605YK7NxDqHcmV325fIJ
	ZEOEbr6DHqye9y8chjNLJ5gwoCNNT3DAsS0X+aq17l835qQuQxXjMczDKi0Npr0BBnQSWDa1jHDup
	H8S5WiIisc6zH4scSVXX8mhZP+5a4wPFuoiz90DP28/x5eiZ7LXT/qJqD8jxtfYx70cF1/bRStWyE
	3H2NolAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GbP-008pAg-Bh; Mon, 05 Dec 2022 18:54:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GbH-008p3k-KQ; Mon, 05 Dec 2022 18:54:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB666612FA;
	Mon,  5 Dec 2022 18:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002C8C433C1;
	Mon,  5 Dec 2022 18:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670266438;
	bh=dDkwloYPqTSZ4SPvf12m0QEAckEY0pJcFUlkg7vk9bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVE9deyV41By2ecKZTxyNR/vJluvD+S+wrV47jbjfV8izTa4gMYXx7zIVwLauOsyN
	 IHLVw3h9kHqr4SHZB2URR7iU/abT0V9/hd34vcLM74k2roTRA22lvJmObJDJzHA6g4
	 3qfgroGFhn4D/LIfrc4+DUSofA80f3hgJFeS1jVSc4v9m4CXqPaB9j72EGyto04aBz
	 ylV3HyuobxbU0IcwC/x0l6GGOO/8PRYpDdYDfX9oeu3z6eORZ+phGKIFZiK+5kbTG2
	 sc+yFdW1qyVq8CMgqZxRBGS7YJg67BmjczpwnszScQFrOdJr7Lpw/qIvcdRu+LQ0OM
	 fytLkls7jOHsg==
Date: Mon, 5 Dec 2022 18:53:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 04/13] riscv: hwcap: make ISA extension ids can be
 used in asm
Message-ID: <Y44+QWJfaa7haS/5@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_105359_791523_1A050A9E 
X-CRM114-Status: GOOD (  21.17  )
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
Content-Type: multipart/mixed; boundary="===============5991058787352407325=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5991058787352407325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SoXKSTu70JicbV71"
Content-Disposition: inline


--SoXKSTu70JicbV71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, Dec 05, 2022 at 01:46:23AM +0800, Jisheng Zhang wrote:
> We will make use of ISA extension in asm files, so make the multi-letter
> RISC-V ISA extension IDs macros rather than enums and move them and
> those base ISA extension IDs to suitable place.

Which base ISA extension IDs? Changelog should match the patch contents,
and it's a little unclear here since the base ISA extension IDs are
visible here but in the context not the diff.

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 43 ++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b22525290073..996884986fea 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -12,20 +12,6 @@
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
> =20
> -#ifndef __ASSEMBLY__
> -#include <linux/jump_label.h>
> -/*
> - * This yields a mask that user programs can use to figure out what
> - * instruction set this cpu supports.
> - */
> -#define ELF_HWCAP		(elf_hwcap)
> -
> -enum {
> -	CAP_HWCAP =3D 1,
> -};
> -
> -extern unsigned long elf_hwcap;
> -
>  #define RISCV_ISA_EXT_a		('a' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
> @@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_BASE 26
> =20
>  /*
> - * This enum represent the logical ID for each multi-letter RISC-V ISA e=
xtension.
> + * These macros represent the logical ID for each multi-letter RISC-V IS=
A extension.
>   * The logical ID should start from RISCV_ISA_EXT_BASE and must not exce=
ed
>   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>   * extensions while all the multi-letter extensions should define the ne=
xt
>   * available logical extension id.
>   */
> -enum riscv_isa_ext_id {
> -	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
> -	RISCV_ISA_EXT_SVPBMT,
> -	RISCV_ISA_EXT_ZICBOM,
> -	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,
> -	RISCV_ISA_EXT_SVINVAL,
> -	RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
> +#define RISCV_ISA_EXT_SSCOFPMF		26
> +#define RISCV_ISA_EXT_SVPBMT		27
> +#define RISCV_ISA_EXT_ZICBOM		28
> +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> +#define RISCV_ISA_EXT_SSTC		30
> +#define RISCV_ISA_EXT_SVINVAL		31

Could you re-order these alphabetically when you move them please?

Thanks,
Conor.

> +
> +#ifndef __ASSEMBLY__
> +#include <linux/jump_label.h>
> +/*
> + * This yields a mask that user programs can use to figure out what
> + * instruction set this cpu supports.
> + */
> +#define ELF_HWCAP		(elf_hwcap)
> +
> +enum {
> +	CAP_HWCAP =3D 1,
>  };
> =20
> +extern unsigned long elf_hwcap;
> +
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension sta=
tic
>   * keys. We can use static key to optimize code path if some ISA extensi=
ons
> --=20
> 2.37.2
>=20

--SoXKSTu70JicbV71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY44+QQAKCRB4tDGHoIJi
0lI5AQCQU4Yulx3aPJ/8VwGzte0KU1wRgZkLQgu+/cIrvg4iygEArz2COMO1jpcT
yHkDw3opFZX0/12MgPrroFAUZCOdQQw=
=Ph2m
-----END PGP SIGNATURE-----

--SoXKSTu70JicbV71--


--===============5991058787352407325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5991058787352407325==--

