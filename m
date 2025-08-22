Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE1CCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CD+O+7Y8cxv7+/G/8FLDF5eXC12w/peCClun5cQQjo=; b=mFg5jfYwjqc/T9
	DEoduBJmFvlyFv3iaXf3HxTHYwypVgYqswSwC1WxhCBfk3wiUvrWEua5+bv01AVD3iXLqin7R190R
	KyPC3kFiwEf9/WAbQSx8c77apD4bSNQ93xwWOZDWBIBaSZaykyW8J79Z584/yOdyenuLiuj/a7+Ch
	VrQEAeT4P5Mxcq21LbdxSmi4NgmdF0Zh+h6nnXjhNrZX7uiPK5ELvtKeTAxMXx0SWSk/gNPINZXpm
	g6cskAZ3O2AVLykn3rpozesoPVONbJvXqYJnCDerPAE+enne5nGNZAWR0ubH8XZujXqx5DXozZK8k
	nuRMpBc/2nT7q1kXR/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvi-00000004CFL-1UHL;
	Sat, 23 Aug 2025 06:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0i-00000003CaW-2jnL
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=lrSCzfgczj5MZw3cm3k/lY2WMSNCfmhjWZKP/WXKXhE=; b=b6hWPga6q2xDasxpU0ItL1LDl2
	UxNBE4xLAzE6Of9BotoowwncvC5rk598WOO0GvcpfBnuChs9DaOeDBSiE1t+hhmTS3UBZJPFTWb2+
	dMRNDVe0dICdSaHbdV3xkSlV1kPocG8c82kReKx8duudlVZl0weNryf6sWZMqfBHoVuu+FV2QaniF
	NQm11DRX/UbwuMkpZalHijwiCrtEzHjrMXgi8RVrrvjKZrryBRT/YrLLpv7UKAPMIg69noovvE87V
	zPyRmhV7kMXr6LLpEcutBsjbHC8noDZkm9SZRMA+4BElxijAMuF/7cOw4QdkSP45vji3/4mY0aPra
	vuzXBxzw==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s5-027p
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lrSCzfgczj5MZw3cm3k/lY2WMSNCfmhjWZKP/WXKXhE=; b=LT21jQkiF1VCFUO8NXszJXtOn9
	AV9wJ3ou98w5SfOJ9qsM5a6tCdJPir+yJA+A8B9H4XO7TgckXncKO6xvkyBsmpTicX61dPjHy9d4G
	WF85YfUyrYObAmuSfMuR+C2bpc9lyMWHHNETPqvQ6atPaIOrHViKiswR2as05IODGCUkMPN4HM7p5
	R3W+3FMoN/MSULTjWpSfuAhZ83CMPBNFUceB/a7zYqngESavoyUYaL1882tI5qcEtzaEZYAQQyY66
	ldwcfutdqqTiDDCAWrOCsV7PWN7CZ8LTELAk7DPIdW2UwfxAvG/V24bYmx97oWsWtZGvUB34haFYC
	RpXKwoPg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0T-0015cm-Ub; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPS-2ark;
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
Subject: [PATCH 09/18] riscv: probes: sort out endian-ness
Date: Fri, 22 Aug 2025 17:52:39 +0100
Message-Id: <20250822165248.289802-10-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_273402_67F41614 
X-CRM114-Status: GOOD (  14.22  )
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

