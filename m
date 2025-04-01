Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A8FC36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cljanHR8LTH976ueCTRBvfUUgH8Rf9iaEfydhd3AbBk=; b=a/p8VwIpHY9M8j
	4erSQciCO3DHqn6PvDy2ipUbDS983PDq1YSS91fGg1uExyf0Ti09tuxcMs4NtALcHWnYmsP6TKvm9
	NpwSx+WgZ+K8lRLRsjBo2xIkYl3I39cVIG8JPbZ1HfEyvV7Cb1K5I1NzYT8YoeZ/uer9RvRBAmO0y
	kORj6GPkFjjdsoUiGRP77O3c/gv1Ko0ExpHNwbGdpzgAkECWFeB6dfNcmC+SNa8gcnbR9eFfATZP4
	d9tVTJEf0wPnp2DDUUBZYHuCloVsHlQZx+Dy2jULYiTgowUKR6MhnedlWIjdZp5b+e4ylURco2Eir
	NNKmk0U677uxM3S6o/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhNz-00000004EUg-3bZ3;
	Tue, 01 Apr 2025 19:34:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhHt-00000004DlI-2M2f
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 19:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 017B66842B;
	Tue,  1 Apr 2025 19:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8892C4CEE5;
	Tue,  1 Apr 2025 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743535720;
	bh=MVpO4VaTcru+BmvxoHYy51uFa0XePQy4IVWWKC/dItU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byeaJBNRrzh+RDHWOK3VOpW1obL/hnTlDiIvpTQ0a1s/wYR6PWSqBUzYXksg0eQid
	 lgxY0Q0+sNREBFJKlhvruETVHYs2W3J4/XKTJpm9nh78TSQVAEa2XR8D5Cmdlb5cQy
	 P7PYBizvRYC2a2Gtft/znwlhgxaVZtdaKEXC2mx1bSLWHOMLAcoI42BxOv76KPpRfO
	 kFMfs6j2YnXGref7V8CP1vqJ19rKK1whdTrqHP5PRxlW6/vCZsOuvkdv79Wv4ufIIb
	 FDDP/1hLsdPPncD7I+wZTM1oZwwUA9hkgRWXNLweHxGHTFHjzgMOHboZvnyLG/bKEg
	 BYSo7CcVkjLFA==
Date: Tue, 1 Apr 2025 12:28:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/2] riscv: Add runtime constant support
Message-ID: <20250401192833.GA3645424@ax162>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
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

Hi Charlie,

On Wed, Mar 19, 2025 at 11:35:20AM -0700, Charlie Jenkins wrote:
> Implement the runtime constant infrastructure for riscv. Use this
> infrastructure to generate constants to be used by the d_hash()
> function.
> 
> This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> constant' support") and commit e3c92e81711d ("runtime constants: add
> x86 architecture support").
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
...
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
...
> +#define RISCV_RUNTIME_CONST_64_ZBA				\
> +	".option push\n\t"					\
> +	".option arch,+zba\n\t"					\
> +	"slli	%[__tmp],%[__tmp],32\n\t"			\
> +	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
> +	"nop\n\t"						\
> +	"nop\n\t"						\
> +	".option pop\n\t"					\
...
> +#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
...
> +#elif defined(CONFIG_RISCV_ISA_ZBA)
> +#define runtime_const_ptr(sym)						\
> +({									\
> +	typeof(sym) __ret, __tmp;					\
> +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> +		ALTERNATIVE(						\
> +			RISCV_RUNTIME_CONST_64_BASE,			\
> +			RISCV_RUNTIME_CONST_64_ZBA,			\
> +			0, RISCV_ISA_EXT_ZBA, 1				\
> +		)							\
> +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> +	__ret;								\
> +})

This breaks the build for clang versions 16 and earlier because they do
not support '.option arch' and it is used in CONFIG_RISCV_ISA_ZBA, which
has no dependencies and it is default on.

  $ make -skj"$(nproc)" ARCH=riscv LLVM=1 mrproper defconfig fs/dcache.o
  fs/dcache.c:117:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
          return runtime_const_ptr(dentry_hashtable) +
                 ^
  arch/riscv/include/asm/runtime-const.h:103:4: note: expanded from macro 'runtime_const_ptr'
                          RISCV_RUNTIME_CONST_64_ZBA,                     \
                          ^
  arch/riscv/include/asm/runtime-const.h:57:17: note: expanded from macro 'RISCV_RUNTIME_CONST_64_ZBA'
          ".option push\n\t"                                      \
                         ^
  <inline asm>:32:10: note: instantiated into assembly here
          .option arch,+zba
                  ^
  fs/dcache.c:117:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
          return runtime_const_ptr(dentry_hashtable) +
                 ^
  arch/riscv/include/asm/runtime-const.h:103:4: note: expanded from macro 'runtime_const_ptr'
                          RISCV_RUNTIME_CONST_64_ZBA,                     \
                          ^
  arch/riscv/include/asm/runtime-const.h:59:30: note: expanded from macro 'RISCV_RUNTIME_CONST_64_ZBA'
          "slli   %[__tmp],%[__tmp],32\n\t"                       \
                                        ^
  <inline asm>:34:2: note: instantiated into assembly here
          add.uw a2,a2,a3
          ^
  ...

  $ rg 'OPTION_ARCH|ZBA' .config
  364:CONFIG_RISCV_ISA_ZBA=y

Should it grow a dependency on AS_HAS_OPTION_ARCH or should there be a
different fix?

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
