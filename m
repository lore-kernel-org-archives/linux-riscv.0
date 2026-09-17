Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241BBC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSRLkiIEduC2gs+Z/F3sHZEG4HHaHxj0kx84ha0NjOM=; b=QbAdf0CtfweObq
	PK2/WZH8moyp5PfluduwqIqZ5B1S71Wgjc4Rf0c02SxqJixIdas4mRaQ4XLzImxpcW6pSw5AStoSh
	hJY8Vx9DhvztJI7RolnqvyAVNMRblkdH+SFXlLIij4qGQNhWE/ngHa7wI0SlBEB742b1fCHwrylz6
	tSlilrb1ex0RyM51W2LQHTdFgg4l8K9OavcSLg6w1tHnpxjnAWFQ1M7ZmQVYb7khEHsPTTPkjkxJk
	qeSzW4Fi4vULq4D/SZpOQVL4N1Yq4bSghJN1SjIsUiSaShOa8Gv6DPo1dAFz+ijBwms3Jxg0vZhHx
	wKoUat23q8t9Yl45fyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JCb-0000000CVln-2S3o;
	Thu, 17 Sep 2026 20:59:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JCZ-0000000CVle-12yq;
	Thu, 17 Sep 2026 20:59:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 905C54322C;
	Thu, 17 Sep 2026 20:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654E71F00893;
	Thu, 17 Sep 2026 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789678766;
	bh=jCN23Z098/jrBfz0bmrygNbGxnLmKn6q7+PuR1I0LGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1iJnrT5zwIrpIGfCXw3tperSIg5wg+ccx1MerSVNbZKcKAO2Wen+D59D8D5DLJnc
	 iF217QvkXDUQ+4iHuY8eEUZ7yL8xlYISWkK8SQeYTnqwssMCw1OEbjQgFp9u0lgKvJ
	 pqHbYnMRym6T6Hhf9CzyK6P9da+oWQN2sQ93SDO+FC20DvtsVGBsMi2ArzaNwg5bVk
	 UJIdWn+vHQPYc8juD9NnTa5TnDl/Bw97Dt4DPOYHw8xO/jPT0st5vqM2dTssTOnZXI
	 gyAXZsmWH+tHCCKaZqYgmKl++M7jkh48ll258Xjdsminj3GIfk0yO8jAHheJBA5Nip
	 ltqEn+yZO5xpw==
Date: Thu, 17 Sep 2026 13:59:26 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 09/20] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <202609171229.31BB336E1@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
 <202609171117.35BFDCC13@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609171117.35BFDCC13@keescook>
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

On Thu, Sep 17, 2026 at 11:42:50AM -0700, Kees Cook wrote:
> On Thu, Sep 17, 2026 at 05:06:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> > This can be done faster in C, so implement scripts/basic/depcheck to do so.
> >
> > It does as little work as possible, reading the .cmd files from a
> > directory's targets and running stat on each dependency only a single time.
>
> Doesn't this run the risk of missing transitive deps?
>
> C.cmd:	C.o depends on A.c and B.c and B.h
> B.cmd:	B.h depends on B.data and B.script
>
> depcheck looks at C.o and B.h's times and is happy so it drops C.cmd file,
> but then see B.script has changed compared to B.h, so it keeps B.cmd,
> and then the build runs and doesn't have the C.o dep list any more,
> and C.o goes unbuilt?
>
> Also, I don't think this handles if_changed commands at all? The kbuild
> rebuild condition is timestamps plus if_changed's command-line check.

tl;dr: I spent way too long looking at this. I think my conclusion is
"Hm, this makes some cases of missed Makefile deps on generated files
harder to find, but there don't *appear* to be any obviously wrong
instances of this in the tree."

Long version:

There does appear to be a problem in the case of generated targets where
the Makefile deps are build-order correct but lack explicit deps. As
in, a clean build generates the needed dependencies due to some prior
explicit Makefile rule dependency, and a later source-level "#include"
for the generated file exists (and the build doesn't fail since the
included file got generated before the source that "#include"d it got
built), and then the normal dep tracking (-Wp,-MMD,... -> .cmd) catches
it and any direct changes to that dep would normally get noticed going
forward on incremental builds.

However, with the depcheck .cmd pruning, changes to transitive deps
(either via file contents or Kconfig options) will go unnoticed during
incremental builds without that explicit dep (but stock doesn't miss
it). Though actually it's kind of worse because it'll get noticed on
rebuild #N+1 for N level of transitive depth, so something will break,
and then you build again, and the changes from 2 builds ago suddenly
get rebuilt...

I think you maybe encountered an instance of this in your series, too,
but it got exposed due to a clean build no longer having the ordering
correct:
https://lore.kernel.org/lkml/20260917-build-speedup-v3-18-9ecf4163ff36@kernel.org/

