Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33E2C4167B
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qkx7NxhXug8nj/KLiTcCUkfJM561pW9+hyIjqa91Htc=; b=PPE1sRtHFYs5NXBz4SxezKrnk+
	88KbsiUmqCTZViJ24VjG/vySBtmtAO3ZRjOnXarL2WzxsmRJ9Vnr/CCAADjMZ1gx8DUMxPAEnMW5v
	EaNIR1xM5H88zL5GJTFuwMoMUDZ8IiUnUjRe4SYpK2k/fZVx5pBlr+SH99r8VnJ5jpXHNLbwWn/vk
	hpZCV0y0F7DoP0MndhlabGsdbGRBGInpsK+l7oczc0dZduA1DXA+AS3xdtaz0kFKoGiGHQ88X0jHJ
	xHTFQHtyQHfnNrSzVKt0plsriBFn/xl5qDIm4gIatebxh9hC8KCWDhNbhG/9pUZrhXGGmAtnvfqYm
	sD9dIt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9l2b-00Gl4m-2Y;
	Sun, 03 Dec 2023 11:53:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9l2Y-00Gl1q-0B
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 11:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CBF08B80B78;
	Sun,  3 Dec 2023 11:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C4C433C9;
	Sun,  3 Dec 2023 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701604416;
	bh=4XnZskoeMF2Cmblt7nv2tGE1KN91nbBk9jchpWv0PRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taFQ/gvqYDb33zhFlIpFf+XbByk/LB+ULTN/utwJQMOwrOQEVqbIaf3rZosTyLrCI
	 k+WJ/x++WyIZTQBo/WIY5M96/RWhkblKpMoCImzw/qhTKFIy/a6W6HyNbYoQ0dptyS
	 eL6KIXyQnb2hj7FXK1sxrUwcWXE7nA+t0BhIoUp7gkmVziVG0Fox10/YxIBtjrKpAi
	 ff4k/dQ+L3SEtfI4pKrEe088wYljNRwuYqTEjVxHvpHXx3sKNrFM1D9uQWy0DLHNI8
	 yt9L2aJlFbznfu5tcZS5IRDGtua1bFyglEhEJD0kIKjz4v7CRp3SlpLYoKKik9Ay4Q
	 PS6i1y5CtMkpw==
Date: Sun, 3 Dec 2023 11:53:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: select DCACHE_WORD_ACCESS for efficient
 unaligned access HW
Message-ID: <20231203-stratus-hypocrisy-b6e2aab86e1d@spud>
References: <20231202111822.3569-1-jszhang@kernel.org>
 <20231202111822.3569-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231202111822.3569-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_035338_365732_C028CA08 
X-CRM114-Status: GOOD (  29.16  )
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
Content-Type: multipart/mixed; boundary="===============6141920947778848798=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6141920947778848798==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45y5lYEdttQFByFb"
Content-Disposition: inline


--45y5lYEdttQFByFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:18:22PM +0800, Jisheng Zhang wrote:
> DCACHE_WORD_ACCESS uses the word-at-a-time API for optimised string
> comparisons in the vfs layer.
>=20
> This patch implements support for load_unaligned_zeropad in much the
> same way as has been done for arm64.
>=20
> Here is the test program and step:
>=20
>  $ cat tt.c
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <unistd.h>
>=20
>  #define ITERATIONS 1000000
>=20
>  #define PATH "123456781234567812345678123456781"
>=20
>  int main(void)
>  {
>          unsigned long i;
>          struct stat buf;
>=20
>          for (i =3D 0; i < ITERATIONS; i++)
>                  stat(PATH, &buf);
>=20
>          return 0;
>  }
>=20
>  $ gcc -O2 tt.c
>  $ touch 123456781234567812345678123456781
>  $ time ./a.out
>=20
> Per my test on T-HEAD C910 platforms, the above test performance is
> improved by about 7.5%.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Doesn't build on nommu:
arch/riscv/include/asm/word-at-a-time.h:64:9: error: expected ':' or ')' be=
fore '_ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD'
arch/riscv/include/asm/word-at-a-time.h:64:45: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:49: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:9: error: expected ':' or ')' be=
fore '_ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD'
arch/riscv/include/asm/word-at-a-time.h:64:45: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:49: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:9: error: expected ':' or ')' be=
fore '_ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD'
arch/riscv/include/asm/word-at-a-time.h:64:45: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:49: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:9: error: expected ':' or ')' be=
fore '_ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD'
arch/riscv/include/asm/word-at-a-time.h:64:45: error: invalid suffix "b" on=
 integer constant
arch/riscv/include/asm/word-at-a-time.h:64:49: error: invalid suffix "b" on=
 integer constant

Cheers,
Conor.

