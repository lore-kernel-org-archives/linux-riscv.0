Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFEFC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERVWZ3BePNGNTCUrzdbmJGDTgS4ur8q7dduCPp1AFPU=; b=c70FmZWwn9UcfAMdcZ1EZQ27E5
	9Dz5Wt9FcqNyfjnvhRT1GZ6ra8Juh62WYiejynBs89kmvVXBejRefy9K2khHSTtwDz0Uy18EUU2X3
	Iw1vZKgv9NxKVqEZHt35imaIzpOV/KX3uaJMq69K+Ml6wpR26dgDWTDdnGqQOmUat+DUzWBn9DZg8
	QTmbT2KHaiKljnefJbZVDi0lO7h+agezAe+Z6bEtwMWpBxQ+X/lvkPDoQy7YB51GJiCEzaffR+7Bl
	F7XS7ClDYWj7L6tJequG55Y6evzdIiWgFoV26jLSw8/nlvg2R6L2P3ozb04+Qckhw+RgaEEHyvN4t
	XoGpxXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL9r7-00Cc3l-CC; Thu, 26 Jan 2023 21:32:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL9r3-00Cc3B-Rd; Thu, 26 Jan 2023 21:32:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37C5D6191F;
	Thu, 26 Jan 2023 21:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF65C433D2;
	Thu, 26 Jan 2023 21:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674768740;
	bh=uOJFWPvn5cydFk6E8jnVlZVnFZHeOXC+rM4lUdsVATc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeK7qr1cX/cH2geL14TR5epFCzWDkgO0T5WzBXT45iUhCgCPuzt6d5bPwa3F/Z7PY
	 hqIuUiBIxvuSaUrYvB6UGG/RYxB3KnLX8x/zBsfKFxbsg6VSBLQ5UVTtfFvglqxwBO
	 2WSidBywfaGrm8CREwT4SQLcXHo7lfL3xHJg85aigqcir//V2ZTVurIhXkuud4HCuJ
	 nZFvjwJyPkbnk0yr54X2SF5NqnB+jzAFVv5kW+axSDikJppuyYWaL3ejExathvpnWe
	 cPDEXpIOzgKgyklbwXsr5sFhutpIHPLaMl+8/ixmjEfZH5UmJpDudcWcjCLWhlalzB
	 NYoYAEqyleq9g==
Date: Thu, 26 Jan 2023 21:32:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v13 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
Message-ID: <Y9LxXwzaDDS/Ny7F@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-9-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-9-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_133222_015768_194802C7 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: multipart/mixed; boundary="===============2998462433078271972=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2998462433078271972==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T81hy5skYr4t8/6w"
Content-Disposition: inline


--T81hy5skYr4t8/6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:45PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Add vector state context struct to be added later in thread_struct. And
> prepare low-level helper functions to save/restore vector contexts.
>=20
> This include Vector Regfile and CSRs holding dynamic configuration state
> (vstart, vl, vtype, vcsr). The Vec Register width could be implementation
> defined, but same for all processes, so that is saved separately.
>=20
> This is not yet wired into final thread_struct - will be done when
> __switch_to actually starts doing this in later patches.
>=20
> Given the variable (and potentially large) size of regfile, they are
> saved in dynamically allocated memory, pointed to by datap pointer in
> __riscv_v_state.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: merged bits from 2 different patches]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andy.chiu: use inline asm to save/restore context, remove asm vaiant]
> ---
>  arch/riscv/include/asm/vector.h      | 84 ++++++++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/ptrace.h | 17 ++++++
>  2 files changed, 101 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 16cb4a1c1230..842a859609b5 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -12,6 +12,9 @@
> =20
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
> +#include <asm/asm.h>
> +
> +#define CSR_STR(x) __ASM_STR(x)
> =20
>  extern unsigned long riscv_vsize;
> =20
> @@ -20,6 +23,26 @@ static __always_inline bool has_vector(void)
>  	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTO=
R]);
>  }
> =20
> +static inline void __vstate_clean(struct pt_regs *regs)

Consistent prefixes here too please, riscv_v_vstate_clean() or similar
and so on for the rest of the patch.

Thanks,
Conor.


--T81hy5skYr4t8/6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LxXwAKCRB4tDGHoIJi
0nQtAPsGLNd4O6pbPjw+cqDbGI+VbH4Kn4FM9cAh60x1ptDi6wD9EM4HeOaAb7Mh
yW8+QgvqohZ2iBo1Nq9xIfk5ilPkeAA=
=s5px
-----END PGP SIGNATURE-----

--T81hy5skYr4t8/6w--


--===============2998462433078271972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2998462433078271972==--