See the trailing diff for a demo:


  git apply demo.diff
  make O=b defconfig
  # simulate a earlier-stage header generation...
  make O=b lib/byfile_anchor.o lib/byconf_anchor.o
  make O=b lib/

  # trigger 1: the header's input file changes
  echo FROMFILE-two > lib/byfile_gen.in
  make O=b lib/

  # trigger 2: a Kconfig value changes; no file is touched
  ./scripts/config --file b/.config --set-str LOCALVERSION -demo2
  make O=b lib/

  # what each object ended up holding
  strings b/lib/byfile_anchor.o | grep FROMFILE-    # FROMFILE-two   both trees
  strings b/lib/byfile_victim.o | grep FROMFILE-    # FROMFILE-two   stock
                                                    # FROMFILE-one   patched  <-- stale

  strings b/lib/byconf_anchor.o | grep CONF-        # CONF--demo2    both trees
  strings b/lib/byconf_victim.o | grep CONF-        # CONF--demo2    stock
                                                    # CONF-          patched  <-- stale


This means adding depcheck would silently expose any current (and future)
missing explicit deps on generated files where those files get generated
by either an earlier build stage or an earlier rule. :(

I went looking for the kind of missed Makefile dep for a generated file,
and while it's not a very grep-able condition, I did look at stuff that
fell into include/generated/, but it's safe due to the prepare/archprepare
ordering AFAICT. So then I looked at places where -I had $(obj) added to
it, and all of those seemed to have explicit Makefile deps too. Well, all
except for arch/x86/boot/compressed/sev-handle-vc.c which includes
"../../lib/inat.c" but that seems safe today due to ordering from
arch/x86/lib/ being needed before arch/x86/boot/compressed/.

So, yeah, it makes me nervous, and it may make incremental builds less
idempotent. But I can't really find extant problems and the demo is
slightly contrived, but not exactly an impossible situation.

-Kees


diff --git a/lib/Makefile b/lib/Makefile
index dfab958327c5c..aed0bd9eb7d6a 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -350,3 +350,36 @@ CONTEXT_ANALYSIS_test_context-analysis.o := y
 obj-$(CONFIG_CONTEXT_ANALYSIS_TEST) += test_context-analysis.o
 
 subdir-$(CONFIG_FORTIFY_SOURCE) += test_fortify
+
+# --- depcheck demo ---
+obj-y += byfile_anchor.o byfile_victim.o byconf_anchor.o byconf_victim.o
+
+quiet_cmd_byfile = GENFILE $@
+      cmd_byfile = printf '\#define BYFILE_STR "%s"\n' "$$(cat $<)" > $@
+
+quiet_cmd_byconf = GENCONF $@
+      cmd_byconf = printf '\#define BYCONF_STR "CONF-%s"\n' '$(CONFIG_LOCALVERSION)' > $@
+
+# Regenerated when its input file changes.
+$(obj)/byfile_gen.h: $(src)/byfile_gen.in FORCE
+	$(call if_changed,byfile)
+
+# No input file: regenerated only when its command line changes, which here
+# means when CONFIG_LOCALVERSION changes. No file is touched.
+$(obj)/byconf_gen.h: FORCE
+	$(call if_changed,byconf)
+
+targets += byfile_gen.h byconf_gen.h
+
+# The anchors declare the dependency. That is what generates the headers on
+# a clean build: fixdep only records a header once the object has compiled
+# successfully, so on a first build there is no .cmd file to rely on. The
+# victims include the same headers without declaring them, so the only
+# record of that edge is the deps_ list in their .cmd files.
+$(obj)/byfile_anchor.o: $(obj)/byfile_gen.h
+$(obj)/byconf_anchor.o: $(obj)/byconf_gen.h
+
+CFLAGS_byfile_anchor.o += -I$(obj)
+CFLAGS_byfile_victim.o += -I$(obj)
+CFLAGS_byconf_anchor.o += -I$(obj)
+CFLAGS_byconf_victim.o += -I$(obj)
diff --git a/lib/byconf_anchor.c b/lib/byconf_anchor.c
new file mode 100644
index 0000000000000..8035eaa352a3b
--- /dev/null
+++ b/lib/byconf_anchor.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "byconf_gen.h"
+const char byconf_anchor_marker[] = BYCONF_STR;
diff --git a/lib/byconf_victim.c b/lib/byconf_victim.c
new file mode 100644
index 0000000000000..285a8de8bdf6e
--- /dev/null
+++ b/lib/byconf_victim.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "byconf_gen.h"
+const char byconf_victim_marker[] = BYCONF_STR;
diff --git a/lib/byfile_anchor.c b/lib/byfile_anchor.c
new file mode 100644
index 0000000000000..9ea0b8ad55963
--- /dev/null
+++ b/lib/byfile_anchor.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "byfile_gen.h"
+const char byfile_anchor_marker[] = BYFILE_STR;
diff --git a/lib/byfile_gen.in b/lib/byfile_gen.in
new file mode 100644
index 0000000000000..7da9e5e0cd83c
--- /dev/null
+++ b/lib/byfile_gen.in
@@ -0,0 +1 @@
+FROMFILE-one
diff --git a/lib/byfile_victim.c b/lib/byfile_victim.c
new file mode 100644
index 0000000000000..763c5ef8f1514
--- /dev/null
+++ b/lib/byfile_victim.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "byfile_gen.h"
+const char byfile_victim_marker[] = BYFILE_STR;


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
