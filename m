Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E339FA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKYKH2w0g+mb4qLXSgfydYlUx6vYejd3Ngy7vSQr9pA=; b=3UAjvKYlhrEa0x
	GsSlo/yL8y/le14aoMPLyc1CZiJSgKrvlIFJb33bV+L8EBTtrhGmnw96ajVVd9tV6i9ga2USgWAno
	hC8OKv2RLkTKIJIondhrrxRLnIaSpFu51+CXrNHRbQtDyi4CKIL6kwDwnhOIQiO8GwggpYfqIF0L4
	EJ7C8FmLElrWV6lr3d5yziDce3ZS4fTTdV8+d3ck2mJYYSC/h2CjeVI+LF0mF63jrcbZEhMBZJmIl
	O9efewmgRIVI9PcuVrm4O6T+ssJMuRAUcT1XNTiio3kSWqf2JX3U54Qihic5x7haruL2lr4uuRNF4
	OMCJosav/3tPnTfy9MZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opafr-00ENBx-K3; Mon, 31 Oct 2022 19:42:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opafo-00EN4P-4S
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 19:42:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DE7661227;
	Mon, 31 Oct 2022 19:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DDCC433C1;
	Mon, 31 Oct 2022 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667245334;
	bh=Gv2H5/Dm7CG/NW0uP4eH9RzWH55ATCVV74kel/qO6Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUQKivPbTObKmBECq9FvalimepMvnRULufJlEunrPC7E8fTTCHZbFlrd3m7T2lhbQ
	 82nqvzBvkl7Kbr+eSAEgPkF2NOcGR6mJKnD43siltXPrLfmpZK6wmfDxB1j52IgzP8
	 eb18+Nqd0g6QmM3KCwvU1Q11zceyx+wvtonks7JSo8QBV4brO7wys8gRMzw7qg/FQw
	 VllotmgeJ38L5JUjsMdnT3ZbTZXCuauOJ9D9XXIP+liY0zaHsFx18etXTbEb3EHlvV
	 MDCNo8NH99AX8oXwZyAszXfFUJHmS7xo7NpV6mHoeURWYPMwQaf/+9GBeAe9HW3agw
	 Zd7OmpwstmMyg==
Date: Mon, 31 Oct 2022 19:42:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	rostedt@goodmis.org, mingo@redhat.com, sfr@canb.auug.org.au,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	liaochang1@huawei.com
Subject: Re: [PATCH 1/8] riscv/kprobe: Prepare the skeleton to implement
 RISCV OPTPROBES feature
Message-ID: <Y2AlEcVRibarLp8a@spud>
References: <20221030090141.2550837-1-chenguokai17@mails.ucas.ac.cn>
 <20221030090141.2550837-2-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030090141.2550837-2-chenguokai17@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_124216_274563_7D49E21E 
X-CRM114-Status: GOOD (  31.71  )
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

Hey Chen Guokai,

On Sun, Oct 30, 2022 at 05:01:34PM +0800, Chen Guokai wrote:
> From: Liao Chang <liaochang1@huawei.com>
> 
> Prepare skeleton to implement optimized kprobe on RISCV, it consists
> of Makfile, Kconfig and some architecture specific files: kprobe.h and
> opt.c opt.c includes some macro, type definition and functions required
> by kprobe framework, opt_trampoline.S provides a piece of assembly code
> template used to construct the detour buffer as the target of long jump
> instruction(s) for each optimzed kprobe.
> 
> Since the jump range of PC-relative instruction JAL is +/-1M, that is
> too small to reach the detour buffer, hence the foudamental idea to
> address OPTPROBES on RISCV is to replace 'EBREAK' with 'AUIPC+JALR'. which
> means it needs to clobber one more instruction beside the kprobe
> instruction, furthermore, RISCV supports hybird RVI and RVC in single
> kernel binary, so in theory a pair of 'AUIPC/JALR' is about to clobber
> 10 bytes(3 RVC and 1 RVI, 2 bytes is padding for alignment) at worst
> case. The second hardsome problem is looking for one integer register as
> the destination of 'AUIPC/JALR' without any side-effect.
> 
> More solution details will be introduced in the coming commits.

nit: you can drop this reference to future commits.

> 
> Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

FYI, your signoff should come last since you're sending the patches, so
this would become:

> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>

