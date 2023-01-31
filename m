Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89838C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=be7mMSTij74m8vk+dTZwdBVTpbbUOMD7Pf1edo5HJLw=; b=ZT6ob0j876M53FkmHasDDkmPzv
	1iBd8GVspNwfpYLWBl0jJqjx4eCEsBxvBpPQdjyOJRcFRQLSFiJszbz3CtBJB1ovx1p3H+J0Hxuh9
	JOzWaiO+wznlhfWfxcyzWzu3qH5v7GHk4wnhDjCdv4a9NJYs0fKCbYEf/uu8Ei22M2nXhuFdKn1eG
	k+MiWzG/+uu3kW3gJggEh+Wm/PJQUGTndxIc1a8sRuTsyyFyHiuqacMI+hdfjcp7tphsZOGZKMv1N
	f7wlz5d0YB+8BftPnfs62PPvNzoiZD/fTsOVwVRB6EIO5/H1wY6c2vDCGGsFdUxvwVCqsy3JkRBg4
	b/NXYNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlPz-006cGj-5p; Tue, 31 Jan 2023 07:51:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlPu-006cFq-Qs
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 07:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675151459; x=1706687459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEYpzWsqXeG2kt3ZV9Y8atrc/7sYS0UcUWG1ZHvmLcI=;
  b=z/gidQglGb8+8FSaZWPiECHy899jMCJl4FXOwCizILe4L5ol8vd2d9gx
   oPr6zd3Dr9g56iiUqLLdQP6y3RV+LptwyRrjLFosoU24EYae7ATUA80F4
   YvPcQGjkRSLPjhanv4uteimDQFCCjoTxT8+nJu3v58NmsICUbViLA6wdR
   VMekExuKBGIIBLEEXcQKEL/b1Qcwqq7nXUp7SZzBGCD9tc+BdzfsqW9Mo
   4Z1FMLH1Pqfa7rcce02Mw7lVjZLpkISsHUf+H//jxG2HxRc6SHeOq/fEJ
   tJq+Hg1U14DWzRVhSyGEII16ONGuzz35o9eibvst3M11di7fjfehB1JDV
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,259,1669100400"; 
   d="asc'?scan'208";a="194585332"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2023 00:50:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 00:50:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 31 Jan 2023 00:50:44 -0700
Date: Tue, 31 Jan 2023 07:50:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Changbin Du <changbin.du@huawei.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hui Wang <hw.huiwang@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Changbin
 Du <changbin.du@gmail.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v3] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <Y9jIPOLxRRrjMo2t@wendy>
References: <20230130232659.3374212-1-changbin.du@huawei.com>
 <Y9fdtcoh8POLZ6CD@wendy>
 <CAJF2gTQm_iHHEOEv+38G6nqjDO5b+oDcUOXi8uKxZLXvG249Kw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQm_iHHEOEv+38G6nqjDO5b+oDcUOXi8uKxZLXvG249Kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_235059_003682_8144CEC4 
X-CRM114-Status: GOOD (  41.88  )
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
Content-Type: multipart/mixed; boundary="===============7915509092539152725=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7915509092539152725==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3SGwvimAJZ7frTLb"
Content-Disposition: inline

