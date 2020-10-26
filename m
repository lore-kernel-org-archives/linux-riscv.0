Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BC8C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 19:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2083220773
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 19:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flCV6nDl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="FrcQ2jUF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2083220773
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Ep+6bZBB8KjtzLIf0Zng2t7Oh/ER8d1ia0veSdfaYs=; b=flCV6nDlQAE2K88P43VcNDXba
	slYOUA2xlmrx8C60yYGUYow1cZ9BGfwPhedkuEnYhoIymFub+O1ZMHv56ezy56XVyd2ufYEUk12cc
	VhxYbXavxUlVocBMVJvXXJ8Exma1BO+JFclmJI3AAG0NHACwrpaEUN/PGSknozI72JSTAz7tyo9MK
	xwFo1mRkz0zmIBNNH+Xt0cFf4eKvEu/Caq/PeFg9gti7b3R96PxzRWdL/p5eRgkY39tw92bkaMsN+
	x4CM5FJUAxlXYzUSPrI3QMdV6Z25Q8rwkpGpeBbzfXO7fqGxqOc8MDGCEkcc4mhbC4PgWmp6Crurq
	JZ3S6HseA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX8Th-0005EK-9Q; Mon, 26 Oct 2020 19:48:25 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX8Te-0005DJ-Md
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 19:48:24 +0000
Received: by mail-pf1-x442.google.com with SMTP id 10so6785492pfp.5
 for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2020 12:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=doiRAFC5F5k0Pyq4fvs/ODdap3/UO+Ut/LZ4yfCBqcQ=;
 b=FrcQ2jUFe4WvgbiY4vxGQxzWTKB09nYh5F9jaFKLDJV2pIlD6AmzIr/mMbvK6AkxzN
 c9x8TcE/YmkmT40PSBDKUjBLWd8a9vwOpcvBQITSl+1OMkwCP5j/QGDzqCtWi5pkctVb
 +Ne/vkvyGH+gp8mslhLSekhWG5CYwQ7rj0ZRP2++tJG3hdY1c62fw6+koDCTmKVqaEW4
 QmCkUs19URqbr73JbhHch1Ef7U7PhB7O53NdtNW4asv6ml39JuBUlp1ajVbEeU2/roVy
 asj7FvxAAyB9h+JKw3m8ws8eo5XF8MLoztMA9VtZwxa0Hs4E4F1QNLHdS8RGQz8MdF5n
 Q2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=doiRAFC5F5k0Pyq4fvs/ODdap3/UO+Ut/LZ4yfCBqcQ=;
 b=EQUMjbZVEq9t0sFg7ft0gR/AqEWCFVzkJV59RUH7qItUpMswcLB0LPbSpMxRXWK2we
 QGMb9zmF+dV8xwEuF94pefi+r1zmLXpBwxbVJphK5wV4Q1WAoEa1ptcRCb/Y58a/8LJz
 NeNKYzMUPJu2Oee6Yon6GIrWn/bhsJJR58fOxKL0lFQQ8n7Axmim7BqN7KknaGGRx0fG
 ie4xxNXPwJ/wNhDDjGFawE+49ci20EwVtqlzSPV3vuWWUyc2M7XXv1/mvqlibfRnNz2b
 7HLcrIyXgDsVQNmHyyi5ZJ8YeQtz+2nnEeqy3STrzvBNM4bOJzvC0a8uWSWgp0amSNmF
 VbYA==
X-Gm-Message-State: AOAM533aJX+QQAN8haCu30r7uWW6D1BaRLAMDDufvJH9yBtKvElAwZUm
 Yz4gKetpuMrYjk9YjCRVND67/movWHJJHT3SodWAyg==
X-Google-Smtp-Source: ABdhPJyDrUHKeb08a2I8Bc7zcdgb45iTqty7MePTVMxTuJuvlkxrX48Ze7NNkghUEIwbeysCilJCOtxaOJivQLbsMHs=
X-Received: by 2002:aa7:9a04:0:b029:163:fe2a:9e04 with SMTP id
 w4-20020aa79a040000b0290163fe2a9e04mr3150062pfj.30.1603741699320; Mon, 26 Oct
 2020 12:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201024045046.3018271-1-palmerdabbelt@google.com>
