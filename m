Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E63EC4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFFE6101D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BFFE6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwEAPxHkiWy/Bfjguu39Ec4MLNc13rGsKiW82ZfbwBk=; b=d2X40dppuRdu1U
	JD6XhBJRWgSDe9Fy4mZKD92ofRPVpjyW6nEm9g+OCt1a8y6m2FOYfdy+EJrbm+r9G+Exj6y5qkPhF
	Pxi6yoh5LMOEYRDqNYpNh7sPcrV3SO43f0ps/LWSarULMkbqO5n785AMHoi79lABx3wDLR6fZ0rgq
	W2VjWsBA/QEBmxnQ1ltoxUnqfOh1K41DIgHHbtMeTZCUVKZLnxWK7VRP1XDNfrJIEDGozcF7/2GYl
	DD+Mll0bTZOYLMQ9uljJvHn/QFcE4tDpmgoBjr1obU50h12cW/Xa+rt+iG6JxtJOTutb383/Rkw3/
	TgUqKtKTXGZRPMVwXM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAjSK-000jdY-B2; Tue, 03 Aug 2021 01:42:56 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAjSH-000jcR-7K
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 01:42:55 +0000
Received: by mail-qk1-x733.google.com with SMTP id az7so18554224qkb.5
 for <linux-riscv@lists.infradead.org>; Mon, 02 Aug 2021 18:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhJekVuEhxikT2dkgVUERpPtmPxTduNhkA9B/Qb17as=;
 b=kIwwj3o6wwPZAELE5SOdYKdHZcr3NRAwGCFmSnpNErgJ+e2yLyONsr4BLnqSNYYKuk
 V4dMPHCh11tp3NMkXn+fvrVhOK49hCLHBqpKp7MnnGb+cRnwASYIVWXi4+qlctt69x8C
 6BBLBzLeP8b0vpRIvn7ozXGJ0RDUwbJDuC/NQe3TOJ7Vcip3M5Z5pI8i6OuuivSKd5q5
 dTAFZIEq0hVIpVSR9a8ij7yAMERWrtBDsA4p0xfH405SrwC9JzSbFox0qtCoxzpAqFT6
 /EEZ3vhWhJa68JLUWfn0P75ac0CpTf4UZwrLGWmAfJcoTg+pF9ZR4W0W/wb1/7dvpxdN
 dlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhJekVuEhxikT2dkgVUERpPtmPxTduNhkA9B/Qb17as=;
 b=WKco+zDCmlp4guTnE2VS/F2JUNH/fWlla57TO/YvN5xJRFheMTOZ+Uy4wOswm4Z5Pd
 lMePoUMaaOgCydzAZBC3yZaaPsiA3TrAYdRYIrMsOtV33/j88JD8PTiaKkUnIJ8iyLhD
 Ks2az3U6NMfUcZ8JlNnrV11W/+/GAUqxW1+ctYabBfDOKgDvCeIj4Jc6R2TehNQJwZhL
 cyYw21qZafFWRyNSqZRoqQRAJi3qB6hn8LabVte6p9Wj19jYzkjVdEjUEmnw0Fp38Ter
 eZo3ma7WIM/3s8w+U7OkzZIRf+KzIbmbvFHFLZc/jSNvnypCDTU04VmYjNfBY6wWiVzf
 a6Cg==
X-Gm-Message-State: AOAM530oGAFSxistXlEwufDBBxcQLvfGZy5P8Y70Qw7uSSbSxDYLAzhc
 SGGKkjcMcJK/DCJdf9RVSSlkwnI7ETotCm8uRiU=
X-Google-Smtp-Source: ABdhPJxGgMMVUlxSb45H8MeLcXhKO1hJwRdVOC68mZ/ef+XBALkIgBhOsLqjsugaVpWqCEmhq0uFwEDfQgOASkhy9Js=
X-Received: by 2002:a05:620a:109a:: with SMTP id
 g26mr19016731qkk.25.1627954970697; 
 Mon, 02 Aug 2021 18:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com>
In-Reply-To: <20210802234304.3519577-1-ndesaulniers@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Aug 2021 18:42:24 -0700
Message-ID: <CAMKF1spr_i+GugX5Mtw8bKVAHRE=GaFK6ANF3=Ya1HQSSotRTQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, clang-built-linux@googlegroups.com, 
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_184253_334358_0D11522D 
X-CRM114-Status: GOOD (  23.48  )
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

On Mon, Aug 2, 2021 at 4:43 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> LLVM_IAS=1 controls enabling clang's integrated assembler via
> -integrated-as. This was an explicit opt in until we could enable
> assembler support in Clang for more architecures. Now we have support
> and CI coverage of LLVM_IAS=1 for all architecures except a few more
> bugs affecting s390 and powerpc.
>
> This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> LLVM_IAS=0.  CI systems or developers that were previously doing builds
> with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> opted-in.
>
> This finally shortens the command line invocation when cross compiling
> with LLVM to simply:
>
> $ make ARCH=arm64 LLVM=1
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1434
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Note: base is:
> https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/
>
>  Documentation/kbuild/llvm.rst | 14 ++++++++------
>  Makefile                      |  2 +-
>  arch/riscv/Makefile           |  2 +-
>  scripts/Makefile.clang        |  6 +++---
>  4 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index f8a360958f4c..16712fab4d3a 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
>           OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>           HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>
> -Currently, the integrated assembler is disabled by default. You can pass
> -``LLVM_IAS=1`` to enable it.
> +Currently, the integrated assembler is enabled by default. You can pass
> +``LLVM_IAS=0`` to disable it.
>
>  Omitting CROSS_COMPILE
>  ----------------------
>
>  As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
>
> -Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> -``--prefix=<path>`` to search for the GNU assembler and linker.
> -
>  If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
>  from ``ARCH``.
>
> @@ -78,7 +75,12 @@ That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
>
>  For example, to cross-compile the arm64 kernel::
>
> -       make ARCH=arm64 LLVM=1 LLVM_IAS=1
> +       make ARCH=arm64 LLVM=1
> +
> +If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
> +``--prefix=<path>`` to search for the GNU assembler and linker. ::
> +

I am not sure if LLVM_IAS should also impacts linker selection

> +       make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
>
>  Supported Architectures
>  -----------------------
> diff --git a/Makefile b/Makefile
> index 444558e62cbc..b24b48c9ebb7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -845,7 +845,7 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> -ifneq ($(LLVM_IAS),1)
> +ifeq ($(LLVM_IAS),0)
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..807f7c94bc6f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -41,7 +41,7 @@ endif
>  ifeq ($(CONFIG_LD_IS_LLD),y)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
> -ifneq ($(LLVM_IAS),1)
> +ifeq ($(LLVM_IAS),0)
>         KBUILD_CFLAGS += -Wa,-mno-relax
>         KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 1f4e3eb70f88..3ae63bd35582 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -22,12 +22,12 @@ else
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif # CROSS_COMPILE
>
> -ifeq ($(LLVM_IAS),1)
> -CLANG_FLAGS    += -integrated-as
> -else
> +ifeq ($(LLVM_IAS),0)
>  CLANG_FLAGS    += -no-integrated-as
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +else
> +CLANG_FLAGS    += -integrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>
> base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
> prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
> prerequisite-patch-id: 2654829756eb8a094a0ffad1679caa75a4d86619
> prerequisite-patch-id: a51e7885ca2376d008bbf146a5589da247806f7b
> --
> 2.32.0.554.ge1b32706d8-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