--3SGwvimAJZ7frTLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2023 at 03:26:33PM +0800, Guo Ren wrote:
> On Mon, Jan 30, 2023 at 11:10 PM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> >
> > Hey Changbin,
> >
> > On Tue, Jan 31, 2023 at 07:26:59AM +0800, Changbin Du wrote:
> > > From: Changbin Du <changbin.du@gmail.com>
> > >
> > > The task of ftrace_arch_code_modify(_post)_prepare() caller is
> > > stop_machine, whose caller and work thread are of different tasks. The
> > > lockdep checker needs the same task context, or it's wrong. That means
> > > it's a bug here to use lockdep_assert_held because we don't guarantee
> > > the same task context.
> > >
> > > kernel/locking/lockdep.c:
> > > int __lock_is_held(const struct lockdep_map *lock, int read)
> > > {
> > >         struct task_struct *curr = current;
> > >         int i;
> > >
> > >         for (i = 0; i < curr->lockdep_depth; i++) {
> > >                       ^^^^^^^^^^^^^^^^^^^
> > >                 struct held_lock *hlock = curr->held_locks + i;
> > >                                         ^^^^^^^^^^^^^^^^
> > >                 if (match_held_lock(hlock, lock)) {
> > >                         if (read == -1 || !!hlock->read == read)
> > >                                 return LOCK_STATE_HELD;
> > >
> > > The __lock_is_held depends on current held_locks records; if
> > > stop_machine makes the checker runing on another task, that's wrong.
> > >
> > > Here is the log:
> > > [   15.761523] ------------[ cut here ]------------
> > > [   15.762125] WARNING: CPU: 0 PID: 15 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x72/0x364
> > > [   15.763258] Modules linked in:
> > > [   15.764154] CPU: 0 PID: 15 Comm: migration/0 Not tainted 6.1.0-rc1-00014-g66924be85884-dirty #377
> > > [   15.765339] Hardware name: riscv-virtio,qemu (DT)
> > > [   15.765985] Stopper: multi_cpu_stop+0x0/0x192 <- stop_cpus.constprop.0+0x90/0xe2
> > > [   15.766711] epc : patch_insn_write+0x72/0x364
> > > [   15.767011]  ra : patch_insn_write+0x70/0x364
> > > [   15.767276] epc : ffffffff8000721e ra : ffffffff8000721c sp : ff2000000067bca0
> > > [   15.767622]  gp : ffffffff81603f90 tp : ff60000002432a00 t0 : 7300000000000000
> > > [   15.767919]  t1 : 0000000000000000 t2 : 73695f6b636f6c5f s0 : ff2000000067bcf0
> > > [   15.768238]  s1 : 0000000000000008 a0 : 0000000000000000 a1 : 0000000000000000
> > > [   15.768537]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> > > [   15.768837]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
> > > [   15.769139]  s2 : ffffffff80009faa s3 : ff2000000067bd10 s4 : ffffffffffffffff
> > > [   15.769447]  s5 : 0000000000000001 s6 : 0000000000000001 s7 : 0000000000000003
> > > [   15.769740]  s8 : 0000000000000002 s9 : 0000000000000004 s10: 0000000000000003
> > > [   15.770027]  s11: 0000000000000002 t3 : 0000000000000000 t4 : ffffffff819af097
> > > [   15.770323]  t5 : ffffffff819af098 t6 : ff2000000067ba28
> > > [   15.770574] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> > > [   15.771102] [<ffffffff80007520>] patch_text_nosync+0x10/0x3a
> > > [   15.771421] [<ffffffff80009c66>] ftrace_update_ftrace_func+0x74/0x10a
> > > [   15.771704] [<ffffffff800fa17e>] ftrace_modify_all_code+0xb0/0x16c
> > > [   15.771958] [<ffffffff800fa24c>] __ftrace_modify_code+0x12/0x1c
> > > [   15.772196] [<ffffffff800e110e>] multi_cpu_stop+0x14a/0x192
> > > [   15.772454] [<ffffffff800e0a34>] cpu_stopper_thread+0x96/0x14c
> > > [   15.772699] [<ffffffff8003f4ea>] smpboot_thread_fn+0xf8/0x1cc
> > > [   15.772945] [<ffffffff8003ac9c>] kthread+0xe2/0xf8
> > > [   15.773160] [<ffffffff80003e98>] ret_from_exception+0x0/0x14
> > > [   15.773471] ---[ end trace 0000000000000000 ]---
> >
> > FWIW, you can always crop the [15.192321] stuff out of commit messages,
> > as it just adds noise.
> >
> > > By the way, this also fixes the same issue for patch_text().
> > >
> > > Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> > > Co-developed-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Zong Li <zong.li@sifive.com>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > > ---
> > > Changes in v3:
> > >  - denote this also fixes function patch_text().
> > >
> > > Changes in v2:
> > >  - Rewrite commit log with lockdep explanation [Guo Ren]
> > >  - Rebase on v6.1 [Guo Ren]
> > >
> > > v1:
> > > https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
> > > ---
> > >  arch/riscv/kernel/patch.c | 7 -------
> > >  1 file changed, 7 deletions(-)
> > >
> > > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > > index 765004b60513..8619706f8dfd 100644
> > > --- a/arch/riscv/kernel/patch.c
> > > +++ b/arch/riscv/kernel/patch.c
> > > @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
> > >       bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> > >       int ret;
> > >
> > > -     /*
> > > -      * Before reaching here, it was expected to lock the text_mutex
> > > -      * already, so we don't need to give another lock here and could
> > > -      * ensure that it was safe between each cores.
> > > -      */
> > > -     lockdep_assert_held(&text_mutex);
> >
> > I must admit, patches like this do concern me a little, as a someone
> > unfamiliar with the world of probing and tracing.
> > Seeing an explicit check that the lock was held, leads me to believe
> > that the original author (Zong Li I think) thought that the text_mutex
> > lock was insufficient.
> > Do you think that their fear is unfounded? Explaining why it is safe to
> > remove this assertion in the commit message would go a long way towards
> > easing my anxiety!
> >
> > Also, why delete the comment altogether? The comment provides some
> > information that doesn't appear to become invalid, even with the
> > assertion removed?
> Stop_machine separated the mutex context and made a lockdep warning.
> So text_mutex can't be used here. We need to find another check
> solution. I agree with the patch.

Whether or not you agree with the change is not the point (with your SoB
I'd hope you agree with it).
I understand that you two are trying to fix a false positive lockdep
warning, but what I am asking for an explanation as to why the original
author's fear is unfounded.
Surely, having added the assertion, they were not thinking of the same
code path that you guys are hitting the false positive on?

Perhaps Zong themselves can tell us what the original fear was?

Thanks,
Conor.

--3SGwvimAJZ7frTLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9jIMAAKCRB4tDGHoIJi
0g8ZAQCMmO+5DxVrDdkolU3lOfOo1Lc2GAa8MC5DI2raeusTpQD+Mr0ePFOFe9K0
7GH3kdLzbxc/6iZ8Mgy+iOjkFMn1Zg4=
=yPOO
-----END PGP SIGNATURE-----

--3SGwvimAJZ7frTLb--


--===============7915509092539152725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7915509092539152725==--

