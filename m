Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE24C9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIXTDDL6rcXyRYTq2N1had1IeZlV+6HYBXPRvYtY8LM=; b=JBMKb4OIte8Vzh
	fbnjx/wx7xR4VqBuGIMi7T3bjtKcv2qBXM12HoSVdkNCrd3ieXcmFoFNIadrlVzR8ilh0QOdHTrhn
	hPZaMvZm841xmJh7gbrH1/Yc/SEGDX1OvaXRDh62mqOBQiRbqLBOvtLIm5h4VTKINWNxK9I9mXpbk
	k8EINDb27aqt1uXVvAdf5wr2vQSh5uuJBNTpeFkvR066FJkfB2NKk7A2GrY8kn4n15Y7cH3rKwXtS
	MXwX6y/+E+nNNJStVdhanra8QImjpdkPO589snAe7XYXkJ6Rl83D5zj446GeQQRsM5MYJGOFxJteu
	JyVGedAnM8oo+T51n9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qfn-000000091FQ-0UMF;
	Wed, 23 Sep 2026 17:22:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qf0-000000090y3-10gg;
	Wed, 23 Sep 2026 17:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F342340C23;
	Wed, 23 Sep 2026 17:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0E41F000FF;
	Wed, 23 Sep 2026 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184093;
	bh=4w9neOqf7b6EaJ3ezfUP/vruXEKR7drJS7P+n8rmU2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mQCfJEkZyOMKxwB5YJvvYnLkPIJXowTIPKoC5XthNNSOptZQJ04fZPMc3gZPelYep
	 Esnty9LF8i4P/P6sQraIteZSWSv00l6ZsVeKBAOyWs3vWf0hkiCWLUi4RfjGwx/cfu
	 +rBHCyc2RHhE2AlsnEFitxLlF3cKNDjvDz/A8LFq3M/NMVF62a6ftgFrF0BIP43oO3
	 yteFzghZGukgliCVTczRm2i1DVvZGhC5pONqL8bjSMPcdjTW1Qb2znLdhD7hcEbo7w
	 WI3DQ7k5yt9PZpzdiHIho1Ovf+pTuzMcpXEdTHkV9+hooDXBVfGkC/J0mSNEZX3jp1
	 sW5yvHiHli8vg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 18:18:04 +0100
Subject: [PATCH v4 15/22] kbuild: batch module finalisation
MIME-Version: 1.0
Message-Id: <20260923-build-speedup-v4-15-73128809a4a4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5003; i=ljs@kernel.org;
 h=from:subject:message-id; bh=kGsKHAXdvm6iK3LVpcjsDvzjOzyjcJz2gnviueErSc4=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLK2cF6xKs2f3zorRfbGZxmJ9qJ/rN+sm87x8wR/Ttr2d
 eUC46MyHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZjIVyGGf9rz/vlkdzJ+3vVY
 r9eAcR6LnOgPtVW2vavmXVLNYf3zV4aRYevKBT+27tmscXqXwKmLOadXcFzT/xI9TfqUio5taet
 kc2YA
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

With the .mod.S change in place, module finalisation on allmodconfig builds
consists of a large number of very short-lived jobs.

For allmodconfig x86-64 this can be on the order of ~22,000 jobs of a few
milliseconds in duration each.

Each job entails processing ~22k .cmd files, so the combination of heavy
overhead and small individual job results in a lot of unnecessary and
repeated work even with all cores being utilised.

The solution is to batch by a number of jobs. Determining which value makes
sense was done empirically.

On a 128-thread threadripper box doing an allmodconfig build, best of
2, *.ko, *.mod.o deleted each time:

    modules per chunk    instances    wall
    -----------------    ---------    ------
                    1        11171    10.22s
                    2         5586     6.72s
                    4         2793     4.97s
                    8         1397     4.26s
                   16          699     4.05s
                   32          350     4.05s
                   64          175     4.07s
                  128           88     4.05s
                  256           44     4.03s
                  512           22     4.18s

Wall time flattens for 16-256 module batches.

A slower/lower core machine will do better with fewer modules-per-batch, a
faster/higher core machine will do better with more modules-per-batch.

Therefore, take the midpoint which works in the most margin in either
direction - 128 modules per batch.

This naturally scales with module count too as the optimum gains are
obtained with higher module count, so fewer batches in this case costs less
overhead.

Each instance holds only its own modules' variables and the top-level one
reads no per-module .cmd files at all, the same rules serve both levels,
and an instance is told its chunk with modfinal-first=<index>.

Only the top-level instance builds .module-common.o, to the chunks it is a
plain prerequisite, so no two instances ever write it.

"make modules" with every *.mod.o and *.ko deleted goes from 28.9s to 15.9s
with clang 22. No-op "make modules" goes from 5.6s to 4.8s, as checking the
22,000 targets is spread over the chunks too.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 allmodconfig, no-op make, gcc         2.3s     1.4s    -0.85s (-38%)
  x86 allmodconfig, no-op make, clang       2.8s     1.8s    -0.94s (-34%)
  x86 allmodconfig, clean, gcc            306.6s   294.1s     -12.6s (-4%)
  x86 allmodconfig, clean, clang          290.2s   283.9s     -6.4s (-2%)

Assisted-by: LLM
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/Makefile.modfinal | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 75e9effdf02c..4d5e6e1a0ff9 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -13,9 +13,30 @@ include $(srctree)/scripts/Makefile.lib
 # find all modules listed in modules.order
 modules := $(call read-file, modules.order)
 
+modfinal-chunk-size := 128
+
+ifdef modfinal-first
+
+# this instance handles the chunk of modules.order starting at $(modfinal-first)
+modules := $(wordlist $(modfinal-first), $(words $(modules)), $(modules))
+modules := $(wordlist 1, $(modfinal-chunk-size), $(modules))
+
 __modfinal: $(modules:%.o=%.ko)
 	@:
 
+else
+
+modfinal-chunks := $(addprefix chunk-, $(shell seq 1 $(modfinal-chunk-size) $(words $(modules))))
+
+PHONY += $(modfinal-chunks)
+$(modfinal-chunks): .module-common.o
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal modfinal-first=$(@:chunk-%=%)
+
+__modfinal: $(modfinal-chunks)
+	@:
+
+endif
+
 # modname and part-of-module are set to make c_flags define proper module flags
 modname = $(notdir $(@:.mod.o=))
 part-of-module = y
@@ -29,8 +50,11 @@ quiet_cmd_as_mod_o = AS [M]  $@
 %.mod.o: %.mod.S FORCE
 	$(call if_changed,as_mod_o)
 
+# Built by the top-level instance alone, the chunks take it as a plain file.
+ifndef modfinal-first
 .module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_rule,cc_o_c)
+endif
 
 ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
 cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
@@ -58,7 +82,11 @@ ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 endif
 	+$(call cmd,check_tracepoint)
 
-targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
+ifdef modfinal-first
+targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
+else
+targets += .module-common.o
+endif
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
