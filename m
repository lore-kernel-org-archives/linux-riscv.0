Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E73C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w37yqCbH6GBCrEBKB7gpZCkLcmj9Ce66lD/1eywdQE=; b=hEqRYIjdSREYxL
	ZyRyTUom9d1VhNovZ8BMxnHE3YsHXuGWobVgoeRp3PxqTAdgO/pldvcfj5IScdaLTK0rblZEN2JzG
	dQbzQhtyNbKQmGxWtXfJV3iq2k98KoLr/JwwuMCEbt6kMI7plqmB6Mbi6lRY9t2Nc92spv3OkMVfL
	kS6OEJa9ablzpbZhtW61HeLE1fV4tLyGekvkHc8n1OFb27Ptfbkn0u1ll6t5g0+0XQsvfrmGRiV6o
	VEG3IrD6mylcaM7971uuJLpYbO/W0XlulBFffqZ6FSvgfzwgqZTADuDua5H72DY0NQ/ocj6TzAdqR
	0T5/lGabomFjv4JDLhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obmRr-0057ve-Tg; Fri, 23 Sep 2022 17:26:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obmRo-0057uF-4y
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 17:26:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A80262932;
	Fri, 23 Sep 2022 17:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE93CC433D6;
	Fri, 23 Sep 2022 17:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663954000;
	bh=ODCjxTzT6V3bEUbRpV1MKpDP+b83Jok/oox8PGujGiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKyMP4wlwmWY62qTQnQJVpuRT9HxR1GMppItCoi8ql/yW+8WXqJLkL70vHtsxTrjY
	 GEAsoHvcEmOxPY6IDBg1OaMPV6QiKLK5RTrlEfFk565mm8LELe05+ywr8XDSr2cHyY
	 bHeC3fGFiqkHHMV0Se1i3zLCWRq2QTB7cK8y6JmRXWTZH9iZjNvGCgbTAjlnenPFH7
	 hvecFl6Ps6kH7eYmd/NC6Zw3Y3SL9wuwCs869Ycg5PFmeTzxJVjKJeR+QYeQqH1AiR
	 6fkFtMbZULW4sXq+NdliwYf5+AVyo1mCtfotaLxj3ibpUkELMCx91exyrYs2SLJoLa
	 DThJoiaXjzMew==
Date: Fri, 23 Sep 2022 18:26:35 +0100
From: Conor Dooley <conor@kernel.org>
To: l3b2w1@gmail.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
	davem@davemloft.net, mhiramat@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] rethook: add riscv rethook implementation.
Message-ID: <Yy3sSzPK20IvaIVP@spud>
References: <YyxG6wC0mjCUUGDB@wendy>
 <20220922134428.19203-1-l3b2w1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220922134428.19203-1-l3b2w1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_102644_313579_45CEBA72 
