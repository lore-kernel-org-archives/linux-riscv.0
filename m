Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCAC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbjnjZVeS4bIaE89eFzC18QBaXfca4cUjz2N6LF5v6s=; b=tgGO52TSOklUwc
	eSmBGFup7RIqiNmg1wGNeuS6iuQZHEZzbDfXZDs570PhsAdGX59iiw+DJ2vsVQWgCiEqzO1iqg4+V
	nxzrNrpwXfPeFfYC4234at9ak+DtOBqtG+MsbbayPfn1NgXV1XptASV7OBUTt5gdm6Jb8o4JcgeJp
	00pR/OmNmajGN3GhuSrJqf+XzNPRLwnYzAA7PzZ8k3gfMUVr5KJVAcJ/f2NAAHY6kwfjV3GISllmE
	hE1j5t91nHpEfwPnJpfdg2zjjHlBz5GVgcl62pqQb6bfvj7s613tZ/hL7v9x4iM1xynkpFVLrtogz
	RQsP0MCf6g5pWf+glnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weh1S-00000000Jjq-0njP;
	Tue, 30 Jun 2026 22:33:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weh1Q-00000000Jji-1ueT
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 22:33:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08C0240211;
	Tue, 30 Jun 2026 22:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966701F000E9;
	Tue, 30 Jun 2026 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858819;
	bh=nfsKD9GM3ZJvGDmqQFlRaZt3ShaCsQhGyjSUxj31w/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mqPNRRhkZE9AmyWatl9oPrw5D8gb2kOs8ITdoOEP9s2ZjxiM/LsTaETgg7Ay3lSaU
	 5XelscLjQY+z2464u0pya13QkL4J5v4gCN7aMhYLAxiKK4tSAz7HdWPJuIZSg+1ISb
	 JBXY4tnBSfa5T3RfZ/VD3/p0VHFs5FgzmgGM8qZFwaDUAl05KONAMsZJd/S+1I6QXv
	 mxuUIeFMSMaqc5wRFtIL0mnX6MSK6Mpa/6YIL/gTAAdyj7ZiWEXmxgosf0dB8uyyRI
	 F5vpySITWhkX1rPbPbP2JpibpL8PQIzVV29okmuThGV022pWt5eKUoRh0Ba4WhAtO0
	 ttEFBiBlgqi4A==
Date: Wed, 1 Jul 2026 07:33:35 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: probes: save original sp in rethook trampoline
Message-Id: <20260701073335.548d8f0b435b1a5fb4e41a69@kernel.org>
In-Reply-To: <20260630194010.1824039-1-martin@kaiser.cx>
References: <20260630194010.1824039-1-martin@kaiser.cx>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Tue, 30 Jun 2026 21:40:03 +0200
Martin Kaiser <martin@kaiser.cx> wrote:

> Reading a word from the stack in a kretprobe crashes a risc-v kernel.
> 
> $ cd /sys/kernel/tracing/
> $ echo 'r n_tty_write $stack0' > dynamic_events
> $ echo 1 > events/kprobes/enable
> Unable to handle kernel paging request at virtual address 0000000200000128
> ...
> [<ffffffff80016d16>] regs_get_kernel_stack_nth+0x26/0x38
> [<ffffffff80177196>] process_fetch_insn+0x3ee/0x760
> [<ffffffff80177836>] kretprobe_trace_func+0x116/0x1f0
> [<ffffffff8017795a>] kretprobe_dispatcher+0x4a/0x58
> [<ffffffff8013572e>] kretprobe_rethook_handler+0x5e/0x90
> [<ffffffff80180838>] rethook_trampoline_handler+0x70/0x108
> [<ffffffff8001ba32>] arch_rethook_trampoline_callback+0x12/0x1c
> [<ffffffff8001ba84>] arch_rethook_trampoline+0x48/0x94
> [<ffffffff8067872a>] tty_write+0x1a/0x30
> 
> In regs_get_kernel_stack_nth, regs->sp contains an arbitrary value.
> 
> arch_rethook_trampoline saves the registers from the probed function in a
> struct pt_regs. sp is not saved. Instead, sp is decremented for
> arch_rethook_trampoline's local stack.
> 
> Fix this crash and save the original sp along with the other registers.
> Use a0 as a temporary register, it is overwritten anyway.

Good catch!

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

I would like this to be handled by the RISC-V maintainers.

Thank you,

> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  arch/riscv/kernel/probes/rethook_trampoline.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/probes/rethook_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
> index f2cd83d9b0f0..c3aa8d8cf5af 100644
> --- a/arch/riscv/kernel/probes/rethook_trampoline.S
> +++ b/arch/riscv/kernel/probes/rethook_trampoline.S
> @@ -41,6 +41,9 @@
>  	REG_S x29, PT_T4(sp)
>  	REG_S x30, PT_T5(sp)
>  	REG_S x31, PT_T6(sp)
> +	/* save original sp */
> +	addi a0, sp, PT_SIZE_ON_STACK
> +	REG_S a0, PT_SP(sp)
>  	.endm
>  
>  	.macro restore_all_base_regs
> -- 
> 2.43.7
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
