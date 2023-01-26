Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B16C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 21:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2EF4oZxyOvBlRExbr8GFufdDoyQn7WgxgrXiXuDPSY=; b=j2jnEoByZ/xZLptqoUDMNV326Z
	lklPWV9wxolYAdoG0G1TWJAljnzdF+Mf2G1ySsJb2K3Qm1q5RXsQWbQTpWacWyrAMAeqYpa4V4uHA
	C4iyuGBb4LqtKXR2A0eN7P2P6IILw72ND8JWfb8TnvPkRzEzAaK+PPzTzCXPzriWlQ/v9uOF4zQEg
	n4RtDvIh8mh34p6+N7d1bkvO61oJ7kMJGveSytP6xBVaRGREFtjXA8TC9OPwAPBi0xu+HWyvzj99w
	yXPMusrk3vtMU6uii+Ua0cOVckt7OdwnfKQEML0iiYah8QVKB84JZ8+OXNcMVx/yQu6QQDZyl2n95
	qHuHmZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLA3E-00Ccos-LA; Thu, 26 Jan 2023 21:44:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLA38-00CcoF-ER; Thu, 26 Jan 2023 21:44:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1B8E61953;
	Thu, 26 Jan 2023 21:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BF8C4339B;
	Thu, 26 Jan 2023 21:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674769488;
	bh=xyqDfL1JGPMf1a5wwoJLuSjiH0eKBEc/Vbbvcw4rKKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlSqOEB//BF9YSpkrCceSFhFUcdkSDiLZ5BUaNeH6RJbJchug2nlDGFSRCO0l9jaG
	 36la2Lkdc7plVGRg32A3wSy0OrVu2bEQD3k7BdiX/xcXD5lWsriHIlxIWmF1WrIrSp
	 uKMgJiG9i46y2JVLK98NFkocZcBLymnMjuAC/cSN/dCrQMuyRatMrCr4NbtKKElobZ
	 4aw69KbURbvWTDEFDAsMIWyeM5h4vEu/2E87D9QqxsBPpFd1vc2015FKQNpSKO2E//
	 VaRETdQ469xh416XrA3q7Xks2emMr9JSBeRedR6MoMbzYqqBN8taIHhhLfQh7/zzyE
	 X0+0xyCUQP8FQ==
Date: Thu, 26 Jan 2023 21:44:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v13 09/19] riscv: Add task switch support for vector
Message-ID: <Y9L0SXMpWWi9L1Ty@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-10-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-10-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_134452_875555_561710A1 
X-CRM114-Status: GOOD (  25.99  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Nick Knight <nick.knight@sifive.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, anup@brainfault.org, Ruinland Tsai <ruinland.tsai@sifive.com>, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Dmitry Vyukov <dvyukov@google.com>, Vincent Chen <vincent.chen@sifive.com>, palmer@dabbelt.com, "Eric W. Biederman" <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5854509910921525156=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5854509910921525156==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KW2ZVp0Ro7F03E3R"
Content-Disposition: inline


--KW2ZVp0Ro7F03E3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:46PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch adds task switch support for vector. It also supports all
> lengths of vlen.
>=20
> [guoren@linux.alibaba.com: First available porting to support vector
> context switching]
> [nick.knight@sifive.com: Rewrite vector.S to support dynamic vlen, xlen a=
nd
> code refine]
> [vincent.chen@sifive.com: Fix the might_sleep issue in vstate_save,
> vstate_restore]
> [andrew@sifive.com: Optimize task switch codes of vector]
> [ruinland.tsai@sifive.com: Fix the arch_release_task_struct free wrong
> datap issue]
> [vineetg: Fixed lkp warning with W=3D1 build]
> [andy.chiu: Use inline asm for task switches]
>=20
> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

More comments about what people did than patch description, lol!

Anyways, this patch breaks the build for every config we have, so please
fix that when you are re-submitting:
https://patchwork.kernel.org/project/linux-riscv/patch/20230125142056.18356=
-10-andy.chiu@sifive.com/

Any of allmodconfig, rv32_defconfig, nommu_{k210,virt}_defconfig should
reproduce with gcc 12.2 - but I have no idea if it's the same same
failures for all 4.

> ---
>  arch/riscv/include/asm/processor.h   |  1 +
>  arch/riscv/include/asm/switch_to.h   | 18 ++++++++++++++++++
>  arch/riscv/include/asm/thread_info.h |  3 +++
>  arch/riscv/include/asm/vector.h      | 26 ++++++++++++++++++++++++++
>  arch/riscv/kernel/process.c          | 18 ++++++++++++++++++
>  arch/riscv/kernel/traps.c            | 14 ++++++++++++--
>  6 files changed, 78 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 94a0590c6971..44d2eb381ca6 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -39,6 +39,7 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> +	struct __riscv_v_state vstate;

__riscv_d_ext_state
__riscv_v_state

:thinking: These should ideally match, probably no harm in adding the
_ext to the v one, no?

> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 549bde5c970a..1a48ff89b2b5 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -24,6 +24,7 @@
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/thread_info.h>
> +#include <asm/vector.h>
> =20
>  int show_unhandled_signals =3D 1;
> =20
> @@ -111,8 +112,17 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>  	SIGBUS, BUS_ADRALN, "instruction address misaligned");
>  DO_ERROR_INFO(do_trap_insn_fault,
>  	SIGSEGV, SEGV_ACCERR, "instruction access fault");
> -DO_ERROR_INFO(do_trap_insn_illegal,
> -	SIGILL, ILL_ILLOPC, "illegal instruction");
> +
> +asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_=
regs *regs)
> +{
> +	if (has_vector() && user_mode(regs)) {
> +		if (rvv_first_use_handler(regs))

And there's your build error, as this function is only added in the next
patch.

Thanks,
Conor.

> +			return;
> +	}
> +	do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
> +		      "Oops - illegal instruction");
> +}


--KW2ZVp0Ro7F03E3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9L0SQAKCRB4tDGHoIJi
0tn4AP9v/yFBusYIxwKebvK4EVn1R/J/I88SedlTaR3LarX/9gD/Sfb4BD7eMv+a
b7Pt9ZKUlwSisCZxGA5AilyvuWwEKQc=
=LGoc
-----END PGP SIGNATURE-----

--KW2ZVp0Ro7F03E3R--


--===============5854509910921525156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5854509910921525156==--

