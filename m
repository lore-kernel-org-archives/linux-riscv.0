Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8B0C79FAA
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Yr2B2wd0teumVV4PofBDMrD4tKHO4oW3BPZAVsLYf4=; b=D1ca3CnAbFRCml
	mt4wXCIgAL/sF3q75EIRomH67kb1lDJyWAnxEQbg0KffPzGNVC/FQ4Lzm+k/oYKeFeaLVbmHxmrFg
	hRvI9xB74CWZ4RcGu/8augOl7TJw/eVrG611EE6Cxpvo6GzDS4sO9+KcJS5kwfPeZw7WNOvj5snFJ
	dXVQjoe0Kvl0Lae50A27o0UnlW7kRZiMghmSb4aSIny8ertvSDIkjnp3w0tMWPOI5qzrA0C8USUjy
	FRkJIsQMC/06UgQtZwnRJ5yKrZH27jsw1o3TzGJvp4NrSgT3YDvG630z5vM/gWtnKGhqiS6bYGloh
	1CM5CM5zpxFB3TxDtnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42sV-0000000AFRF-47io;
	Tue, 08 Sep 2026 20:57:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42sU-0000000AFQO-2rEB;
	Tue, 08 Sep 2026 20:57:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FCA0601F7;
	Tue,  8 Sep 2026 20:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A4A1F00A3D;
	Tue,  8 Sep 2026 20:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901033;
	bh=GYh5ADlkGLy+2VaSmAelr1Xekd9caswVRBA8jASHD2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FXfJGq/qY4JmJQuVyW2SpUy9+ytBVLe2S+qVuwH4rYbalkg/HocfiX84Ngdc6lVga
	 vHwHd9434u13Te2c7pP9dukLigUKNecK6PDB3SX7PHIN+p5yybvca6tvdJL8UUUdBp
	 zbZgJFz/ZLTPlK0ddGk161TUz6q7CneS82OhmjlKtHSahTn2hSzO4ZgIK1LaT1VDNw
	 XCqRc+ECGGJMw0mHZOUQZIrUeJGN9xGoLn+I2sk+4BTgeLQPwEe+XUtOrI8HQyef0F
	 mkW4zW40JU/TVZ0lzZAPzPt2ZzmWwcWl3XokXyaOl7X69g1AxhbapDEoGgt1mUBWX7
	 fdYkzsvM/1b4w==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 08 Sep 2026 21:55:09 +0100
Subject: [PATCH 09/23] kbuild: do not allocate .modinfo in vmlinux
MIME-Version: 1.0
Message-Id: <20260908-build-speedup-v1-9-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4632; i=ljs@kernel.org;
 h=from:subject:message-id; bh=MbJ/+6TmwtBwAFA3foaiJYQ20esYkNk6sPYlzgWUs0Q=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIWlJn1XnoTy/us7THn/v8RVX+XTrB3Wan2+vZps7D/2
 kaXZPW5O0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRMw8ZGdafYxPw61h16A/D
 3IeJjP63F138mL0o+o/alu0Bf64lHZ3NyDBV/3Zv6yO/02fcggQX9Xe4cp6t3mXzmq+wRyhq6Wn
 HmWwA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
placed MODULE_INFO() strings in the .modinfo section in vmlinux.unstripped,
however it left the section allocatable, so it gets assigned an address and
on arm64, arm and riscv, the section is tagged as PT_LOAD.

This is useless as the data is ultimately stripped anyway.

Doing this results in a lot of unnecessary work - each pass copies the
whole file, 450 MIB with relocations for an x86 allmodconfig build and 250
MiB for an arm64 allmodconfig build.

This adds ~0.7s on the serial tail of every build for arm64 and ~0.2s for
x86 (the tail is single-threaded work done after parallel work has
finished).

Nothing requires .modinfo to exist at an address, so fix this by using
--dump-section which prevents the allocation.

Image, bzImage, System.map and modules.builtin.modinfo are unchanged and
the stripped vmlinux differs only in its program headers.

The objcopy passes are on the serial tail of every build that links
vmlinux, no-op builds are unchanged.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig, touch mm/vma.c, gcc        8.9s     8.8s    -0.16s (-2%)
  x86 defconfig, touch mm/vma.c, clang      8.1s     7.9s    -0.20s (-2%)
  x86 defconfig, clean, gcc                27.6s    27.5s    -0.13s (0%)
  x86 defconfig, clean, clang              27.2s    27.0s    -0.18s (-1%)
  x86 allmodconfig, touch mm/vma.c, gcc    42.0s    41.6s    -0.40s (-1%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 include/asm-generic/vmlinux.lds.h |  2 +-
 scripts/Makefile.vmlinux          | 24 ++++++------------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2988aa12f66..7be9e0321867 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -855,7 +855,7 @@
 		KLP_SYMID
 
 #define MODINFO								\
-		.modinfo : { *(.modinfo) . = ALIGN(8); }
+		.modinfo (INFO) : { *(.modinfo) . = ALIGN(8); }
 
 #ifdef CONFIG_GENERIC_BUG
 #define BUG_TABLE							\
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 4b54aaeca65d..1fc7a0ca8eaf 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -90,11 +90,9 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
 
 remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
 
-# To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
-# it is necessary to remove the PT_LOAD flag from the segment.
+# none of the removed sections is allocated, so no segment is left empty
 quiet_cmd_strip_relocs = OBJCOPY $@
-      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
-                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $(remove-symbols) $@
+      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $(remove-symbols) $< $@
 
 targets += vmlinux
 vmlinux: vmlinux.unstripped FORCE
@@ -103,21 +101,11 @@ vmlinux: vmlinux.unstripped FORCE
 # modules.builtin.modinfo
 # ---------------------------------------------------------------------------
 
-# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
-# tools that expect vmlinux to have sufficiently aligned sections but the
-# additional bytes used for padding .modinfo to satisfy this requirement break
-# certain versions of kmod with
-#
-#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
-#
-# Strip the trailing padding bytes after extracting .modinfo to comply with
-# what kmod expects to parse.
+# use --dump-section to include non-allocated sections
 quiet_cmd_modules_builtin_modinfo = GEN     $@
-      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
-                                    sed -i 's/\x00\+$$/\x00/g' $@; \
-                                    chmod -x $@
-
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+      cmd_modules_builtin_modinfo = $(OBJCOPY) -O binary -j .modinfo --dump-section .modinfo=$@ $< $@.tmp; \
+                                    rm -f $@.tmp; \
+                                    sed -i 's/\x00\+$$/\x00/g' $@
 
 targets += modules.builtin.modinfo
 modules.builtin.modinfo: vmlinux.unstripped FORCE

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
