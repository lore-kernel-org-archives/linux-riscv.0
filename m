Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9454DC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gp2m2KOK/WyoYWXWr9os1kxS/jVKvVtyWdk0JsXBP8M=; b=h9uzAY3zGGuqom
	6+BwCBuPO3V5z37qQbzF62cz9P1OaQkvlYKsi3nA3uvPPKwos/XRYp4LgoCbAIt+WYy17GOdSs8Pq
	knszdxFockBMH6PFcjipU6diRJUnn9i2mECaWSy5q6W/XssLG5gyzZRFJn2Jvw2o8Dc8kugZKR/U2
	uK2r5A2eoJycDeyyxQ7haxh/1feSiZdpGVB07eFjCcEVCLgSq8OxkkFEyHgFfwvxJ4DRF07Fuiqlq
	uILSob+loy7wPYRLXEeDt/ccTfQB2NzSLWClhQu2XsLCIaCBQdF+V0fimvfhQcZMx3qcNyAym5YS0
	MZ/AAjPNltBDDX4G1f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qgk-000000091cW-1qqf;
	Wed, 23 Sep 2026 17:23:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qg0-000000091Jk-2qJ8;
	Wed, 23 Sep 2026 17:22:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DEC2600AA;
	Wed, 23 Sep 2026 17:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59621F000FF;
	Wed, 23 Sep 2026 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184155;
	bh=RpyglNkLvgtO+g1zDJNpkY3JopuChXGi3ttcKAuST+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CW3sRhYGfPGHFUr2248WZC9Hf230RyEjEzZbWKjU10wEURx4jBU49P/EFHuafJBm+
	 OhE4O8riLvUVZKfj4H/BTTHlZzJXwTyytVTgwGIT0k1AJydF/bYU9STRDiFSRDNFBB
	 eRgu/eySu3QFdveEJjwRKEwWO4hyeDY1mumbYmXPEJvmSbke1OrkvTcQnvBAiPLc3y
	 YZgouDBBvQYnRYKk1KGsaCzYvtSWubA0PVabCoAPotC2a41sy+iXsOMwez5xJf7Uu+
	 avQKUwuhymuDeaGIWkBiUBI62/GgIEWU2vBBJuAZWr1gPu5RfuCY4aNh0ACOFZxBOi
	 mHsJbxX3+BTAg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 18:18:09 +0100
Subject: [PATCH v4 20/22] rust: make exports.o depend on the headers
 generated for it
MIME-Version: 1.0
Message-Id: <20260923-build-speedup-v4-20-73128809a4a4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=ljs@kernel.org;
 h=from:subject:message-id; bh=kx145CbsbOZNlrJo3YNnQ6X8zzclemP0tqvdTYAGrNw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLK2cF7dpf38yyJDZYecy4KWgWrRi7NmPFe7ENX/WW0hx
 8TavfoyHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiI0RtGhhuHD+28qdz11fP9
 s0evqt3jWD5W/4r/U/FSRNopgLHaNZWRYVrvjjMvdq+d25Z0MPWC1yelO+89WkNXcjr8vFpf37l
 8DRMA
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

rust/exports.c includes the exports_*_generated.h listing the symbols of
the core, bindings, kernel and helpers objects, but this is not expressed
in its Makefile.

This worked previously because the headers are always-y targets, and make
prepare built all of the rust crates first, which is an implicit
dependency.

Fix this as it is a dependency of the subsequent commit.

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 rust/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..74d21ae6f383 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -728,6 +728,11 @@ endef
 $(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
 	+$(call if_changed_rule,rust_cc_library)
 
+# The exported symbol lists are generated from the crates' objects.
+$(obj)/exports.o: $(obj)/exports_core_generated.h \
+    $(obj)/exports_bindings_generated.h $(obj)/exports_kernel_generated.h \
+    $(if $(CONFIG_RUST_INLINE_HELPERS),,$(obj)/exports_helpers_generated.h)
+
 # Disable symbol versioning for exports.o to avoid conflicts with the actual
 # symbol versions generated from Rust objects.
 $(obj)/exports.o: private skip_gendwarfksyms = 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
