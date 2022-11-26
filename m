Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC46C4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3DKahsH51PF5JzJ0E/8IH8n3Kv6dsXBP0I2AYunoTw=; b=qq3CXrBtWbgp6D
	KzISnOZ4qty1ma8S6DO+WzTkwMGHTt8/P+kMbGB/Z8QpYreQIgu7SbCB9u39DW75dTyI9wJf/pM/O
	QaDCjZquf4gdapimcESYKF25x2pqmRKwjzhJxv6hz8xKCpslMnHELQHHZO8Cac28rIanVIhbDRDdd
	g+BFQAeBVflymjXcol6r8l1nCRF1OTdb5PqfueTvMPVn1zMgBPdPLGhem3rWDfvxi+46fgC5qNXIt
	IYuhTr1atwa4DW1kdeobZoNEbNeyB0CTgiPpMbVemPM3eRjwQSVQx4sSHPP79g2ajMYItxduov6LF
	LPAyDGqIuDGZkXawIr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz46C-008XMa-CK; Sat, 26 Nov 2022 22:56:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz467-008XKW-RM
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 22:56:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4793660B41;
	Sat, 26 Nov 2022 22:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F234C433D6;
	Sat, 26 Nov 2022 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669503393;
	bh=m3ZEUK0zXePJycyJFWyVV/OydFcxPrFRvDSAjxSAbFg=;
	h=From:To:Cc:Subject:Date:From;
	b=PO2FYMebNnz4Pbfnw8L4jSaDjHMCbBhjOKGHHL0XHqdTEbi9z/rQObYtc5Y1R8A90
	 BfP+J0A5NJQO/9ZpskWhGvFqo5+N4UbA0/KELhr4nfVkR0ZcrD5JbPC1XmRdq5UvCz
	 pFFTHtOLfHL63Xa2FRll9c/1SMNrWbyeqdSa70SK2xcfK3idyIdASCNjALTZ63eR3K
	 ohcsiMfWB1/6ELvIZtYDEiD5am3qskj/aG4I3aGJiffQ6/AUoPbLkPFBggduWJ0HJm
	 nCMros1t7GTgCwsh69Z3buA7Ohtivt+nh04MO1b+ORFjDV8YmaxH8p9/yBPTU9m54E
	 8g2ZlTEp/i1OA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH v3 1/5] kbuild: add test-{le,ge,lt,gt} macros
Date: Sun, 27 Nov 2022 07:56:20 +0900
Message-Id: <20221126225624.751661-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_145635_981371_06FF8F7B 
X-CRM114-Status: GOOD (  15.58  )
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

Because GNU Make is handle strings, it is very hard to perform math in
Makefiles.

When we compare two integers, we invokes shell. One example is in the
top Makefile:

  ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)

This is more expensive than using built-in functions since it forks a
process.

If we know the two have the same number of digits, we can do better.

This commit adds four macros, test-le, test-ge, test-lt, test-gt.

$(call test-lt, A, B) is evaluated to 'y' if A is less than B, or
empty otherwise. This will replace $(call shell test A -lt B).

Again, the limitation is that A and B must have the same number of
digits because these macros are based on $(sort ) function.

  $(call test-lt, 1, 9)    -->  y        (Works!)
  $(call test-lt, 10, 9)   -->  y        (Not work...)

To make the latter work, you need to add '0' prefix to align the number
of digits:

  $(call test-lt, 10, 09)  -->  empty    (Works!)

Actually, we can live with this limitation in many places. As for the
example above, we know $(CONFIG_LLD_VERSION) is 6-digits because the
minimal supported version of LLVM is 11.0.0 (or CONFIG_LLD_VERSION=0
if the linker is not LLD, this case also works.)

So, the shell invocation can be replaced with more efficient code:

  ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)

Of course, this assumption will break when LLVM 100 is released, but it
will be far in the future.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v3:
  - Ensure the given parameters are not empty

 Makefile               |  2 +-
 arch/riscv/Makefile    |  2 +-
 arch/x86/Makefile      |  2 +-
 scripts/Kbuild.include | 10 ++++++++++
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6f846b1f2618..eb80332f7b51 100644
--- a/Makefile
+++ b/Makefile
@@ -986,7 +986,7 @@ KBUILD_LDFLAGS += -mllvm -import-instr-limit=5
 # Check for frame size exceeding threshold during prolog/epilog insertion
 # when using lld < 13.0.0.
 ifneq ($(CONFIG_FRAME_WARN),0)
-ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
+ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
 KBUILD_LDFLAGS	+= -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
 endif
 endif
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0d13b597cb55..faf2c2177094 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -37,7 +37,7 @@ else
 endif
 
 ifeq ($(CONFIG_LD_IS_LLD),y)
-ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
+ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 150000),y)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
 ifndef CONFIG_AS_IS_LLVM
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 415a5d138de4..e72c7a49cd59 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -211,7 +211,7 @@ endif
 KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
 
 ifdef CONFIG_LTO_CLANG
-ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
+ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
 KBUILD_LDFLAGS	+= -plugin-opt=-stack-alignment=$(if $(CONFIG_X86_32),4,8)
 endif
 endif
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index cbe28744637b..4b8cf464b53b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -11,6 +11,16 @@ space   := $(empty) $(empty)
 space_escape := _-_SPACE_-_
 pound := \#
 
+###
+# Comparison macros.
+# Usage: $(call test-le, A, B)
+# works like shell's "test A -le B", use with care bacause it is ASCII sort.
+# If A and B have the same number of digits, it works as expected.
+test-le = $(and $(strip $1),$(strip $2),$(filter $1, $(firstword $(sort $1 $2))),y)
+test-ge = $(call test-le, $2, $1)
+test-lt = $(and $(strip $1),$(strip $2),$(filter-out $2, $(firstword $(sort $1 $2))),y)
+test-gt = $(call test-lt, $2, $1)
+
 ###
 # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
 dot-target = $(dir $@).$(notdir $@)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
