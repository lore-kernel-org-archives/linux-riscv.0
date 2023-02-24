Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CA3C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FdvgsruCqykwPwk+DMijZpZIdvPyOycqLaF72ITdlg=; b=uEL2ikTvPC3OUzG1c2dVLfPzYl
	0VNGeAI2Oq/m63CIkCWUGecFUQkGRGe0/HdhOxpq0IYpdVi5MEuB49rn19cz04KaAxaphgGcE2DLg
	cSVojh0kTy/9DDx1zcd1qjWZP7LjPuE7cmzdneBHKknRRX8+6HzcdQthqmMay2tsPSUuRwpQ0fgyg
	ClqLzFlgeMT4bRFWFYbwjHRYrx5eASglmGmiwODiIguZme1fON+Jor4iFhQUNXM9xQj3c7oYB11l6
	3jOQGHY+uavSDlWpWHNrOe8962zRgf/Zb5o5ZsZXoRElnGq6ZhLypcGUKucQU8ItQyPV62DZ2LrCz
	H4kHto4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVw8-002BnM-Jj; Fri, 24 Feb 2023 11:08:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVw5-002BlO-4G
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 11:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677236900; x=1708772900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DMCXTMe4oV50E85uap9w6csM3AzaSqzKKkA7hgvfXFI=;
  b=ew+59eKL7+c7FGqTffaGsev/ZYwPKUE9KJD2/TvlwQaWGJHVSdPMNPeO
   8csoviRHRTz88XZ1x2CDWqfqcGwMGW35ryAVojVp6j/HN6Xd6t7vjYqQs
   9rdLKyx27rsJU8uVq9ZJ73vmD7BOw3czEFDydQAZsUoUJmXn8AoXEMQ+E
   jUr6Kx7Ld0tFT0i5pQAKEXPF4FBLFqFHy7bJd0hRx/Qdp/alMYwCgVy35
   qrkjqdoB6w60QpBaHXJ60LwjZybDFz+P58mVjz/BaoLx7/pbAzDfIcJq0
   YnfZcxVKO+PcHYIWq6FfLlq0DTzWbVJAzN0rCdq2Q2o4nCupd4rf+Lotj
   A==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="asc'?scan'208";a="202234574"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 04:08:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 04:08:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 04:08:09 -0700
Date: Fri, 24 Feb 2023 11:07:42 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Changbin Du <changbin.du@huawei.com>
CC: Conor Dooley <conor@kernel.org>, <palmer@dabbelt.com>, Palmer Dabbelt
	<palmerdabbelt@google.com>, <linux-riscv@lists.infradead.org>, Steven Rostedt
	<rostedt@goodmis.org>, Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt
	<palmer@rivosinc.com>
Subject: Re: [PATCH v3] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <Y/iafgRdYtWCmQZ2@wendy>
References: <20230215164317.727657-1-conor@kernel.org>
 <20230216113126.kio4uqovoo4p6ubm@M910t>
MIME-Version: 1.0
In-Reply-To: <20230216113126.kio4uqovoo4p6ubm@M910t>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_030821_310361_26A486E4 
X-CRM114-Status: GOOD (  44.10  )
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
Content-Type: multipart/mixed; boundary="===============2058375448647815319=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2058375448647815319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zh3dtgAMuW4Zo9IM"
Content-Disposition: inline