X-CRM114-Status: GOOD (  28.88  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hey Binglei Wang,

I don't know anything about rethooks, so just more minor comments from
me. Don't respin until someone more knowledgable comes back with a
review of the patch itself.

Please send new versions of the patch as a new mail thread & not as
a reply to the existing one.

On Thu, Sep 22, 2022 at 09:44:28PM +0800, l3b2w1@gmail.com wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> =

> Implement the kretprobes function on riscv arch by
> using rethook machenism which abstracts general kretprobe info
                ^mechanism
> into the struct rethook_node
> to be embedded in the struct kretprobe_instance

Whenever you resend, please fix the line wrapping here too.

> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>

Again, your first version of the patch used your work email as the
commit author/signer. The sending email does not need to match your
authorship/signature email so is there a reason not to have your h3c
email here?
Thanks,
Conor.

> ---
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/kernel/probes/Makefile             |  1 +
>  arch/riscv/kernel/probes/kprobes.c            |  8 --
>  arch/riscv/kernel/probes/kprobes_trampoline.S | 73 +----------------
>  arch/riscv/kernel/probes/kprobes_trampoline.h | 79 +++++++++++++++++++
>  arch/riscv/kernel/probes/rethook.c            | 24 ++++++
>  arch/riscv/kernel/probes/rethook_trampoline.S | 22 ++++++
>  include/linux/kprobes.h                       |  6 ++
>  8 files changed, 134 insertions(+), 80 deletions(-)
>  create mode 100644 arch/riscv/kernel/probes/kprobes_trampoline.h
>  create mode 100644 arch/riscv/kernel/probes/rethook.c
>  create mode 100644 arch/riscv/kernel/probes/rethook_trampoline.S
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4..c5cae0825 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -97,6 +97,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_MOVE_PMD
>  	select HAVE_MOVE_PUD
>  	select HAVE_PCI
> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes=
/Makefile
> index 7f0840dcc..ee345e7e9 100644
> --- a/arch/riscv/kernel/probes/Makefile
> +++ b/arch/riscv/kernel/probes/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_KPROBES)		+=3D kprobes.o decode-insn.o simul=
ate-insn.o
>  obj-$(CONFIG_KPROBES)		+=3D kprobes_trampoline.o
>  obj-$(CONFIG_KPROBES_ON_FTRACE)	+=3D ftrace.o
>  obj-$(CONFIG_UPROBES)		+=3D uprobes.o decode-insn.o simulate-insn.o
> +obj-$(CONFIG_RETHOOK) 		+=3D rethook.o rethook_trampoline.o
>  CFLAGS_REMOVE_simulate-insn.o =3D $(CC_FLAGS_FTRACE)
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probe=
s/kprobes.c
> index e6e950b7c..04911cc42 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -350,14 +350,6 @@ void __kprobes __used *trampoline_probe_handler(stru=
ct pt_regs *regs)
>  	return (void *)kretprobe_trampoline_handler(regs, NULL);
>  }
>  =

