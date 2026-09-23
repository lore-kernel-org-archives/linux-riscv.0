Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E885C9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FERRf7YJXNdly+RZ735YEMWW4OMZlyAmLWNefLNxUo=; b=M44ev47/S3awVd
	aCfbphmV8zWKlTrvVrgr3VFf7CNkN889Ob6NMkDcHm/otWg0PMsDnDsx9RZZs4tiR2rjCucDZUEXS
	BdZP0Bf3nLUntqwiY98t/jmumgXnysc/RC4Z6penTtKuPKLu9FEIjzbiZpsGc3+0/T+LZqN9Ec++9
	39Hbs8l7VkQJkHsvwJl8egKUQyLQ2stnkRL+IUrCEH9d9b1pmIwGRldUO96D5FmhDcr6KDGhHncPF
	ZPvqMXsepgPUkVSh3slG42hgoVP8vEM7qA4usQP9WzF59oV/Zp5P0V1MyRqK+6Ptdqs2mjyrx/SfB
	+zIj8qmQlWt+OmjZkncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qfs-000000091HP-2g8P;
	Wed, 23 Sep 2026 17:22:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QfC-0000000912Z-2gIl;
	Wed, 23 Sep 2026 17:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61C7740860;
	Wed, 23 Sep 2026 17:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D40C1F00893;
	Wed, 23 Sep 2026 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184106;
	bh=w76QC9QJAdMuOMrYbXs7K9mQ4Sc+nh+ldKukdJl+Sv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lTCdrsfC1wELmvIfvOqOjtXJ/ZUc7ct63u/MijOd3D1W9jPMazKza02LyGd3/36U/
	 X0aIFutHfwyntHtrtwyZZXP++T9Ryi1xqfAgZAB1LnrsXzJ6bQw+mc1JkwmwbCssU0
	 v2jEXoDP3RBzljy6UC+3cHbABd0Kz2fiYtH4cythWv0cs9kAvYHwXrYOhnDRTCOawu
	 6TF/lsJ0PRDPynBTgQHNxS/Q/5Ol30HeX5QvM+PPtPY95WzxqE1qcC5GL+mYkoIfv8
	 APOYkEdh359JMQZN3kPnkMRlkgEyw5H4pAkEINE8mB8b2FXpv03azaww3kvIMK/gDl
	 66eejFPP/NfVQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 18:18:05 +0100
Subject: [PATCH v4 16/22] objtool: do not hash DWARF relocations
MIME-Version: 1.0
Message-Id: <20260923-build-speedup-v4-16-73128809a4a4@kernel.org>
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
In-Reply-To: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
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
 linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3393; i=ljs@kernel.org;
 h=from:subject:message-id; bh=JsrcNLsDFz81n4CrtQtvecqRzIoQyaHRODeEltcBuYs=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLK2cF7x49TRiVZYf+VH+uekbukL9nNiDPdE7YldoL6rf
 mJ0kF1fRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACbi68vIsO3Rmd7ZtgmWOu+a
 4+ce/XW/8eJC3Ue/XG1U3nFozd7ifJiRYYrD7XsXWrL5b9sb+V8x9YqZctbZYVJoV4VT37yzGw1
 teAE=
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

objtool hashes the relocation of each section so it can find them by
destination, but DWARF sections are never looked up this way, so there is
no reason to hash them.

With CONFIG_DEBUG_INFO_DWARF5 set a defconfig vmlinux.o has ~22 million
relocations, 20.5 million of which are .debug_* sections.

Therefore, don't hash these.

With the same configuration the objtool vmlinux.o link-time run takes ~.5s
less to complete (2.63s -> 2.14s) and ~130 MiB memory to do it.

The output remains unchanged.

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 tools/objtool/elf.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index a791f4ea6ec1..98a110e3e8f5 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1071,7 +1071,8 @@ struct reloc *elf_init_reloc(struct elf *elf, struct section *rsec,
 	set_reloc_type(elf, reloc, type);
 	set_reloc_addend(elf, reloc, addend);
 
-	elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
+	if (!is_dwarf_section(rsec->base))
+		elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
 	set_sym_next_reloc(reloc, sym->relocs);
 	sym->relocs = reloc;
 
@@ -1125,16 +1126,14 @@ struct reloc *elf_init_reloc_data_sym(struct elf *elf, struct section *sec,
 
 static int read_relocs(struct elf *elf)
 {
-	unsigned long nr_reloc, max_reloc = 0;
+	unsigned long nr_reloc, max_reloc = 0, nr_hashed = 0;
 	struct section *rsec;
 	struct reloc *reloc;
 	unsigned int symndx;
 	struct symbol *sym;
+	bool hashed;
 	int i;
 
-	if (!elf_alloc_hash(reloc, elf->num_relocs))
-		return -1;
-
 	list_for_each_entry(rsec, &elf->sections, list) {
 		if (!is_reloc_sec(rsec))
 			continue;
@@ -1147,6 +1146,23 @@ static int read_relocs(struct elf *elf)
 
 		rsec->base->rsec = rsec;
 
+		/*
+		 * DWARF relocations are never looked up by destination, they
+		 * only need to be on their symbol's list.
+		 */
+		if (!is_dwarf_section(rsec->base))
+			nr_hashed += sec_num_entries(rsec);
+	}
+
+	if (!elf_alloc_hash(reloc, nr_hashed))
+		return -1;
+
+	list_for_each_entry(rsec, &elf->sections, list) {
+		if (!is_reloc_sec(rsec))
+			continue;
+
+		hashed = !is_dwarf_section(rsec->base);
+
 		/* nr_alloc_relocs=0: libelf owns d_buf */
 		rsec->nr_alloc_relocs = 0;
 
@@ -1168,7 +1184,8 @@ static int read_relocs(struct elf *elf)
 				return -1;
 			}
 
-			elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
+			if (hashed)
+				elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
 			set_sym_next_reloc(reloc, sym->relocs);
 			sym->relocs = reloc;
 
@@ -1180,6 +1197,7 @@ static int read_relocs(struct elf *elf)
 	if (opts.stats) {
 		printf("max_reloc: %lu\n", max_reloc);
 		printf("num_relocs: %lu\n", elf->num_relocs);
+		printf("num_relocs_hashed: %lu\n", nr_hashed);
 		printf("reloc_bits: %d\n", elf->reloc_bits);
 	}
 
@@ -1634,7 +1652,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
 
 	memcpy(new_relocs, old_relocs, nr_relocs_old * sizeof(struct reloc));
 
-	for (int i = 0; i < nr_relocs_old; i++) {
+	for (int i = 0; i < nr_relocs_old && !is_dwarf_section(rsec->base); i++) {
 		struct reloc *old = &old_relocs[i];
 		struct reloc *new = &new_relocs[i];
 		u32 key = reloc_hash(old);

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
