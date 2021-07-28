Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501DAC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 00:40:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A626360F58
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 00:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A626360F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=923w2Lz3LDL1TRRn1XJe2O1/GGfh9uF43qZVsGqzXLo=; b=ucM0LvqnkJC3d8
	I9pyPw6keghhTvWD+KRi6Yoi7vHviktDTaIGw4Q/awqkvIWbQ3B6CLzT+weZOF3r3SWjwU1sTtAWS
	8kffTOn0Gh/5NvtooLyYQkbtxk+5ByudQdN4Wy+AzvBefhLRmiDoLyAOXSyKBvOWgXE00O71O/pWL
	sh+E556pxQbO15IK71AReg4tsAFNvVWi8NbpbFYVnOQ5gQkMjiub57khSG5HskqchwBlB95gBI8c5
	bDMOlsOKMb7UUYLqol7H8vPspNPomfUqfkj8R6193a8/8A5mQ8rMzlRVz90dinM61GPH0fQnG6rkw
	DCnAfPE70MtmYfNH7yhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Xbk-00GjjJ-Is; Wed, 28 Jul 2021 00:39:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Xbg-00Gjip-TG
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 00:39:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4FC460F58;
 Wed, 28 Jul 2021 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627432771;
 bh=MNUplsMFO1Q7AKGQ50jxh4neGoh+okDih5g+n2m2r94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IaxlxZ0djrFwhmYH9v4Mpl/S8RXIoOt7AbxwIcJBxRw2pgNxc+Jmn+nZBp17l4DId
 143cPLEv3lypXcsJ5jeOSJSQl6WTM3eecjNT7R6afva3qA0E3P1JQ+3kIZa8JV+B2K
 p6B6VKABNTyEK8R2D5rKqOsPrYUNIU4TFWR/YPxIicg4Wtu3J/K5X2Fw8X0Ey9hxhV
 ebuz9535ac4zMZm+MvGOUI3PH3So5YHVg+iBHI3S2RyJSriwov/DYUke6t4eqDG6um
 4ysV8pPLtxAoI8LXb+qX+uOpi4wLa3yv3Gx4Q/Thjj7T7lgCYTEP7d+ZW/FTjMXQGi
 xbxbEgXIZCFmA==
Date: Tue, 27 Jul 2021 17:39:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Saleem Abdulrasool <abdulras@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: explicitly use symbol offsets for VDSO
Message-ID: <YQCnQARTYgAP9hbU@Ryzen-9-3900X.localdomain>
References: <20210707185105.1180526-1-abdulras@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707185105.1180526-1-abdulras@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_173933_043261_93D545C5 
X-CRM114-Status: GOOD (  36.81  )
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

Hi Saleem,