--Zh3dtgAMuW4Zo9IM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 07:31:26PM +0800, Changbin Du wrote:
> On Wed, Feb 15, 2023 at 04:43:17PM +0000, Conor Dooley wrote:
> > From: Palmer Dabbelt <palmerdabbelt@google.com>
> >=20
> > We're currently using stop_machine() to update ftrace, which means that
> > the thread that takes text_mutex during ftrace_prepare() may not be the
> > same as the thread that eventually patches the code.  This isn't
> > actually a race because the lock is still held (preventing any other
> > concurrent accesses) and there is only one thread running during
> > stop_machine(), but it does trigger a lockdep failure.
> >=20
> > This patch just elides the lockdep check during stop_machine.
> >=20
> > Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support=
")
> > Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> > Reported-by: Changbin Du <changbin.du@gmail.com>
> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Resending this version as I am quite averse to deleting the assertion!
> >=20
> > Changes since v2 [<20220322022331.32136-1-palmer@rivosinc.com>]:
> > * rebase on riscv/for-next as it as been a year.
> > * incorporate Changbin's suggestion that init_nop should take the lock
> >   rather than call prepare() & post_process().
> >=20
> > Changes since v1 [<20210506071041.417854-1-palmer@dabbelt.com>]:
> > * Use ftrace_arch_ocde_modify_{prepare,post_process}() to set the flag.
> >   I remember having a reason I wanted the function when I wrote the v1,
> >   but it's been almost a year and I forget what that was -- maybe I was
> >   just crazy, the patch was sent at midnight.
> > * Fix DYNAMIC_FTRACE=3Dn builds.
> > ---
> >  arch/riscv/include/asm/ftrace.h |  7 +++++++
> >  arch/riscv/kernel/ftrace.c      | 15 +++++++++++++--
> >  arch/riscv/kernel/patch.c       | 10 +++++++++-
> >  3 files changed, 29 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/f=
trace.h
> > index 04dad3380041..3ac7609f4ee9 100644
> > --- a/arch/riscv/include/asm/ftrace.h
> > +++ b/arch/riscv/include/asm/ftrace.h
> > @@ -81,8 +81,15 @@ do {									\
> >  struct dyn_ftrace;
> >  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
> >  #define ftrace_init_nop ftrace_init_nop
> > +extern int riscv_ftrace_in_stop_machine;
> >  #endif
> > =20
> > +#else /* CONFIG_DYNAMIC_FTRACE */
> > +
> > +#ifndef __ASSEMBLY__
> > +#define riscv_ftrace_in_stop_machine 0
> >  #endif
> > =20
> > +#endif /* CONFIG_DYNAMIC_FTRACE */
> > +
> >  #endif /* _ASM_RISCV_FTRACE_H */
> > diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> > index 2086f6585773..661bfa72f359 100644
> > --- a/arch/riscv/kernel/ftrace.c
> > +++ b/arch/riscv/kernel/ftrace.c
> > @@ -11,14 +11,25 @@
> >  #include <asm/cacheflush.h>
> >  #include <asm/patch.h>
> > =20
> > +int riscv_ftrace_in_stop_machine;
> > +
> >  #ifdef CONFIG_DYNAMIC_FTRACE
> >  void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
> >  {
> >  	mutex_lock(&text_mutex);
> > +
> > +	/*
> > +	 * The code sequences we use for ftrace can't be patched while the
> > +	 * kernel is running, so we need to use stop_machine() to modify them
> > +	 * for now.  This doesn't play nice with text_mutex, we use this flag
> > +	 * to elide the check.
> > +	 */
> > +	riscv_ftrace_in_stop_machine =3D true;
> >  }
> > =20
> >  void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
> >  {
> > +	riscv_ftrace_in_stop_machine =3D false;
> >  	mutex_unlock(&text_mutex);
> >  }
> > =20
> > @@ -134,9 +145,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_=
ftrace *rec)
> >  {
> >  	int out;
> > =20
> > -	ftrace_arch_code_modify_prepare();
> > +	mutex_lock(&text_mutex);
> >  	out =3D ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> > -	ftrace_arch_code_modify_post_process();
> > +	mutex_unlock(&text_mutex);
> > =20
> >  	return out;
> >  }
> > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > index 765004b60513..56b70271518d 100644
> > --- a/arch/riscv/kernel/patch.c
> > +++ b/arch/riscv/kernel/patch.c
> > @@ -11,6 +11,7 @@
> >  #include <asm/kprobes.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/fixmap.h>
> > +#include <asm/ftrace.h>
> >  #include <asm/patch.h>
> > =20
> >  struct patch_insn {
> > @@ -59,8 +60,15 @@ static int patch_insn_write(void *addr, const void *=
insn, size_t len)
> >  	 * Before reaching here, it was expected to lock the text_mutex
> >  	 * already, so we don't need to give another lock here and could
> >  	 * ensure that it was safe between each cores.
> > +	 *
> > +	 * We're currently using stop_machine() for ftrace, and while that
> > +	 * ensures text_mutex is held before installing the mappings it does
> > +	 * not ensure text_mutex is held by the calling thread.  That's safe
> > +	 * but triggers a lockdep failure, so just elide it for that specific
> > +	 * case.
> >  	 */
> > -	lockdep_assert_held(&text_mutex);
> > +	if (!riscv_ftrace_in_stop_machine)
> > +		lockdep_assert_held(&text_mutex);
> > =20
> >  	if (across_pages)
> >  		patch_map(addr + len, FIX_TEXT_POKE1);
> This misses this function.
>=20
> int patch_text(void *addr, u32 insn)

So, with a corresponding rename to the symbol, does the following look
okay to you?

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/=
kprobes.c
index f21592d20306..433b454e693f 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -27,9 +27,15 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe=
 *p)
=20
 	p->ainsn.api.restore =3D (unsigned long)p->addr + offset;
=20
+	/*
+	 * kprobes takes text_mutex, but patch_text() calls stop_machine and
+	 * lockdep gets confused by the context in which the lock is taken.
+	 */
+	riscv_patch_in_stop_machine =3D true;
 	patch_text(p->ainsn.api.insn, p->opcode);
 	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
 		   __BUG_INSN_32);
+	riscv_patch_in_stop_machine =3D false;
 }
=20
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
@@ -96,16 +102,28 @@ void *alloc_insn_page(void)
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
+	/*
+	 * kprobes takes text_mutex, but patch_text() calls stop_machine and
+	 * lockdep gets confused by the context in which the lock is taken.
+	 */
+	riscv_patch_in_stop_machine =3D true;
 	if ((p->opcode & __INSN_LENGTH_MASK) =3D=3D __INSN_LENGTH_32)
 		patch_text(p->addr, __BUG_INSN_32);
 	else
 		patch_text(p->addr, __BUG_INSN_16);
+	riscv_patch_in_stop_machine =3D false;
 }
=20
 /* remove breakpoint from text */
 void __kprobes arch_disarm_kprobe(struct kprobe *p)
 {
+	/*
+	 * kprobes takes text_mutex, but patch_text() calls stop_machine and
+	 * lockdep gets confused by the context in which the lock is taken.
+	 */
+	riscv_patch_in_stop_machine =3D true;
 	patch_text(p->addr, p->opcode);
+	riscv_patch_in_stop_machine =3D false;
 }
=20
 void __kprobes arch_remove_kprobe(struct kprobe *p)

--Zh3dtgAMuW4Zo9IM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/iafgAKCRB4tDGHoIJi
0r+kAQDkslf97CFCevVYoHU26k3n4u4UHGtdALwNT3P6GYB02AD6Az9axmjrx56x
EPiivKk+OD4k2gyznH+bS2jDa9EjYAM=
=HabL
-----END PGP SIGNATURE-----

--Zh3dtgAMuW4Zo9IM--


--===============2058375448647815319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2058375448647815319==--

