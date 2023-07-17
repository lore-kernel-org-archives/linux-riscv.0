Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A57DEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfCS0sYQ2VmK1xdJtaJdQ/oHJlAseqN2kMi/wrU8yOg=; b=40++IAcc10SQ36vAlX/JjY8hvO
	deEAbLVclOHS8osCghHG/KaYfTiX2tcRh64Nchh/xE6T+P/NjYFo4R4Yry3nmyAaSFA9FY1Akazmq
	l4JNdPVcMs4GSTTcOkqnfifnYynfrQupF3Ay5mnTefwg/xiBjIKaijVHyoNfHwQ7fPPVFfJNGRbVQ
	JDAWfU27j1YwiqHOn3voRJahFJZ5WGHpVwdCnsknl4PuQiBFG6h7TbyY5kiF6iWaCBJuRo/CV6Mev
	77eWMjU9tSa9U9fS/1fZS3NpCOuebxCVCWrROsDYStG+E3Kc2WEGDAkYPzeuJl58rtELRiLUBjF98
	sNhxbHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLXc-003lJU-2j;
	Mon, 17 Jul 2023 10:33:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLXU-003lIa-2p
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 10:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689589993; x=1721125993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUSmMlA6l2fmmMgtM8qupCoIXevCTRgenxJUm/kCesU=;
  b=1u3vdJA4rdQ9yWng5qrnlq/S36VQjNZ+ICmN0UyKTQ3NFkp6vTzuxIO8
   7dXaVUxH54mRiTg8nMm6qrIoe5qtn5f+isu+sGo/ZbC/nHsyMOfRtGGDI
   F281t34YGJy1UdnsoLQI//AUAKxgUnFJKW0IGz8jk98lKXMPW32Aykkc1
   qag4vYU+5hLrAW/WCfdmK0DS+iw1KVEEEibQ3KactkN5DMV7qCAeoUErR
   5TXYoYzSNNmW1Sp5gqnpvhhExsnMWEnK1ooFh57RxqGFJD490HhKAT2xT
   veUtYbtPUOUGTKLbsHJlxDhNlblaePlx0Pj4/5sPq3PgWxcs4evptpVJW
   w==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="220708874"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 03:33:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 03:33:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 03:33:02 -0700
Date: Mon, 17 Jul 2023 11:32:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>, Guo Ren
	<guoren@kernel.org>, Yipeng Zou <zouyipeng@huawei.com>, Huacai Chen
	<chenhuacai@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Mathis Salmen
	<mathis.salmen@matsal.de>, Andrew Bresticker <abrestic@rivosinc.com>
Subject: Re: [v1, 4/6] riscv: vector: do not pass task_struct into
 riscv_v_vstate_{save,restore}()
Message-ID: <20230717-igloo-poncho-ede3baa98110@wendy>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
 <20230715150032.6917-5-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230715150032.6917-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_033312_978375_B106D2F0 
X-CRM114-Status: GOOD (  21.34  )
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
Content-Type: multipart/mixed; boundary="===============6381657652842339059=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6381657652842339059==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HXFWgjJ7RW52Wp8V"
Content-Disposition: inline

--HXFWgjJ7RW52Wp8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 15, 2023 at 03:00:30PM +0000, Andy Chiu wrote:
> riscv_v_vstate_{save,restore}() can operate only on the knowlege of
> struct __riscv_v_ext_state, and struct pt_regs. Let the caller decides
> which should be passed into the function. Meanwhile, the kernel-mode
> Vector is going to introduce another vstate, so this also makes functions
> potentially able to be reused.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Breaks the build chief:
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'
=2E./arch/riscv/include/asm/vector.h:199:41: error: incompatible type for a=
rgument 1 of 'riscv_v_vstate_save'

