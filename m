Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0809CC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmNm610j6cWCPFT4gXxnCpyg927aiiid992ksl8IaJk=; b=1IDtwHPzCtlHgiZju+UZ0BYN4T
	Yi+Ia291NCK6u/57F83nBEvnwOktUnYYFCPY8GE4Al12FcFXJ5VzaOshPy6DHz/3i4ULPbMXtTMrz
	5XVwBtLMWU+otpxXFMrlnCwZ0OwVPRZY8EeWXeXz+KErhz4zQhMHD95Pk6P4lIBEDrIl4cm0qBUMj
	5jLDhkXamh59FwA2UeV1xNTR22zDHovvZa64UC2dUo3BbfPq6MhFqg1FYEzD4orl8iUxvl14E5y/k
	bgL59xXbq3k8ei0OApXKhDbMWD+vqJJJInXRQDVPcfp0jZDWhpWbjYWIlcOjDYXbWgcc3jJafGyMd
	atpE+xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXU5z-0005DQ-8u; Wed, 01 Mar 2023 21:34:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXU5w-0005CG-ID; Wed, 01 Mar 2023 21:34:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1283C6142D;
	Wed,  1 Mar 2023 21:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6DCC433EF;
	Wed,  1 Mar 2023 21:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677706479;
	bh=ig3Hl3nEpWU8/6DTitC4SLqyY6r2VKOxYmzoDEYw5Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7/qFped6BFkAhwq8aIEJkFaj2VUXZuQC8mgKvVGiSMzeUb2HPLlgpLovW3lb0+1R
	 BVuOo0CjTFEzUiVvJgGOs33kQ/eKbrQ/Yi6mtPLZTicM/L9bodlr4yCP72z37mU89s
	 I3QQTAJqoxYKe5tPWU9MzuakcUEwEdh7H2ivqgKEzo3s7180Vsa3R+jULvBtzux/vR
	 AvAXNwThZk87ZRjCXGP3pUOwjWqvdMeqcF8CLYIyqUaMQ9S050D1UdHeocN456r5Wm
	 LiTxsYD3He8qOLtFOgyIsXgfjHW3LJcDu1br+dz6ozv75cQzSVs4EqYQfsmrdKNn0V
	 Si+4OXiUIccTQ==
Date: Wed, 1 Mar 2023 21:34:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, ShihPo Hung <shihpo.hung@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH -next v14 16/19] riscv: prevent stack corruption by
 reserving task_pt_regs(p) early
Message-ID: <d20d93b0-a36f-41e0-aa4d-8525caca7fb5@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-17-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-17-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_133440_732302_52CED206 
X-CRM114-Status: GOOD (  20.03  )
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
Content-Type: multipart/mixed; boundary="===============5225209675231809882=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5225209675231809882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NGS829YiPh9QiuzW"
Content-Disposition: inline


--NGS829YiPh9QiuzW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy
On Fri, Feb 24, 2023 at 05:01:15PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Early function calls, such as setup_vm, relocate_enable_mmu,

Here, and elsewhere in the series, please append the () to functions in
commit text.

> soc_early_init etc, are free to operate on stack. However,
> PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
> reserved for the placement of per-task register context pointed by
> task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
> the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
> tests, treating the kernel to save V context before V was actually
> allocated, resulting in a kernel panic.
>=20
> Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
> calls from the top-level assembly.
>=20
> Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/head.S | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index e16bb2185d55..11c3b94c4534 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -301,6 +301,7 @@ clear_bss_done:
>  	la tp, init_task
>  	la sp, init_thread_union + THREAD_SIZE
>  	XIP_FIXUP_OFFSET sp
> +	addi sp, sp, -PT_SIZE_ON_STACK
>  #ifdef CONFIG_BUILTIN_DTB
>  	la a0, __dtb_start
>  	XIP_FIXUP_OFFSET a0
> @@ -318,6 +319,7 @@ clear_bss_done:
>  	/* Restore C environment */
>  	la tp, init_task
>  	la sp, init_thread_union + THREAD_SIZE
> +	addi sp, sp, -PT_SIZE_ON_STACK

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--NGS829YiPh9QiuzW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY//E6QAKCRB4tDGHoIJi
0gIeAP47Q3iTPP/wbfPgD3XmUbXTwv5fVRKeyc6wKddNiLcobAEAiajdMX1TNBfm
Owh93zEEyBj/ENwFB2HjBlakLoxH3Ag=
=VuoZ
-----END PGP SIGNATURE-----

--NGS829YiPh9QiuzW--


--===============5225209675231809882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5225209675231809882==--

