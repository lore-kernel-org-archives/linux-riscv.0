Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D95AC88E6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ53XIKQvFkuqdXH13lcrG1inrXFgBE4QFLAd1TQVvQ=; b=RBHhrrDKLYjZce
	IO7oOGL8qf9Wn+wuF4KbJ3qvivNzPXMBc97OTYKi3ezuC2bgSUcSHHUeiaaoveq6UauhBHzjl/eTE
	kTvdWi1nXM3MUbBdcR/fqaXjCbUK0qpjujyTC8DkVzOYfjSgWzNwnHd7pyjAN3VVBCa3h0Zsx6TgA
	8hLWo7NjO6GPHWq+3TfcqXK0aGkIoRcquJKjn3ppcWHIxarq2OHqw5uYLr+CRyAoOgKaAFZvkv0x8
	FY6peoFN7lx6oeVTCDX4QMdIQhPJ99GaUL7hzSPUTAdx42o51qaHcEjm4AyST28964PduAnDHFTQG
	H6plnEZk0FMYoRV/Rmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62vW-00000002vgk-06v8;
	Mon, 14 Sep 2026 09:24:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62vT-00000002veg-2oKW;
	Mon, 14 Sep 2026 09:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 684E0419CE;
	Mon, 14 Sep 2026 09:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372FD1F000FF;
	Mon, 14 Sep 2026 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377875;
	bh=flxRB0RNwZz3AOlLZeEynIEfspQVvaUpjYF/Tjf2+64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D6COJiXd1FUhjmM6c5vu415yJ1pfM1pE0rktIRq/TZYrbeEu4ErjGcQVzGf8lk47A
	 +HoEdMWTPF/B09+UGE2nuvIZafO1VxCm5Z+9bIlsLFtfzlD2gNlwMI510yMoSjemVj
	 KJDhTg9H9bHo+h5JvGT2vR5OtWcRXz73TZwiYntQ3DE1MaptfiwF3y7NoRHxaWMgn1
	 Rw3guujw7hPUf8txULCj4Ua0EnUfsZVZeoyLviFGT7QP13NNXxm2LWWTZO/G/xYUwU
	 5wm64bhMTKupe/TjBOMn1Edv4lySAymgD+0+0aQj5Rbyz4ASXCj98hzfrQQeub/90W
	 Ab28ZuClLpHmQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 10:22:15 +0100
Subject: [PATCH v2 16/21] objtool: size the instruction hash to the text
MIME-Version: 1.0
Message-Id: <20260914-build-speedup-v2-16-39817ec5db23@kernel.org>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
In-Reply-To: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5734; i=ljs@kernel.org;
 h=from:subject:message-id; bh=1MNx2aSSjSgi0WUnp9kWu6YKYuPNVv4LhqSB+6OA3nE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKW7zmYM+cfpzTXyVm9J664dzX6mNrrzS++vFHVko1td
 pC60v2UjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAEzEvYiRodkzb7NPVFJCcayE
 4nIZOe2H7SmyZ9/JLbQ+cL9x+ZND/xn+e4prLUrMK263WhLY+UjBZPmG9u5v4aa6+5ccO+NTU1D
 EBQA=
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

The instruction hash is a fixed 2^20 buckets, which for an x86-64
allmodconfig vmlinux.o of ~16 million instructions leaves find_insn()
walking chains of four or more entries.

Size it by the amount of text to be decoded instead, at one bucket per
OFFSET_STRIDE window, as sec_offset_hash() keys on those and anything
finer would sit empty.

This gives 2^20 buckets (8 MiB) for a defconfig vmlinux.o and 2^22 (32 MiB)
for allmodconfig, so it is not an egregious use of memory.

The output of objtool before and after this change was confirmed to be
byte-for-byte identical for x86_64 defconfig and allmodconfig.

On a 128-thread machine, objtool on the gcc allmodconfig vmlinux.o goes
from 9.0s to 6.8s. A defconfig vmlinux.o already had 2^20 buckets and is
unchanged.

