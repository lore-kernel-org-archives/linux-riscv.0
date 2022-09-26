Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13326C6FA83
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qr9D5LSqqtHeETSxxwTy9wIsyeRGZVJcdyJA78krH3g=; b=M6MLcd0jGi9Vm9
	4/Kb4AFbyAHRObKhdTojTVJEP39c6iRcbPeOVt4Uprdp+rRav/cS91+H07XB7dWZI7ZEUJvYthQpt
	P0WiY9yj2dQVOrN71jBpNkonh/QZtn1ik59Mkvi4qcJ1hKCqz8csRpeYbKWwzI+b6uM75HoFGNjgw
	XTyYhkOwhwhnfiTKoazrjtCV2UcPPMsdwaXi8pIssn4sLDKHUH8mEwW7VOXVpU3pv0yZQlu9CdYr+
	u3lMOnB2MI3BTq6zbe41Y8u5VzYxyBZWjzoe5gbr/rarYbXc0ngkM4Yjp70YisWSKPsP6sXpL2Omg
	eIXobFRG0/QHbmU1geCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclEp-0043iv-CJ; Mon, 26 Sep 2022 10:21:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclBO-0041ec-Al
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 10:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664187470; x=1695723470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5JjJDXrkyUyXqGn1bmKBkBsCl7GSmQYPD4A5lM+cSo=;
  b=SjdQ1noHFddzfRt1CyTU7xbWYigpY0tdiVVj/Y0d/Dk2qH+V2EtPDuTo
   PIYXL0mQpc4bFFCZQELDrAzEuiXPlZsqRtNYeIa4R7vszZksEPsk+kILe
   qsckc0jKEO3b4qFuusu5TyoCw9+N/d2X760peysePgVX3DLc11IogRe49
   gh/p86L/OuggLOTFJhDaUkG6TdgejkrNRPKSHlw7bOuJGhhpMGjGmPDre
   iK9Ynrs76khAj4+aJ+R5Bp1Rstc17FQn50SWiLMPc+xIBRv58xZiMDsIl
   KydojJ3H8faHcfWMLuR3IiCSzZJZWgDLlemkPAwBSrGVx1smIZEwamSNh
   g==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="178886226"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2022 03:17:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 03:17:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 26 Sep 2022 03:17:43 -0700
Date: Mon, 26 Sep 2022 11:17:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binglei Wang <l3b2w1@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<naveen.n.rao@linux.ibm.com>, <anil.s.keshavamurthy@intel.com>,
	<davem@davemloft.net>, <mhiramat@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6] rethook: add riscv rethook implementation.
Message-ID: <YzF8MqouI96oBtJJ@wendy>
References: <20220926084136.629638-1-l3b2w1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926084136.629638-1-l3b2w1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_031750_539872_2AC249A3 
X-CRM114-Status: GOOD (  22.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 26, 2022 at 04:41:36PM +0800, Binglei Wang wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> 
> Implement the kretprobes on riscv arch by using rethook mechanism
> which abstracts general kretprobe info into a struct rethook_node
> to be embedded in the struct kretprobe_instance.
> 
> 1. remove arch dependent kretprobe implementation
> 2. replace __kretprobe_trampoline with arch_hook_trampoline
> 
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
> ---

What changed since v5? You need to put a changelog under the --- for
what changed in each revision.
Thanks,
Conor.

>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/kernel/probes/Makefile             |  2 +-
>  arch/riscv/kernel/probes/kprobes.c            | 13 ----------
>  arch/riscv/kernel/probes/rethook.c            | 26 +++++++++++++++++++
>  arch/riscv/kernel/probes/rethook.h            |  8 ++++++
>  ...obes_trampoline.S => rethook_trampoline.S} |  0
>  6 files changed, 36 insertions(+), 14 deletions(-)
>  create mode 100644 arch/riscv/kernel/probes/rethook.c
>  create mode 100644 arch/riscv/kernel/probes/rethook.h
>  rename arch/riscv/kernel/probes/{kprobes_trampoline.S => rethook_trampoline.S} (100%)
> 
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
> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
> index 7f0840dcc..9a96a7038 100644
> --- a/arch/riscv/kernel/probes/Makefile
> +++ b/arch/riscv/kernel/probes/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o simulate-insn.o
> -obj-$(CONFIG_KPROBES)		+= kprobes_trampoline.o
>  obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
>  obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
> +obj-$(CONFIG_KPROBES)		+= rethook.o rethook_trampoline.o
>  CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7c..f21592d20 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -345,19 +345,6 @@ int __init arch_populate_kprobe_blacklist(void)
>  	return ret;
>  }
>  
> -void __kprobes __used *trampoline_probe_handler(struct pt_regs *regs)
> -{
> -	return (void *)kretprobe_trampoline_handler(regs, NULL);
> -}
> -
> -void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
> -				      struct pt_regs *regs)
> -{
> -	ri->ret_addr = (kprobe_opcode_t *)regs->ra;
> -	ri->fp = NULL;
> -	regs->ra = (unsigned long) &__kretprobe_trampoline;
> -}
> -
>  int __kprobes arch_trampoline_kprobe(struct kprobe *p)
>  {
>  	return 0;
> diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
> new file mode 100644
> index 000000000..edfeaa256
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic return hook for riscv.
> + */
> +
> +#include <linux/kprobes.h>
> +#include <linux/rethook.h>
> +#include "rethook.h"
> +
> +/* This is called from arch_rethook_trampoline() */
> +unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
> +{
> +	return rethook_trampoline_handler(regs, regs->s0);
> +}
> +NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
> +
> +
> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
> +{
> +	rhn->ret_addr = regs->ra;
> +	rhn->frame = regs->s0;
> +
> +	/* replace return addr with trampoline */
> +	regs->ra = (u64)arch_rethook_trampoline;
> +}
> +NOKPROBE_SYMBOL(arch_rethook_prepare);
> diff --git a/arch/riscv/kernel/probes/rethook.h b/arch/riscv/kernel/probes/rethook.h
> new file mode 100644
> index 000000000..cc573d701
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook.h
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#ifndef __RISCV_RETHOOK_H
> +#define __RISCV_RETHOOK_H
> +
> +unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
> +
> +#endif
> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
> similarity index 100%
> rename from arch/riscv/kernel/probes/kprobes_trampoline.S
> rename to arch/riscv/kernel/probes/rethook_trampoline.S
> -- 
> 2.27.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
