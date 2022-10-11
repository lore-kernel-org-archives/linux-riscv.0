Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFDCC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQIZ4NKq5Dgf11hQA9kBQ62BbGksDdhRFuzXKlcZpz0=; b=gWMMWTnXtZlR7a
	s9G1lHD/vLiUAGAAq/DppLy1x6dAXpuHeibvgd+bCB5sUvT4P1KNWu/a0Mmfl+iQb3I9eHEw85jY+
	I8CGqkr1B0mGBI7VCQfLdSTaiIkYaUIkzDTDpX1+M6CfbuWb/0aBYO9WyVCJloS9J7QB52bnRAO1o
	6mXTcRUGUcVQN3C6cQG+ny+6JNrbs8obuzTbdtzV+jcnTcNo4YTD5qntdS4JFKS7Lav/YKR6lp1vb
	4M5UviCsJTWB56eeVVd62lYAkd9/nhhTCEHBP1i8hQNCIP7xsF+szlpGB2zCuQ89LskLpl1LXaPrN
	llWZv8MaYmgGLDNTNb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9kw-003b65-Mb; Tue, 11 Oct 2022 07:32:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9kt-003b4z-PL
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 07:32:49 +0000
Received: from p5b127dea.dip0.t-ipconnect.de ([91.18.125.234] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oi9kd-0007DL-OH; Tue, 11 Oct 2022 09:32:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy asm constraints
Date: Tue, 11 Oct 2022 09:32:30 +0200
Message-ID: <2432835.C4sosBPzcN@phil>
In-Reply-To: <20221006064028.548-1-jszhang@kernel.org>
References: <20221006064028.548-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_003247_832476_14D48D4B 
X-CRM114-Status: GOOD (  18.04  )
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

Am Donnerstag, 6. Oktober 2022, 08:40:28 CEST schrieb Jisheng Zhang:
> Samuel reported that the static branch usage in cpu_relax() breaks
> building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]:
> 
> In file included from <command-line>:
> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
> probably does not match constraints
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:285:33: error: impossible constraint
> in 'asm'
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:249:
> arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> 
> Maybe "-Os" prevents GCC from detecting that the key/branch arguments
> can be treated as constants and used as immediate operands. Inspired
> by x86's commit 864b435514b2("x86/jump_label: Mark arguments as const to
> satisfy asm constraints"), and as pointed out by Steven in [2] "The "i"
> constraint needs to be a constant.", let's do similar modifications to
> riscv.
> 
> Tested by CC_OPTIMIZE_FOR_SIZE + gcc and CC_OPTIMIZE_FOR_SIZE + clang.

I ran into the same build-issue when enabling CC_OPTIMIZE_FOR_SIZE
and this patch fixes it, so

Tested-by: Heiko Stuebner <heiko@sntech.de>


> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> [2]https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/jump_label.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 38af2ec7b9bf..6d58bbb5da46 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -14,8 +14,8 @@
>  
>  #define JUMP_LABEL_NOP_SIZE 4
>  
> -static __always_inline bool arch_static_branch(struct static_key *key,
> -					       bool branch)
> +static __always_inline bool arch_static_branch(struct static_key * const key,
> +					       const bool branch)
>  {
>  	asm_volatile_goto(
>  		"	.option push				\n\t"
> @@ -35,8 +35,8 @@ static __always_inline bool arch_static_branch(struct static_key *key,
>  	return true;
>  }
>  
> -static __always_inline bool arch_static_branch_jump(struct static_key *key,
> -						    bool branch)
> +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
> +						    const bool branch)
>  {
>  	asm_volatile_goto(
>  		"	.option push				\n\t"
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
