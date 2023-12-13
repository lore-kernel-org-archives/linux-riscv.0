Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF94C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBvc7YrGzcl/OqVMtrrLuSz0JzCvuASqZ0kZRYj9x0s=; b=R1LJ9NqS5mD7NA
	Q5RvSR9eInFq6GnxIEpAM5zrtYZ2V/iPTiRKKTxqf9/0k/GxEJ7kcNTXVctqF3zBjJFcANfAWRkJq
	SbJNPBpzGtkhymciyWIn6eNzsusF2W/suJqBn7UgsIGqBV7/Om/C/DFHT0AvTWLEUR19u3vVtlQWO
	VtjiH4WRFfuAFg+Pet82QXFzmjDmBawYBgyB5qd9eRcx++O41bb31UvTtyzBF5kixNzPmhez21MbR
	uETH+aYmhv2YNFg1mdVkaugojJEpONQqW848R9j01C4pUeGPjGCeXBJwfWAWBDTF7CTC1SMrrVyBT
	zX9eMQmabYZGVfXGehBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRxo-00FQae-39;
	Wed, 13 Dec 2023 16:20:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRxf-00FQXM-1y;
	Wed, 13 Dec 2023 16:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DEA0A61C04;
	Wed, 13 Dec 2023 16:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D2AC433C9;
	Wed, 13 Dec 2023 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702484390;
	bh=rtYsdGUgzG4gShOq5eir9uSz6Dv02AOWRgbvbC1z6QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSNZEtlyKCT/FLY4w9ZppFBut3oFTo86KvXQ19A5ut2LSqARZgZyhF61vRtVNrlEe
	 Ay6EDQ78iJiWMBryaP7r58sTbMMPPeFtYOwsHvf0y/xUOHdevS95ZXyDZ5996bVweU
	 sv4KhhPsk0N6ZxNbb6aTXaRmvvfIxXMebINNc1JCdEbg3xS5+77zm0cfnfALLOjYaI
	 LOX2IHnhNjki/2k4b+A3P3mcp4sjgIq92Q/94wAC7sdnVuHgtC7eESr3vtcaq3I9gA
	 6uX/hRFS0gmB3XF6ZMoRq4x6IVDRMvD7vXlc24FhXwedhXTL2t+QN7yPIx4aLREPb6
	 C/OnndWIpOX3Q==
Date: Wed, 13 Dec 2023 16:19:44 +0000
From: Will Deacon <will@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 04/12] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <20231213161944.GA32062@willie-the-truck>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-5-samuel.holland@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_081951_727604_6A0715F2 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, Dec 07, 2023 at 09:54:34PM -0800, Samuel Holland wrote:
> arm64 provides an equivalent to the common kernel-mode FPU API, but in a
> different header and using different function names. Add a wrapper
> header, and export CFLAGS adjustments as found in lib/raid6/Makefile.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/arm64/Kconfig           |  1 +
>  arch/arm64/Makefile          |  9 ++++++++-
>  arch/arm64/include/asm/fpu.h | 17 +++++++++++++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/fpu.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b071a00425d..485ac389ac11 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -30,6 +30,7 @@ config ARM64
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> +	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
>  	select ARCH_HAS_KEEPINITRD
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 9a2d3723cd0f..4a65f24c7998 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -36,7 +36,14 @@ ifeq ($(CONFIG_BROKEN_GAS_INST),y)
>  $(warning Detected assembler with broken .inst; disassembly will be unreliable)
>  endif
>  
> -KBUILD_CFLAGS	+= -mgeneral-regs-only	\
> +# The GCC option -ffreestanding is required in order to compile code containing
> +# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
> +CC_FLAGS_FPU	:= -ffreestanding
> +# Enable <arm_neon.h>
> +CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
> +CC_FLAGS_NO_FPU	:= -mgeneral-regs-only
> +
> +KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
>  		   $(compat_vdso) $(cc_has_k_constraint)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)

Can you use this to replace the same logic in arch/arm64/lib/Makefile,
like you do for arch/arm/?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
