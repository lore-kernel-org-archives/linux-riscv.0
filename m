Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC254C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFASJ3dWbs26GqHwS0CPtZgMMy9UdOFYsJE6C3VpLKM=; b=mHNTaemf9P6v/N
	OBov/HbB+5q1nDduKFwprBvVQsdj8A6pH2Est4b6IjhG12brdM0SWE/s00/7/O/JlDSy/HyXuF0ZK
	0hWWvjUJFbtHS5J1IRw7mTot4WZ1QPUKp9sapwq4TdA1A40OsyUihGZJguvUH4l1zDpkXqFhy4D4U
	CVpbKFhoFlkFTnzdvYA6RQTaBUJEqP9ZZ103BAEPdPEFvjMdiNQZ7t2lYZZeeeFMwqXvvQoO2qWBw
	v1dGDHJ2ypqFSnX92V4qxL/FrxlzZk1h/it3G18t9RCqsueF4H6xOAhqAzIFIrJte5iDY7lyxUngL
	jueiEs7NwLDpv07oMppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42tz-0000000AGJn-1fZ0;
	Tue, 08 Sep 2026 20:58:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42tv-0000000AGGd-48LX;
	Tue, 08 Sep 2026 20:58:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B912F40A2F;
	Tue,  8 Sep 2026 20:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABE81F00A3D;
	Tue,  8 Sep 2026 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901123;
	bh=uqBq8a6PBmwcf0p2yuh6c4ut6ERzykBEHjxf3/hGkX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e6lx/od9mLRaFbj6pD8WjdyUrpu387L5oUbxsS74POQpizvsu2X9B5alOW1uFj8y5
	 BogpoBtibbPrlFDz4Ec3/AdNz6xfPwZHUB5guwX01WhFo9UMbOB2aUsI9pZsrRRAP4
	 wLq+X3qQGbQ3EeoOOjm9JR1UCr2lqd+VX4HE/xOvgXCQToYgf4Uq0lu6WcIoU831NT
	 3Zr0ZWhdRXCFxU99AazeTkyNbDJRABmRLmC5/jK+DX1UXfCtMjxQZsFLerx/2qIlYU
	 IYr/jQMlMujoHloJcSVIewZGRNZ7u1U02GBUq6x7y5XXIcE7+DXZzJcawr7XnyLaFC
	 RprAR8YIz6BTg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 08 Sep 2026 21:55:17 +0100
Subject: [PATCH 17/23] modpost: perform srcversion hashing in parallel
MIME-Version: 1.0
Message-Id: <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5781; i=ljs@kernel.org;
 h=from:subject:message-id; bh=WICQxA7wSs1OjQCOKkZs0RphLh6aY8TzrexzGYQ5YdM=;
 b=kA0DAAoWz53NioHifxQByyZiAGqgdjiivqgxWMcAzwXiFMjxhapr5eptu4LqrpJHxWdzErhUN
 Yh1BAAWCgAdFiEE5/QXv1IUVp6J0E9Gz53NioHifxQFAmqgdjgACgkQz53NioHifxRJhQD+KkKD
 qLzGPYKtOKR3m+zxpGn6XPTCEmJRgn6E7DzMTooBAIO2t2bh9xq8Miz8ic/o7YF92YFvKDtRCsm
 kxE2EVJsK
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

modpost does a lot of single-threaded work hashing files from each object's
.cmd file.

This makes the build slower than it needs to be, so do this work in
parallel.

This is egregious for allmodconfig builds - for instance x86-64 can end up
opening 200,000 files individually and hashing them all serially.

Parallelise this operation by maintaining a thread pool for the hashing
work.

Combined with the per-file hashing commit this cuts modpost's run time
nearly in half for an allmodconfig build.

Module.symvers and every *.mod.S are byte for byte the same.

