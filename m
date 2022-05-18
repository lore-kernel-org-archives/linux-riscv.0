Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02174C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qwahJiiEPef1OWbkDukxbeEmLqwWv0h1qSpuseIdQvQ=; b=fRAWZHpW+M1mpZ
	rcPkeUT0zumWOAy5x4+LaZhaI18d3pCSwc29FHAVJ3IAMq56irQ+RBdeMDgiFS+rhbb+TxHr6Ng/w
	eifoU2a3liIe4bvdVQ2cl2Sz5dTklWQtfficWLWIODI1CtihMma3yI1E9Wj6j48tTNEbzJB4fotqN
	4hjfk3226loqFmQQC32ac57ZhE8pTKBdl5wyAaDYxg2jEEaa1bZAiMiHwBfRb9CKJBq7VxWBboau6
	zExCwegstF36Js802JLr3W3c31cz4oUM2rHrNDBmBiY+znqmxAUlUPsl4GL9U7wY4oww8CgKZ6smR
	zTALWnympZKoysQWY2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrOgA-003UFS-7u; Wed, 18 May 2022 18:45:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrOg7-003UET-27
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 18:45:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7E21618BB;
 Wed, 18 May 2022 18:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F82C34113;
 Wed, 18 May 2022 18:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652899545;
 bh=BagzOTYZWCGSwt0tBoax0Ts+NwQ5tB79VYsdhAHbds4=;
 h=From:To:Cc:Subject:Date:From;
 b=pMJlSrxH3S//KP5N794tKqWKYBIZxNC6S/ejwsxrZN8rTUXu2JkoFh4rQdPAiX5MY
 DjZGXOf2/i/f/7N0TnU5HlBwFH7xKkex0i/5RKCpR7bJOjpdTyW4jEIZAoLluUALY3
 MRIvsc7tquW6QgQP1gnrzR13pBZSWcoTGeNF8hBTgvI6uxtAHZ1EvQiEQJTsAFL7YM
 KJzr/Mic+FGYEAOWs2VGx1K7eOJ9ZLfrIPAz68oMDjMtec1wGou8piBBUoOE3CLsvO
 CIZPFeJoEhzR4curzPpB+gyZyemdubXvhe5/cc3MvN6ZV4bYcC3uMv92ShQtYSBZK0
 v9V01CFk7ZSdA==
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH] riscv: Fix ALT_THEAD_PMA's asm parameters
Date: Wed, 18 May 2022 11:45:29 -0700
Message-Id: <20220518184529.454008-1-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_114547_212521_456C128F 
X-CRM114-Status: GOOD (  13.53  )
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

After commit a35707c3d850 ("riscv: add memory-type errata for T-Head"),
builds with LLVM's integrated assembler fail like:

  In file included from arch/riscv/kernel/asm-offsets.c:10:
  In file included from ./include/linux/mm.h:29:
  In file included from ./include/linux/pgtable.h:6:
  In file included from ./arch/riscv/include/asm/pgtable.h:114:
  ./arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
          ALT_THEAD_PMA(prot_val);
          ^
  ./arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
          : "0"(_val),                                                    \
            ^

This was reported upstream to LLVM where Jessica pointed out a couple of
issues with the existing implementation of ALT_THEAD_PMA:

* t3 is modified but not listed in the clobbers list.

* "+r"(_val) marks _val as both an input and output of the asm but then
  "0"(_val) marks _val as an input matching constraint, which does not
  make much sense in this situation, as %1 is not actually used in the
  asm and matching constraints are designed to be used for different
  inputs that need to use the same register.

Drop the matching contraint and shift all the operands by one, as %1 is
unused, and mark t3 as clobbered. This resolves the build error and goes
not cause any problems with GNU as.

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Link: https://github.com/ClangBuiltLinux/linux/issues/1641
Link: https://github.com/llvm/llvm-project/issues/55514
Link: https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html
Suggested-by: Jessica Clarke <jrtc27@jrtc27.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/include/asm/errata_list.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 9e2888dbb5b1..416ead0f9a65 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -75,20 +75,20 @@ asm volatile(ALTERNATIVE(						\
 	"nop\n\t"							\
 	"nop\n\t"							\
 	"nop",								\
-	"li      t3, %2\n\t"						\
-	"slli    t3, t3, %4\n\t"					\
+	"li      t3, %1\n\t"						\
+	"slli    t3, t3, %3\n\t"					\
 	"and     t3, %0, t3\n\t"					\
 	"bne     t3, zero, 2f\n\t"					\
-	"li      t3, %3\n\t"						\
-	"slli    t3, t3, %4\n\t"					\
+	"li      t3, %2\n\t"						\
+	"slli    t3, t3, %3\n\t"					\
 	"or      %0, %0, t3\n\t"					\
 	"2:",  THEAD_VENDOR_ID,						\
 		ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)		\
 	: "+r"(_val)							\
-	: "0"(_val),							\
-	  "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
+	: "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
 	  "I"(_PAGE_PMA_THEAD >> ALT_THEAD_PBMT_SHIFT),			\
-	  "I"(ALT_THEAD_PBMT_SHIFT))
+	  "I"(ALT_THEAD_PBMT_SHIFT)					\
+	: "t3")
 #else
 #define ALT_THEAD_PMA(_val)
 #endif

base-commit: 93c0651617a62a69717299f1464dda798af8bebb
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
