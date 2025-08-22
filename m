Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FA7CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cozYRzq3a2cUVmZc9XLxbNS51u7D+DormXjCXFe12l8=; b=rLeD9ChUW57qFe
	XSI+i3F8q1qqz+V/G30Qxtr4J9+Hy0+0z/3UtHkTKnkOQzDlrvorRVNrA1XarauA7N68A2ZNOw82t
	HD9mtfXjl6wP7O57g03ChT4/njF8mkXQwtlux6du/ePCLJbG0bv338SMLFm2OZxoc/R5EUpwsV8cN
	nnjFiJuKYnQaoi2D5sYqOyPn1adFBrjcctpBD7I3xftocGcHIjcY4asbaaKQMapUMRBFEXKdGm7iu
	u+VIg72vruGeUmyEuLYIrfUVADLadYwRTy0KtAiFu31qOU4Ut4wUVVziAw6OA5a2cjdmkCCtJyuLm
	kIZ+LUGFroaMHhYndH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfC-00000004UQ5-3JZb;
	Sat, 23 Aug 2025 09:35:54 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-00000003CVz-2QNR
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jflgl2BWjMawpc7jlp7bH3VBKxu94oVxg5ytK07njCw=; b=kIVvCrjqmdLHBZYD9nHIJpmbAP
	qZ+lYm+xTn9KWJRhoYu9TXs7cphQ8W7sUIURXIrLQzuMHEbfHNGM0XtqCclLJVZN1TGdpeL0QaIfN
	cjs0JOnZ0dBQImcKcEpaBqDyJ6dit0luF7hJ1Ezo0jaO154QLwJge6BQIOEZLRQhzFlL5nzJFYRml
	WI0w5dNSxZgvyB2w4FEJF/9HFzk/VLMfUw3GDoW3MN73iX9hPxu14Jvbi/P1l/BdD54GZv+eTubbe
	mam0je6DYM5S8v1Dsg621mbG9gKqjuW1pyYwXYKh+ww2H9azTqqmTPYOJ7yAKV966SvOYIXcwgJ08
	vIbznnDQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGt-F6; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPK-2Ncj;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 07/18] riscv: fixup use of natural endian on instructions
Date: Fri, 22 Aug 2025 17:52:37 +0100
Message-Id: <20250822165248.289802-8-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095258_633500_27E61716 
X-CRM114-Status: GOOD (  15.66  )
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
 arch/riscv/kernel/jump_label.c       |  5 ++++-
 arch/riscv/kernel/traps.c            |  2 ++
 arch/riscv/kernel/traps_misaligned.c |  3 +++
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7eb3cb1215c6..059bbd800112 100644
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
index 6ec9dbd7292e..ee633094d855 100644
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
index b4c1a6a3fbd2..ed9bc7f7d319 100644
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
@@ -36,6 +36,9 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 		insn = RISCV_INSN_NOP4;
 	}
 
+
+	insn = cpu_to_le32(insn);
+
 	if (early_boot_irqs_disabled) {
 		riscv_patch_in_stop_machine = 1;
 		patch_insn_write(addr, &insn, sizeof(insn));
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167de..b8b3b6073cf7 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -263,6 +263,7 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
 
+	insn = le32_to_cpu(insn);
 	return GET_INSN_LENGTH(insn);
 }
 
@@ -411,6 +412,7 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
+	insn = cpu_to_le32(insn);
 	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
 		return (insn == __BUG_INSN_32);
 	else
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index f760e4fcc052..f11c14bdf73a 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -299,6 +299,7 @@ static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
 		 * below with the upper 16 bits half.
 		 */
 		insn &= GENMASK(15, 0);
+		insn = le16_to_cpu(insn);
 		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
 			*r_insn = insn;
 			return 0;
@@ -306,12 +307,14 @@ static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
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
