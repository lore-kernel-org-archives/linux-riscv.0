Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6C7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 00:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNwPgTb+tYeDEDSmkMBjwZe8biUWdhal8k1Mog2TgUs=; b=JPLO3bgwSascgo
	yhQWVB2SKS6mJM8z5vbZTsVsO8Hd2SGpWcXYO8P4qKEYflp4n7GdKzR0Dir+TMb+bkVS47X252/Nd
	sy+aFz3PdrNhQdNkeukyOSc8yRYTcOdRKSOiNGEhxsaX3SF8j0oqpETClcNyAypIsEESGacIH/X3l
	EHJWcU2zA1ifmvBtJYjRU3M1wf8AKZBt0sqP0u1HxA6BJM5RDbCoiiGnNNdV9e0Dzak9M6Quu/EVa
	nRwrcJJ5+0edDix3Xg4R616Ew+2JHDTCU5Z8YCL97f6ZnvWvMfF5el7bNYsaHnWgCennw72540DGz
	WtdbTVh6+6SL2qYsoxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5cJD-005Bf4-MM; Thu, 15 Dec 2022 00:41:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5cJA-005BYg-Me
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 00:41:10 +0000
Received: by mail-pg1-x532.google.com with SMTP id b12so457858pgj.6
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 16:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l1+9aFWIywW24+fuTbx+Qyc1HRmi+jILztX+FivWx3Q=;
        b=jb2ClHC0JzlU6/A7oG9wX2lIjW163wYAAsnuD7z6vHKLAJ6WCABdC0zHaJgH+vW1cJ
         X85wm2u0tBa3ucj4A9xYBR14n5W4lrDo4Z776KQYkYdhCQEQVA9T1mvhctnbGmU3BE4C
         WARNv31LD1wabhMMu+06rdt20q9faYRYxU+FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1+9aFWIywW24+fuTbx+Qyc1HRmi+jILztX+FivWx3Q=;
        b=QByajWI+t+gb/l00EwfudumQ2zYJbptUqVASKDMFSdPYeQZHb6AKM/r0jozCjRDET4
         tlPQFJWKYLgzkeVO5LYAOUSHaZLKPmsDjUwTrCdcxve31/GZi4R9S/6rp9jySz89G8VF
         7N6ECYKpu2M5O9iIiPC7+uGdE4qlQnATgcejnhKbxdCMmqipRvSeTxbRNDylrEyM2krq
         ERGfcMF3IYjVZt9mIjxe10LUN1f2izxhsddo7wJ74lpTw8AID5EDryOV9wSOa3Pf7iI5
         Yo5/+g9NKuYm8pQwCVOxXsVNTRvrw/r0KwSiZaGLcUjszo/H9WzjS5SRv6biuhp8AT/f
         noXw==
X-Gm-Message-State: ANoB5pniolABy+P26UJcM4sJgH1F0JR94SJyCvlV1teoiXTc9SaX650w
	14Adyc3jEhVYvmU51Vk9LTMQFfn1+q+q1/serUYf
X-Google-Smtp-Source: AA0mqf41r0jXtY+/17AH27nqYNOeQ6pZv+/Uw7fREISQYROGD50E5EiI8tulDjCBbhcj8fUBC5QzNKLSVNd4DxlDuwc=
X-Received: by 2002:a63:f4b:0:b0:46f:98cf:3bb6 with SMTP id
 11-20020a630f4b000000b0046f98cf3bb6mr68618832pgp.332.1671064864426; Wed, 14
 Dec 2022 16:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20220921214439.1491510-1-stillson@rivosinc.com> <20220921214439.1491510-4-stillson@rivosinc.com>
In-Reply-To: <20220921214439.1491510-4-stillson@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 14 Dec 2022 16:40:52 -0800
Message-ID: <CAOnJCULtT-y9vo6YhW7bW9XyKRdod-hvFfr02jHVamR_LcsKdA@mail.gmail.com>
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
To: Chris Stillson <stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_164109_027755_5F3676AE 
X-CRM114-Status: GOOD (  23.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Davidlohr Bueso <dave@stgolabs.net>, Yury Norov <yury.norov@gmail.com>, Changbin Du <changbin.du@intel.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Myrtle Shah <gatecat@ds0.me>, Eugene Syromiatnikov <esyr@redhat.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Greentime Hu <greentime.hu@sifive.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Li Zhengyu <lizhengyu3@huawei.com>, Evgenii Stepanov <eugenis@google.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Barret Rhoden <brho@google.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Dao Lu <daolu@rivosinc.com>, Alexander Graf <graf@amazon.com>, Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Peter Collingbourne <pcc@google.com>, Janosch Frank <frankja@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Colin Cross <ccross@google.com>, Alexey Dobriyan <adobriyan@gmail.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 21, 2022 at 2:47 PM Chris Stillson <stillson@rivosinc.com> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This patch adds a new config option which could enable assembler's
> vector feature.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/Kconfig  | 15 +++++++++++++--
>  arch/riscv/Makefile |  1 +
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..e294d85bfb7d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -432,7 +432,17 @@ config FPU
>
>           If you don't know what to do here, say Y.
>
> -endmenu # "Platform type"
> +config VECTOR
> +       bool "VECTOR support"
> +       depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
> +       default n
> +       help
> +         Say N here if you want to disable all vector related procedure
> +         in the kernel.
> +
> +         If you don't know what to do here, say Y.
> +
> +endmenu
>
>  menu "Kernel features"
>
> @@ -556,6 +566,7 @@ config CMDLINE_EXTEND
>           cases where the provided arguments are insufficient and
>           you don't want to or cannot modify them.
>
> +
>  config CMDLINE_FORCE
>         bool "Always use the default kernel command string"
>         help
> @@ -648,7 +659,7 @@ config XIP_PHYS_ADDR
>           be linked for and stored to.  This address is dependent on your
>           own flash usage.
>
> -endmenu # "Boot options"
> +endmenu
>
>  config BUILTIN_DTB
>         bool
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3fa8ef336822..1ec17f3d6d09 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -50,6 +50,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)      := rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)       := rv64ima
>  riscv-march-$(CONFIG_FPU)              := $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
> +riscv-march-$(CONFIG_VECTOR)           := $(riscv-march-y)v
>
>  # Newer binutils versions default to ISA spec version 20191213 which moves some
>  # instructions from the I extension to the Zicsr and Zifencei extensions.
> --
> 2.25.1
>

Kernel boot hangs if compiled LLVM and vector enabled. Because LLVM
enables auto vectorization by default and it inserts
random vector instructions.

We need to add "-mno-implicit-float" for llvm builds to disable auto
vectorization. Thanks Vineet and Saleem for the hint :).

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
