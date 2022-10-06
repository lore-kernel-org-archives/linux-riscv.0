Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D86C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7XE9q9cVtsu9t8rFQ+20F6XK+ZuWUwaGMXtNA3Dqu/M=; b=T4Lm3PRnjqxP8B
	SZzUIkzJvLJ+QHpOhlQUlDVmRkJGVNYWr/ArhDjCk0ZA2sCtTlaedLhiNUBKSUBFsTD9Xk7VNW4rZ
	b7IBwrRQMZtliR1rfdC9lPimxnpoLnT0ot7c6j5chHEqPO9aizNiwjvbgE7mppxFowaWGEu9ILghr
	wTkMveaPuY53NIIgYWBa3yrKQ+XrMm1R9bJarT4u7pf0wdYFH6wiEeER8jzBXrOuTzvUJO0lOFqj5
	FsXuAFwc6xXcJxbz5XamxS8RnF7kwNPwJAm2iZTFH14qxQNu5I8E4SaP9lLgfwTtZV/wodHGIHtJH
	5imKMIm5pzZoH2xpOq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKhr-000GTU-Uf; Thu, 06 Oct 2022 06:50:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKho-000GSD-Mh
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 06:50:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65B7A61852;
	Thu,  6 Oct 2022 06:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8EBC433C1;
	Thu,  6 Oct 2022 06:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665039002;
	bh=8znyUi7frmFRBSfuJybw+EkaJdAE56P9QcmLz7WlrfU=;
	h=From:To:Cc:Subject:Date:From;
	b=nzw9aL84H/hEuWBrmMCqO7iVRhyDMlG92G8VdzvEhwA5J7VnKKgTXIZxr9alq5saR
	 eOsn40rDosNmHBJ1201GllDNCWXi4+vICrBWr823ZlLxzX/eU9rho7b9itXQlT1wCK
	 nobAVA+SB7ec/EHF/A71eObffcMnDWHOmGybB+seGnp/tDeaocq+6SwiXQ3rQGPzVH
	 yMK7dEzF5BBfG2SxbACWCycSX2pR8P/b4Tg37hmYy5uWkTW3I2BLVp0YKwiKFOdZ3r
	 hpcN/v4b3nKwY8kRZy3Fos+F4hcmgk22kt0cshIcfa3bu+wl340nJeY9ZZ4wYKcrqq
	 WJd0IXmW3VOxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] riscv: jump_label: mark arguments as const to satisfy asm constraints
Date: Thu,  6 Oct 2022 14:40:28 +0800
Message-Id: <20221006064028.548-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_235004_866780_122353C5 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Samuel reported that the static branch usage in cpu_relax() breaks
building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]:

In file included from <command-line>:
./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
probably does not match constraints
  285 | #define asm_volatile_goto(x...) asm goto(x)
      |                                 ^~~
./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
'asm_volatile_goto'
   41 |         asm_volatile_goto(
      |         ^~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:285:33: error: impossible constraint
in 'asm'
  285 | #define asm_volatile_goto(x...) asm goto(x)
      |                                 ^~~
./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
'asm_volatile_goto'
   41 |         asm_volatile_goto(
      |         ^~~~~~~~~~~~~~~~~
make[1]: *** [scripts/Makefile.build:249:
arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2

Maybe "-Os" prevents GCC from detecting that the key/branch arguments
can be treated as constants and used as immediate operands. Inspired
by x86's commit 864b435514b2("x86/jump_label: Mark arguments as const to
satisfy asm constraints"), and as pointed out by Steven in [2] "The "i"
constraint needs to be a constant.", let's do similar modifications to
riscv.

Tested by CC_OPTIMIZE_FOR_SIZE + gcc and CC_OPTIMIZE_FOR_SIZE + clang.

[1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
[2]https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/jump_label.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 38af2ec7b9bf..6d58bbb5da46 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -14,8 +14,8 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
-static __always_inline bool arch_static_branch(struct static_key *key,
-					       bool branch)
+static __always_inline bool arch_static_branch(struct static_key * const key,
+					       const bool branch)
 {
 	asm_volatile_goto(
 		"	.option push				\n\t"
@@ -35,8 +35,8 @@ static __always_inline bool arch_static_branch(struct static_key *key,
 	return true;
 }
 
-static __always_inline bool arch_static_branch_jump(struct static_key *key,
-						    bool branch)
+static __always_inline bool arch_static_branch_jump(struct static_key * const key,
+						    const bool branch)
 {
 	asm_volatile_goto(
 		"	.option push				\n\t"
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