In-Reply-To: <20201024045046.3018271-1-palmerdabbelt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Oct 2020 12:48:08 -0700
Message-ID: <CAKwvOdn5ib_WHpTg8YpHtqeOMLs+QDxVkzb8fuyDUL_N9BA_xw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Fix the VDSO symbol generaton for
 binutils-2.35+
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_154822_838397_E9CA822B 
X-CRM114-Status: GOOD (  29.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-riscv@lists.infradead.org, kernel-team <kernel-team@android.com>,
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 10:03 PM 'Palmer Dabbelt' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> We were relying on GNU ld's ability to re-link executable files in order
> to extract our VDSO symbols.  This behavior was deemed a bug as of
> binutils-2.35 (specifically the binutils-gdb commit a87e1817a4 ("Have
> the linker fail if any attempt to link in an executable is made."), but as that
> has been backported to at least Debian's binutils-2.34 in may manifest in other
> places.
>
> The previous version of this was a bit of a mess: we were linking a
> static executable version of the VDSO, containing only a subset of the
> input symbols, which we then linked into the kernel.  This worked, but
> certainly wasn't a supported path through the toolchain.  Instead this
> new version parses the textual output of nm to produce a symbol table.
> Both rely on near-zero addresses being linkable, but as we rely on weak
> undefined symbols being linkable elsewhere I don't view this as a major
> issue.
>
> Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
> Cc: clang-built-linux@googlegroups.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Any way to improve the error message if/when this fails?
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/407165683

>
> ---
>
> Changes since v2 <20201019235630.762886-1-palmerdabbelt@google.com>:
>
> * Uses $(srctree)/$(src) to allow for out-of-tree builds.
>
> Changes since v1 <20201017002500.503011-1-palmerdabbelt@google.com>:
>
> * Uses $(NM) instead of $(CROSS_COMPILE)nm.  We use the $(CROSS_COMPILE) form
>   elsewhere in this file, but we'll fix that later.
> * Removed the unnecesary .map file creation.
>
> ---
>  arch/riscv/kernel/vdso/.gitignore |  1 +
>  arch/riscv/kernel/vdso/Makefile   | 17 ++++++++---------
>  arch/riscv/kernel/vdso/so2s.sh    |  6 ++++++
>  3 files changed, 15 insertions(+), 9 deletions(-)
>  create mode 100755 arch/riscv/kernel/vdso/so2s.sh
>
> diff --git a/arch/riscv/kernel/vdso/.gitignore b/arch/riscv/kernel/vdso/.gitignore
> index 11ebee9e4c1d..3a19def868ec 100644
> --- a/arch/riscv/kernel/vdso/.gitignore
> +++ b/arch/riscv/kernel/vdso/.gitignore
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  vdso.lds
>  *.tmp
> +vdso-syms.S
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 478e7338ddc1..a8ecf102e09b 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -43,19 +43,14 @@ $(obj)/vdso.o: $(obj)/vdso.so
>  SYSCFLAGS_vdso.so.dbg = $(c_flags)
>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>         $(call if_changed,vdsold)
> +SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> +       -Wl,--build-id -Wl,--hash-style=both
>
>  # We also create a special relocatable object that should mirror the symbol
>  # table and layout of the linked DSO. With ld --just-symbols we can then
>  # refer to these symbols in the kernel code rather than hand-coded addresses.
> -
> -SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> -       -Wl,--build-id -Wl,--hash-style=both
> -$(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
> -       $(call if_changed,vdsold)
> -
> -LDFLAGS_vdso-syms.o := -r --just-symbols
> -$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
> -       $(call if_changed,ld)
> +$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
> +       $(call if_changed,so2s)
>
>  # strip rule for the .so file
>  $(obj)/%.so: OBJCOPYFLAGS := -S
> @@ -73,6 +68,10 @@ quiet_cmd_vdsold = VDSOLD  $@
>                             $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>                     rm $@.tmp
>
> +# Extracts
> +quiet_cmd_so2s = SO2S    $@
> +      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
> +
>  # install commands for the unstripped file
>  quiet_cmd_vdso_install = INSTALL $@
>        cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
> diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
> new file mode 100755
> index 000000000000..3c5b43207658
> --- /dev/null
> +++ b/arch/riscv/kernel/vdso/so2s.sh
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0+
> +# Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
> +
> +sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)@@LINUX_4.15!.global \2\n.set \2,0x\1!' \
> +| grep '^\.'
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201024045046.3018271-1-palmerdabbelt%40google.com.



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
