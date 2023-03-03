Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3280C6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 00:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7Y5xsGsOU/RKdDSZamVlnR7eVxnpcUSm+ylEDhr8oU=; b=Y09q15+HeFd2D85a71SRZliyYi
	0X9afijd93MLc1kOWMjLSazIdlpP23uWzmv35qCialZP+vErR3UKaql4FJtyRLxYD2A1q9J5iNMqz
	jmsPEI2Jtd9uBFJtJ3JyLCch5dnh82lbugI4qDm/hGW8N+XxdtWXLM80+5trbRjRfis9MBwr4rU+S
	/VbC360BJ+mhampTbvLaOp8ZnhuKlbrAsbZ2RlRPvLxKFHiyNR/kchf0GHLg/jPQNOkOjjl49ecKx
	85vQ6YNSUcPGDqAWmQsvDr4rfH/FH+5zbDt/jJTEY8ix9BH4tPLSUAqyaqOXTtSpjsSRLLWFrKK8H
	+S0U5u9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtBW-003pm1-Cf; Fri, 03 Mar 2023 00:22:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtBT-003pko-KC
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 00:22:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AB527B815B8;
	Fri,  3 Mar 2023 00:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA40FC433EF;
	Fri,  3 Mar 2023 00:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677802916;
	bh=Iot4NAkPu+mPo9V+OoiKhV7wLqbwyEvNwQoB+Vsfqvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzFx/yGXrESsoC6nzmB8ungB95oxWyxKxmSNFD1myD8IGLTPTkoX5an6WmQB6KeSr
	 oawBmROdD9TNiPX+Jry8llNz2JW/lfZc+ZsSpygQ6Hq5T0r1UcgNan68UHlIbUs1c6
	 eA4lymLRYq2DYjGGoC76vz5T4nW18FGjOva7FptH3GfA8seb+2fHq7plhTQsfT8Z5/
	 L/F5swfUH0f0tcDAi6Dy3wZIwf3lc3mxb/QDO7xxJMFW8tBpP0BVJZUZqTaCl0NdFI
	 /0sNjhDkt4jYH56FwGiy7xIWKxYf04Fc9K98XcRqNiv9exLHz+PvEQ63P7K/UZ5fX7
	 OPmDY9HvIbytA==
Date: Fri, 3 Mar 2023 00:21:52 +0000
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
	linux-riscv@lists.infradead.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Changbin Du <changbin.du@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <7d7af200-ddf6-4dbd-940c-cd7ce2a3338a@spud>
References: <20230301223853.1444332-1-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230301223853.1444332-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_162204_004940_2DE08AC1 
X-CRM114-Status: GOOD (  28.30  )
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
Content-Type: multipart/mixed; boundary="===============0341868052357184603=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0341868052357184603==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZsWVi+CRQn/H7yC6"
Content-Disposition: inline


--ZsWVi+CRQn/H7yC6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2023 at 10:38:53PM +0000, Conor Dooley wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>=20
> We're currently using stop_machine() to update ftrace & kprobes, which
> means that the thread that takes text_mutex during may not be the same
> as the thread that eventually patches the code.  This isn't actually a
> race because the lock is still held (preventing any other concurrent
> accesses) and there is only one thread running during stop_machine(),
> but it does trigger a lockdep failure.
>=20
> This patch just elides the lockdep check during stop_machine.
>=20
> Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support")
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Reported-by: Changbin Du <changbin.du@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v3 [<20230215164317.727657-1-conor@kernel.org>]:
> * rename the flag to riscv_patch_in_stop_machine as it is being used for
>   kprobes & ftrace, and just looked a bit odd.
> * implement Changbin's suggestion of checking the lock is held in
>   patch_text(), rather than set the flag in callers of patch_text().
>=20
> Changes since v2 [<20220322022331.32136-1-palmer@rivosinc.com>]:
> * rebase on riscv/for-next as it as been a year.
> * incorporate Changbin's suggestion that init_nop should take the lock
>   rather than call prepare() & post_process().
>=20
> Changes since v1 [<20210506071041.417854-1-palmer@dabbelt.com>]:
> * Use ftrace_arch_ocde_modify_{prepare,post_process}() to set the flag.
>   I remember having a reason I wanted the function when I wrote the v1,
>   but it's been almost a year and I forget what that was -- maybe I was
>   just crazy, the patch was sent at midnight.
> * Fix DYNAMIC_FTRACE=3Dn builds.

> @@ -121,13 +129,25 @@ NOKPROBE_SYMBOL(patch_text_cb);
> =20
>  int patch_text(void *addr, u32 insn)
>  {
> +	int ret;
>  	struct patch_insn patch =3D {
>  		.addr =3D addr,
>  		.insn =3D insn,
>  		.cpu_count =3D ATOMIC_INIT(0),
>  	};
> =20
> -	return stop_machine_cpuslocked(patch_text_cb,
> -				       &patch, cpu_online_mask);
> +	/*
> +	 * kprobes takes text_mutex, before calling patch_text(), but as we call
> +	 * calls stop_machine(), the lockdep assertion in patch_insn_write()
> +	 * gets confused by the context in which the lock is taken.
> +	 * Instead, ensure the lock is held before calling stop_machine(), and
> +	 * set riscv_patch_in_stop_machine to skip the check in
> +	 * patch_insn_write().
> +	 */
> +	lockdep_assert_held(&text_mutex);
> +	riscv_patch_in_stop_machine =3D true;
> +	ret =3D stop_machine_cpuslocked(patch_text_cb, &patch, cpu_online_mask);
> +	riscv_patch_in_stop_machine =3D false;
> +	return ret;

*sigh*, automation reports that this is not possible:
=2E./arch/riscv/kernel/patch.c:153:30: error: expression is not assignable
        riscv_patch_in_stop_machine =3D true;
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
=2E./arch/riscv/kernel/patch.c:155:30: error: expression is not assignable
        riscv_patch_in_stop_machine =3D false;
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^

The rest of the patch (in the commit context) uses this variable inside
ftrace code, but as this one is in patch.c, it's compiled in whether or
not we have ftrace etc. On rv32 & nommu defconfigs, that results in a
build failure:
https://patchwork.kernel.org/project/linux-riscv/patch/20230301223853.14443=
32-1-conor@kernel.org/

A respin is in order...

--ZsWVi+CRQn/H7yC6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAE9oAAKCRB4tDGHoIJi
0m/2AP9hDTldt/2pBd5dlFkVBGKuXG6JNewj15fuT8tpMwnCgwD9HO/Bwm3OZPBt
Yu+ukD2p/rVNOl+xx9t8/cyHCiZbTQQ=
=Iz+q
-----END PGP SIGNATURE-----

--ZsWVi+CRQn/H7yC6--


--===============0341868052357184603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0341868052357184603==--

