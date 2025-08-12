Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7F4C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9fdgkf34NxjDQ60oWefqvSkWUghPatgX6xeYSP/vFCU=; b=KrnWW234A34yIw
	myMrlMiio4OZSQOh+FwZKe+Ua+LACFQZ43naHfk1e4yOuOriXlBwy7c+Up4qVRaqLTpoPSmOLL53i
	Z8HgGmIQ3DvjG+SmLnF3+1zaTI9P7cy1X/rOSxg7ykO4vd6yqjHpgRiiO5mthAV0+Ud8+5g9GpO0h
	p9kHbHE09RR+B7zhJw2xm7qPASGtRm+tawu8yQh9OE2uw/cGulpcQpt0xN1EB0gKIbl32DVdWoqr4
	udzzZ+b9A/UiwCUezuLd/jTBRt5ma7qNaVBC1kpmFp8n3qTljoygccZiiub+CK2tdypgL8XNRnOdh
	vmo6IS+imrF3q/TWjnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgLU-00000009lxM-3pOi;
	Tue, 12 Aug 2025 04:10:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgLR-00000009lwr-337G
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 04:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E30A75C657C;
	Tue, 12 Aug 2025 04:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0E6C4CEF0;
	Tue, 12 Aug 2025 04:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754971840;
	bh=A1IDknI2wBVOF1lDrVTLS/8ROE/k11Q3XCJ/bLtA1Qk=;
	h=From:Date:Subject:To:Cc:From;
	b=tMPKyrPX7lo45EbxFVokOQCV7amf4PfNmPA+d8EqFKOZ7mq6bO73wUaWvP7MO3jPa
	 x2QLuPdJvru8sVfRRndqXv9SLq8UL/BRs+KfSVqpzOXH5u8ZACsmXSw4CIs3QogrwE
	 a4i9XTRhwvDiyZAZIOB6gaFJqBAdJS5uyKhEIQgJTKJArOIsihkmLm7Fn0eQqRbn4H
	 oFR4MN3FIPX10lbxO07nIAAVOFC0mw6ZqvCCBhgR5NFfx4cLZ1tPL/mgz0iEH7M1pg
	 pCt4uuXQO5jniQp2dYuexo25QpiZrRJsqnrz7ut4QO69TmnPiuyEJYUFa8luUha2cA
	 84MuwP1LVk6TQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 Aug 2025 21:10:01 -0700
Subject: [PATCH RFC] riscv: Use 64-bit variable for output in
 __get_user_asm
MIME-Version: 1.0
Message-Id: <20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v1-1-7bb8c9cbb92b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJi+mmgC/x3NywrCMBCF4Vcps3agSbEUt4IP4FZcDHFSB9Km5
 KZQ+u4OLv+z+M4OmZNwhku3Q+ImWeKqYU4duDetM6O8tMH29txPxmCS7Bp+CENoC1JecI4lYqx
 lqyXroGBRBD1JqIlxJPZkx2GYnANlt8Revv/LB9xvV3gexw/QjY3WhwAAAA==
X-Change-ID: 20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-6aefa26338cc
To: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Craig Topper <craig.topper@sifive.com>, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547; i=nathan@kernel.org;
 h=from:subject:message-id; bh=A1IDknI2wBVOF1lDrVTLS/8ROE/k11Q3XCJ/bLtA1Qk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmz9u3bu+uaZ6lnc862mOrn133Ys/dd/3fH+YnE1hdRc
 y/lJNzk6ChlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATMX7JyHDe9KGdeaNbuKXH
 l/DAxCAb4a+J21+Ul92Kl05/7JhnpMXIsLmZ0U0t6PDh/XeutvcsczGcuKHPsEa67Lyh28p7y+W
 zWAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_211041_858412_C9021C16 
X-CRM114-Status: GOOD (  12.61  )
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
I did this unconditionally but I did not do much investigation into how
the code generation changes, as I never have good luck with figuring out
what is real vs. noise. If this is a worry, I can just duplicate this
under a CONFIG_CC_IS_CLANG block. Alternatively, we could mark
CONFIG_CC_HAS_ASM_GOTO_OUTPUT as broken with clang when targeting
RISC-V.
---
 arch/riscv/include/asm/uaccess.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index b88a6218b7f2..ff162db20521 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -98,12 +98,16 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
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
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-6aefa26338cc

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
