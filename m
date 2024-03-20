Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24AFC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywkqK2/mvJ7e4Cj6FFJt8ylrO1/tyIPYnVpcrzU+5Rk=; b=OZepHONVwM9XcT
	E9Q8M3dz8BUriyHGQzSCNM1Q5VrQX33nJh92E7rBn+5eiUXWt4Cdtshw3LDvUh1NCOXlLjfREwsTJ
	S7x/zYAUIHIdvjHK5nbvAHZVjGrRmUPVzqkXPj+tUVKae5SwOU3x+tpXP4B5sL1stbcKqI28GBLfJ
	nrCfrOX3/q0zyFI6g9Ylm7H6D4DwwasGgbL3zcqDkLnvZsXM1aSIZx8HYpE2ba6DKQVOcn8p1WiSd
	Yp6JUApe7QKwRojYDFp04M71SRc6Z6rwqquKKEIe09MZbpgy+8ilOvbLftpZAzYCRXVW03nHSlneS
	iwbPXFuNoH+nVvBHXxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn0IB-00000000ZrO-1iuO;
	Wed, 20 Mar 2024 18:03:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn0I8-00000000ZoU-1nZi
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 18:03:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D6E01007;
	Wed, 20 Mar 2024 11:04:27 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.34.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19D053F762;
	Wed, 20 Mar 2024 11:03:49 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:03:45 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: =?us-ascii?Q?Bj=22orn_T=22opel?= <bjorn@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Guo Ren <guoren@kernel.org>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Bjorn Topel <bjorn@rivosinc.com>,
	Song Shuai <suagrfillet@gmail.com>,
	Cl'ement L'eger <cleger@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <ZfslAb_W0Gk-0pmR@FVFF77S0Q05N.cambridge.arm.com>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com>
 <87zfv0onre.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zfv0onre.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_110356_578833_B41B742B 
X-CRM114-Status: GOOD (  21.29  )
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

On Thu, Mar 14, 2024 at 04:07:33PM +0100, Bj"orn T"opel wrote:
> After reading Mark's reply, and discussing with OpenJDK folks (who does
> the most crazy text patching on all platforms), having to patch multiple
> instructions (where the address materialization is split over multiple
> instructions) is a no-go. It's just a too big can of worms. So, if we
> can only patch one insn, it's CALL_OPS.
> 
> A couple of options (in addition to Andy's), and all require a
> per-function landing address ala CALL_OPS) tweaking what Mark is doing
> on Arm (given the poor branch range).
> 
> ..and maybe we'll get RISC-V rainbows/unicorns in the future getting
> better reach (full 64b! ;-)).
> 
> A) Use auipc/jalr, only patch jalr to take us to a common
>    dispatcher/trampoline
>   
>  | <func_trace_target_data_8B> # probably on a data cache-line != func .text to avoid ping-pong
>  | ...
>  | func:
>  |   ...make sure ra isn't messed up...
>  |   aupic
>  |   nop <=> jalr # Text patch point -> common_dispatch
>  |   ACTUAL_FUNC
>  | 
>  | common_dispatch:
>  |   load <func_trace_target_data_8B> based on ra
>  |   jalr
>  |   ...
> 
> The auipc is never touched, and will be overhead. Also, we need a mv to
> store ra in a scratch register as well -- like Arm. We'll have two insn
> per-caller overhead for a disabled caller.

Is the AUIPC a significant overhead? IIUC that's similar to Arm's ADRP, and I'd
have expected that to be pretty cheap.

IIUC your JALR can choose which destination register to store the return
address in, and if so, you could leave the original ra untouched (and recover
that in the common trampoline). Have I misunderstood that?

Maybe that doesn't play nicely with something else?

> B) Use jal, which can only take us +/-1M, and requires multiple
>    dispatchers (and tracking which one to use, and properly distribute
>    them. Ick.)
> 
>  | <func_trace_target_data_8B> # probably on a data cache-line != func .text to avoid ping-pong
>  | ...
>  | func:
>  |   ...make sure ra isn't messed up...
>  |   nop <=> jal # Text patch point -> within_1M_to_func_dispatch
>  |   ACTUAL_FUNC
>  | 
>  | within_1M_to_func_dispatch:
>  |   load <func_trace_target_data_8B> based on ra
>  |   jalr
> 
> C) Use jal, which can only take us +/-1M, and use a per-function
>    trampoline requires multiple dispatchers (and tracking which one to
>    use). Blows up text size A LOT.
> 
>  | <func_trace_target_data_8B> # somewhere, but probably on a different cacheline than the .text to avoid ping-ongs
>  | ...
>  | per_func_dispatch
>  |   load <func_trace_target_data_8B> based on ra
>  |   jalr
>  | func:
>  |   ...make sure ra isn't messed up...
>  |   nop <=> jal # Text patch point -> per_func_dispatch
>  |   ACTUAL_FUNC

Beware that with option (C) you'll need to handle that in your unwinder for
RELIABLE_STACKTRACE. If you don't have a symbol for per_func_dispatch (or
func_trace_target_data_8B), PC values within per_func_dispatch would be
symbolized as the prior function/data.

> It's a bit sad that we'll always have to have a dispatcher/trampoline,
> but it's still better than stop_machine(). (And we'll need a fencei IPI
> as well, but only one. ;-))
> 
> Today, I'm leaning towards A (which is what Mark suggested, and also
> Robbin).. Any other options?

Assuming my understanding of JALR above is correct, I reckon A is the nicest
option out of A/B/C.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
