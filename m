Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C513C76188
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn70NdYHgmUJvd8eDF41bIbi6tGHuJJDSheaCAIHVs=; b=KfaC2RVXBbjKZVivBKhhW8eeO9
	+ikemcdkdVSrkMjThhMKcms/IHyG8ZDM4YM1Qft6S5Z1lpDQ2Vb/R4+qbzEhy0EtzyJFK0+3v87qY
	DE/ksqE+P5FFgWB6GzUNxzejchWDykPl+EkA/zLPikWJ6wVxAoZs82wIQcwD7pAWmxzdep7WHjrAL
	tCF/HLZmEdTygGDdvt2dfvZvexYUXIrZs2pJkx3u3fNghBs2UmfBbFweF9GqHb4Bp+zGEKKsan+Qk
	AK0ox3Uoqpgj6FZ7/9rhSWj+igWCidRZ6w0/sRiaXo/BLI57GW70suESrNsIi2mjKJmD8Vv1NBUYO
	x1NBIY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMwA-00Fwbk-2g;
	Mon, 03 Apr 2023 16:21:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMw8-00FwbD-3A
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Apr 2023 16:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6afTO4oEQn+AHLNviC7P4YfdPdFleXN53RJrps7nDgM=; b=MORXeAtSRjXs1GHv0j0dWBw9PQ
	0a5ugtDxl3PRXku4evvnrAyHcjMrW/5sTFI4AajXOupLeGFmyh1unHyHNPmpJGqUTPfIpiH60BaIb
	rS+wJIyC7VhF8iQcs99lWwIABjZOodlb6TQTH7utwUQc/SX1B6i7ahUPhCVCA4SwsSiSspjctFWrX
	leVQ/3tQyM/Y5H2q0cD1jD6VUud4ZdxqN5xALmf93lAEG17DPPKuXgWj+UxGMbDDWNFzWGJuOqvMG
	X4L/aZJS0UYOs7wq75maNsVltZiD5uVzQXQ50H7SyUjVDorwNr5+fDUgGq7tYBAcQnGMPZ7FAKJKy
	tnR0CYFA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMw4-008vq0-38
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 16:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68E8762122;
	Mon,  3 Apr 2023 16:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723CBC433EF;
	Mon,  3 Apr 2023 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680538891;
	bh=s/h9BxcKiHCWDLpRMf/OxHcfV+3/cmpO+wdtHk8dx9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItTLRmpc/AKSD7fGCTzArFPVOVs1SdvwB4iP5dIPOx7YxjQFjLCxCB6H5P757Z28V
	 UJeH1fNjndM2vu0bFuSlGA99VEslIY01Vznl2H+fqiGQR//nBIG+MyMVnqC7IdwuSk
	 S2GDdtpfhKhCx6OzrhJfwOF7rl24AzReK4x7Lm24JO96e0P6iAR5RKPc7R7idrIDiH
	 CeSFMBuXf6GPzVwDaFJ3wBiRrY9WvNuRHFSRhlb7BQPVCZ0ApSiZG0AYoXswhe5CKM
	 G3TKTVXi9WoVP0LsqpUM7aLMnbz6eVwgsqUAbh62Essc/tl4GVwhBLUJaOxi21w0qB
	 2sadR7e3s7Uuw==
Date: Mon, 3 Apr 2023 17:21:27 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Yipeng Zou <zouyipeng@huawei.com>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] riscv: entry: Save a0 prior
 syscall_enter_from_user_mode()
Message-ID: <20230403-crisping-animosity-04ed8a45c625@spud>
References: <20230403065207.1070974-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230403065207.1070974-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_172137_412891_4640732E 
X-CRM114-Status: GOOD (  20.45  )
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
Content-Type: multipart/mixed; boundary="===============8798757650552518444=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8798757650552518444==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R7iREP1gQeGxJksL"
Content-Disposition: inline


--R7iREP1gQeGxJksL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 08:52:07AM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> The RISC-V calling convention passes the first argument, and the
> return value in the a0 register. For this reason, the a0 register
> needs some extra care; When handling syscalls, the a0 register is
> saved into regs->orig_a0, so a0 can be properly restored for,
> e.g. interrupted syscalls.
>=20
> This functionality was broken with the introduction of the generic
> entry patches. Here, a0 was saved into orig_a0 after calling
> syscall_enter_from_user_mode(), which can change regs->a0 for some
> paths, incorrectly restoring a0.
>=20
> This is resolved, by saving a0 prior doing the
> syscall_enter_from_user_mode() call.
>=20
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

As you pointed out, v12 did indeed have this ordering, so *deep breath*
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/linux-riscv/60ee7c26-1a70-427d-beaf-92e2989fc=
479@spud/
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for fixing this Bj=F6rn!
> ---
>  arch/riscv/kernel/traps.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 1f4e37be7eb3..8c258b78c925 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -270,11 +270,11 @@ asmlinkage __visible __trap_section void do_trap_ec=
all_u(struct pt_regs *regs)
>  	if (user_mode(regs)) {
>  		ulong syscall =3D regs->a7;
> =20
> -		syscall =3D syscall_enter_from_user_mode(regs, syscall);
> -
>  		regs->epc +=3D 4;
>  		regs->orig_a0 =3D regs->a0;
> =20
> +		syscall =3D syscall_enter_from_user_mode(regs, syscall);
> +
>  		if (syscall < NR_syscalls)
>  			syscall_handler(regs, syscall);
>  		else
>=20
> base-commit: d34a6b715a23ccd9c9d0bc7a475bea59dc3e28b2
> --=20
> 2.37.2
>=20

--R7iREP1gQeGxJksL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCr9AwAKCRB4tDGHoIJi
0uChAP9U8xmkAUQFANUtusPF/nQKVwoeUIJlqkQQzmUlIl6dZQEA2Rg5robA6oPH
5h312z8HKnb5QE9lXkT3WQea0531eQA=
=Ks/G
-----END PGP SIGNATURE-----

--R7iREP1gQeGxJksL--


--===============8798757650552518444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8798757650552518444==--

