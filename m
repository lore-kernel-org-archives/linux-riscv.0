Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5829FC7EE2F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfHKUGqCIQrHUnX0Tvy+1DUvedGLX9rhOso9p6QMBtY=; b=EBFJ6o939+S3MfM1qcWv6RNXDT
	2S1ShdWyLTSFQucl03fsxagZWfAnQUvNl4AH7RuGUj7Ld91Zu6u8TYhMpu7eg0TpyxNg7rvIARWIv
	jilMNdULjvXIXBJQgfFlOBOLVCgopWBcD0pcnkXFN9mlODiOjbpLQb8ZP2iEVIwa4ZkkVE8s6sLc8
	SrFHXwouKLRJMh0IwrN4cYpIz7RtRedlsqcdpX5ZtuHGS/JIuxoYBwH/UU36asU17PZzsnTkje1HQ
	r2hX2LW8hk0SFRR5Fm9KMT+DTO/5q4/htJTgVLR9kqpyGiIghZcqA1lYEl68QLTtSzD7eWQJFxPmr
	i1TkwA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPiU-00Gtjc-Nv; Wed, 01 Mar 2023 16:54:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPiR-00Gtic-1x; Wed, 01 Mar 2023 16:54:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74FE661386;
	Wed,  1 Mar 2023 16:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F24C433D2;
	Wed,  1 Mar 2023 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677689645;
	bh=ZJHIMz6Qurc7C2I/yWH+2t2TDANoy6FPff6UM9+d9iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVKI4Ch1yjFvcrRrpaxCVgM5wm//4lFcJfG4R3IJQnk5XYRuyUEOaCIKb7wYTSGi5
	 vCZjCBHYmxeqfCMH0EuI2UdLAM626JKbz5yQssWhoGb0XghewvU7Phisz1btlux3qk
	 XPNOFTnd90ucbcRFv9PSzUm3R0iaeZbpX62Jb3YL9ba5cUJeOXCwG8g5f3aIWaG7iD
	 vvN9vgXLn6ymLpdGAYgGHHt2sAKoWdkdsp9onDMfR7COqjpMP6XlYFF1NvqQyeovFz
	 +oS9I+GCPcnl3w+Aan4d55HHwarK2vRLFFhsskA62H1hPbohJYYCrm3pyDcAUwix9M
	 y8O8oW+aVqojw==
Date: Wed, 1 Mar 2023 16:53:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liao Chang <liaochang1@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mattias Nissler <mnissler@rivosinc.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v14 10/19] riscv: Allocate user's vector context in
 the first-use trap
Message-ID: <Y/+DJmmZSFIgmEem@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-11-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-11-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_085407_221328_4023947E 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: multipart/mixed; boundary="===============0952632627611596000=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0952632627611596000==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p/O4FNRjX/eMHP3j"
Content-Disposition: inline


--p/O4FNRjX/eMHP3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Fri, Feb 24, 2023 at 05:01:09PM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d@lina=
ro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 082baf2a061f..585e2c51b28e 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -4,9 +4,19 @@
>   * Author: Andy Chiu <andy.chiu@sifive.com>
>   */
>  #include <linux/export.h>
> +#include <linux/sched/signal.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
> =20
> +#include <asm/thread_info.h>
> +#include <asm/processor.h>
> +#include <asm/insn.h>
>  #include <asm/vector.h>
>  #include <asm/csr.h>
> +#include <asm/ptrace.h>
> +#include <asm/bug.h>
> =20
>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
> @@ -19,3 +29,84 @@ void riscv_v_setup_vsize(void)
>  	riscv_v_disable();
>  }
> =20
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode =3D insn_buf & __INSN_OPCODE_MASK;
> +	bool is_vector =3D false;
> +
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) !=3D 4))
> +		return false;
> +
> +	switch (opcode) {
> +	case RVV_OPCODE_VECTOR:
> +		is_vector =3D true;
> +		break;
> +	case RVV_OPCODE_VL:

> +	case RVV_OPCODE_VS:
> +		u32 width =3D RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +
> +		if (width =3D=3D RVV_VL_VS_WIDTH_8 || width =3D=3D RVV_VL_VS_WIDTH_16 =
||
> +		    width =3D=3D RVV_VL_VS_WIDTH_32 || width =3D=3D RVV_VL_VS_WIDTH_64)
> +			is_vector =3D true;
> +		break;
> +	case RVG_OPCODE_SYSTEM:
> +		u32 csr =3D RVG_EXTRACT_SYSTEM_CSR(insn_buf);
> +
> +		if ((csr >=3D CSR_VSTART && csr <=3D CSR_VCSR) ||
> +		    (csr >=3D CSR_VL && csr <=3D CSR_VLENB))
> +			is_vector =3D true;
> +		break;
> +	}

