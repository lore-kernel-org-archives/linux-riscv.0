Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54279C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fEr42F31AUR6dICU2llj3fCjoKQId1CIpf/cGS9xQs=; b=aZJDS4xgcSAad+
	MgXJzWfcAjaLBHIsUOOQN62E1qPS5s5nyFL8CRAGYiE011461ULSBnBRaCmN39UzBZdadcyf4Ogae
	knyejjhNlC4eng6npGajkC5pLFxaXYofGPjKNcjLDZhU8bp5seEWAN/8gd5TzOVBAmjOZCHSne4Vw
	1QbLdbq5fyR9P2iZ8Lco+ETWa1ixziDt6nW+7hrGEQ3EVnCut5X5nbQumUk01G9wvVwaN/HGYs7w2
	ZbVobMFGQI8f25Cd421PpnnnTwvnfwBBHfKK4/DenrbAn4mYvRCKRPwgP1N6PxAauy+OktI/Mzogc
	sD1SjXt6egB2cwdiH9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCIO-002fFd-2j;
	Fri, 17 Mar 2023 15:47:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCIK-002fE4-2c;
	Fri, 17 Mar 2023 15:47:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06053B82628;
	Fri, 17 Mar 2023 15:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D26C433D2;
	Fri, 17 Mar 2023 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068021;
	bh=12zZKHOmdvjfV4b8aAhGOw58PKPbYKo3hyQtwGB9kH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGWS4Rlh6YFCbXnctrhVWv7Ykcq54wAf0H5U1Tl24lkPq9+EDAXqOp8EYBgGJiKcy
	 9oeGW+NxZmZ+1ig0Dv8MhddFAYiPQsB1aOgo4ed0Iw+jdlsulNlE4awVPBqf5oFfLl
	 vB7Wjffm8tzRjy6v5BWc0/sNZh7NKF5HXxMynCwg4b7Lf2qLIfKW0MRE5gBrVcPwbt
	 OdNPHgECAur9yQOGf+r95wWpB8izSNJWncG+mI4fL/XYxZYRABEuEc6oBeyKIDXNzz
	 GRwg+IbeogaDaVmdUYuWxSL9fCTJxOr6U9ySRBMWpKn/mGD+h30v6R1ZzuzzteDTb7
	 18ANVBp7ud9Bw==
Date: Fri, 17 Mar 2023 08:46:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v15 19/19] riscv: Enable Vector code to be built
Message-ID: <20230317154658.GA1122384@dev-arch.thelio-3990X>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-20-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230317113538.10878-20-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_084705_169986_C7609DF0 
X-CRM114-Status: GOOD (  28.12  )
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

Hi Andy,

On Fri, Mar 17, 2023 at 11:35:38AM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch adds a config which enables vector feature from the kernel
> space.
> 
> Support for RISC_V_ISA_V is limited to GNU-assembler for now, as LLVM
> has not acquired the functionality to selectively change the arch option
> in assembly code. This is still under review at
>     https://reviews.llvm.org/D123515
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/Kconfig  | 20 ++++++++++++++++++++
>  arch/riscv/Makefile |  6 +++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c736dc8e2593..bf9aba2f2811 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -436,6 +436,26 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config TOOLCHAIN_HAS_V
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> +	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> +	depends on AS_IS_GNU

Consider hoisting this 'depends on AS_IS_GNU' into its own configuration
option, as the same dependency is present in CONFIG_TOOLCHAIN_HAS_ZBB
for the exact same reason, with no comment as to why. By having a shared
dependency configuration option, we can easily update it when that
change is merged into LLVM proper and gain access to the current and
future options that depend on it. I imagine something like:

config AS_HAS_OPTION_ARCH
    bool
    default y
    # https://reviews.llvm.org/D123515
    depends on AS_IS_GNU

config TOOLCHAIN_HAS_ZBB
    bool
    default y
    depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
    depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
    depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
    depends on AS_HAS_OPTION_ARCH

config TOOLCHAIN_HAS_V
    bool
    default y
    depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
    depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
    depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
    depends on AS_HAS_OPTION_ARCH

It would be nice if it was a hard error for LLVM like GCC so that we
could just dynamically check support via as-instr but a version check is
not the end of the world when we know the versions.

  $ cat test.s
  .option arch, +v

  $ cat test-invalid.s
  .option arch, +vv

  $ clang --target=riscv64-linux-gnu -c -o /dev/null test.s
  test.s:1:13: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
  .option arch, +v
              ^

  $ clang --target=riscv64-linux-gnu -c -o /dev/null test-invalid.s
  test-invalid.s:1:13: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
  .option arch, +vv
              ^

  $ riscv64-linux-gcc -c -o /dev/null test.s

  $ riscv64-linux-gcc -c -o /dev/null test-invalid.s
  test-invalid.s: Assembler messages:
  test-invalid.s:1: Error: unknown ISA extension `vv' in .option arch `+vv'

As a side note, 'bool + default y' is the same as 'def_bool y', if you
wanted to same some space.

Cheers,
Nathan

> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on TOOLCHAIN_HAS_V
> +	depends on FPU
> +	select DYNAMIC_SIGFRAME
> +	default y
> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6203c3378922..84a50cfaedf9 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
>  
>  # Newer binutils versions default to ISA spec version 20191213 which moves some
>  # instructions from the I extension to the Zicsr and Zifencei extensions.
> @@ -65,7 +66,10 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>  
> -KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> +# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> +# keep non-v and multi-letter extensions out with the filter ([^v_]*)
> +KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed  -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> +
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>  
>  KBUILD_CFLAGS += -mno-save-restore
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
