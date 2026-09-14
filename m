Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2EAC88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d52XjNGJY+VY2LS6fE6bsrJ9VH1DFsFkc4DzWmSnr1A=; b=oAVhjl0EjCr29B
	JRrNjtWQQF+BFO3/gMUieYtGtuucC4Jy147+VAOXgOvDYt6mfdX45svhB8QTbYskAOtljokz6kbrO
	djglh/PQ/4kcITVBRwUZeE0261BFTZqiDeUataAIXy9oRxGzxQXNO37odhsD889giexWBEfYxSShe
	SRC350Yh51reTOgrDYZuNLlEEwn52f7jlrXit6n5S3K0lgAxZNeUeCLvD7r5hTpv+yV3TBpkiYBdH
	i1A7ZHs267c+8nj35AN8QL/g98faIMSn7zgtYbjGIdlzaZ/84gkAafIHSHgK/eRGHrxATxFbMxvJm
	kAWJJKjP89yEzBAHJWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62uR-00000002uwK-2nLV;
	Mon, 14 Sep 2026 09:23:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62uN-00000002uu0-3r1B;
	Mon, 14 Sep 2026 09:23:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CE2360008;
	Mon, 14 Sep 2026 09:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018FA1F0089A;
	Mon, 14 Sep 2026 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377807;
	bh=1ZPmnc5+8fCi4Y57FKsAI3Lb+t0VOqD62dinOd1QwiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DR3yDZT3x9JgRUAdsM9P3bjw8NlxZl2ve9hwrOnONEaXaS+6VMpnNiKySBQJnX1aR
	 KI84LT6XGmG2MqqsxER5hIQ7xw5eFW7KLmMOSxuUyiZf0T6Va5B4D4Pk8RP7I24rXN
	 Bg/BSWIf3RfIlPTzhUra01HUCMKzZ4J3/B0etbM3epuJwbJU559uYO+35sonVdJ0KP
	 5t8p4Ovpgxki9mErfGTt2IEkubXNJN7o9X7DQH4IczmqUclPZLupmUtwH6RS7OEatC
	 vhep86RGt9MWTx10LrItRJ9x4FJtmY2nWkMT7/ztipDFOJCQVkWKInf7hkexloGH4S
	 qrwuf/ZdQRP1Q==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 10:22:07 +0100
Subject: [PATCH v2 08/21] kbuild: cache list, composite object state per
 object
MIME-Version: 1.0
Message-Id: <20260914-build-speedup-v2-8-39817ec5db23@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457; i=ljs@kernel.org;
 h=from:subject:message-id; bh=c87iVV1zeBni5F+nfbl6i4a6ieyR5SmyZw+q91uinWA=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKW7znw9b/9g+obcf+cah1nskgoq/yZd3pfh+ob5vORr
 5/UM3/K7ShlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBEfmgzMpw/siDrflXVn4V8
 CZpzPFtM1sw6fnL+40t2hmpPTnpYnNnC8D/tONOiLZea+UMWZzg/bNn4c/HEjF9rHkulC8c25P3
 TPMEDAA==
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

When each object's command line is expanded, kbuild has to figure out on
multiple occasions whether it's built-in or part of a module and which
composite object it belongs to.

This causes the time spent on each directory in the kernel tree to grow
O(n^2) with its object count, which is especially problematic for instance
in drivers/gpu/drm/amd/amdgpu with 310 objects.

No-op builds (i.e. make -j $(nproc) when nothing has changed) are
particularly impacted by this.

Fix the issue by caching this data and looking it up instead of getting it
over and over again.

This has a particularly large impact on allmodconfig builds.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig, no-op make, gcc            1.1s     1.1s    -0.02s (-2%)
  x86 defconfig, no-op make, clang          1.3s     1.3s    -0.01s (-1%)
  x86 allmodconfig, no-op make, gcc        15.3s    14.5s    -0.83s (-5%)
  x86 allmodconfig, no-op make, clang      16.2s    15.5s    -0.65s (-4%)
  x86 allmodconfig, touch mm/vma.c, gcc    35.0s    34.3s    -0.77s (-2%)
  x86 allmodconfig, touch mm/vma.c, clang  33.7s    33.2s    -0.51s (-2%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/Makefile.build | 8 ++++++++
 scripts/Makefile.lib   | 7 +++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4349108e75e1..2cabfe85b798 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -122,6 +122,14 @@ multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/, $(subdir-ym))
 endif
 
+# Cache which list each object is in and which composite objects it belongs to,
+# once per object for $(part-of-builtin), $(part-of-module) and $(modname-multi).
+$(foreach o, $(real-obj-y) $(lib-y), $(eval part-of-builtin_$o := y))
+$(foreach o, $(real-obj-m), $(eval part-of-module_$o := y))
+$(foreach m, $(multi-obj-ym), \
+	$(foreach o, $(call suffix-search, $m, .o, -objs -y -m), \
+		$(eval modname-multi_$o += $(m:.o=))))
+
 ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..2f447bc25e7b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -2,8 +2,7 @@
 
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
-modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
-		$(if $(filter $*.o, $(call suffix-search, $m, .o, -objs -y -m)),$(m:.o=))))
+modname-multi = $(sort $(modname-multi_$*.o))
 
 __modname = $(or $(modname-multi),$(basetarget))
 
@@ -149,8 +148,8 @@ endif
 # If $(is-kernel-object) is 'y', this object will be linked to vmlinux or modules
 is-kernel-object = $(or $(part-of-builtin),$(part-of-module))
 
-part-of-builtin = $(if $(filter $(basename $@).o, $(real-obj-y) $(lib-y)),y)
-part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
+part-of-builtin = $(part-of-builtin_$(basename $@).o)
+part-of-module = $(part-of-module_$(basename $@).o)
 quiet_modtag = $(if $(part-of-module),[M],   )
 
 modkern_cflags =                                          \

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
