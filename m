Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B36EC98308
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hj6GAHYZIh6gVXIA3yP+f3HA1C7zHijVPadEXcYQcOE=; b=mvVOzmzAeG2J3g
	kI0O26SYWGv0U72gaIp+YUQiErWj0RsMYd5ah3DMAfZxMU29+q/BraBlY1+CsXX6i9wcfMZ2iZm62
	fRntmSRoB7C4K6fnJACQApqC5Hy8MnTo6ha4jRTt0L56JCDTb+XPu8SKvvcm7OpB1IoyoQCcaI0f8
	H2u0Si5RCutyDs7RcpLZdoMrrPhYNJF70xCYdLNgrDo7ORXVCINw77em2bHE4FMHh7eLxMvCd1NZA
	pWf//mim2fS/IicUSPOHcPg8jqz5kXHZvQUDjngjZUKicsCht/oX6HPgBzZX8SOBvaNcz2mD9/Wjx
	Q6oVpXmzp/GJgBRV4Slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgsYv-0000000Ez5A-3HBa;
	Fri, 16 Jan 2026 22:45:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgsYt-0000000Ez4V-13GA
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 22:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB23C4412E;
	Fri, 16 Jan 2026 22:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC27AC116C6;
	Fri, 16 Jan 2026 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768603498;
	bh=gjvrPL9/wzh4AalQEt+FlL5xbebbIKh0iM8Gwb+H4Uw=;
	h=From:Date:Subject:To:Cc:From;
	b=eq/IMixjH6fWBH6DyiJOwY+q6q0xKMIpw4uP3fY/ZGGHBV+Mg5xPh8p/nGdQJguUH
	 5JmB6PUrzXSJT7BoBg7KMCvvwhPDAouKqpaCpiXql3Shjy56dR4XBSHsvTkhgPp3Fl
	 Y62nygglr3ELpR8Ewwj825CyWjj0TW0hZobR3Vhsl4seNMO6xaxZQSqPG6RQnpHXYj
	 BtLGqR/rRwvsGNaJ8eAXoZMDI4QYX7M9dv6BoYkw/bKFFjrqg+DfgJnx9CgvIQhPJM
	 GsQeY2+CdIbUjZDRHF+Ub8QLOQZzQ2hv5T5TSLXsrNuGz0IDStaa6SU7N7flrpL0zA
	 1gkTTNP7VvmHg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 16 Jan 2026 15:44:34 -0700
Subject: [PATCH v3] riscv: Use 64-bit variable for output in __get_user_asm
MIME-Version: 1.0
Message-Id: <20260116-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v3-1-55b5775f989b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XOTQ6CMBQE4KuYrn2mP4rgynsYF219hUagpC1VQ
 7i7hcSFW13OLOabiQT0FgM5bSbiMdlgXZ+D2G6IbmRfI9hbzoRTfqAlY+Bt0AkeEto2dSBDB7W
 LDtwYhzGGXOTBmEfASNuOHqGQaCQvhCi1Jnl28GjscyUv15wbG6Lzr/VBYkv7B5YYMDgqVepKK
 1Vxdb6j77HdOV+TRUv8IxSUMfGDwLOAdC+V5MhMZb6EeZ7fEee3bFMBAAA=
X-Change-ID: 20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-6aefa26338cc
To: Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Craig Topper <craig.topper@sifive.com>, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gjvrPL9/wzh4AalQEt+FlL5xbebbIKh0iM8Gwb+H4Uw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlZ+zMChCv5IkOs+bnErGsOdwb9ezsvn0dh37ufd8S4i
 2XTj57sKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPZZs3wP6N7e4QnW9ILc25T
 bn/lE7Ktzjqd0xRLfZ/uLtqXqVTlzciw9MDPJVNsV8ieuvc1xq1u/ulvCWccd509PWFJh4r/jIg
 ebgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_144459_353162_F102EFDA 
X-CRM114-Status: GOOD (  13.25  )
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

After commit f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for
get_user()"), which was the first commit that started using asm goto
with outputs on RISC-V, builds of clang built with assertions enabled
start crashing in certain files that use get_user() with:

  clang: llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp:12743: Register FollowCopyChain(MachineRegisterInfo &, Register): Assertion `MI->getOpcode() == TargetOpcode::COPY && "start of copy chain MUST be COPY"' failed.

Internally, LLVM generates an addiw instruction when the output of the
inline asm (which may be any scalar type) needs to be sign extended for
ABI reasons, such as a later function call, so that basic block does not
have to do it.

Use a temporary 64-bit variable as the output of the inline assembly in
__get_user_asm() and explicitly cast it to truncate it if necessary,
avoiding the addiw that triggers the assertion.

Link: https://github.com/ClangBuiltLinux/linux/issues/2092
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v3:
- Add a comment around why a temporary variable is used (Paul)
- Link to v2: https://patch.msgid.link/20260113-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v2-1-e04aba2e1f9f@kernel.org

Changes in v2:
- Rebase on 6.19-rc5
- Send to updated addresses
- Link to v1: https://lore.kernel.org/r/20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v1-1-7bb8c9cbb92b@kernel.org
---
 arch/riscv/include/asm/uaccess.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 36bba6720c26..53a643c0f6fe 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -97,13 +97,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
  */
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+/*
+ * Use a temporary variable for the output of the asm goto to avoid a
+ * triggering an LLVM assertion due to sign extending the output when
+ * it is used in later function calls:
+ * https://github.com/llvm/llvm-project/issues/143795
+ */
 #define __get_user_asm(insn, x, ptr, label)			\
+do {								\
+	u64 __tmp;						\
 	asm_goto_output(					\
 		"1:\n"						\
 		"	" insn " %0, %1\n"			\
 		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
-		: "=&r" (x)					\
-		: "m" (*(ptr)) : : label)
+		: "=&r" (__tmp)					\
+		: "m" (*(ptr)) : : label);			\
+	(x) = (__typeof__(x))__tmp;				\
+} while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_asm(insn, x, ptr, label)			\
 do {								\

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-6aefa26338cc

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
