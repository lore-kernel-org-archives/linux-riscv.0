Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F62AC982D6
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoR09TuslKYxPn83sRWX3+rTUe5aj99Dlpe0f980awE=; b=pkJ0f6UhYBRU8O
	+g8XBOwRqFvdiRFQB2RXqatDVtTCLyjeE1WXXuiIyU4lFwHv2/bhwrsVCi3oAJznacnosuLqvDXcA
	JHG7Uwcmhu3xj8u7ZkocvzXGQCuqsSgaugCpiqKa+s5hUa4teXEaVVOT7M+jHO5PTnhu1hb0DuWVS
	Zo2f7ZY93k0BPgdmRs02bY0lf8/zCUjy9+CXaSJoDiclYpzRswrQpkh5Ql/+y/XqCKDC7PoDDq+fm
	fIXcQ/hGVPrGbi50DMTk1mBylHKrp5GlQf6QYlMCu3hYlVUf1wYwVCdp72jU44BCIFLLEommGkNJt
	P+RnFyDz0wkg55VhwqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Efm-0000000Bq66-3oFO;
	Thu, 17 Sep 2026 16:09:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Efl-0000000Bq4Y-17K7;
	Thu, 17 Sep 2026 16:09:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0BB66022E;
	Thu, 17 Sep 2026 16:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD61F000FF;
	Thu, 17 Sep 2026 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789661356;
	bh=B/2HtZkmT+u7/JWW+lpRsHLnC+c6qMifLdIPC//XmMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WhS1by2S7B78AvylX6QFAyIjxUvuXD08hsZz4m4/BC8Rx0PVrGouqW6feex7zvHzM
	 l60/dLPcpo9fvV1VXHadVGT2+Gf9xMbIMUqkZC51juGA00XAs1dmw0TkbADbsmbd7L
	 qXYuloZL6012uHcgPe01sjfiYaar7dupH0AeRrJFTMj0c+44Qg87OwwgHAoY7RO1C1
	 zfkuXBDBK6T3dfLVKGQv3N1oOh5wjuaLT7V1gHZWRcberEzqdqJNolRTvFfQSazvL1
	 H1VmkxS+6fJob+5RQnJEF7hmn+J2XUwCh6A6ZTpk0QFPM6vwTQpvr+Q/+n7uN2ox+4
	 C76cnOAe61xaw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 17 Sep 2026 17:06:22 +0100
Subject: [PATCH v3 12/20] modpost: cache section relocation mismatch state
MIME-Version: 1.0
Message-Id: <20260917-build-speedup-v3-12-9ecf4163ff36@kernel.org>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
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
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4714; i=ljs@kernel.org;
 h=from:subject:message-id; bh=Ec1/kqBneOXNUE0gtcHjI1qdlGW1hFvqVFIOwSgkaek=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLW8P+ryj603Nm39dGf1hVTP+rqnEi9q27mMaXgg/K02
 AucvcUyHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZhIEBvD//D3lclMpacDZp3t
 2XK0I/SO49wnm6e8Yq2uz9x87JVL2hOG/4WtpWn3I5qrawMaLy0o/8Szkeex6wTvJJmmKIfXL+0
 usAEA
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

For every relocation modpost invokes check_section_mismatch() to determine
whether there is any kind of mismatch between the source and destination,
and if so which classification applies.

Each time it does this it invokes section_mismatch() which iterates
through the sectioncheck[] array every time it's called.

When walked a relocation section the source is fixed and there aren't many
targets, so the same names are looked up over and over again.

Therefore cache not only mismatch categorisation but also whether a
mismatch even exists for a given section and look up the sections in the
cache.

Special indices (undefined, absolute, common) take the uncached path as
before.

This results in very significant speed ups for allmodconfig incremental
builds.

modpost is on the serial tail of every build that links vmlinux.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
  x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
  x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
  x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/mod/modpost.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc..0fd43c8a89ea 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1155,12 +1155,67 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 			 name);
 }
 
+/*
+ * mismatch_cache[section index] ->
+ *   0 - uncached.
+ *  -1 - no mismatch.
+ *  >0 - mismatch index + 1.
+ */
+static int *mismatch_cache;
+
+static void init_mismatch_cache(unsigned int num_sections)
+{
+	mismatch_cache = xcalloc(num_sections, sizeof(*mismatch_cache));
+}
+
+static void reset_mismatch_cache(unsigned int num_sections)
+{
+	memset(mismatch_cache, 0, num_sections * sizeof(*mismatch_cache));
+}
+
+static void free_mismatch_cache(void)
+{
+	free(mismatch_cache);
+	mismatch_cache = NULL;
+}
+
+static const struct sectioncheck
+*cache_mismatch(unsigned int secndx, const struct sectioncheck *mismatch)
+{
+	if (!mismatch) {
+		mismatch_cache[secndx] = -1;
+		return NULL;
+	}
+
+	mismatch_cache[secndx] = (mismatch - sectioncheck) + 1;
+	return mismatch;
+}
+
+static const struct sectioncheck *get_section_mismatch(const char *fromsec,
+		const struct elf_info *elf, unsigned int secndx)
+{
+	int cached;
+
+	if (secndx >= elf->num_sections)
+		return section_mismatch(fromsec, sec_name(elf, secndx));
+
+	cached = mismatch_cache[secndx];
+	if (cached < 0)
+		return NULL;
+	if (cached > 0)
+		return &sectioncheck[cached - 1];
+
+	return cache_mismatch(secndx,
+			      section_mismatch(fromsec, sec_name(elf, secndx)));
+}
+
 static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 				   Elf_Sym *sym,
 				   unsigned int fsecndx, const char *fromsec,
 				   Elf_Addr faddr, Elf_Addr taddr)
 {
-	const char *tosec = sec_name(elf, get_secindex(elf, sym));
+	const unsigned int to_secndx = get_secindex(elf, sym);
+	const char *tosec = sec_name(elf, to_secndx);
 	const struct sectioncheck *mismatch;
 
 	if (module_enabled && elf->export_symbol_secndx == fsecndx) {
@@ -1168,7 +1223,7 @@ static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 		return;
 	}
 
-	mismatch = section_mismatch(fromsec, tosec);
+	mismatch = get_section_mismatch(fromsec, elf, to_secndx);
 	if (!mismatch)
 		return;
 
@@ -1445,6 +1500,8 @@ static void check_sec_ref(struct module *mod, struct elf_info *elf)
 {
 	int i;
 
+	init_mismatch_cache(elf->num_sections);
+
 	/* Walk through all sections */
 	for (i = 0; i < elf->num_sections; i++) {
 		Elf_Shdr *sechdr = &elf->sechdrs[i];
@@ -1461,6 +1518,9 @@ static void check_sec_ref(struct module *mod, struct elf_info *elf)
 			if (match(secname, section_white_list))
 				continue;
 
+			/* Reset cache per-section. */
+			reset_mismatch_cache(elf->num_sections);
+
 			start = sym_get_data_by_offset(elf, i, 0);
 			stop = start + sechdr->sh_size;
 
@@ -1472,6 +1532,8 @@ static void check_sec_ref(struct module *mod, struct elf_info *elf)
 					    start, stop);
 		}
 	}
+
+	free_mismatch_cache();
 }
 
 static char *remove_dot(char *s)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