> -void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
> -				      struct pt_regs *regs)
> -{
> -	ri->ret_addr =3D (kprobe_opcode_t *)regs->ra;
> -	ri->fp =3D NULL;
> -	regs->ra =3D (unsigned long) &__kretprobe_trampoline;
> -}
> -
>  int __kprobes arch_trampoline_kprobe(struct kprobe *p)
>  {
>  	return 0;
> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/k=
ernel/probes/kprobes_trampoline.S
> index 7bdb09ded..54937f342 100644
> --- a/arch/riscv/kernel/probes/kprobes_trampoline.S
> +++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
> @@ -2,78 +2,7 @@
>  /*
>   * Author: Patrick St=E4hlin <me@packi.ch>
>   */
> -#include <linux/linkage.h>
> -
> -#include <asm/asm.h>
> -#include <asm/asm-offsets.h>
> -
> -	.text
> -	.altmacro
> -
> -	.macro save_all_base_regs
> -	REG_S x1,  PT_RA(sp)
> -	REG_S x3,  PT_GP(sp)
> -	REG_S x4,  PT_TP(sp)
> -	REG_S x5,  PT_T0(sp)
> -	REG_S x6,  PT_T1(sp)
> -	REG_S x7,  PT_T2(sp)
> -	REG_S x8,  PT_S0(sp)
> -	REG_S x9,  PT_S1(sp)
> -	REG_S x10, PT_A0(sp)
> -	REG_S x11, PT_A1(sp)
> -	REG_S x12, PT_A2(sp)
> -	REG_S x13, PT_A3(sp)
> -	REG_S x14, PT_A4(sp)
> -	REG_S x15, PT_A5(sp)
> -	REG_S x16, PT_A6(sp)
> -	REG_S x17, PT_A7(sp)
> -	REG_S x18, PT_S2(sp)
> -	REG_S x19, PT_S3(sp)
> -	REG_S x20, PT_S4(sp)
> -	REG_S x21, PT_S5(sp)
> -	REG_S x22, PT_S6(sp)
> -	REG_S x23, PT_S7(sp)
> -	REG_S x24, PT_S8(sp)
> -	REG_S x25, PT_S9(sp)
> -	REG_S x26, PT_S10(sp)
> -	REG_S x27, PT_S11(sp)
> -	REG_S x28, PT_T3(sp)
> -	REG_S x29, PT_T4(sp)
> -	REG_S x30, PT_T5(sp)
> -	REG_S x31, PT_T6(sp)
> -	.endm
> -
> -	.macro restore_all_base_regs
> -	REG_L x3,  PT_GP(sp)
> -	REG_L x4,  PT_TP(sp)
> -	REG_L x5,  PT_T0(sp)
> -	REG_L x6,  PT_T1(sp)
> -	REG_L x7,  PT_T2(sp)
> -	REG_L x8,  PT_S0(sp)
> -	REG_L x9,  PT_S1(sp)
> -	REG_L x10, PT_A0(sp)
> -	REG_L x11, PT_A1(sp)
> -	REG_L x12, PT_A2(sp)
> -	REG_L x13, PT_A3(sp)
> -	REG_L x14, PT_A4(sp)
> -	REG_L x15, PT_A5(sp)
> -	REG_L x16, PT_A6(sp)
> -	REG_L x17, PT_A7(sp)
> -	REG_L x18, PT_S2(sp)
> -	REG_L x19, PT_S3(sp)
> -	REG_L x20, PT_S4(sp)
> -	REG_L x21, PT_S5(sp)
> -	REG_L x22, PT_S6(sp)
> -	REG_L x23, PT_S7(sp)
> -	REG_L x24, PT_S8(sp)
> -	REG_L x25, PT_S9(sp)
> -	REG_L x26, PT_S10(sp)
> -	REG_L x27, PT_S11(sp)
> -	REG_L x28, PT_T3(sp)
> -	REG_L x29, PT_T4(sp)
> -	REG_L x30, PT_T5(sp)
> -	REG_L x31, PT_T6(sp)
> -	.endm
> +#include "kprobes_trampoline.h"
>  =

>  ENTRY(__kretprobe_trampoline)
>  	addi sp, sp, -(PT_SIZE_ON_STACK)
> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.h b/arch/riscv/k=
ernel/probes/kprobes_trampoline.h
> new file mode 100644
> index 000000000..48895a5e3
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/kprobes_trampoline.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef _KPROBES_TRAMPOLINE_H
> +#define _KPROBES_TRAMPOLINE_H
> +/*
> + * Author: Patrick St=E4hlin <me@packi.ch>
> + */
> +#include <linux/linkage.h>
> +
> +#include <asm/asm.h>
> +#include <asm/asm-offsets.h>
> +
> +	.text
> +	.altmacro
> +
> +	.macro save_all_base_regs
> +	REG_S x1,  PT_RA(sp)
> +	REG_S x3,  PT_GP(sp)
> +	REG_S x4,  PT_TP(sp)
> +	REG_S x5,  PT_T0(sp)
> +	REG_S x6,  PT_T1(sp)
> +	REG_S x7,  PT_T2(sp)
> +	REG_S x8,  PT_S0(sp)
> +	REG_S x9,  PT_S1(sp)
> +	REG_S x10, PT_A0(sp)
> +	REG_S x11, PT_A1(sp)
> +	REG_S x12, PT_A2(sp)
> +	REG_S x13, PT_A3(sp)
> +	REG_S x14, PT_A4(sp)
> +	REG_S x15, PT_A5(sp)
> +	REG_S x16, PT_A6(sp)
> +	REG_S x17, PT_A7(sp)
> +	REG_S x18, PT_S2(sp)
> +	REG_S x19, PT_S3(sp)
> +	REG_S x20, PT_S4(sp)
> +	REG_S x21, PT_S5(sp)
> +	REG_S x22, PT_S6(sp)
> +	REG_S x23, PT_S7(sp)
> +	REG_S x24, PT_S8(sp)
> +	REG_S x25, PT_S9(sp)
> +	REG_S x26, PT_S10(sp)
> +	REG_S x27, PT_S11(sp)
> +	REG_S x28, PT_T3(sp)
> +	REG_S x29, PT_T4(sp)
> +	REG_S x30, PT_T5(sp)
> +	REG_S x31, PT_T6(sp)
> +	.endm
> +
> +	.macro restore_all_base_regs
> +	REG_L x3,  PT_GP(sp)
> +	REG_L x4,  PT_TP(sp)
> +	REG_L x5,  PT_T0(sp)
> +	REG_L x6,  PT_T1(sp)
> +	REG_L x7,  PT_T2(sp)
> +	REG_L x8,  PT_S0(sp)
> +	REG_L x9,  PT_S1(sp)
> +	REG_L x10, PT_A0(sp)
> +	REG_L x11, PT_A1(sp)
> +	REG_L x12, PT_A2(sp)
> +	REG_L x13, PT_A3(sp)
> +	REG_L x14, PT_A4(sp)
> +	REG_L x15, PT_A5(sp)
> +	REG_L x16, PT_A6(sp)
> +	REG_L x17, PT_A7(sp)
> +	REG_L x18, PT_S2(sp)
> +	REG_L x19, PT_S3(sp)
> +	REG_L x20, PT_S4(sp)
> +	REG_L x21, PT_S5(sp)
> +	REG_L x22, PT_S6(sp)
> +	REG_L x23, PT_S7(sp)
> +	REG_L x24, PT_S8(sp)
> +	REG_L x25, PT_S9(sp)
> +	REG_L x26, PT_S10(sp)
> +	REG_L x27, PT_S11(sp)
> +	REG_L x28, PT_T3(sp)
> +	REG_L x29, PT_T4(sp)
> +	REG_L x30, PT_T5(sp)
> +	REG_L x31, PT_T6(sp)
> +	.endm
> +#endif
> diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probe=
s/rethook.c
> new file mode 100644
> index 000000000..47853bc36
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic return hook for riscv.
> + */
> +
> +#include <linux/kprobes.h>
> +#include <linux/rethook.h>
> +
> +/* This is called from arch_rethook_trampoline() */
> +unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *re=
gs)
> +{
> +	return rethook_trampoline_handler(regs, regs->s0);
> +}
> +NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
> +
> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs=
, bool mcount)
> +{
> +	rhn->ret_addr =3D regs->ra;
> +	rhn->frame =3D regs->s0;
> +
> +	/* replace return addr with trampoline */
> +	regs->ra =3D (u64)arch_rethook_trampoline;
> +}
> +NOKPROBE_SYMBOL(arch_rethook_prepare);
> diff --git a/arch/riscv/kernel/probes/rethook_trampoline.S b/arch/riscv/k=
ernel/probes/rethook_trampoline.S
> new file mode 100644
> index 000000000..e81c3d4e0
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook_trampoline.S
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Author: Patrick St=E4hlin <me@packi.ch>
> + */
> +#include "kprobes_trampoline.h"
> +
> +ENTRY(arch_rethook_trampoline)
> +	addi sp, sp, -(PT_SIZE_ON_STACK)
> +	save_all_base_regs
> +
> +	move a0, sp /* pt_regs */
> +
> +	call arch_rethook_trampoline_callback
> +
> +	/* use the result as the return-address */
> +	move ra, a0
> +
> +	restore_all_base_regs
> +	addi sp, sp, PT_SIZE_ON_STACK
> +
> +	ret
> +ENDPROC(arch_rethook_trampoline)
> diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
> index 55041d2f8..a3805b5b2 100644
> --- a/include/linux/kprobes.h
> +++ b/include/linux/kprobes.h
> @@ -210,6 +210,12 @@ static nokprobe_inline unsigned long get_kretprobe_r=
etaddr(struct kretprobe_inst
>  {
>  	return ri->node.ret_addr;
>  }
> +static nokprobe_inline
> +unsigned long kretprobe_trampoline_handler(struct pt_regs *regs,
> +					   void *frame_pointer)
> +{
> +	return 0;
> +}
>  #else
>  extern void arch_prepare_kretprobe(struct kretprobe_instance *ri,
>  				   struct pt_regs *regs);
> =

> base-commit: f30480cdeafc79d1f017d41335a96d8e3b973c91
> -- =

> 2.25.1
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
