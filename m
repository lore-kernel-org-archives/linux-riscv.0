Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF22C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAcyIAMdll9ZiYUuXA5AGQyoTFiDlwFtwJWF3M1TfMM=; b=gjZA/fRYv0K5L7
	DxZ3HBJ75Fdy0kzz4kPN6dcKYwDvj5RXm3GXosE5GsF949IRLMHxjKFX46DqCzp/aFahGyO1DUxbu
	LGy+ju3NgpwQz3XIA9nLxWqd+wPxg80mdkGaOWnx3ZUIHQtn3x8uHvArNzpm0w50/ozLjxlgxs5xL
	je+DCkT4hQXUVvvKpTjdSZz5BZGtLGIRpE3LulPek3FbU95cZiaFcKEApbsMg6xRrVM1s2Ipw8oQj
	NbCMqXAdbcGr+BKCw5ApJJT9athST+EGip5U8dnFq6cKor9HZ35/Wz4K0Unu7tvYmypa5AvilO7Zk
	sp2mITfMQji9rWNXQ6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4v-0000000F25r-3VYo;
	Wed, 14 May 2025 12:19:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zo-0000000EhBq-3qQN
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5zozQgL8hNfvDHr+6QpG+zfi9XouqRvI/psbV6Onzs=;
	b=0ljJnqd69eHsdExLWZE2Q0Z59kmesYbIMgxUkOSRtQb4VsNQpNnQnei7XvPZ11YVx6ofIq
	R0b0KfINrR3UX+bjFNdT8SsjAnE6/TNYp648636ag/1YLJp5c0a9OvQ1fOAi3Fq9db0qai
	x1cNZak6dI5IDk5LTMT+CKWbZ3Jwihy3b/Lf1pOd1LcWll1bBG7VfQEa9GLZOYnao8l8hU
	d+qTo5qPVX2E5cDdsHyQaxJsko9z2mA5WeISNFzjJ6DbndPkCz4oCsGeu9+8fsx3bFHAa+
	X0jyPg8OI12Lw1dcm4sDP7s9oiAhwefA5O9AeYHc2XjkOUh+ai050v7s6L5eLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5zozQgL8hNfvDHr+6QpG+zfi9XouqRvI/psbV6Onzs=;
	b=2ONDfHYdBi3haCF5NDkeQvJSZUHBABqWTIDCyimkgJ+ByFxm++9pmMUkamj+RabqBULu7r
	BAfEYndGuB4xX/Aw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
Date: Wed, 14 May 2025 11:38:45 +0200
Message-Id: <24497deaab06d6b12cb84923606ec26f67e25424.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023901_091605_94F06277 
X-CRM114-Status: UNSURE (   6.08  )
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

Use RVC_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_c_j().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 3ba97e79a2a3..5defbde4dd50 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -170,24 +170,9 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 
 bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 *  15    13 12                            2 1      0
-	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
-	 *     3                   11                    2
-	 */
-
-	s32 offset;
-
-	offset  = ((opcode >> 3)  & 0x7) << 1;
-	offset |= ((opcode >> 11) & 0x1) << 4;
-	offset |= ((opcode >> 2)  & 0x1) << 5;
-	offset |= ((opcode >> 7)  & 0x1) << 6;
-	offset |= ((opcode >> 6)  & 0x1) << 7;
-	offset |= ((opcode >> 9)  & 0x3) << 8;
-	offset |= ((opcode >> 8)  & 0x1) << 10;
-	offset |= ((opcode >> 12) & 0x1) << 11;
+	s32 offset = RVC_EXTRACT_JTYPE_IMM(opcode);
 
-	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
+	instruction_pointer_set(regs, addr + offset);
 
 	return true;
 }
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
