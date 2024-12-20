Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEF7E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pm5r57j6rsYAQw1GodceJfCppPguvIexRBl5L+8ToD0=; b=BrA9gEvHQPyKTe
	Yw7NxX+rK7Q8K5Ges3dxNUUYlwMhDoFrfyOwg5Jn2a5Qnz6WZZUKCCbd/gR72tbQ4Xh6JsAqQ71Rj
	/1cVUBSkJEoFc2aeKpeUvxf8usy3sov5slnpsvIDDxHlwy7Nnk6G+qiF6idEESyOlkzRzTzRDIkP6
	ING5EgbosGZgTq2Ui7qyez3P7B2iQEnBDN67ortvbkXlxnquQQE9t9QYQnWmg1oPpc9FoC8XCJSxK
	Tfaw1o+maUsc6hHXX5GV8bkcc1RgwRHxGCa9tZrYY3Ab1183U8XHVAzrl6b71vIjV+zADY4AOEj4P
	AZuZZpGpKwkmy0ZfhTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOU-00000005O6w-2WLX;
	Fri, 20 Dec 2024 15:58:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOT-00000005O4N-0Dkg
	for linux-riscv@bombadil.infradead.org;
	Fri, 20 Dec 2024 15:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zPhaTsY4qCL9woinVqGvqyBBtfuDqS0FIL6nGwEOfcA=; b=ZOEF8RcDnIhKvRgAwXOAo8AJK4
	aDDDqf4tMbHLbbtf+lA5xgH5wixdetKvP+lDmj4CFBmMTjG9DMeBoZUS4l82c9QcmlgCaRx4jqtuP
	R0uBGkyleEeFZpbM2CRSMRg5GEgoL0AtquzBHLh8Q1wy0S7JFb8z4bXNdhnfcbJvNRxiePCpMrLCE
	0cQMcJEZEY/p/nhKE9MGBWwkhXmQb1HiH8R7mHTL1UK4iPpjXwn2+9kEdfA47KfVuyyNR3B0FnW7n
	chk+YOyj+5SgeOpTGiXZY6wyZjSPC14UOyfsTXGGSNBaQUc4fRvgvBbkqOjvyDdGZ2uFOZA//CpLK
	H04AU5UA==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOP-00000001Urf-4462
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zPhaTsY4qCL9woinVqGvqyBBtfuDqS0FIL6nGwEOfcA=; b=n2/AIh7xFYFviRyoRSt4fvi2IB
	gxeNj2wRODlsIVN6HP9KD2/f2/qIM0BJeqo0wtu8zmF56tIqfmx+ZLBcz6CHXjuWMBs05P8EbzaSe
	b6f8Y56gTpf0Fb1hwM/AfVwmWzkGOv5tonSMsIbM6uWTpbaq1fc8+2czGaosLygEZvSAx+6mEzNqr
	4w/Dqa6regrv9X4YzH0NJGmCn9GxjcVOCYKm01I5+qgKr6Gt6U/91a+O6HhwkwFRj/MvIHpeQoIL0
	3ap7e3CgBnrXdHiwJM/xmnYnD8WI8M9NK4H2qBnPXC3uyFmBNHu8ysOS0Z8IO9pYajyUdPg9VUwIu
	zF2zAymQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAR-5A; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LTK-3nAj;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 13/15] riscv: probes: sort out endian-ness
Date: Fri, 20 Dec 2024 15:57:59 +0000
Message-Id: <20241220155801.1988785-14-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_155822_294642_25B6216E 
X-CRM114-Status: GOOD (  13.18  )
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
index 474a65213657..aba684938284 100644
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
-	patch_text_nosync(p->ainsn.api.insn + len, &insn, GET_INSN_LENGTH(insn));
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
index 4b3dc8beaf77..e31c1dd337d5 100644
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
@@ -172,8 +172,8 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 
 	/* Add ebreak behind opcode to simulate singlestep */
 	if (vaddr) {
-		dst += GET_INSN_LENGTH(*(probe_opcode_t *)src);
-		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
+		dst += read_insn_length(src);
+		*(uprobe_opcode_t *)dst = cpu_to_le32(__BUG_INSN_32);
 	}
 
 	kunmap_atomic(kaddr);
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
