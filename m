Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ACFC05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/NbTlnc4cHtTQKt9DSli4q3v+Uadiz4YAGnI4sakc8=; b=qAvdwCBqHEOUduqFJr9+x8EJ+m
	22eCNbnQmIFNkzIXTqkJzswXE48mBfNHubftD/XZLZhDeHsYcLA9IwET2DOKmWZh/uI+LpJFvo2o3
	+mYkUneMxqty1849N7kzBfDIMAmCHNAufz4ViJHDHZo1mqg8k/yYFosNz0f2kisWWQ7kmkG//gCZX
	fcECFyG+GJL8DjNKwasW6zcAlFYGiQuOTrL24aGYiRG77wIDizkVb7H2b2bFTAlopAcql0TI9iLDR
	1+hG9DsfrIjhdXJ9d371KB275fxWqwWl5zc2TMR5CPQ/6q1aA4WmoBID8c7Wa8nNHgvlW9oJLFSxG
	+y1n7PUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5Z8-0042yZ-1m; Wed, 15 Feb 2023 00:22:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5Z4-0042xP-5d
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:22:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8E666B81F71;
	Wed, 15 Feb 2023 00:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A7EC433D2;
	Wed, 15 Feb 2023 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676420543;
	bh=eJkD9W/AbhdZZvu56hhtgijrudKqphBNpTK3MVykL7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgEOEVVIQX5DYodku9Kr0QA7wV9XaU+JvzxjqVb0FKTjVlyeSRDCiPIKYYGy2ubWn
	 2U0u6RtU4EkrUdJHXoZ/On7SinFDS6VpC2BxnN/AcuS3pGNFPTNTHBuSnczk18PILh
	 ccojlJ/NTJkBSmRhVg1bADjMN/R7D+rO9q2l8MDD+NnfBN55Ju45hm03nraeL65zft
	 vUqMlEgh2RhLGwGJzkqHVZGuKBeKZrIY0C6Mg6BPmpSAMXuavpoUpBXtm5kYDhShNA
	 mrWWtZF8kDsnzTytlC5mV7bM5eX399ubF14ZzeUApClLQYtErQz0T2UOWRajF+jtHK
	 PbBdGfur53gPA==
Date: Wed, 15 Feb 2023 00:22:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Changbin Du <changbin.du@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hui Wang <hw.huiwang@huawei.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v4] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <Y+wlula69tYrSZjQ@spud>
References: <20230202114116.3695793-1-changbin.du@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230202114116.3695793-1-changbin.du@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_162226_540470_AFF51DC6 
X-CRM114-Status: GOOD (  31.84  )
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
Content-Type: multipart/mixed; boundary="===============3263712621364953650=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3263712621364953650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WkuUbfOnrC+6zab3"
Content-Disposition: inline


--WkuUbfOnrC+6zab3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Changbin,

