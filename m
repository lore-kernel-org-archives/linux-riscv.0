Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A97C4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/C5rvl7BFR7haOupE9vDwP/EfbkkJbK1VLDOYRQrLHs=; b=kVB4CYNSfgDb//
	dF0btHRNSo78dFbxnGsl+gzdXOd8arvSVL+m53ojBxxmrr9mHHV/jRovbfYMakRvxOFPUoDxxT4uE
	a7gzwmf7rqjek789Os+HZPq0wGTZHT0GJ1MTP80j6W1bRabTBdiUH83QmwfuQCHYt//lqq/rlHxz0
	oIG0BVY2ns+GaIe8FdoXB9hhIMe/4p+sRjx2bsW6iv1RmTs5eQE0p75fhRgfkD1AwCM5lh+qYOasC
	nWxyzF92ww3RkrAH6D5yMz/suoKihvXVRVqz/7Z/Ltxr3MUDfWBnmUQUHOS3F7OUFOukCENwF/Z8n
	iOnt5teY4slzredl7cJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlivm-000000069Uj-0gVp;
	Mon, 20 Jul 2026 08:00:54 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlivi-000000069Ti-1GCp
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 08:00:53 +0000
Received: from smtp.gmail.com (unknown [180.111.28.80])
	by APP-01 (Coremail) with SMTP id qwCowABXLfGo1V1qO7CtAA--.8116S2;
	Mon, 20 Jul 2026 16:00:40 +0800 (CST)
From: daichengrong <daichengrong@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daichengrong <daichengrong@iscas.ac.cn>
Subject: [RFC PATCH] riscv: uprobe: Relax SYSTEM instruction validation
Date: Mon, 20 Jul 2026 16:00:16 +0800
Message-Id: <20260720080016.49842-1-daichengrong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowABXLfGo1V1qO7CtAA--.8116S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF43GF43ZF4rZFy3CFW5trb_yoW5Xry7pF
	s8Cw1fCFZ5Wrs3CryfAr4kur4Yga1rGw43KryDZw4aqayxJry5tF95tw45tr1ktFWjqr10
	qF4Y9r9Y9345AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-Originating-IP: [180.111.28.80]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_010050_717160_728CB3DA 
X-CRM114-Status: UNSURE (   9.35  )
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

RISC-V uprobe currently rejects all SYSTEM instructions during
instruction validation.

This policy is conservative, but it also rejects CSR instructions that
only read architectural state, preventing uprobe from instrumenting
user applications containing such instructions.

This RFC proposes refining the SYSTEM instruction validation by
distinguishing read-only CSR instructions from CSR operations that may
modify processor state. Read-only CSR instructions are allowed, while
CSR write operations and other SYSTEM instructions continue to be
rejected.

The RISC-V ISA permits implementation-defined side effects on some CSR
reads. Feedback is welcome on whether instruction-level validation is
sufficient, or whether additional validation based on CSR properties
would be more appropriate.

Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
---
 arch/riscv/include/asm/insn.h          | 15 +++++++++++++++
 arch/riscv/kernel/probes/decode-insn.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..08c6be4609ea 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -600,4 +600,19 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
 	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
 }
+
+static __always_inline bool riscv_insn_is_csr_read(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_SYSTEM &&
+			(GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRS)
+				 || GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRC)
+				 || GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRSI)
+				 || GET_FUNCT3(code) == GET_FUNCT3(INSN_MATCH_CSRRCI)) &&
+			 RV_EXTRACT_RS1_REG(code) == 0;
+}
+
+static __always_inline bool riscv_insn_is_system_except_csr_read(u32 code)
+{
+	return riscv_insn_is_system(code) && !riscv_insn_is_csr_read(code);
+}
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bfb9f..4a6a33b95159 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -21,7 +21,7 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	/*
 	 * Reject instructions list:
 	 */
-	RISCV_INSN_REJECTED(system,		insn);
+	RISCV_INSN_REJECTED(system_except_csr_read,		insn);
 	RISCV_INSN_REJECTED(fence,		insn);
 
 	/*
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
