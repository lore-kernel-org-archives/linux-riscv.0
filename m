Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97968C64ED6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVt2b+XSF0nJy+24he1GVzpRyGik0+qirzBqqFiOa0Q=; b=HMNfY++MRFGjmEMwvkw2/r+unn
	WoEJpRjFOfHRJolvGrqgBhWGl9UfIikCLHNvRtJMkhfDngs5C5IBWRDQs1j5FZkFN0+uv6cXNguEY
	ONjf1wIiGQSoSXteGeBpuTkSyUBo/y6Oiu9JjUESaz3inHgsEFXXOSR8sCHNEE/kLPcPq47G5bph6
	7rS97ksweOTsf+pkGMAhu0eTMWpVwnvyAFe0qNIatt/FAKl8CV9izOWNrsbNT2oAR7KALjaZTr9mw
	ujpvkEpssIV3qn5JC4eiLmFL+lQisGFdCLJ6und3qr6RZcgMJLJd4/++8BrlQP/V2q87bYWz/zpSX
	Lz61CBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPWM-00Grvg-Fk; Wed, 01 Mar 2023 16:41:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPWJ-00Grun-9O; Wed, 01 Mar 2023 16:41:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DE5F61378;
	Wed,  1 Mar 2023 16:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4CEC433D2;
	Wed,  1 Mar 2023 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677688893;
	bh=ilPyVms7UIryzUrsM+Np2EOsRlnOLEbdK14JoDx6MHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZB2LKzs0qUuWleTcmnuFpnEw+hlWFu9WoeeuL4gkBxjwroXZqmgQrPJNzPqmxmvO
	 TbAOXuyW1zc88FVsU9fCZzF1hiAc3Wome0J20NP8ncOzQaU8avaY6r7p6PoqERvCLW
	 7F8ihTWRaonHmO0F+3TU11JMwGj7elzjJ8pGcNjgI/nwkSko1t8hekP3DFDORmRnBJ
	 U29y/Rkgf8ni9UYchTXuttVGAuqELf7/Y6XL6TXBI8bASrkQXm+YEr/tmH82h4j07f
	 783v1PolzJahYVs8StciNeV0VViA8DjWSaUtyE37FxaI7OjikLwMaZeaROIWFRGXHx
	 n2Z7clJ4qc+Jw==
Date: Wed, 1 Mar 2023 16:41:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v14 09/19] riscv: Add task switch support for vector
Message-ID: <Y/+AN0e5netDShxx@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-10-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-10-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_084135_452140_8DD0213E 
X-CRM114-Status: GOOD (  20.30  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Nick Knight <nick.knight@sifive.com>, anup@brainfault.org, Ruinland Tsai <ruinland.tsai@sifive.com>, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Dmitry Vyukov <dvyukov@google.com>, Vincent Chen <vincent.chen@sifive.com>, palmer@dabbelt.com, "Eric W. Biederman" <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0628216857028275479=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0628216857028275479==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6+DehdO2+y0/dUdA"
Content-Disposition: inline


--6+DehdO2+y0/dUdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Fri, Feb 24, 2023 at 05:01:08PM +0000, Andy Chiu wrote:
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
> [vincent.chen@sifive.com: Fix the might_sleep issue in riscv_v_vstate_sav=
e,
> riscv_v_vstate_restore]
> [andrew@sifive.com: Optimize task switch codes of vector]
> [ruinland.tsai@sifive.com: Fix the arch_release_task_struct free wrong
> datap issue]
> [vineetg: Fixed lkp warning with W=3D1 build]
> [andy.chiu: Use inline asm for task switches]

Can we *please* get rid of these silly changelogs in the commit messages?
Either someone did something worthy of being a co-developer on the
patch, or this belongs under the --- line.
It's a bit ridiculous I think to have a 15 word commit message for the
patch, but have like 8 different bits of per-version changelogs...

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
> ---
>  arch/riscv/include/asm/processor.h   |  1 +
>  arch/riscv/include/asm/switch_to.h   |  3 ++
>  arch/riscv/include/asm/thread_info.h |  3 ++
>  arch/riscv/include/asm/vector.h      | 43 ++++++++++++++++++++++++++--
>  arch/riscv/kernel/process.c          | 18 ++++++++++++
>  5 files changed, 66 insertions(+), 2 deletions(-)

> @@ -118,6 +154,9 @@ static __always_inline bool has_vector(void) { return=
 false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return f=
alse; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 do {} while (0)
> +#define riscv_v_vstate_save(task, regs)		do {} while (0)
> +#define riscv_v_vstate_restore(task, regs)	do {} while (0)
> +#define __switch_to_vector(__prev, __next)	do {} while (0)
>  #define riscv_v_vstate_off(regs)		do {} while (0)
>  #define riscv_v_vstate_on(regs)			do {} while (0)

While you're at it, you pay as well tab out all the do {} while (0) so
that they align. That's my OCD showing though.

Other than my complaint about the changelogs, this looks grand.

Thanks,
Conor.

--6+DehdO2+y0/dUdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+ANAAKCRB4tDGHoIJi
0iomAQDpMp3VqnpVdvJ/tHxRv8rBb8uA3DTLsMTxyXoU5vx3PgEA8PfYfPho/7xr
PGvH3ug2iAYIbBSLhqlULA0e+uVRnwA=
=dxbL
-----END PGP SIGNATURE-----

--6+DehdO2+y0/dUdA--


--===============0628216857028275479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0628216857028275479==--