rv64 allmodconfig w/ gcc.

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/entry-common.h  |  2 +-
>  arch/riscv/include/asm/vector.h        | 14 +++++---------
>  arch/riscv/kernel/kernel_mode_vector.c |  2 +-
>  arch/riscv/kernel/ptrace.c             |  2 +-
>  arch/riscv/kernel/signal.c             |  2 +-
>  5 files changed, 9 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/a=
sm/entry-common.h
> index 52926f4d8d7c..aa1b9e50d6c8 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -12,7 +12,7 @@ static inline void arch_exit_to_user_mode_prepare(struc=
t pt_regs *regs,
>  {
>  	if (ti_work & _TIF_RISCV_V_DEFER_RESTORE) {
>  		clear_thread_flag(TIF_RISCV_V_DEFER_RESTORE);
> -		riscv_v_vstate_restore(current, regs);
> +		riscv_v_vstate_restore(&current->thread.vstate, regs);
>  	}
>  }
> =20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 9831b19153ae..50c556afd95a 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -163,23 +163,19 @@ static inline void riscv_v_vstate_discard(struct pt=
_regs *regs)
>  	__riscv_v_vstate_dirty(regs);
>  }
> =20
> -static inline void riscv_v_vstate_save(struct task_struct *task,
> +static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstat=
e,
>  				       struct pt_regs *regs)
>  {
>  	if ((regs->status & SR_VS) =3D=3D SR_VS_DIRTY) {
> -		struct __riscv_v_ext_state *vstate =3D &task->thread.vstate;
> -
>  		__riscv_v_vstate_save(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
>  	}
>  }
> =20
> -static inline void riscv_v_vstate_restore(struct task_struct *task,
> +static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vs=
tate,
>  					  struct pt_regs *regs)
>  {
>  	if ((regs->status & SR_VS) !=3D SR_VS_OFF) {
> -		struct __riscv_v_ext_state *vstate =3D &task->thread.vstate;
> -
>  		__riscv_v_vstate_restore(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
>  	}
> @@ -200,7 +196,7 @@ static inline void __switch_to_vector(struct task_str=
uct *prev,
>  	struct pt_regs *regs;
> =20
>  	regs =3D task_pt_regs(prev);
> -	riscv_v_vstate_save(prev, regs);
> +	riscv_v_vstate_save(prev->thread.vstate, regs);
>  	riscv_v_vstate_set_restore(next, task_pt_regs(next));
>  }
> =20
> @@ -218,8 +214,8 @@ static inline bool riscv_v_vstate_query(struct pt_reg=
s *regs) { return false; }
>  static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false=
; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_vstate_discard(regs)		do {} while (0)
> -#define riscv_v_vstate_save(task, regs)		do {} while (0)
> -#define riscv_v_vstate_restore(task, regs)	do {} while (0)
> +#define riscv_v_vstate_save(vstate, regs)	do {} while (0)
> +#define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
>  #define __switch_to_vector(__prev, __next)	do {} while (0)
>  #define riscv_v_vstate_off(regs)		do {} while (0)
>  #define riscv_v_vstate_on(regs)			do {} while (0)
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> index c0c152c501a5..30f1b861cac0 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -91,7 +91,7 @@ int kernel_rvv_begin(void)
>  		return -EPERM;
> =20
>  	/* Save vector state, if any */
> -	riscv_v_vstate_save(current, task_pt_regs(current));
> +	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
> =20
>  	/* Acquire kernel mode vector */
>  	get_cpu_vector_context();
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 1d572cf3140f..85e7167245cc 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -99,7 +99,7 @@ static int riscv_vr_get(struct task_struct *target,
>  	 * copying them to membuf.
>  	 */
>  	if (target =3D=3D current)
> -		riscv_v_vstate_save(current, task_pt_regs(current));
> +		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
> =20
>  	/* Copy vector header from vstate. */
>  	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 0fca2c128b5f..75fd8cc05e10 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -86,7 +86,7 @@ static long save_v_state(struct pt_regs *regs, void __u=
ser **sc_vec)
>  	/* datap is designed to be 16 byte aligned for better performance */
>  	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
> =20
> -	riscv_v_vstate_save(current, regs);
> +	riscv_v_vstate_save(&current->thread.vstate, regs);
>  	/* Copy everything of vstate but datap. */
>  	err =3D __copy_to_user(&state->v_state, &current->thread.vstate,
>  			     offsetof(struct __riscv_v_ext_state, datap));
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--HXFWgjJ7RW52Wp8V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUYvQAKCRB4tDGHoIJi
0nHvAP914arHbuDURcVqAk3tG2nKAMvfZx92yVeSf7RdPpzSOQD/QuXU8JcWGiHB
eYLrAYT+rRGOKW3gjJIxmh7kqwmDYAQ=
=+bJ5
-----END PGP SIGNATURE-----

--HXFWgjJ7RW52Wp8V--


--===============6381657652842339059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6381657652842339059==--

