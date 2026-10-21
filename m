Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EA0606A31B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=duB6BCtJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MHpgtJe4SzJne40vGXSm+Q1t4kFefZeo0ug1j0crUv4=; b=duB6BCtJBfJX1L
	nw2+d7+z2RYWDTbAijR/iR9nj9i1GAb62zKj474szRfWpEgR/jSwm5lN0AOnZttINM13q1dUAX4Aj
	m/R40iuJROs4EWDx3bmKFraucAmU3TtfxZOdugYfyEaOxh8SDWHBY3Hy1f3pKyHpi4NaLRr4XyD9Z
	BYJqybyjgoshlAsZzJ3s54xYrJiuWunqDoe8OMncxAGkXchLlRDrg9XCsMkpsQuS6o2RZBgHzXN60
	yQM7AGENo+Qwim6fQdyN/fcePW+6WM+6MdseaFanqRrA+UP3BLRJMxJyiGZ5Z3BeWP4ZUh1KBJAOG
	rQstylQHopc0zZPYYEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT8N-0000000BYbU-0kuo;
	Wed, 21 Oct 2026 10:01:23 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT8I-0000000BYZp-0RrW
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 10:01:22 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgAnuW1ajdhqg4mHAA--.45461S2;
	Wed, 21 Oct 2026 18:00:59 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH] riscv: kprobes: decode instruction from copied opcode
Date: Wed, 21 Oct 2026 18:00:58 +0800
Message-Id: <20261021100058.322-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgAnuW1ajdhqg4mHAA--.45461S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW7tr4kWw4kXw1xCw1rWFg_yoWrur47pa
	n0kw4Yqr45J3WIkrZ7Jrs5W348t395Gw42gr1DXFW3A3y7Xr15Xw1xKr4aqrn0yrs0gr15
	uw45AryFvayxJrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEHE2rXl7QlSQAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_030118_317284_7167D5E2 
X-CRM114-Status: GOOD (  13.43  )
X-Spam-Score: -2.6 (--)
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

riscv_probe_decode_insn() reads the probed instruction with a raw
32-bit load:

	probe_opcode_t insn = *addr;

If the instruction is compressed and sits in the last two bytes of a
module text page, this load crosses into the following vmalloc guard
page and faults.  arch_prepare_kprobe() already copies the instruction
in two 16-bit steps into p->opcode, so pass that value by value instead
of reading the probed address again.

Do the same in arch_uprobe_analyze_insn() and arch_uprobe_skip_sstep(),
which still read auprobe->insn[] with a raw 32-bit load, for
consistency with arch_prepare_kprobe().

Link: https://lore.kernel.org/all/undine-1792411157938575056-598130d3332901bd@undined.local
Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
 arch/riscv/kernel/probes/decode-insn.c |  4 +---
 arch/riscv/kernel/probes/decode-insn.h |  2 +-
 arch/riscv/kernel/probes/kprobes.c     |  2 +-
 arch/riscv/kernel/probes/uprobes.c     | 11 ++++++++---
 4 files changed, 11 insertions(+), 8 deletions(-)

Tested on QEMU riscv64: the in-tree kprobes KUnit tests pass, and a
userspace uprobe smoke test (compressed c.j and 32-bit jal probe sites)
exercises arch_uprobe_analyze_insn() and arch_uprobe_skip_sstep() with
the new two-step 16-bit reads.  The cross-page fault cannot be
reproduced in QEMU (it needs a module text page of size % 4096 == 4094),
so it is argued statically and confirmed by disassembly that the raw
load is gone.

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 433d9035b..4a298de88 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -14,10 +14,8 @@
  *   INSN_GOOD_NO_SLOT If instruction is supported but doesn't use its slot.
  */
 enum probe_insn __kprobes
-riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
+riscv_probe_decode_insn(probe_opcode_t insn, struct arch_probe_insn *api)
 {
-	probe_opcode_t insn = *addr;
-
 	/*
 	 * Reject instructions list:
 	 */
diff --git a/arch/riscv/kernel/probes/decode-insn.h b/arch/riscv/kernel/probes/decode-insn.h
index 42269a7d6..0064bc76e 100644
--- a/arch/riscv/kernel/probes/decode-insn.h
+++ b/arch/riscv/kernel/probes/decode-insn.h
@@ -13,6 +13,6 @@ enum probe_insn {
 };
 
 enum probe_insn __kprobes
-riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *asi);
+riscv_probe_decode_insn(probe_opcode_t insn, struct arch_probe_insn *asi);
 
 #endif /* _RISCV_KERNEL_KPROBES_DECODE_INSN_H */
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 9e2afabf9..d9274b530 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -85,7 +85,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 		p->opcode |= (kprobe_opcode_t)(*insn) << 16;
 
 	/* decode instruction */
-	switch (riscv_probe_decode_insn(p->addr, &p->ainsn.api)) {
+	switch (riscv_probe_decode_insn(p->opcode, &p->ainsn.api)) {
 	case INSN_REJECTED:	/* insn not supported */
 		return -EINVAL;
 
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index eb177d0ce..8c003b7de 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -32,12 +32,15 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 			     unsigned long addr)
 {
 	probe_opcode_t opcode;
+	u16 *insn = (u16 *)&auprobe->insn[0];
 
-	opcode = *(probe_opcode_t *)(&auprobe->insn[0]);
+	opcode = (probe_opcode_t)(*insn++);
+	if (GET_INSN_LENGTH(opcode) == 4)
+		opcode |= (probe_opcode_t)(*insn) << 16;
 
 	auprobe->insn_size = GET_INSN_LENGTH(opcode);
 
-	switch (riscv_probe_decode_insn(&opcode, &auprobe->api)) {
+	switch (riscv_probe_decode_insn(opcode, &auprobe->api)) {
 	case INSN_REJECTED:
 		return -EINVAL;
 
@@ -96,7 +99,9 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	if (!auprobe->simulate)
 		return false;
 
-	insn = *(probe_opcode_t *)(&auprobe->insn[0]);
+	insn = (probe_opcode_t)(*(u16 *)&auprobe->insn[0]);
+	if (auprobe->insn_size == 4)
+		insn |= (probe_opcode_t)(*(u16 *)&auprobe->insn[2]) << 16;
 	addr = instruction_pointer(regs);
 
 	if (auprobe->api.handler)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