On Thu, Feb 02, 2023 at 07:41:16PM +0800, Changbin Du wrote:
> The task of ftrace_arch_code_modify(_post)_prepare() caller is
> stop_machine, whose caller and work thread are of different tasks. The
> lockdep checker needs the same task context, or it's wrong. That means
> it's a bug here to use lockdep_assert_held because we don't guarantee
> the same task context.
>=20
> kernel/locking/lockdep.c:
> int __lock_is_held(const struct lockdep_map *lock, int read)
> {
>         struct task_struct *curr =3D current;
>         int i;
>=20
>         for (i =3D 0; i < curr->lockdep_depth; i++) {
> 			^^^^^^^^^^^^^^^^^^^
>                 struct held_lock *hlock =3D curr->held_locks + i;
> 					  ^^^^^^^^^^^^^^^^
>                 if (match_held_lock(hlock, lock)) {
>                         if (read =3D=3D -1 || !!hlock->read =3D=3D read)
>                                 return LOCK_STATE_HELD;
>=20
> The __lock_is_held depends on current held_locks records; if
> stop_machine makes the checker running on another task, that's wrong.
>=20
> Here is the log:
> [   15.761523] ------------[ cut here ]------------
> [   15.762125] WARNING: CPU: 0 PID: 15 at arch/riscv/kernel/patch.c:63 pa=
tch_insn_write+0x72/0x364
> [   15.763258] Modules linked in:
> [   15.764154] CPU: 0 PID: 15 Comm: migration/0 Not tainted 6.1.0-rc1-000=
14-g66924be85884-dirty #377
> [   15.765339] Hardware name: riscv-virtio,qemu (DT)
> [   15.765985] Stopper: multi_cpu_stop+0x0/0x192 <- stop_cpus.constprop.0=
+0x90/0xe2
> [   15.766711] epc : patch_insn_write+0x72/0x364
> [   15.767011]  ra : patch_insn_write+0x70/0x364
> [   15.767276] epc : ffffffff8000721e ra : ffffffff8000721c sp : ff200000=
0067bca0
> [   15.767622]  gp : ffffffff81603f90 tp : ff60000002432a00 t0 : 73000000=
00000000
> [   15.767919]  t1 : 0000000000000000 t2 : 73695f6b636f6c5f s0 : ff200000=
0067bcf0
> [   15.768238]  s1 : 0000000000000008 a0 : 0000000000000000 a1 : 00000000=
00000000
> [   15.768537]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 00000000=
00000000
> [   15.768837]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 00000000=
00000000
> [   15.769139]  s2 : ffffffff80009faa s3 : ff2000000067bd10 s4 : ffffffff=
ffffffff
> [   15.769447]  s5 : 0000000000000001 s6 : 0000000000000001 s7 : 00000000=
00000003
> [   15.769740]  s8 : 0000000000000002 s9 : 0000000000000004 s10: 00000000=
00000003
> [   15.770027]  s11: 0000000000000002 t3 : 0000000000000000 t4 : ffffffff=
819af097
> [   15.770323]  t5 : ffffffff819af098 t6 : ff2000000067ba28
> [   15.770574] status: 0000000200000100 badaddr: 0000000000000000 cause: =
0000000000000003
> [   15.771102] [<ffffffff80007520>] patch_text_nosync+0x10/0x3a
> [   15.771421] [<ffffffff80009c66>] ftrace_update_ftrace_func+0x74/0x10a
> [   15.771704] [<ffffffff800fa17e>] ftrace_modify_all_code+0xb0/0x16c
> [   15.771958] [<ffffffff800fa24c>] __ftrace_modify_code+0x12/0x1c
> [   15.772196] [<ffffffff800e110e>] multi_cpu_stop+0x14a/0x192
> [   15.772454] [<ffffffff800e0a34>] cpu_stopper_thread+0x96/0x14c
> [   15.772699] [<ffffffff8003f4ea>] smpboot_thread_fn+0xf8/0x1cc
> [   15.772945] [<ffffffff8003ac9c>] kthread+0xe2/0xf8
> [   15.773160] [<ffffffff80003e98>] ret_from_exception+0x0/0x14
> [   15.773471] ---[ end trace 0000000000000000 ]---
>=20
> By the way, this also fixes the same issue for patch_text().

Given this lockdep stuff seems to have pointed out that we weren't
taking the lock for alternative patching just this past week [1], I'm
really not convinced that deleting this is a good idea.

Thanks,
Conor.

1 - https://patchwork.kernel.org/project/linux-riscv/patch/20230212194735.4=
91785-1-conor@kernel.org/

>=20
> Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Zong Li <zong.li@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
> Changes in v4:
>  - preserve and update comments.
>=20
> Changes in v3:
>  - denote this also fixes function patch_text().
>=20
> Changes in v2:
>  - Rewrite commit log with lockdep explanation [Guo Ren]
>  - Rebase on v6.1 [Guo Ren]
>=20
> v1:
> https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@g=
mail.com/
> ---
>  arch/riscv/kernel/ftrace.c |  5 ++---
>  arch/riscv/kernel/patch.c  | 15 ++++++++-------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 2086f6585773..f73660e73822 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -126,9 +126,8 @@ int ftrace_make_nop(struct module *mod, struct dyn_ft=
race *rec,
>  /*
>   * This is called early on, and isn't wrapped by
>   * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't=
 hold
> - * text_mutex, which triggers a lockdep failure.  SMP isn't running so w=
e could
> - * just directly poke the text, but it's simpler to just take the lock
> - * ourselves.
> + * text_mutex. SMP isn't running so we could just directly poke the text=
, but
> + * it's simpler to just take the lock ourselves.
>   */
>  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  {
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..8eb243703efe 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -49,19 +49,20 @@ static void patch_unmap(int fixmap)
>  }
>  NOKPROBE_SYMBOL(patch_unmap);
> =20
> +/*
> + * Before reaching here, it was expected to lock the text_mutex
> + * already, so we don't need to give another lock here and could
> + * ensure that it was safe between each cores. We do not add
> + * lockdep assertion here since it would trigger a false positive
> + * when called by stop_machine (The lockdep checker requires the
> + * same task context).
> + */
>  static int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>  	void *waddr =3D addr;
>  	bool across_pages =3D (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SI=
ZE;
>  	int ret;
> =20
> -	/*
> -	 * Before reaching here, it was expected to lock the text_mutex
> -	 * already, so we don't need to give another lock here and could
> -	 * ensure that it was safe between each cores.
> -	 */
> -	lockdep_assert_held(&text_mutex);
> -
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);
> =20
> --=20
> 2.25.1
>=20

--WkuUbfOnrC+6zab3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+wlugAKCRB4tDGHoIJi
0tEdAQDCk0GoSZIq2hLA5IPoLAur8UbX6Kz0sPg9vuXQZkkABQD+JTDT6T8aRDnD
h9/lKCNM4RJkoLBjnjs7ZXBhCt7W+wc=
=obS5
-----END PGP SIGNATURE-----

--WkuUbfOnrC+6zab3--


--===============3263712621364953650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3263712621364953650==--

