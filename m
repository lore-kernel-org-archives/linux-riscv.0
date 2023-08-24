Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B2C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oyRWh7jkrz1ERPBNmi0p62sTJpESRyCuhYWKZuFwne8=; b=w2K
	mrGiwSr9Jys0gXTh09EpolYOPwtUI2Mhv3uRwsKb9irjQINNUmOjp+27j6HWgQ/MP/OUOllApmd0/
	BRdf6mCDqsVYXZSXeUuL8WYeFd9tiLFR54A3RO8gtTcBoydusRN1L/7R19VIcM7REKev5q7sT1Ovs
	dq0E26xpcCc5tPPF2ZgyUke0Vny8aLqvw/aS6uTKpe9viF0g799o3CcSBa9m5hZ13T7EEVkb4bH6c
	mIQSpv+n1pBJ/U15CGN2DXtNf7vKSvin0XtDnvdG/Es+awQHwigj2GcU9exiRhY85wjAeJaUymh1j
	BbLykZZbYPdit6G5rS9Oid4LExnDl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEg3-003Z5z-0Z;
	Thu, 24 Aug 2023 18:03:27 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEg0-003Z5Y-03
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 18:03:25 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d4ddbcbbaacso128275276.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692900201; x=1693505001;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jylpqBSq6UZhDtJHaP/6cFTqfJ1I/2o5dmapcGZqzGk=;
        b=E1FcvBcvo1zP1Vdi0KwRwEi4XcKZj2/NFp52Hpeo3fA/EOMBpFgAU04ap1h+EiJzIO
         YDmoI/iJcKnWCiURI93udUFg04oDjRjV5TKetnMYZdncataXHWrDUThf7ZAt2yXv8435
         4CcW4YJtDEUZA9j1Hdr0uSenajyWJGANqc+05EPJvPSZfkErZBkh/k70pWmVQqIR0vxt
         rFhDm9Dyn4at7lRQuYDAqBkhx97LspiHznYimCqZymj1I+8jKeeX6wG9HRReRgx6cUdc
         HB8gMTQfZ6COrsPz29W6oUdbcMzaS4iy53e13a4aEo/Mosl1DYV2b30RgXbFSPe7p5x4
         bFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900201; x=1693505001;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jylpqBSq6UZhDtJHaP/6cFTqfJ1I/2o5dmapcGZqzGk=;
        b=ITjlr+9MC5qS77ei92whKIdRQB/ld5JLHmFojzNc8x+x45TLSZVTVrT1vv+lJPJHa9
         fggqSnbfLVPU9VniwxOqqaYD5MjKL3l7CQaCtmvPPa/gRFLQnjG3XVyUNTJTaTOfC1V4
         Nqq0bcA+sakD9GWyjEPx/ZCHiIBexF6OKwMmzUi+T7J8QjJG4KaZ1ruKT51p9+yrNrXq
         01R8CvAYCLBfv7j3Bz1A5qEWb7XeX5SsVbxPNi0AGHECOEBkECq4cJfxRGzZ0EJmXSdG
         7qNh7fgyG9/CnIhIAVtJ/5wS6rCpT7aPlfrVzHMZ9JijVrfaeDUxN1rvgmdh5AJK9+Yf
         RGiw==
X-Gm-Message-State: AOJu0YxeXbrdwCZSlTwsahvK9pxS/r6Yc1uBSjjaSnkJ7k4jNf+8e5mT
	LddyOpCOPYyLVdOOgJH71iFsu8hW+/fjEYnOm/Y=
X-Google-Smtp-Source: AGHT+IGDTvjBhTEjTSJ+jxTsdrlcA5pLuf1/WRjn/S7zeKMOvitmcknjEYYJppddGEudEVAhJ3cf8i90mlLIl7TEptE=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:63f7:38ec:c0bd:8830])
 (user=ndesaulniers job=sendgmr) by 2002:a25:c752:0:b0:d6b:1a89:6673 with SMTP
 id w79-20020a25c752000000b00d6b1a896673mr217374ybe.5.1692900201401; Thu, 24
 Aug 2023 11:03:21 -0700 (PDT)
