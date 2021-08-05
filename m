Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1665C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 15:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64CD76104F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 15:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64CD76104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VX4Brk6mADHvrprb3UvZKV/nKsLF2v9VlmryR8f+1do=; b=Ak3eS0hpRQaiGk
	375A0C5wbmvGZdJzPKCdh+YkqE59R3p9gN5fzCpo6qQjMvRg4BLrt7F+LaIpUPNej9iESqLmGpPJg
	59MCcGdTQ3MvbP6CAK5oH/eUgn59h/MgbOqDG++rxmAn8gllpiSNuxtZoah+AlO7CEmkJjYSRoV8O
	7VGjKVjWs+wvXGNJTqYmcTYJqngdSRP1t636AKchyt+i3IO2m0A4UXprG6ea6/nHJ7akcO0YHtPxD
	XR5dxo2nZPTcoEfXQYC9qAIueUyd9Rugf+L7i0+8SRJrVpq045O4OyU3zKxA3dOLOGnd7fkNRAEjQ
	t1eb9ABf2lZcgjDuvTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBf6q-00A22H-DZ; Thu, 05 Aug 2021 15:16:36 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBf6n-00A21n-1Y
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 15:16:35 +0000
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 175FG7ZN002686
 for <linux-riscv@lists.infradead.org>; Fri, 6 Aug 2021 00:16:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 175FG7ZN002686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628176567;
 bh=7JKVqdhk3wDgxUpgLrRBBJjC3akBTBo6VvDVu+02hPk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NbSRuTWtsSoUCcitllxBuHGpjcs6wQH82TDnRhc4ee4feibkzphqAG4g+oz9wjs19
 yXGbH+/lxlX7LcVj5qD7PWjOPp8SPSS6atZ8zwE12jPRB6cm4JDSFjJ+bnJf7n8NJL
 CfPdjzGZYmpx0Hh3Q7/oNswTtpy4pl0PsqJLrg09ug/7l02k8nv8Mf3Zrg7DQPPc8Y
 n3/y1P0QDDGu8KvDSgZ1jbXm9MHjLntCJ17k3YvjJhglCGn/5Fa4dqTKNxgacm5M+Q
 7BIN9NiNf9xU5fzZfK1SHHDiegYxKoWYCJDhvFzOuN0m/gltYCaCZv07fitMGNw9m7
 mcZqmH64jgqnA==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so10253839pjh.3
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 08:16:07 -0700 (PDT)
X-Gm-Message-State: AOAM5326tCAjvoKiSTDwywTW9MwJtgGlw+dpKgJW90l/YvcYHWCHA1oo
 F7NfTnrWGGNtkyIA3SRlsaJavmv9PXcRAZDhwkw=
X-Google-Smtp-Source: ABdhPJwrhP5GxxiXyQoPTJ4HbkL2DpweB++rWVgwsahs6nVzqpqSNzY6uS/hh/EvSpVap/wB8NFnoDkci8pzupkBsb8=
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr203382pgm.175.1628176566664; 
 Thu, 05 Aug 2021 08:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com>
In-Reply-To: <20210802234304.3519577-1-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Aug 2021 00:15:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
Message-ID: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Khem Raj <raj.khem@gmail.com>,
 Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_081633_368095_59E32C17 
X-CRM114-Status: GOOD (  25.79  )
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

On Tue, Aug 3, 2021 at 8:43 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
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



Please drop these two hunks.

I will apply my patch instead.
https://lore.kernel.org/patchwork/patch/1472580/






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


When we negate a flag that is enabled by default,
which is a common way?
 - set it to '0'
 - set is to empty


So, I was wondering if we should support
not only LLVM_IAS=0 but also LLVM_IAS=.

What do you think?


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
