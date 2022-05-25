Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672BDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AB+6IvbslamD366yd2VLszyD4bDadwQVs2OrjwW1xIg=; b=xBJh6TNV1vQhRk
	hq7gOx7W43C8Qr9Tu4je8CEgdrDHuc73FTIcB6uSiXNXAlVM3del5+TiKV1CYWir/aSOktziQ77Vn
	BQlrgzQV0aiRd2qCRAKqptvEa3DJ603JtXh9HQtJjf01Dif0vbl5UcXbj6pTOQVk/HGg/ZwPwqp8R
	1E8YCZkWKi6aGATJtrPMoThoUDqe0ou4WFbeRnOf8hVXeE+PiqZ/FCF6elgXzHLYuKfdYx6oloFnp
	wnoTjGbcSjN3MY7AEXXHluMipIy5rzYGLivV9zUZmemeEpvqFkF/rn4dJaePObxN8VxPlfQuni0KN
	tILURET9rtKtZomxQrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzRq-00Crt4-Ev; Wed, 25 May 2022 22:25:46 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzRn-00Crs3-IA
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 22:25:45 +0000
Received: by mail-lj1-x231.google.com with SMTP id s20so4230866ljd.10
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4JE5dVY5pJ4L5p/4sGg1xocj3NSEFAKSZJJs4bfl50=;
        b=fAMfron/HjbN7nd+bsG3ASO/nK1WjlcoVqa4+QdtPam6ciW/bwdYCmk9ujS4Abe4VJ
         w2sueG/5d5jh11UgLmuXnMAdarDjSChSdXdKrhg3y7F8Pjptb4ff8WlByIdiSkfEbGFm
         PkRmC+09uBSPSsg344wCJdI8n7v1Yt+vr7kQ9DePitEy6ui34PJ0AU8C5jZKRsffEDfP
         ug3LM0AmYwwUZHhVNWlMxQzBz79rShyO1d1dkhvX1r4lmvgXBfWQm+lShZOQXq9rxarC
         SWsS9kfyfYspj/5U44fShRnUcSFmlbceeiOtALpaquQdvDHDNyVkshBPqlQYpF3P0oqm
         UHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4JE5dVY5pJ4L5p/4sGg1xocj3NSEFAKSZJJs4bfl50=;
        b=7XhrngxigP4x+hMUXug9yYp2YX/OLJ1IPc2wJ9AeQIKFgQ84qQpbIDsXtmDg5W0mFG
         iHVkTx2S4TfQg9XMzpEPDbelKh+eFIDmkXe+MvCXRQD5CV0AJ0l+FYidkmFLgV6fryPF
         g3tSJnB21H8phZOuFRRDQp/q+GAQHNWydxOvrQplooYRFg+y13SCXG5ylfzowXza1K0D
         DddD6c3BaA0OSqwEaIYPLTGr70s7Tplndqx+0XGHASafn6Az3sivH+itlDSoqBeirJMO
         ZyFhffMV5gGx6sRvf5vnb36x4LVzDBA5v02D16D9TBTYALI4jAG68LRy/JTeAyxlOmgp
         GclA==
X-Gm-Message-State: AOAM5314l9E3x8jsghoO4uc4T9ld+FQl06cV+1HjToF7oPNvsuL/7gHs
	8PVY7IfIVK+EpAnlOQvJcpfjtmCp92OdOJYA+ocRvw==
X-Google-Smtp-Source: ABdhPJyyMkDOBVLKOsbECK6J7ZWww0BuYU20TDN6fYXnxk8xptFKTQXny9GfJRyE8hkAsArQFcu6jZmKOkIJSKODNlQ=
X-Received: by 2002:a2e:98c3:0:b0:253:e0e1:20 with SMTP id s3-20020a2e98c3000000b00253e0e10020mr14949440ljj.26.1653517540546;
 Wed, 25 May 2022 15:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-22-ojeda@kernel.org>
In-Reply-To: <20220523020209.11810-22-ojeda@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 May 2022 15:25:28 -0700
Message-ID: <CAKwvOdn+9qORm8UpDGnPXxiK7B7P_TW5CtXv1+8qkv7UvQr3hQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Finn Behrens <me@kloenk.de>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Sven Van Asbroeck <thesven73@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>, Douglas Su <d0u9.su@outlook.com>, 
	Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, Antonio Terceiro <antonio.terceiro@linaro.org>, 
	Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>, David Gow <davidgow@google.com>, 
	Michal Marek <michal.lkml@markovi.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-um@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_152543_665725_5AF74932 
X-CRM114-Status: GOOD (  32.55  )
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

On Sun, May 22, 2022 at 7:04 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> --- a/Makefile
> +++ b/Makefile
> @@ -120,6 +120,15 @@ endif
>
>  export KBUILD_CHECKSRC
>
> +# Enable "clippy" (a linter) as part of the Rust compilation.
> +#
> +# Use 'make CLIPPY=1' to enable it.
> +ifeq ("$(origin CLIPPY)", "command line")
> +  KBUILD_CLIPPY := $(CLIPPY)
> +endif

Is there a reason to not just turn clippy on always? Might be nicer to
start off with good practices by default. :^)