Unfortunately, this is not valid code:
/stuff/linux/arch/riscv/kernel/vector.c:50:3: error: expected expression
                u32 width =3D RVV_EXRACT_VL_VS_WIDTH(insn_buf);
                ^
/stuff/linux/arch/riscv/kernel/vector.c:52:7: error: use of undeclared iden=
tifier 'width'
                if (width =3D=3D RVV_VL_VS_WIDTH_8 || width =3D=3D RVV_VL_V=
S_WIDTH_16 ||
                    ^
/stuff/linux/arch/riscv/kernel/vector.c:52:37: error: use of undeclared ide=
ntifier 'width'
                if (width =3D=3D RVV_VL_VS_WIDTH_8 || width =3D=3D RVV_VL_V=
S_WIDTH_16 ||
                                                  ^
/stuff/linux/arch/riscv/kernel/vector.c:53:7: error: use of undeclared iden=
tifier 'width'
                    width =3D=3D RVV_VL_VS_WIDTH_32 || width =3D=3D RVV_VL_=
VS_WIDTH_64)
                    ^
/stuff/linux/arch/riscv/kernel/vector.c:53:38: error: use of undeclared ide=
ntifier 'width'
                    width =3D=3D RVV_VL_VS_WIDTH_32 || width =3D=3D RVV_VL_=
VS_WIDTH_64)
                                                   ^
/stuff/linux/arch/riscv/kernel/vector.c:57:3: error: expected expression
                u32 csr =3D RVG_EXTRACT_SYSTEM_CSR(insn_buf);
                ^
/stuff/linux/arch/riscv/kernel/vector.c:59:8: error: use of undeclared iden=
tifier 'csr'
                if ((csr >=3D CSR_VSTART && csr <=3D CSR_VCSR) ||
                     ^
/stuff/linux/arch/riscv/kernel/vector.c:59:29: error: use of undeclared ide=
ntifier 'csr'
                if ((csr >=3D CSR_VSTART && csr <=3D CSR_VCSR) ||
                                          ^
/stuff/linux/arch/riscv/kernel/vector.c:60:8: error: use of undeclared iden=
tifier 'csr'
                    (csr >=3D CSR_VL && csr <=3D CSR_VLENB))
                     ^
/stuff/linux/arch/riscv/kernel/vector.c:60:25: error: use of undeclared ide=
ntifier 'csr'
                    (csr >=3D CSR_VL && csr <=3D CSR_VLENB))
                                      ^
10 errors generated.
make[5]: *** [/stuff/linux/scripts/Makefile.build:252: arch/riscv/kernel/ve=
ctor.o] Error 1

:/

--p/O4FNRjX/eMHP3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+DJgAKCRB4tDGHoIJi
0lLaAP0QW27CObwxtZceLleA+ttTHug+obavwVf9fnbqudDIDgD/c2lWRU+FHw9l
XNDDmCOabPEYhZ1A/vaSPygpCtElZQg=
=bTyP
-----END PGP SIGNATURE-----

--p/O4FNRjX/eMHP3j--


--===============0952632627611596000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0952632627611596000==--