> ---
>  arch/riscv/Kconfig                      |  1 +
>  arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
>  arch/riscv/include/asm/word-at-a-time.h | 23 ++++++++++++++++++
>  arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
>  4 files changed, 70 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0a76209e9b02..bb366eb1870e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -657,6 +657,7 @@ config RISCV_MISALIGNED
>  config RISCV_EFFICIENT_UNALIGNED_ACCESS
>  	bool "Use unaligned access for some functions"
>  	depends on NONPORTABLE
> +	select DCACHE_WORD_ACCESS if MMU
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	default n
>  	help
> diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/as=
m/asm-extable.h
> index 00a96e7a9664..0c8bfd54fc4e 100644
> --- a/arch/riscv/include/asm/asm-extable.h
> +++ b/arch/riscv/include/asm/asm-extable.h
> @@ -6,6 +6,7 @@
>  #define EX_TYPE_FIXUP			1
>  #define EX_TYPE_BPF			2
>  #define EX_TYPE_UACCESS_ERR_ZERO	3
> +#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
> =20
>  #ifdef CONFIG_MMU
> =20
> @@ -47,6 +48,11 @@
>  #define EX_DATA_REG_ZERO_SHIFT	5
>  #define EX_DATA_REG_ZERO	GENMASK(9, 5)
> =20
> +#define EX_DATA_REG_DATA_SHIFT	0
> +#define EX_DATA_REG_DATA	GENMASK(4, 0)
> +#define EX_DATA_REG_ADDR_SHIFT	5
> +#define EX_DATA_REG_ADDR	GENMASK(9, 5)
> +
>  #define EX_DATA_REG(reg, gpr)						\
>  	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
> =20
> @@ -62,6 +68,15 @@
>  #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
>  	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)
> =20
> +#define _ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD(insn, fixup, data, addr)		\
> +	__DEFINE_ASM_GPR_NUMS							\
> +	__ASM_EXTABLE_RAW(#insn, #fixup,					\
> +			  __stringify(EX_TYPE_LOAD_UNALIGNED_ZEROPAD),		\
> +			  "("							\
> +			    EX_DATA_REG(DATA, data) " | "			\
> +			    EX_DATA_REG(ADDR, addr)				\
> +			  ")")
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  #else /* CONFIG_MMU */
> diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include=
/asm/word-at-a-time.h
> index 7c086ac6ecd4..5a3865ac3623 100644
> --- a/arch/riscv/include/asm/word-at-a-time.h
> +++ b/arch/riscv/include/asm/word-at-a-time.h
> @@ -9,6 +9,7 @@
>  #define _ASM_RISCV_WORD_AT_A_TIME_H
> =20
> =20
> +#include <asm/asm-extable.h>
>  #include <linux/kernel.h>
> =20
>  struct word_at_a_time {
> @@ -45,4 +46,26 @@ static inline unsigned long find_zero(unsigned long ma=
sk)
>  /* The mask we created is directly usable as a bytemask */
>  #define zero_bytemask(mask) (mask)
> =20
> +/*
> + * Load an unaligned word from kernel space.
> + *
> + * In the (very unlikely) case of the word being a page-crosser
> + * and the next page not being mapped, take the exception and
> + * return zeroes in the non-existing part.
> + */
> +static inline unsigned long load_unaligned_zeropad(const void *addr)
> +{
> +	unsigned long ret;
> +
> +	/* Load word from unaligned pointer addr */
> +	asm(
> +	"1:	" REG_L " %0, %2\n"
> +	"2:\n"
> +	_ASM_EXTABLE_LOAD_UNALIGNED_ZEROPAD(1b, 2b, %0, %1)
> +	: "=3D&r" (ret)
> +	: "r" (addr), "m" (*(unsigned long *)addr));
> +
> +	return ret;
> +}
> +
>  #endif /* _ASM_RISCV_WORD_AT_A_TIME_H */
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index 35484d830fd6..dd1530af3ef1 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -27,6 +27,14 @@ static bool ex_handler_fixup(const struct exception_ta=
ble_entry *ex,
>  	return true;
>  }
> =20
> +static inline unsigned long regs_get_gpr(struct pt_regs *regs, unsigned =
int offset)
> +{
> +	if (unlikely(!offset || offset > MAX_REG_OFFSET))
> +		return 0;
> +
> +	return *(unsigned long *)((unsigned long)regs + offset);
> +}
> +
>  static inline void regs_set_gpr(struct pt_regs *regs, unsigned int offse=
t,
>  				unsigned long val)
>  {
> @@ -50,6 +58,27 @@ static bool ex_handler_uaccess_err_zero(const struct e=
xception_table_entry *ex,
>  	return true;
>  }
> =20
> +static bool
> +ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
> +				  struct pt_regs *regs)
> +{
> +	int reg_data =3D FIELD_GET(EX_DATA_REG_DATA, ex->data);
> +	int reg_addr =3D FIELD_GET(EX_DATA_REG_ADDR, ex->data);
> +	unsigned long data, addr, offset;
> +
> +	addr =3D regs_get_gpr(regs, reg_addr * sizeof(unsigned long));
> +
> +	offset =3D addr & 0x7UL;
> +	addr &=3D ~0x7UL;
> +
> +	data =3D *(unsigned long *)addr >> (offset * 8);
> +
> +	regs_set_gpr(regs, reg_data * sizeof(unsigned long), data);
> +
> +	regs->epc =3D get_ex_fixup(ex);
> +	return true;
> +}
> +
>  bool fixup_exception(struct pt_regs *regs)
>  {
>  	const struct exception_table_entry *ex;
> @@ -65,6 +94,8 @@ bool fixup_exception(struct pt_regs *regs)
>  		return ex_handler_bpf(ex, regs);
>  	case EX_TYPE_UACCESS_ERR_ZERO:
>  		return ex_handler_uaccess_err_zero(ex, regs);
> +	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
> +		return ex_handler_load_unaligned_zeropad(ex, regs);
>  	}
> =20
>  	BUG();
> --=20
> 2.42.0
>=20

--45y5lYEdttQFByFb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxsPAAKCRB4tDGHoIJi
0jVoAPwO0p3JwmeLSkc8Otzw8zlT0Yuqy06kwkhkgpnfFnWavgEAlzZZCd+zjUns
YuwKlAa4WhXbys7uK/LbzOdIhYSOEAA=
=6La6
-----END PGP SIGNATURE-----

--45y5lYEdttQFByFb--


--===============6141920947778848798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6141920947778848798==--

