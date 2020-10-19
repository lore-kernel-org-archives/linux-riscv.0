Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8D7C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 19:24:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3387522260
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 19:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zlFf+Yx9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ju2ohyzm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3387522260
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DGx6YZUYYyv8ys25n8/73FgrqzwMYELbujOSzJtQbns=; b=zlFf+Yx9VbvD4wil8N59NZrza
	CcqIGSgiOrfF80RazsTSWjBdtcVSjG+T6ozjE/ih7KMAOiHlJj3XLMdBMji1nuL5Xlbe94XSgheXx
	ADTVwYJiO/gY7hFbUcOYeSFB4BWTs1u4uEb3jENt/M8Q9+dbS0u5zG1T3ZSSKdx5c1NS+89j/oS1B
	l5pXUYdL7FCICUk8Q8XboezB2J0JHofTBKiQj3ODljGELH4JK20dnrxuaCkjQvaJeu/XnQbOlG0zk
	CH16AsQe7vWK7q6rPMd8+yC7fVKw7btLbK6454aYIFFQGDItZBSqo+r37Of/ZO1TrOhZRugpmKzfI
	BTALLGbQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUalY-0006ki-Mi; Mon, 19 Oct 2020 19:24:20 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUalW-0006jy-5R
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 19:24:19 +0000
Received: by mail-pl1-x644.google.com with SMTP id h2so280465pll.11
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uIfWuzz/Oi2OkmAg7QQj+om01xgjYQC13tivpsY4ap0=;
 b=ju2ohyzmil762bBA/+brUwTLU43sMSwJMV0FhC8+6ixcmC2U/oxWhswQCiDoLgBTUq
 p38dzwpBKwDZa/efpZvK4m6WhqPMHbQ2nXWl6u+aLkz1P1YvH2ZTBMGTYtlij0fGVrR1
 8/4wmK5ZOlv3i1Wo/uWqlSeTjUL8TPN+LYBhvCcT+4ll1YeCG4PA5efit4fMi7TBt36X
 446mVLHBrmxiOeOxV3oXOWdivJ5xLjlSbBhAidBizfZ88KKnU02l2rj8QkkZBYdfpXMO
 V9o0f74EhHJEqH7/ORiwM5hXl41CnZyh2cXElz3eU497i0hMHhN0wQhJHKmr9CwS/VwY
 thnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIfWuzz/Oi2OkmAg7QQj+om01xgjYQC13tivpsY4ap0=;
 b=WMGSr51+0m7UCAT+ZTjYcmI2tZRWG3yWPquokvsh6eeeRnIIiinbVLbAM0Ahjchtcp
 bqVPb2GCGrexxvSE+EIp0K2becpAiV9uE6y0HDT7SMFAtn5H0QoMw7mbVorRnYGcb9Oe
 Yrg71vDCvQAc3i5bQ82JqSU4vbobj0letZ1l3Wzl148mItkL3LSLrvqSqJ1RkcOYwwgs
 6tN86/XI+X5JzJhYhl7cw75bcHOUOcjmuBM6N3Eh7+edcQ5NqDkmOQ0PMsjCXV56+Thk
 DxYgvTvo0U/hVpTiFngj4XFEIilBktlSBA/4NbQQIZST1vOZUC0OOjOYQkEAaD8j5yBf
 eaOw==
X-Gm-Message-State: AOAM531WpUPjqhwc/tAq+ci2BCw41OJAiqLfi6G9GJEh8i6oyegkuvZS
 NQQcBr6+Y1w1d4NZcQWyidAfu6eMwMV15idQXjjctg==
X-Google-Smtp-Source: ABdhPJwkm9qKOonfmzQG2CiafojX189ed37IunFvJ5nWQQY16dHeLxrFVDxkHYRel+Q/LZos+oZFpTmwL6ODbB6paFw=
X-Received: by 2002:a17:902:c40b:b029:d3:def2:d90f with SMTP id
 k11-20020a170902c40bb02900d3def2d90fmr1361931plk.29.1603135453759; Mon, 19
 Oct 2020 12:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201017002500.503011-1-palmerdabbelt@google.com>
In-Reply-To: <20201017002500.503011-1-palmerdabbelt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 19 Oct 2020 12:24:02 -0700
Message-ID: <CAKwvOdnsRHA1WMb7OWi-jV662xLrBBBZ=zBbB1gvfpBqVFeSfQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix the VDSO symbol generaton for binutils-2.34+
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_152418_241376_45B8388F 
X-CRM114-Status: GOOD (  30.39  )
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

On Fri, Oct 16, 2020 at 5:44 PM 'Palmer Dabbelt' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> We were relying on GNU ld's ability to re-link executable files in order
> to extract our VDSO symbols.  This behavior was deemed a bug as of
> binutils-2.34 (specifically the binutils-gdb commit a87e1817a4 ("Have
> the linker fail if any attempt to link in an executable is made."),
> which IIUC landed in 2.34), which recently installed itself on my build
> setup.
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
> Cc: stable@vger.kernel.org
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Ah, I do see a build failure to link the vdso with:
$ riscv64-linux-gnu-ld --version
GNU ld (GNU Binutils for Debian) 2.34.90.20200706

riscv64-linux-gnu-ld: cannot use executable file
'arch/riscv/kernel/vdso/vdso-dummy.o' as input to a link

This patch fixes that for me, but there's a problem related to related
to `nm` below.

After this, there's two other things we might want to fix up related
to the build of the vdso:
1. it looks like $(CC) is being used to link the vdso, rather than
$(LD).  While it's generally fine to use the compiler as the driver
for building a linked object file, it does not respect the set $(LD).
`-fuse-ld=` needs to be passed to invoke the linker the user
specified.  See also:
https://lore.kernel.org/linux-kbuild/20201013033947.2257501-1-natechancellor@gmail.com/T/#u
(this has popped up in a few places when trying to do hermetic builds
with LLD).
2. I observe the warning when building with clang: `argument unused
during compilation: '-no-pie' [-Wunused-command-line-argument]`. IIRC,
the top level Makefile sets `-Qunused-arguments` for builds with
clang.  `cmd_vdsold` may need that, but it's curious why it's unused
and makes me wonder why/if `-no-pie` is necessary?  That also might be
fixed by fixing 1.

> ---
>  arch/riscv/kernel/vdso/.gitignore |  1 +
>  arch/riscv/kernel/vdso/Makefile   | 19 +++++++++----------
>  arch/riscv/kernel/vdso/so2s.sh    |  7 +++++++
>  3 files changed, 17 insertions(+), 10 deletions(-)
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
> index 478e7338ddc1..2e02958f6224 100644
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
> @@ -68,11 +63,15 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Make sure only to export the intended __vdso_xxx symbol offsets.
>  quiet_cmd_vdsold = VDSOLD  $@
>        cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
> -                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
> +                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp -Wl,-Map,$@.map && \
>                     $(CROSS_COMPILE)objcopy \
>                             $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>                     rm $@.tmp
>
> +# Extracts
> +quiet_cmd_so2s = SO2S    $@
> +      cmd_so2s = $(CROSS_COMPILE)nm -D $< | $(src)/so2s.sh > $@

This should use `$(NM)` rather than `$(CROSS_COMPILE)nm` which
hardcodes the use of GNU nm from GNU binutils.

> +
>  # install commands for the unstripped file
>  quiet_cmd_vdso_install = INSTALL $@
>        cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
> diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
> new file mode 100755
> index 000000000000..7862866b5ebb
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

-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