> @@ -1494,7 +1588,8 @@ MRPROPER_FILES += include/config include/generated          \
>                   certs/signing_key.pem \
>                   certs/x509.genkey \
>                   vmlinux-gdb.py \
> -                 *.spec
> +                 *.spec \
> +                 rust/target.json rust/libmacros.so
>
>  # clean - Delete most, but leave enough to build external modules
>  #
> @@ -1519,6 +1614,9 @@ $(mrproper-dirs):
>
>  mrproper: clean $(mrproper-dirs)
>         $(call cmd,rmfiles)
> +       @find . $(RCS_FIND_IGNORE) \
> +               \( -name '*.rmeta' \) \
> +               -type f -print | xargs rm -f

Are there *.rmeta directories that we _don't_ want to remove via `make
mrproper`? I'm curious why *.rmeta isn't just part of MRPROPER_FILES?

>
>  # distclean
>  #
> @@ -1606,6 +1704,23 @@ help:
>         @echo  '  kselftest-merge   - Merge all the config dependencies of'
>         @echo  '                      kselftest to existing .config.'
>         @echo  ''
> +       @echo  'Rust targets:'
> +       @echo  '  rustavailable   - Checks whether the Rust toolchain is'
> +       @echo  '                    available and, if not, explains why.'
> +       @echo  '  rustfmt         - Reformat all the Rust code in the kernel'
> +       @echo  '  rustfmtcheck    - Checks if all the Rust code in the kernel'
> +       @echo  '                    is formatted, printing a diff otherwise.'
> +       @echo  '  rustdoc         - Generate Rust documentation'
> +       @echo  '                    (requires kernel .config)'
> +       @echo  '  rusttest        - Runs the Rust tests'
> +       @echo  '                    (requires kernel .config; downloads external repos)'
> +       @echo  '  rust-analyzer   - Generate rust-project.json rust-analyzer support file'
> +       @echo  '                    (requires kernel .config)'
> +       @echo  '  dir/file.[os]   - Build specified target only'
> +       @echo  '  dir/file.i      - Build macro expanded source, similar to C preprocessing'
> +       @echo  '                    (run with RUSTFMT=n to skip reformatting if needed)'
> +       @echo  '  dir/file.ll     - Build the LLVM assembly file'

I don't think we need to repeat dir/* here again for rust. The
existing targets listed above (outside this hunk) make sense in both
contexts.

Does rustc really use .i as a conventional suffix for macro expanded
sources? (The C compiler might use the -x flag to override the guess
it would make based on the file extension; I'm curious if rustc can
ingest .i files or will it warn?)

> diff --git a/init/Kconfig b/init/Kconfig
> index ddcbefe535e9..3457cf596588 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> +config RUSTC_VERSION_TEXT
> +       string
> +       depends on RUST
> +       default $(shell,command -v $(RUSTC) >/dev/null 2>&1 && $(RUSTC) --version || echo n)
> +
> +config BINDGEN_VERSION_TEXT
> +       string
> +       depends on RUST
> +       default $(shell,command -v $(BINDGEN) >/dev/null 2>&1 && $(BINDGEN) --version || echo n)

Are these two kconfigs used anywhere?

> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 0496efd6e117..83e850321eb6 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -36,12 +36,12 @@ ld-option = $(success,$(LD) -v $(1))
>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>
>  # check if $(CC) and $(LD) exist
> -$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> +$(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)

Not that it's important to do so, but a couple hunks s/compiler/C
compiler/. Those _could_ probably get submitted ahead of this, but not
important to do so.

> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index 9f39b0130551..fe87389d52c0 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -1,4 +1,5 @@
>  DEBUG_CFLAGS   :=
> +DEBUG_RUSTFLAGS        :=
>
>  ifdef CONFIG_DEBUG_INFO_SPLIT
>  DEBUG_CFLAGS   += -gsplit-dwarf
> @@ -10,6 +11,12 @@ ifndef CONFIG_AS_IS_LLVM
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>
> +ifdef CONFIG_DEBUG_INFO_REDUCED
> +DEBUG_RUSTFLAGS += -Cdebuginfo=1
> +else
> +DEBUG_RUSTFLAGS += -Cdebuginfo=2
> +endif
> +

How does enabling or disabling debug info work for rustc? I may have
missed it, but I was surprised to see no additional flags getting
passed to rustc based on CONFIG_DEBUG info.

> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> new file mode 100644
> index 000000000000..c146a3407183
> --- /dev/null
> +++ b/scripts/generate_rust_target.rs

Ah, that explains the host rust build infra.  Bravo! Hard coding the
target files was my major concern last I looked at the series. I'm
very happy to see it be generated properly from .config!

I haven't actually reviewed this yet, but it makes me significantly
more confident in the series to see this approach added. Good job
whoever wrote this.

> diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
> new file mode 100755
> index 000000000000..277a64d07f22
> --- /dev/null
> +++ b/scripts/is_rust_module.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# is_rust_module.sh module.ko
> +#
> +# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
> +
> +set -e
> +
> +# Using the `16_` prefix ensures other symbols with the same substring
> +# are not picked up (even if it would be unlikely). The last part is
> +# used just in case LLVM decides to use the `.` suffix.
> +${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'

Does `$(READELF) -p .comment foo.o` print anything about which
compiler was used? That seems less brittle IMO.

---

Modulo the RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C which I'm not a fan
of, this is looking good to me. Masahiro, what are your thoughts on
the build system support?
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