objtool on vmlinux.o is on the serial tail of every build that links
vmlinux, no-op builds are unchanged.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 allmodconfig, touch mm/vma.c, gcc    28.0s    25.7s     -2.4s (-8%)
  x86 allmodconfig, touch mm/vma.c, clang  26.2s    24.1s     -2.0s (-8%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 tools/objtool/check.c                   | 58 +++++++++++++++++++++++++++++++--
 tools/objtool/include/objtool/objtool.h |  3 +-
 tools/objtool/objtool.c                 |  1 -
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 464f6c9d9ff0..62a3e1d4e9e5 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -38,12 +38,22 @@ struct disas_context *objtool_disas_ctx;
 
 size_t sym_name_max_len;
 
+static struct hlist_head *insn_hash_head(struct objtool_file *file,
+					 struct section *sec, unsigned long offset)
+{
+	/* Determine instruction hash based on section index and offset. */
+	const u32 sec_hash = sec_offset_hash(sec, offset);
+	const u32 hash = hash_min(sec_hash, file->insn_hash_bits);
+
+	return &file->insn_hash[hash];
+}
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset)
 {
 	struct instruction *insn;
 
-	hash_for_each_possible(file->insn_hash, insn, hash, sec_offset_hash(sec, offset)) {
+	hlist_for_each_entry(insn, insn_hash_head(file, sec, offset), hash) {
 		if (insn->sec == sec && insn->offset == offset)
 			return insn;
 	}
@@ -403,6 +413,44 @@ static void *cfi_hash_alloc(unsigned long size)
 static unsigned long nr_insns;
 static unsigned long nr_insns_visited;
 
+/*
+ * sec_offset_hash() keys on OFFSET_STRIDE windows, so the instructions of a
+ * window share a chain and buckets beyond one per window would sit empty.
+ */
+#define INSN_HASH_BYTES_PER_BUCKET	OFFSET_STRIDE
+#define INSN_HASH_MIN_BITS		10
+
+static unsigned long total_text_size(struct objtool_file *file)
+{
+	unsigned long size = 0;
+	struct section *sec;
+
+	for_each_sec(file->elf, sec)
+		if (is_text_sec(sec))
+			size += sec_size(sec);
+
+	return size;
+}
+
+static int alloc_insn_hash(struct objtool_file *file, unsigned long text_size)
+{
+	const unsigned long nr_buckets = text_size / INSN_HASH_BYTES_PER_BUCKET;
+	const int bits = ilog2(nr_buckets);
+
+	file->insn_hash_bits = max(INSN_HASH_MIN_BITS, bits);
+	file->insn_hash = calloc(1UL << file->insn_hash_bits,
+				 sizeof(*file->insn_hash));
+	if (!file->insn_hash) {
+		ERROR_GLIBC("calloc");
+		return -1;
+	}
+
+	if (opts.stats)
+		printf("insn_hash_bits: %d\n", file->insn_hash_bits);
+
+	return 0;
+}
+
 /*
  * Call the arch-specific instruction decoder for all the instructions and add
  * them to the global instruction list.
@@ -414,6 +462,9 @@ static int decode_instructions(struct objtool_file *file)
 	unsigned long offset;
 	struct instruction *insn;
 
+	if (alloc_insn_hash(file, total_text_size(file)))
+		return -1;
+
 	for_each_sec(file->elf, sec) {
 		struct instruction *insns = NULL;
 		u8 prev_len = 0;
@@ -474,7 +525,7 @@ static int decode_instructions(struct objtool_file *file)
 			if (insn->type == INSN_BUG)
 				insn->dead_end = true;
 
-			hash_add(file->insn_hash, &insn->hash, sec_offset_hash(sec, insn->offset));
+			hlist_add_head(&insn->hash, insn_hash_head(file, sec, insn->offset));
 			nr_insns++;
 		}
 
@@ -4802,6 +4853,9 @@ void free_insns(struct objtool_file *file)
 
 	for (chunk = chunks; chunk; chunk = chunk->next)
 		free(chunk->addr);
+
+	free(file->insn_hash);
+	file->insn_hash = NULL;
 }
 
 const char *objtool_disas_insn(struct instruction *insn)
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index 6dc12a59ad00..79fe82b7397e 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -21,7 +21,8 @@ struct pv_state {
 
 struct objtool_file {
 	struct elf *elf;
-	DECLARE_HASHTABLE(insn_hash, 20);
+	struct hlist_head *insn_hash;
+	int insn_hash_bits;
 	struct list_head retpoline_call_list;
 	struct list_head return_thunk_list;
 	struct list_head static_call_list;
diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index a4e139dee7e9..71e048f8582a 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -29,7 +29,6 @@ struct objtool_file *objtool_open_read(const char *filename)
 	if (!file.elf)
 		return NULL;
 
-	hash_init(file.insn_hash);
 	INIT_LIST_HEAD(&file.retpoline_call_list);
 	INIT_LIST_HEAD(&file.return_thunk_list);
 	INIT_LIST_HEAD(&file.static_call_list);

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
