Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E62C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqHhed5joDyLQDLJzUZdGUi5Rc0Y2mnhfgJM2Tyq1Uk=; b=A78jdMh77ZVz07
	7s+aDvWyLMDL8Hr+R/CPw5fp59/2BjcnXjDp8Q8YFJ5Cayr3F2y8bIEgNWHm2H8wQOWUaygONvCPW
	lLk9DlCvMI/RTIh8KeDwmJdqlWFwAuk3tvwyK4NtgKav1bo01EfRaqOqG0XxrJdAu3Mlp4SKn4QzQ
	j7xGCxHJIeM/3AP1M483b7loBLnsGESLJAiZctFkYlc0XQMeqNNVDcSB1xmpQfoVCPNInV+oRIwlh
	6gFYHULlgkrk0UC2Q4E1hZrbV4IWNtg/+z+WbEby9PZiiS6JNJYeYKKl+atAJjOSQLOvEA065dwBb
	wcGgvW/HB4+luWuN/ufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09jQ-00Bbpy-B5; Tue, 29 Nov 2022 23:09:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09jN-00BbpR-Nm
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:09:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82A8D6193C;
	Tue, 29 Nov 2022 23:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BAFC433C1;
	Tue, 29 Nov 2022 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669763375;
	bh=h/I9WE2TfNER0oZbr2EzVV/5EUaxq//X/yipSB6BEcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8oI/baH+4/6XzD3ks6sVgmygAfuplJfADpIe556vinzxNmc1NxQV5IOOR2gmjulu
	 kfZq+9YZwqEX1HK0PiPoExP6GXI5HJi/MBIPDUH1zZiqNh6rGhHMKNg1BgYE2Ru9A0
	 kXWZG7/uU11RO7X1CVV8TQL1dVsK4+sppyNOzEUhg4ML+gtuCIP4R61lntzwMy7c6r
	 ZV0Y9f44EOlDkRAz8Bj9uRn+5EC5jnwBDw5oSQBVsAtIQWJc+Ds/IARB2nD14HMLL9
	 5JjQmoYmIs2wGHHeh+KbGumj3ksWbdmb4xbc7sxzv7NZtfQN49EtzSeNgS97TIXj2e
	 ni7GazlrgxqBw==
Date: Tue, 29 Nov 2022 23:09:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 04/13] RISC-V: Move riscv_insn_is_* macros into a
 common header
Message-ID: <Y4aRK9CvoH56A+Ai@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_150937_893120_48F20646 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, Nov 28, 2022 at 11:26:23AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Right now the riscv kernel has (at least) two independent sets
> of functions to check if an encoded instruction is of a specific
> type. One in kgdb and one kprobes simulate-insn code.
> 
> More parts of the kernel will probably need this in the future,
> so instead of allowing this duplication to go on further,
> move macros that do the function declaration in a common header,
> similar to at least aarch64.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h       | 41 ++++++++++++++++----
>  arch/riscv/kernel/kgdb.c                 | 49 ++++++++----------------
>  arch/riscv/kernel/probes/simulate-insn.h | 26 +++----------
>  3 files changed, 54 insertions(+), 62 deletions(-)

> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> index cb6ff7dccb92..29fb16cd335c 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -3,14 +3,7 @@
>  #ifndef _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
>  #define _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
>  
> -#define __RISCV_INSN_FUNCS(name, mask, val)				\
> -static __always_inline bool riscv_insn_is_##name(probe_opcode_t code)	\
> -{									\
> -	BUILD_BUG_ON(~(mask) & (val));					\
> -	return (code & (mask)) == (val);				\
> -}									\
> -bool simulate_##name(u32 opcode, unsigned long addr,			\
> -		     struct pt_regs *regs)
> +#include <asm/parse_asm.h>
>  
>  #define RISCV_INSN_REJECTED(name, code)					\
>  	do {								\
> @@ -30,18 +23,9 @@ __RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
>  		}							\
>  	} while (0)
>  
> -__RISCV_INSN_FUNCS(c_j,		0xe003, 0xa001);
> -__RISCV_INSN_FUNCS(c_jr,	0xf007, 0x8002);
> -__RISCV_INSN_FUNCS(c_jal,	0xe003, 0x2001);
> -__RISCV_INSN_FUNCS(c_jalr,	0xf007, 0x9002);
> -__RISCV_INSN_FUNCS(c_beqz,	0xe003, 0xc001);
> -__RISCV_INSN_FUNCS(c_bnez,	0xe003, 0xe001);
> -__RISCV_INSN_FUNCS(c_ebreak,	0xffff, 0x9002);
> -
> -__RISCV_INSN_FUNCS(auipc,	0x7f, 0x17);
> -__RISCV_INSN_FUNCS(branch,	0x7f, 0x63);
> -
> -__RISCV_INSN_FUNCS(jal,		0x7f, 0x6f);
> -__RISCV_INSN_FUNCS(jalr,	0x707f, 0x67);
> +bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
> +bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);

I assume the other ones didn't actually have a user and so didn't need a
function created? Code movement here looks fine. Dropping the double
definitions is always nice :)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