Updated {k,u}probe code to deal with big endian mode where
the instruction stream is always in little endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/probes/decode-insn.c |  2 +-
 arch/riscv/kernel/probes/decode-insn.h |  5 +++++
 arch/riscv/kernel/probes/kprobes.c     | 30 ++++++++++++++++----------
 arch/riscv/kernel/probes/uprobes.c     | 10 ++++-----
 4 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bfb9f..5f30c10f7d8d 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -16,7 +16,7 @@
 enum probe_insn __kprobes
 riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 {
-	probe_opcode_t insn = *addr;
+	probe_opcode_t insn = le32_to_cpu(*addr);
 
 	/*
 	 * Reject instructions list:
diff --git a/arch/riscv/kernel/probes/decode-insn.h b/arch/riscv/kernel/probes/decode-insn.h
index 42269a7d676d..0515deb204b5 100644
--- a/arch/riscv/kernel/probes/decode-insn.h
+++ b/arch/riscv/kernel/probes/decode-insn.h
@@ -15,4 +15,9 @@ enum probe_insn {
 enum probe_insn __kprobes
 riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *asi);
 
+static inline int read_insn_length(void *ptr)
+{
+	return GET_INSN_LENGTH(le16_to_cpu(*(__le16 *)ptr));
+}
+
 #endif /* _RISCV_KERNEL_KPROBES_DECODE_INSN_H */
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index c0738d6c6498..9d496b15d18d 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -24,13 +24,13 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
-	size_t len = GET_INSN_LENGTH(p->opcode);
-	u32 insn = __BUG_INSN_32;
+	size_t len = read_insn_length(&p->opcode);
+	u32 insn = cpu_to_le32(__BUG_INSN_32);
 
 	p->ainsn.api.restore = (unsigned long)p->addr + len;
 
 	patch_text_nosync(p->ainsn.api.insn, &p->opcode, len);
-	patch_text_nosync((void *)p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
+	patch_text_nosync((void *)p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(__BUG_INSN_32));
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
@@ -58,7 +58,7 @@ static bool __kprobes arch_check_kprobe(struct kprobe *p)
 		if (tmp == addr)
 			return true;
 
-		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+		tmp += read_insn_length((u16 *)tmp);
 	}
 
 	return false;
@@ -75,9 +75,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 		return -EILSEQ;
 
 	/* copy instruction */
-	p->opcode = (kprobe_opcode_t)(*insn++);
-	if (GET_INSN_LENGTH(p->opcode) == 4)
-		p->opcode |= (kprobe_opcode_t)(*insn) << 16;
+	*((u16 *)&p->opcode) = (*insn++);
+	if (read_insn_length(&p->opcode) == 4)
+		p->opcode = (kprobe_opcode_t)(*(u32 *)p->addr);
 
 	/* decode instruction */
 	switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
@@ -107,16 +107,24 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
-	size_t len = GET_INSN_LENGTH(p->opcode);
-	u32 insn = len == 4 ? __BUG_INSN_32 : __BUG_INSN_16;
+	size_t len = read_insn_length(&p->opcode);
+	u32 insn;
+
+	if (len == 4)
+		insn = cpu_to_le32(__BUG_INSN_32);
+	else {
+		insn = cpu_to_le16(__BUG_INSN_16);
+		insn |= cpu_to_le16(__BUG_INSN_16) << 16;
+	}
 
+	pr_info("%s: patching %px (%d bytes)\n", __func__, p->addr, (int)len);
 	patch_text(p->addr, &insn, len);
 }
 
 /* remove breakpoint from text */
 void __kprobes arch_disarm_kprobe(struct kprobe *p)
 {
-	size_t len = GET_INSN_LENGTH(p->opcode);
+	size_t len = read_insn_length(&p->opcode);
 
 	patch_text(p->addr, &p->opcode, len);
 }
@@ -336,7 +344,7 @@ kprobe_single_step_handler(struct pt_regs *regs)
 	struct kprobe *cur = kprobe_running();
 
 	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
-	    ((unsigned long)&cur->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode) == addr)) {
+	    ((unsigned long)&cur->ainsn.api.insn[0] + read_insn_length(&cur->opcode) == addr)) {
 		kprobes_restore_local_irqflag(kcb, regs);
 		post_kprobe_handler(cur, kcb, regs);
 		return true;
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index cc15f7ca6cc1..ffdda8771380 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -12,9 +12,9 @@
 bool is_swbp_insn(uprobe_opcode_t *insn)
 {
 #ifdef CONFIG_RISCV_ISA_C
-	return (*insn & 0xffff) == UPROBE_SWBP_INSN;
+	return (*(u16 *)insn) == cpu_to_le16(UPROBE_SWBP_INSN);
 #else
-	return *insn == UPROBE_SWBP_INSN;
+	return *insn == cpu_to_le32(UPROBE_SWBP_INSN);
 #endif
 }
 
@@ -35,7 +35,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 
 	opcode = *(probe_opcode_t *)(&auprobe->insn[0]);
 
-	auprobe->insn_size = GET_INSN_LENGTH(opcode);
+	auprobe->insn_size = GET_INSN_LENGTH(le32_to_cpu(opcode));
 
 	switch (riscv_probe_decode_insn(&opcode, &auprobe->api)) {
 	case INSN_REJECTED:
@@ -173,8 +173,8 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 
 	/* Add ebreak behind opcode to simulate singlestep */
 	if (vaddr) {
-		dst += GET_INSN_LENGTH(*(probe_opcode_t *)src);
-		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
+		dst += read_insn_length(src);
+		*(uprobe_opcode_t *)dst = cpu_to_le32(__BUG_INSN_32);
 	}
 
 	flush_icache_range(start, start + len);
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