I noticed on some of the other patches that your SoB is missing there,
for example patch 2.

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig                        |  1 +
>  arch/riscv/include/asm/kprobes.h          | 32 ++++++++++++++
>  arch/riscv/kernel/probes/Makefile         |  1 +
>  arch/riscv/kernel/probes/opt.c            | 51 +++++++++++++++++++++++
>  arch/riscv/kernel/probes/opt_trampoline.S | 12 ++++++
>  5 files changed, 97 insertions(+)
>  create mode 100644 arch/riscv/kernel/probes/opt.c
>  create mode 100644 arch/riscv/kernel/probes/opt_trampoline.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b48a3ae9843..ca29306c93e2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -99,6 +99,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_OPTPROBES if !XIP_KERNEL
>  	select HAVE_MOVE_PMD
>  	select HAVE_MOVE_PUD
>  	select HAVE_PCI
> diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
> index 217ef89f22b9..22b73a2fd1fd 100644
> --- a/arch/riscv/include/asm/kprobes.h
> +++ b/arch/riscv/include/asm/kprobes.h
> @@ -43,5 +43,37 @@ bool kprobe_single_step_handler(struct pt_regs *regs);
>  void __kretprobe_trampoline(void);
>  void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>  
> +#ifdef CONFIG_OPTPROBES
> +
> +/* optinsn template addresses */
> +extern __visible kprobe_opcode_t optprobe_template_entry[];
> +extern __visible kprobe_opcode_t optprobe_template_end[];
> +
> +#define MAX_OPTINSN_SIZE				\
> +	((unsigned long)optprobe_template_end -		\
> +	 (unsigned long)optprobe_template_entry)
> +
> +/*
> + * For RVI and RVC hybird encoding kernel, althought long jump just needs
> + * 2 RVI instructions(AUIPC+JALR), optimized instructions is 10 bytes long
> + * at most to ensure no RVI would be truncated actually, so it means four
> + * combinations:
> + * - 2 RVI
> + * - 4 RVC
> + * - 2 RVC + 1 RVI
> + * - 3 RVC + 1 RVI (truncated, need padding)
> + */
> +#define MAX_COPIED_INSN		4
> +#define MAX_OPTIMIZED_LENGTH	10
> +
> +struct arch_optimized_insn {
> +	kprobe_opcode_t copied_insn[MAX_COPIED_INSN];
> +	/* detour code buffer */
> +	kprobe_opcode_t *insn;
> +	unsigned long length;
> +	int rd;
> +};
> +
> +#endif /* CONFIG_OPTPROBES */
>  #endif /* CONFIG_KPROBES */
>  #endif /* _ASM_RISCV_KPROBES_H */
> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
> index 7f0840dcc31b..6255b4600875 100644
> --- a/arch/riscv/kernel/probes/Makefile
> +++ b/arch/riscv/kernel/probes/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o simulate-insn.o
>  obj-$(CONFIG_KPROBES)		+= kprobes_trampoline.o
>  obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
>  obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
> +obj-$(CONFIG_OPTPROBES)		+= opt.o opt_trampoline.o
>  CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
> diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
> new file mode 100644
> index 000000000000..56c8a227c857
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/opt.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Kernel Probes Jump Optimization (Optprobes)
> + *
> + * Copyright (C) Guokai Chen, 2022
> + * Author: Guokai Chen chenguokai17@mails.ucas.ac.cn
> + */
> +
> +#define pr_fmt(fmt)	"optprobe: " fmt
> +
> +#include <linux/kprobes.h>
> +#include <asm/kprobes.h>
> +
> +int arch_prepared_optinsn(struct arch_optimized_insn *optinsn)
> +{
> +	return 0;
> +}
> +
> +int arch_check_optimized_kprobe(struct optimized_kprobe *op)
> +{
> +	return 0;
> +}
> +
> +int arch_prepare_optimized_kprobe(struct optimized_kprobe *op,
> +				  struct kprobe *orig)
> +{
> +	return 0;
> +}
> +
> +void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
> +{
> +}
> +
> +void arch_optimize_kprobes(struct list_head *oplist)
> +{
> +}
> +
> +void arch_unoptimize_kprobes(struct list_head *oplist,
> +			     struct list_head *done_list)
> +{
> +}
> +
> +void arch_unoptimize_kprobe(struct optimized_kprobe *op)
> +{
> +}
> +
> +int arch_within_optimized_kprobe(struct optimized_kprobe *op,
> +				 kprobe_opcode_t *addr)
> +{
> +	return 0;
> +}
> diff --git a/arch/riscv/kernel/probes/opt_trampoline.S b/arch/riscv/kernel/probes/opt_trampoline.S
> new file mode 100644
> index 000000000000..16160c4367ff
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/opt_trampoline.S
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 Guokai Chen
> + */
> +
> +#include <linux/linkage.h>
> +
> +#incldue <asm/csr.h>
> +#include <asm/asm-offsets.h>
> +
> +SYM_ENTRY(optprobe_template_entry, SYM_L_GLOBAL, SYM_A_NONE)
> +SYM_ENTRY(optprobe_template_end, SYM_L_GLOBAL, SYM_A_NONE)
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