On Wed, Jul 07, 2021 at 06:51:05PM +0000, Saleem Abdulrasool wrote:
> The current implementation of the `__rt_sigaction` reference computed an
> absolute offset relative to the mapped base of the VDSO.  While this can
> be handled in the medlow model, the medany model cannot handle this as
> it is meant to be position independent.  The current implementation
> relied on the BFD linker relaxing the PC-relative relocation into an
> absolute relocation as it was a near-zero address allowing it to be
> referenced relative to `zero`.
> 
> We now extract the offsets and create a generated header allowing the
> build with LLVM and lld to succeed as we no longer depend on the linker
> rewriting address references near zero.  This change was largely
> modelled after the ARM64 target which does something similar.
> 
> Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> ---
>  arch/riscv/Makefile                        |  4 ++++
>  arch/riscv/include/asm/vdso.h              | 11 ++---------
>  arch/riscv/kernel/vdso/Makefile            | 21 +++++++++------------
>  arch/riscv/kernel/vdso/gen_vdso_offsets.sh |  5 +++++
>  arch/riscv/kernel/vdso/so2s.sh             |  6 ------
>  5 files changed, 20 insertions(+), 27 deletions(-)
>  create mode 100755 arch/riscv/kernel/vdso/gen_vdso_offsets.sh
>  delete mode 100755 arch/riscv/kernel/vdso/so2s.sh
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index e241e0e85ac8..f2beaa3c9fcb 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -92,6 +92,10 @@ PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>  
> +prepare: vdso_prepare
> +vdso_prepare: prepare0
> +	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
> +
>  ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_KENDRYTE),yy)
>  KBUILD_IMAGE := $(boot)/loader.bin
>  else
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index 8454f746bbfd..a72c4093d1c7 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -9,24 +9,17 @@
>  #define _ASM_RISCV_VDSO_H
>  
>  #include <linux/types.h>
> +#include <generated/vdso-offsets.h>
>  
>  #ifndef GENERIC_TIME_VSYSCALL
>  struct vdso_data {
>  };
>  #endif
>  
> -/*
> - * The VDSO symbols are mapped into Linux so we can just use regular symbol
> - * addressing to get their offsets in userspace.  The symbols are mapped at an
> - * offset of 0, but since the linker must support setting weak undefined
> - * symbols to the absolute address 0 it also happens to support other low
> - * addresses even when the code model suggests those low addresses would not
> - * otherwise be availiable.
> - */
>  #define VDSO_SYMBOL(base, name)							\
>  ({										\
>  	extern const char __vdso_##name[];					\
> -	(void __user *)((unsigned long)(base) + __vdso_##name);			\
> +	(void __user *)((unsigned long)(base) + __vdso_##name##_offset);	\
>  })
>  
>  asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f001ae91ef46..17cb755cf282 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -42,20 +42,22 @@ $(obj)/vdso.o: $(obj)/vdso.so
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>  	$(call if_changed,vdsold)
> -LDFLAGS_vdso.so.dbg = -shared -s -soname=linux-vdso.so.1 \
> +LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
>  	--build-id=sha1 --hash-style=both --eh-frame-hdr
>  
> -# We also create a special relocatable object that should mirror the symbol
> -# table and layout of the linked DSO. With ld --just-symbols we can then
> -# refer to these symbols in the kernel code rather than hand-coded addresses.
> -$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
> -	$(call if_changed,so2s)
> -
>  # strip rule for the .so file
>  $(obj)/%.so: OBJCOPYFLAGS := -S
>  $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  	$(call if_changed,objcopy)
>  
> +# Generate VDSO offsets using helper script
> +gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
> +quiet_cmd_vdsosym = VDSOSYM $@
> +	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +
> +include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
> +	$(call if_changed,vdsosym)
> +
>  # actual build commands
>  # The DSO images are built using a special linker script
>  # Make sure only to export the intended __vdso_xxx symbol offsets.
> @@ -64,11 +66,6 @@ quiet_cmd_vdsold = VDSOLD  $@
>                     $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>                     rm $@.tmp
>  
> -# Extracts symbol offsets from the VDSO, converting them into an assembly file
> -# that contains the same symbols at the same offsets.
> -quiet_cmd_so2s = SO2S    $@
> -      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
> -
>  # install commands for the unstripped file
>  quiet_cmd_vdso_install = INSTALL $@
>        cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
> diff --git a/arch/riscv/kernel/vdso/gen_vdso_offsets.sh b/arch/riscv/kernel/vdso/gen_vdso_offsets.sh
> new file mode 100755
> index 000000000000..c2e5613f3495
> --- /dev/null
> +++ b/arch/riscv/kernel/vdso/gen_vdso_offsets.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +LC_ALL=C
> +sed -n -e 's/^[0]\+\(0[0-9a-fA-F]*\) . \(__vdso_[a-zA-Z0-9_]*\)$/\#define \2_offset\t0x\1/p'
> diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
> deleted file mode 100755
> index e64cb6d9440e..000000000000
> --- a/arch/riscv/kernel/vdso/so2s.sh
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0+
> -# Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
> -
> -sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)\(@@LINUX_4.15\)*!.global \2\n.set \2,0x\1!' \
> -| grep '^\.'
> -- 
> 2.32.0.93.g670b81a890-goog

I had a difficult time getting this patch to apply as it does not appear
to be generated against the latest mainline tree, since the diff does
account for at least commit 772d7891e8b3 ("riscv: vdso: fix and clean-up
Makefile"), 08734e0581a5 ("riscv: Use vendor name for K210 SoC
support"), and 44c922572952 ("RISC-V: enable XIP") in it.

I was able to get it to apply but then I ran into the following error:

make[5]: *** No rule to make target 'arch/riscv/kernel/vdso/vdso-syms.o', needed by 'arch/riscv/kernel/vdso/built-in.a'.

The following diff works for me and it appears to build and boot in QEMU
without any issues. However, the errors on 5.10 still persist, I've commented
on GitHub for now.

Cheers,
Nathan

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index fa60e8241e42..f8cb9144a284 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -23,10 +23,10 @@ ifneq ($(c-gettimeofday-y),)
 endif

 # Build rules
-targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-syms.S
+targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
 obj-vdso := $(addprefix $(obj)/, $(obj-vdso))

-obj-y += vdso.o vdso-syms.o
+obj-y += vdso.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)

 # Disable -pg to prevent insert call site

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