modpost is on the serial tail of every allmodconfig build, however
defconfig does not set CONFIG_MODULE_SRCVERSION_ALL and is unchanged.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 allmodconfig, touch mm/vma.c, gcc    33.4s    30.2s     -3.2s (-10%)
  x86 allmodconfig, touch mm/vma.c, clang  31.1s    28.1s     -3.0s (-10%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/mod/Makefile     |  1 +
 scripts/mod/modpost.c    | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
 scripts/mod/modpost.h    |  2 ++
 scripts/mod/sumversion.c |  3 +-
 4 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index fbd5099e0441..fdd486184f9c 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -5,6 +5,7 @@ hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
 
 modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
+HOSTLDLIBS_modpost := -lpthread
 
 devicetable-offsets-file := devicetable-offsets.h
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 550ccd753ed8..882169e51851 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -16,6 +16,7 @@
 #include <fnmatch.h>
 #include <stdio.h>
 #include <ctype.h>
+#include <pthread.h>
 #include <string.h>
 #include <limits.h>
 #include <stdbool.h>
@@ -1717,8 +1718,7 @@ static void read_symbols(const char *modname)
 	if (!mod->is_vmlinux) {
 		version = get_modinfo(&info, "version");
 		if (version || all_versions)
-			get_src_version(mod->name, mod->srcversion,
-					sizeof(mod->srcversion) - 1);
+			mod->need_srcversion = true;
 	}
 
 	parse_elf_finish(&info);
@@ -1736,6 +1736,72 @@ static void read_symbols(const char *modname)
 	}
 }
 
+static struct module **srcversion_mods;
+static unsigned int nr_srcversion_mods, next_srcversion_mod;
+
+static bool get_next_src_version(void)
+{
+	struct module *mod;
+	unsigned int idx;
+
+	idx = __sync_fetch_and_add(&next_srcversion_mod, 1);
+	if (idx >= nr_srcversion_mods)
+		return false;
+	mod = srcversion_mods[idx];
+
+	get_src_version(mod->name, mod->srcversion,
+			sizeof(mod->srcversion) - 1);
+	return true;
+}
+
+static void *srcversion_worker(void *arg)
+{
+	while (get_next_src_version())
+		;
+
+	return NULL;
+}
+
+static void hash_srcversions(void)
+{
+	unsigned int i = 0;
+	struct module *mod;
+	pthread_t *threads;
+	long nr_threads;
+
+	list_for_each_entry(mod, &modules, list)
+		if (mod->need_srcversion)
+			nr_srcversion_mods++;
+
+	if (!nr_srcversion_mods)
+		return;
+
+	srcversion_mods = xmalloc(nr_srcversion_mods * sizeof(*srcversion_mods));
+
+	list_for_each_entry(mod, &modules, list)
+		if (mod->need_srcversion)
+			srcversion_mods[i++] = mod;
+
+	nr_threads = sysconf(_SC_NPROCESSORS_ONLN);
+	nr_threads = nr_threads < 1 ? 1 : nr_threads; /* On error assume 1. */
+	if (nr_threads > nr_srcversion_mods)
+		nr_threads = nr_srcversion_mods;
+
+	sumversion_init();
+	threads = xmalloc(nr_threads * sizeof(*threads));
+	for (i = 0; i < nr_threads; i++) {
+		if (pthread_create(&threads[i], NULL, srcversion_worker, NULL)) {
+			perror("pthread_create");
+			exit(1);
+		}
+	}
+	for (i = 0; i < nr_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	free(threads);
+	free(srcversion_mods);
+}
+
 static void read_symbols_from_files(const char *filename)
 {
 	FILE *in = stdin;
@@ -2729,6 +2795,8 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	hash_srcversions();
+
 	list_for_each_entry(mod, &modules, list) {
 		keep_no_trim_symbols(mod);
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index d5f6d82837d5..10d5f8f2f293 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -127,6 +127,7 @@ struct module {
 	bool has_init;
 	bool has_cleanup;
 	char	     srcversion[25];
+	bool need_srcversion;
 	// Missing namespace dependencies
 	struct list_head missing_namespaces;
 	// Actual imported namespaces
@@ -213,6 +214,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname);
 
 /* sumversion.c */
+void sumversion_init(void);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 5501d6aa0bea..4521b92ef868 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -249,7 +249,7 @@ static int parse_comment(const char *file, unsigned long len)
 /* FIXME: Handle .s files differently (eg. # starts comments) --RR */
 static bool stop_char[256];
 
-static void sumversion_init(void)
+void sumversion_init(void)
 {
 	static bool done;
 	int chr;
@@ -402,7 +402,6 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 				     line, strerror(errno));
 				goto out_file;
 			}
-
 		}
 
 	}

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