Date: Thu, 24 Aug 2023 11:03:17 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGSb52QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCyMT3ZT85GLdZEPzRNOUVPM0QwNjJaDSgqLUtMwKsDHRsbW1AIR2Jcx WAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692900199; l=7833;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=yaDjW5hOI5gJGOMZ1DsDzpbL5Z3k3IDsA7FrJwcxAdM=; b=6OoJ7R8CkuDjqnXjQysK58Kb5Piqi7H/nHRIVfhdlo6v+c7ImybKTufIPhYohUbYmUpG/dahd
 9/vUqbUHgtjD7Ucxf0/2rRwHPB8uTmjizRlYvGdyr2Yrr+yquGSVi89
X-Mailer: b4 0.12.3
Message-ID: <20230824-docs-v1-1-67e061278b8f@google.com>
Subject: [PATCH] Documentation/llvm: refresh docs
From: ndesaulniers@google.com
To: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Tom Rix <trix@redhat.com>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_110324_061703_AB262002 
X-CRM114-Status: GOOD (  21.48  )
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

Recent fixes for an embargoed hardware security vulnerability failed to
link with ld.lld (LLVM's linker).  [0]  To be fair, our documentation
mentions ``CC=clang`` foremost with ``LLVM=1`` being buried "below the
fold."

We want to encourage the use of ``LLVM=1`` rather than just
``CC=clang``. Make that sugguestion "above the fold" and "front and
center" in our docs.

While here, the following additional changes were made:
- remove the bit about CROSS_COMPILE setting --target=, that's no longer
  true.
- Add ARCH=loongarch to the list of maintained targets (though we're
  still working on getting defconfig building cleanly at the moment;
  we're pretty close).
- Promote ARCH=riscv from being Maintained to being Supported. Android
  is working towards supporting RISC-V, and we have excellent support
  from multiple companies in this regard.
- Note that the toolchain distribution on kernel.org has been built with
  profile data from kernel builds.

Link: https://github.com/ClangBuiltLinux/linux/issues/1907 [0]
---


Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/kbuild/llvm.rst | 102 +++++++++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 47 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index c3851fe1900d..00b26a0a6bf1 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -25,50 +25,38 @@ objects <https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM
 that supports C and the GNU C extensions required by the kernel, and is
 pronounced "klang," not "see-lang."
 
-Clang
------
-
-The compiler used can be swapped out via ``CC=`` command line argument to ``make``.
-``CC=`` should be set when selecting a config and during a build. ::
-
-	make CC=clang defconfig
+Building with LLVM
+------------------
 
-	make CC=clang
-
-Cross Compiling
----------------
+Invoke ``make`` via::
 
-A single Clang compiler binary will typically contain all supported backends,
-which can help simplify cross compiling. ::
-
-	make ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu-
+	make LLVM=1
 
-``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
-``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
-example: ::
+to compile for the host target. For cross compiling::
 
-	clang --target=aarch64-linux-gnu foo.c
+	make LLVM=1 ARCH=arm64
 
-LLVM Utilities
+The LLVM= argument
 --------------
 
-LLVM has substitutes for GNU binutils utilities. They can be enabled individually.
-The full list of supported make variables::
+LLVM has substitutes for GNU binutils utilities. They can be enabled
+individually. The full list of supported make variables::
 
 	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
 	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
 
-To simplify the above command, Kbuild supports the ``LLVM`` variable::
-
-	make LLVM=1
+``LLVM=1`` expands to the above.
 
 If your LLVM tools are not available in your PATH, you can supply their
 location using the LLVM variable with a trailing slash::
 
 	make LLVM=/path/to/llvm/
 
-which will use ``/path/to/llvm/clang``, ``/path/to/llvm/ld.lld``, etc.
+which will use ``/path/to/llvm/clang``, ``/path/to/llvm/ld.lld``, etc. The
+following may also be used::
+
+	PATH=/path/to/llvm:$PATH make LLVM=1
 
 If your LLVM tools have a version suffix and you want to test with that
 explicit version rather than the unsuffixed executables like ``LLVM=1``, you
@@ -78,31 +66,46 @@ can pass the suffix using the ``LLVM`` variable::
 
 which will use ``clang-14``, ``ld.lld-14``, etc.
 
-``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
-``LLVM=1``. If you only wish to use certain LLVM utilities, use their respective
-make variables.
+To support combinations of out of tree paths with version suffixes, we
+recommend::
+
+	PATH=/path/to/llvm/:$PATH make LLVM=-14
 
-The integrated assembler is enabled by default. You can pass ``LLVM_IAS=0`` to
-disable it.
+``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
+``LLVM=1``. If you only wish to use certain LLVM utilities, use their
+respective make variables.
 
-Omitting CROSS_COMPILE
-----------------------
+The same value used for ``LLVM=`` should be set for each invocation of ``make``
+if configuring and building via distinct commands. ``LLVM=`` should also be set
+as an environment variable when running scripts that will eventually run
+``make``.
 
-As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
+Cross Compiling
+---------------
 
-If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
-from ``ARCH``.
+A single Clang compiler binary (and corresponding LLVM utilities) will
+typically contain all supported backends, which can help simplify cross
+compiling especially when ``LLVM=1`` is used. If you use only LLVM tools,
+``CROSS_COMPILE`` becomes unnecessary.
 
-That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
+As an example, for a target like ``ARCH=s390`` which does not yet have
+``ld.lld`` support, you could invoke ``make`` via::
 
-For example, to cross-compile the arm64 kernel::
+	make LLVM=1 LD=ld.bfd CROSS_COMPILE=s390x-linux-gnu-
 
-	make ARCH=arm64 LLVM=1
+``CROSS_COMPILE`` is not used to prefix the Clang compiler binary (or
+corresponding LLVM utilities), but it will be for any GNU toolchain utilities.
+This example will invoke ``s390x-linux-gnu-ld.bfd`` as the linker, so ensure
+that is reachable in your ``$PATH``.
 
-If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
-``--prefix=<path>`` to search for the GNU assembler and linker. ::
+The LLVM_IAS= argument
+-----------------
 
-	make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
+Clang can assemble assembler code. You can pass ``LLVM_IAS=0`` to disable this
+behavior and have Clang invoke the system assembler instead (or the assembler
+based on ``CROSS_COMPILE``). ``CROSS_COMPILE`` is necessary when ``LLVM_IAS=0``
+is set when cross compiling in order to set ``--prefix=`` for the compiler to
+find the corresponding non-integrated assembler.
 
 Supported Architectures
 -----------------------
@@ -135,14 +138,17 @@ yet. Bug reports are always welcome at the issue tracker below!
    * - hexagon
      - Maintained
      - ``LLVM=1``
+   * - loongarch
+     - Maintained
+     - ``LLVM=1``
    * - mips
      - Maintained
      - ``LLVM=1``
    * - powerpc
      - Maintained
-     - ``CC=clang``
+     - ``LLVM=1``
    * - riscv
-     - Maintained
+     - Supported
      - ``LLVM=1``
    * - s390
      - Maintained
@@ -171,9 +177,11 @@ Getting Help
 Getting LLVM
 -------------
 
-We provide prebuilt stable versions of LLVM on `kernel.org <https://kernel.org/pub/tools/llvm/>`_.
-Below are links that may be useful for building LLVM from source or procuring
-it through a distribution's package manager.
+We provide prebuilt stable versions of LLVM on `kernel.org
+<https://kernel.org/pub/tools/llvm/>`_. These have been optimized with profile
+data for building Linux kernels. Below are links that may be useful for
+building LLVM from source or procuring it through a distribution's package
+manager.
 
 - https://releases.llvm.org/download.html
 - https://github.com/llvm/llvm-project

---
base-commit: 93f5de5f648d2b1ce3540a4ac71756d4a852dc23
change-id: 20230824-docs-c17a5de7f103

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
