Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BDB606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwQl9Bl5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuSn4+araXq5KD9hJgaplzPv1c6Dy9E8AjTz3j01glE=; b=kwQl9Bl5Y6OBWD
	9fA22OWm9iiMorSgA++kYSuXIcFA6KCmIe+bubAeZOPYBarlhJUOusCW+RPO7103xs8BFSo/GEDVq
	0cAJsJpI8oKjLLiWGUCcvsRvwcOlz69nvTBXY5eMbXoWC1iIj8T+ua1jgnun1iATkts06jOlVCX6N
	3c8ZkD5nTH2u/IvYdLSc2IMNY3JnNPG2FwgETaVNHRWWPmbkIA+/kdlsth7U75zDfW9u7bor15rph
	vHEjGWq+e8GkX/nwIyy82RxS0EFXwDF8pnXBVSU32elR2kKd4xpF8UPXPB5iFa6DhEHGT8A9KYzum
	lUxi7yVdJN22vDnDdJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Xl-00000008wHv-3VXW;
	Tue, 20 Oct 2026 06:41:53 +0000
Received: from azure-sdnproxy.icoremail.net ([13.76.78.106])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Xh-00000008wGW-1BdK
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 06:41:52 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDniXMgDddqfWGHAA--.19571S3;
	Tue, 20 Oct 2026 14:41:38 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 1/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Tue, 20 Oct 2026 14:41:35 +0800
Message-Id: <20261020064136.665-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
References: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgDniXMgDddqfWGHAA--.19571S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr43AryxXF1kXF48Xw45GFg_yoW7Xw48pa
	n0k3ZxKrWDWFs7Cr9xArs8ur4rtws5Kw43Ka1UJa15K3y7WryrZ3sagw43AF1DJFyFgry7
	KFyYvrykC343A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	e5r4UUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEGE2rWRqodbgACs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_234149_507772_48C99E47 
X-CRM114-Status: GOOD (  12.83  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A kprobe or uprobe placed on a nop currently replays the instruction
out-of-line: the breakpoint trap runs the probe handler and redirects
execution to a copy of the instruction sitting in an XOL slot, and a
second breakpoint appended after the copy traps again to finish the
hit.  That costs an extra exception round-trip per hit; for uprobes
the slot runs in user mode, so the re-trap is a full
kernel<->userspace round-trip.

nop and c.nop have no architectural effect, so the replay can be
replaced by simply advancing the program counter when handling the
initial breakpoint, completing every hit within a single trap.
arm64 does the same in its probe-decode path, which is also shared
between kprobes and uprobes; see commit ac4ad5c09b34 ("arm64: insn:
Simulate nop instruction for better uprobe performance").

riscv_probe_decode_insn() is shared by kprobes and uprobes, so the
simulation applies to both.  It primarily matters for uprobes on
USDT probe sites: under the SystemTap SDT ABI (sys/sdt.h, parsed by
libbpf), the recorded probe location is by construction a plain nop
or c.nop, the same case that motivated the arm64 series.

Measured on QEMU (RISC-V virt, emulated): for a uprobe on a USDT
style nop site the per-hit cost drops by roughly 80 percent; for a
kprobe on a nop by roughly 40 percent.  On real arm64 hardware the
referenced commit measured ~2x.

Compile tested on RISC-V, and verified with the RISC-V kprobes
KUnit test which now covers nop and c.nop.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            |  7 +++++++
 arch/riscv/kernel/probes/decode-insn.c   |  6 ++++++
 arch/riscv/kernel/probes/simulate-insn.c | 14 ++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ad348d8b8..29a8a121e 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -228,6 +228,11 @@
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
 
+#define RVG_MATCH_NOP		0x00000013
+#define RVG_MASK_NOP		0xffffffff
+#define RVC_MATCH_C_NOP		0x0001
+#define RVC_MASK_C_NOP		0xffff
+
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
 #define __INSN_OPCODE_MASK	_UL(0x7F)
@@ -262,6 +267,8 @@ __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
 __RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+__RISCV_INSN_FUNCS(nop, RVG_MASK_NOP, RVG_MATCH_NOP)
+__RISCV_INSN_FUNCS(c_nop, RVC_MASK_C_NOP, RVC_MATCH_C_NOP)
 
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 433d9035b..e8888d3a4 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -44,5 +44,11 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_SET_SIMULATE(auipc,		insn);
 	RISCV_INSN_SET_SIMULATE(branch,		insn);
 
+	/* Simulate NOP for better performance */
+	RISCV_INSN_SET_SIMULATE(nop,		insn);
+#ifdef CONFIG_RISCV_ISA_C
+	RISCV_INSN_SET_SIMULATE(c_nop,		insn);
+#endif
+
 	return INSN_GOOD;
 }
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index f8a2f6857..9a9b128d2 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -244,3 +244,17 @@ bool __kprobes simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *r
 {
 	return simulate_c_bnez_beqz(opcode, addr, regs, false);
 }
+
+bool __kprobes simulate_nop(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, addr + 4);
+
+	return true;
+}
+
+bool __kprobes simulate_c_nop(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, addr + 2);
+
+	return true;
+}
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index b89e1bb01..64e65e82a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -30,5 +30,7 @@ bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_nop(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_nop(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
