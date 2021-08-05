Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3634AC432BE
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FE260F01
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2FE260F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL6icXBoq5kI0m9OdnB//MkKlrBIG/tHxHFRRMe+1Gs=; b=mPogME8qIJaVGiZDRc8l3OEiOg
	uom4XfGffrTGJ7yg7hkeEvnsjb3n2w0kc71tHlImmCYA8VKDpOqgx8dpPXiOZfs432yYHvncbzszA
	uWmlU0f0Eb2+3Sv3XtPZkS5eP+SWOUwygmCavHPRdOtF2ax5GA08pJeDRi/bYhBtcxMq19w8V6BY0
	SCDK8kxmJvPxVdS8hr0L94Tf7NBClB5JA42isin4taMjRDCe+iH32hhK//a4eAPOFLcRHOGryRjnd
	omROP5vdPiDV6j2fnUsBpBS+ZRASXswwdAb05Ak/eTsKMZGLqLEaHYXWT7peAgiAO1lgWZe1SeUGJ
	6CV9VQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiMA-00AYAs-Nb; Thu, 05 Aug 2021 18:44:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiM7-00AYAP-Kk
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 18:44:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5783560F01;
 Thu,  5 Aug 2021 18:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628189074;
 bh=V+yClbERtd7wR+Quq7Ck+f5fI7p0BVNHghH2h61vC5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i/JOA3obDm/t8FHfX/Xt8EPazAVkBXdScd7XlsrQJXPAsuHuwxxn7bjGTC/FzMVyJ
 Xad6/KroTVtmH5Ez43wC1ZvZ+Ts2Wp0JmvtxG0k9TZhcLbiDs2xdfOcr6T+vhgEDm3
 wZTwIs8ioQHnXD6ZdN91prn+iAe6ry84ScHuAUnWWYjrZasYw0JfvsSCTJR+YzPBhA
 2lEuQraoTbbvIDEi6eVFW4LH2elbgbrCj2ovCAfaYrpk16Jhy5JzZFL4NWalMY/Dxj
 aBEGH4Xytj/mr3WQToz9H13g4o5QCa12knMUYL7tzhyFP0febL8s86NicQGaPMiu0b
 9/X28esndF70g==
Subject: Re: [PATCH v3] riscv: explicitly use symbol offsets for VDSO
To: Saleem Abdulrasool <abdulras@google.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, clang-built-linux@googlegroups.com
References: <20210804173214.1027994-1-abdulras@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <615fafba-bdcc-7f13-483d-6f3ef405924c@kernel.org>
Date: Thu, 5 Aug 2021 11:44:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804173214.1027994-1-abdulras@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_114435_770993_7A4D42C1 
X-CRM114-Status: GOOD (  29.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/4/2021 10:32 AM, 'Saleem Abdulrasool' via Clang Built Linux wrote:
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

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   arch/riscv/Makefile                        |  4 ++++
>   arch/riscv/include/asm/vdso.h              | 14 ++----------
>   arch/riscv/kernel/vdso/Makefile            | 25 ++++++++++------------
>   arch/riscv/kernel/vdso/gen_vdso_offsets.sh |  5 +++++
>   arch/riscv/kernel/vdso/so2s.sh             |  6 ------
>   5 files changed, 22 insertions(+), 32 deletions(-)
>   create mode 100755 arch/riscv/kernel/vdso/gen_vdso_offsets.sh
>   delete mode 100755 arch/riscv/kernel/vdso/so2s.sh
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..e026b2d0a5a4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -108,6 +108,10 @@ PHONY += vdso_install
>   vdso_install:
>   	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>   
> +prepare: vdso_prepare
> +vdso_prepare: prepare0
> +	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
> +
>   ifneq ($(CONFIG_XIP_KERNEL),y)
>   ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
>   KBUILD_IMAGE := $(boot)/loader.bin
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index 1453a2f563bc..d8d003c2b5a3 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -9,25 +9,15 @@
>   #define _ASM_RISCV_VDSO_H
>   
>   #include <linux/types.h>
> +#include <generated/vdso-offsets.h>
>   
>   #ifndef CONFIG_GENERIC_TIME_VSYSCALL
>   struct vdso_data {
>   };
>   #endif
>   
> -/*
> - * The VDSO symbols are mapped into Linux so we can just use regular symbol
> - * addressing to get their offsets in userspace.  The symbols are mapped at an
> - * offset of 0, but since the linker must support setting weak undefined
> - * symbols to the absolute address 0 it also happens to support other low
> - * addresses even when the code model suggests those low addresses would not
> - * otherwise be availiable.
> - */
>   #define VDSO_SYMBOL(base, name)							\
> -({										\
> -	extern const char __vdso_##name[];					\
> -	(void __user *)((unsigned long)(base) + __vdso_##name);			\
> -})
> +	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
>   
>   asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
>   
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 24d936c147cd..f8cb9144a284 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -23,10 +23,10 @@ ifneq ($(c-gettimeofday-y),)
>   endif
>   
>   # Build rules
> -targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-syms.S
> +targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
>   obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>   
> -obj-y += vdso.o vdso-syms.o
> +obj-y += vdso.o
>   CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>   
>   # Disable -pg to prevent insert call site
> @@ -43,20 +43,22 @@ $(obj)/vdso.o: $(obj)/vdso.so
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
>   	$(call if_changed,vdsold)
> -LDFLAGS_vdso.so.dbg = -shared -s -soname=linux-vdso.so.1 \
> +LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
>   	--build-id=sha1 --hash-style=both --eh-frame-hdr
>   
> -# We also create a special relocatable object that should mirror the symbol
> -# table and layout of the linked DSO. With ld --just-symbols we can then
> -# refer to these symbols in the kernel code rather than hand-coded addresses.
> -$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
> -	$(call if_changed,so2s)
> -
>   # strip rule for the .so file
>   $(obj)/%.so: OBJCOPYFLAGS := -S
>   $(obj)/%.so: $(obj)/%.so.dbg FORCE
>   	$(call if_changed,objcopy)
>   
> +# Generate VDSO offsets using helper script
> +gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
> +quiet_cmd_vdsosym = VDSOSYM $@
> +	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +
> +include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
> +	$(call if_changed,vdsosym)
> +
>   # actual build commands
>   # The DSO images are built using a special linker script
>   # Make sure only to export the intended __vdso_xxx symbol offsets.
> @@ -65,11 +67,6 @@ quiet_cmd_vdsold = VDSOLD  $@
>                      $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>                      rm $@.tmp
>   
> -# Extracts symbol offsets from the VDSO, converting them into an assembly file
> -# that contains the same symbols at the same offsets.
> -quiet_cmd_so2s = SO2S    $@
> -      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
> -
>   # install commands for the unstripped file
>   quiet_cmd_vdso_install = INSTALL $@
>         cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
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
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
