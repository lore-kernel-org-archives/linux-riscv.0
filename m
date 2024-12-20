Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52EFE7718C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQqyEG77QGrzjXeZVsnLpFeBjzjJjfIPKtPDi2aP0lw=; b=fnVAik9zyLgtva
	OFZYv7BGakR1vdttZTMOKPFLxsQNFjXo9AiOFgxodswbOh9epVhxggpkPtkFJZmjklyF1ub8v9/kr
	llx5HX1y+GhA3+7NU4j7wmq+AknuNXaXwJlMpLN7+K1irYvMQfrjTZ39sAKcW4qFjH7wAlK4uAYkv
	9CsabHIFvy/wsb2AkqRA0oh4+mEEDFuyCtNFwm/Nq5AdUZKejq9QXeA7HQAvw/LYbF75pd+mnAB67
	1Cgjv69W+ik5ScexRXeieL6otL24sDBEUjxy7lUEDLVkG/yE2G8WBKwXW9E8fTjXIHGf8whMMAMwK
	x9klX7om/W+YlLj7/IFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOI-00000005NuU-0E2x;
	Fri, 20 Dec 2024 15:58:14 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005NqX-0fLh
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZnXGFCpfCP9HiAZ+IkE+2YmSsqzx9QwNJVZS7AaXEzw=; b=lIX2V++SU6VFKrxoUeUTqjnNMj
	5ZgR84MQ0L5pUl7hugPjWJxpTxQMqyTUayX/oZ8rpO5ZO1HewsFNO9E+av1HXHgoCXHqWJpDGKAKf
	KZ9QBKraG1vDFs0Mp53jsGm9TGDbFeLdzyIIdgZAukPGsbJNE0FgVTunD4PDXGoUCwlb+aDo3/2Cz
	IuIl5FaL0TLZIMkDQfHxo4HvPCfXJqyqFg2l1dZvuOeHQh28suWW4HwSqZMNinoD3TB0qk6g+S+8H
	A5ROe5Zu4yQU4dqr6v3Kw1WW7O2+9rqEhKlzzGAv7ZPyBrXHcPXz15wqHGR3QQ6qVWnqt+FUw+o54
	yShUigUg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAM-3D; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LT7-3VT1;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 10/15] riscv: fixup use of natural endian on instructions
Date: Fri, 20 Dec 2024 15:57:56 +0000
Message-Id: <20241220155801.1988785-11-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_277309_38F3AA35 
X-CRM114-Status: GOOD (  14.26  )
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

The priveldged ISA spec says that all instructions should
be treated as little endian, so if we load them from memory
we should do le{16,32}_to_cpu on these and the reverse when
storing.

This fixes jump_label, bug and related functions for big endian
builds.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/alternative.c      | 10 +++++++++-
 arch/riscv/kernel/cfi.c              |  3 ++-
 arch/riscv/kernel/jump_label.c       |  3 ++-
 arch/riscv/kernel/traps.c            |  2 ++
 arch/riscv/kernel/traps_misaligned.c |  3 +++
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 0128b161bfda..a2c8f0a5bca9 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -62,11 +62,16 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 	}
 }
 
+static u32 get_u16(u16 *ptr)
+{
+	return le16_to_cpu(*ptr);
+}
+
 static u32 riscv_instruction_at(void *p)
 {
 	u16 *parcel = p;
 
-	return (u32)parcel[0] | (u32)parcel[1] << 16;
+	return (u32)get_u16(parcel+0) | (u32)get_u16(parcel+1) << 16;
 }
 
 static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
@@ -83,6 +88,8 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
 	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
 
 	/* patch the call place again */
+	call[0] = cpu_to_le32(call[0]);
+	call[1] = cpu_to_le32(call[1]);
 	patch_text_nosync(ptr, call, sizeof(u32) * 2);
 }
 
@@ -98,6 +105,7 @@ static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
 	riscv_insn_insert_jtype_imm(&jal_insn, imm);
 
 	/* patch the call place again */
+	jal_insn = cpu_to_le32(jal_insn);
 	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
 }
 
diff --git a/arch/riscv/kernel/cfi.c b/arch/riscv/kernel/cfi.c
index 64bdd3e1ab8c..bd35ddbcbcee 100644
--- a/arch/riscv/kernel/cfi.c
+++ b/arch/riscv/kernel/cfi.c
@@ -37,15 +37,16 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	 */
 	if (get_kernel_nofault(insn, (void *)regs->epc - 4))
 		return false;
+	insn = le32_to_cpu(insn);
 	if (!riscv_insn_is_beq(insn))
 		return false;
-
 	*type = (u32)regs_ptr[RV_EXTRACT_RS1_REG(insn)];
 
 	if (get_kernel_nofault(insn, (void *)regs->epc) ||
 	    get_kernel_nofault(insn, (void *)regs->epc + GET_INSN_LENGTH(insn)))
 		return false;
 
+	insn = le32_to_cpu(insn);
 	if (riscv_insn_is_jalr(insn))
 		rs1_num = RV_EXTRACT_RS1_REG(insn);
 	else if (riscv_insn_is_c_jalr(insn))
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 11ad789c60c6..e8a9301ec0bf 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -19,7 +19,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 				     enum jump_label_type type)
 {
 	void *addr = (void *)jump_entry_code(entry);
-	u32 insn;
+	__le32 insn;
 
 	if (type == JUMP_LABEL_JMP) {
 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
@@ -36,6 +36,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 		insn = RISCV_INSN_NOP;
 	}
 
+	insn = cpu_to_le32(insn);
 	mutex_lock(&text_mutex);
 	patch_insn_write(addr, &insn, sizeof(insn));
 	mutex_unlock(&text_mutex);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..a475fd9310fd 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -253,6 +253,7 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
 
+	insn = le32_to_cpu(insn);
 	return GET_INSN_LENGTH(insn);
 }
 
@@ -399,6 +400,7 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
+	insn = cpu_to_le32(insn);
 	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
 		return (insn == __BUG_INSN_32);
 	else
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 1b9867136b61..21b2a4df185f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -290,6 +290,7 @@ static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
 		 * below with the upper 16 bits half.
 		 */
 		insn &= GENMASK(15, 0);
+		insn = le16_to_cpu(insn);
 		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
 			*r_insn = insn;
 			return 0;
@@ -297,12 +298,14 @@ static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
 		epc += sizeof(u16);
 		if (__read_insn(regs, tmp, epc, u16))
 			return -EFAULT;
+		tmp = le16_to_cpu(tmp);
 		*r_insn = (tmp << 16) | insn;
 
 		return 0;
 	} else {
 		if (__read_insn(regs, insn, epc, u32))
 			return -EFAULT;
+		insn = le32_to_cpu(insn);
 		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
 			*r_insn = insn;
 			return 0;
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
