Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4BCC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710AF6128A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 710AF6128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hYNQUHACQEC7PL26/OS5UPD/WkcPej2ufYxhp17/kuk=; b=N9nLyWm7c6UCWkLh4NUIAv17OW
	3x0KSgSZ2gUXPJf+6Q+1ABUDUbRjFB16Sk4hrQ9eH2Q4t4UsbkKNNP+0yLvxCftaDx2q9ToJjKWKW
	E6w7ulC/OfPiULEduwrsh4AadW6j1WmTOh93NqVp9DwPA2eqN28k/GPtGc2OMiM7r91HadvjCdY8K
	W91PdvTe63FIo2wFlRaMACnOteVMf9qDQarttlHVxg+ShKyv3pDLZeWpf0zuy2wWqLJmv9Aq0sZ1V
	MAN5t+CONQGl/F4HHaMd1Kt7+ZONpKrQUjryWa2pu81KKKesdDMqti64PxE/KLVoNuAkm8Tz9mnAU
	oHpLyY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIkvz-005VAs-8E; Wed, 25 Aug 2021 04:54:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIkvt-005VAO-5v
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 04:54:42 +0000
Received: by mail-pl1-x62d.google.com with SMTP id q3so1762007plx.4
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 21:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aauOcYKQzuccwG+K+JsY0KHiVjAx8DxyADm89FIzrnc=;
 b=L1l8gaVH3eoLzb8xf721pmxhgE65WlC+w49GyfBtCt6IYIKX95DPWN6lM8mC6wcXk7
 5T5OPz2c4if2esfHeig7y6N/Ze1zSogMkV301s3G+LUYRh9bpN1fyII77h4ycoHHiiSc
 94sMDRJg1WMs5so7ClSXIBcW1T1ufIRU0G85zcaqrJXeuDeorDVyQZ0nkS6Kd1Kjcj0G
 Pg7dBwHHnJQ5H3W1B+zl+QOS+om36KO7vNAWXoBxWvUqvhTJkUV/dANJuDROKvTcTuUb
 ePRWfXXabYoKhBhTOoCU9lqgsEDZc7jVHzjZdzcrBcpmmhXuDVb+RJEPTjozA3s2gPZp
 sStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aauOcYKQzuccwG+K+JsY0KHiVjAx8DxyADm89FIzrnc=;
 b=TuvOx5082Tp008+gy22++ZHFTTU7ancfo7bRlWpBq3iMA3q6INDJ8i0CZg3Q0V69fB
 Yu6hvpOQxY0dXantAlcUoR2/aeQh20c/8LWXRpAbbv2AAcxHQ+LuLtZXn0J7GwHsDKmF
 Kn+kI/dFLg+FVq4U5KmPXOQ3TM7EQxdmVUUzeHbqj1y6KIwvUX748+uYlQz07hkEKfQN
 i9idLJ1YFIwYmusOhc7x/Xypbue3ppNk9GCb1Drvv3RRgt9cZb9tcx6rDARiTUFJx287
 axfmDlnaVTTwgbcDxupv8r19LaAMHz4luKFiaJr8OQKoqrQ2Ra+Wm+rEwJbGAokW9FMo
 Yqvw==
X-Gm-Message-State: AOAM5319F2FYVrPoN8RzvjK7OR7lACFgN9Ld/3n7+XsZEPcaSLC+t1Ju
 rlMcPJwC6kKuiu0EYlUPTCAZK+fww+bMUfql
X-Google-Smtp-Source: ABdhPJx2LSHjA37segM0q2dY7ujwUT8u5hS9/EkdL7E3MculJFWvjS2c9R/IeoaUZ5DZJ/ZSt3GRgg==
X-Received: by 2002:a17:902:c412:b0:137:c25c:8536 with SMTP id
 k18-20020a170902c41200b00137c25c8536mr988168plk.16.1629867275729; 
 Tue, 24 Aug 2021 21:54:35 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u24sm22051028pfm.27.2021.08.24.21.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 21:54:35 -0700 (PDT)
Date: Tue, 24 Aug 2021 21:54:35 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 21:54:31 PDT (-0700)
Subject: Re: [PATCH v3] riscv: explicitly use symbol offsets for VDSO
In-Reply-To: <20210804173214.1027994-1-abdulras@google.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 nathan@kernel.org, 
 ndesaulniers@google.com, morbo@google.com, clang-built-linux@googlegroups.com,
 abdulras@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: abdulras@google.com
Message-ID: <mhng-a7fbcae6-db7b-48d5-808f-3f8eff233ea9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_215437_318264_8C146CFA 
X-CRM114-Status: GOOD (  33.86  )
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

On Wed, 04 Aug 2021 10:32:14 PDT (-0700), abdulras@google.com wrote:
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
>  arch/riscv/include/asm/vdso.h              | 14 ++----------
>  arch/riscv/kernel/vdso/Makefile            | 25 ++++++++++------------
>  arch/riscv/kernel/vdso/gen_vdso_offsets.sh |  5 +++++
>  arch/riscv/kernel/vdso/so2s.sh             |  6 ------
>  5 files changed, 22 insertions(+), 32 deletions(-)
>  create mode 100755 arch/riscv/kernel/vdso/gen_vdso_offsets.sh
>  delete mode 100755 arch/riscv/kernel/vdso/so2s.sh
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..e026b2d0a5a4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -108,6 +108,10 @@ PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>
> +prepare: vdso_prepare
> +vdso_prepare: prepare0
> +	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
> +
>  ifneq ($(CONFIG_XIP_KERNEL),y)
>  ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
>  KBUILD_IMAGE := $(boot)/loader.bin
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index 1453a2f563bc..d8d003c2b5a3 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -9,25 +9,15 @@
>  #define _ASM_RISCV_VDSO_H
>
>  #include <linux/types.h>
> +#include <generated/vdso-offsets.h>
>
>  #ifndef CONFIG_GENERIC_TIME_VSYSCALL
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
> -({										\
> -	extern const char __vdso_##name[];					\
> -	(void __user *)((unsigned long)(base) + __vdso_##name);			\
> -})
> +	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
>
>  asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 24d936c147cd..f8cb9144a284 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -23,10 +23,10 @@ ifneq ($(c-gettimeofday-y),)
>  endif
>
>  # Build rules
> -targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-syms.S
> +targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
>  obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>
> -obj-y += vdso.o vdso-syms.o
> +obj-y += vdso.o
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>
>  # Disable -pg to prevent insert call site
> @@ -43,20 +43,22 @@ $(obj)/vdso.o: $(obj)/vdso.so
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
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
> @@ -65,11 +67,6 @@ quiet_cmd_vdsold = VDSOLD  $@
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

This is on for-next.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
