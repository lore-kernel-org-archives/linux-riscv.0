Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE3CC38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YOixJ6ToahLy/cDXXCgeES5TP43rRpXxL8CeZha0AM=; b=XE6g2f+BHiU/PU
	XkQbSUeipBOCLKzJqKuWp/3FCt1L3Pd1A5LfvXArGxPYz31qdjLnxj6zxAYHXrGiaRqtcukC52Vj6
	0IG22LEF4pzUmvfWjAGtNmrY0IKbYWK0yRXYPO281HOn0CGbqAO5BoMgH41Way7DV6bpJtO9z5ZeY
	cfnlGWWTktuj40JcnCem7EKHrIjWXI5jL9mrR8SLXepJZv/Uj365Neun+5llykIbGyWd8te995tZi
	ueYBh+NF+s2VSLZV0UVyEuQwvIq2LtGV/C9jLxnMfTKgS4T8UDe6kAENIRgm8t5ZneX7s98lE4wQM
	4G1MDjiimVU8tdMe7ccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOph-00F11a-4D; Fri, 27 Jan 2023 13:31:57 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOR0-00Ery3-DO
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:06:32 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S10;
	Fri, 27 Jan 2023 21:06:10 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com,
	Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: [PATCH v6 06/13] riscv/kprobe: Add code to check if kprobe can be optimized
Date: Fri, 27 Jan 2023 21:05:34 +0800
Message-Id: <20230127130541.1250865-7-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S10
X-Coremail-Antispam: 1UD129KBjvJXoWxGr47Jw1rKFyUuw4kuF48Zwb_yoWrur1fpF
	s0ka4YqrWrJFZagrZayrs8Ar1ftws5Gr4xtFW7KrySyw12qr90gan2kr4YvwnxGF4F9r17
	AF40yry5ur43ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFc
	xC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_
	Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2
	IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjTmh7UUUUU==
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCgUEE2PTtMIZwAADsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050626_943980_49D7B79F 
X-CRM114-Status: GOOD (  15.18  )
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

From: Liao Chang <liaochang1@huawei.com>

For the RVI and RVC hybrid encoding kernel, although AUIPC/JALR just
occupy 8 bytes space, the patched code is 10 bytes at the worst case
to ensure no RVI is truncated, so to check if kprobe satisfies the
requirement of jump optimization, it has to find out an instruction
window large enough to patch AUIPC/JALR(and padding C.NOP), and ensure
no instruction nearby jumps into the patching window.

Besides that, this series does not support the simulation of pc-relative
instruction in optprobe handler yet, so the patching window should not
includes pc-relative instruction.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
---
 arch/riscv/kernel/probes/opt.c | 94 +++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
index d38ed1a52c93..d84aa1420fa2 100644
--- a/arch/riscv/kernel/probes/opt.c
+++ b/arch/riscv/kernel/probes/opt.c
@@ -269,6 +269,50 @@ static void find_free_registers(struct kprobe *kp, struct optimized_kprobe *op,
 	*ra = (kw == 1UL) ? 0 : __builtin_ctzl(kw & ~1UL);
 }
 
+static bool insn_jump_into_range(unsigned long addr, unsigned long start,
+				 unsigned long end)
+{
+	kprobe_opcode_t insn = *(kprobe_opcode_t *)addr;
+	unsigned long target, offset = GET_INSN_LENGTH(insn);
+
+#ifdef CONFIG_RISCV_ISA_C
+	if (offset == RVC_INSN_LEN) {
+		if (riscv_insn_is_c_beqz(insn) || riscv_insn_is_c_bnez(insn))
+			target = addr + rvc_branch_imme(insn);
+		else if (riscv_insn_is_c_jal(insn) || riscv_insn_is_c_j(insn))
+			target = addr + rvc_jal_imme(insn);
+		else
+			target = 0;
+		return (target >= start) && (target < end);
+	}
+#endif
+
+	if (riscv_insn_is_branch(insn))
+		target = addr + rvi_branch_imme(insn);
+	else if (riscv_insn_is_jal(insn))
+		target = addr + rvi_jal_imme(insn);
+	else
+		target = 0;
+	return (target >= start) && (target < end);
+}
+
+static int search_copied_insn(unsigned long paddr, struct optimized_kprobe *op)
+{
+	int i =  1;
+	struct arch_probe_insn api;
+	unsigned long offset = GET_INSN_LENGTH(*(kprobe_opcode_t *)paddr);
+
+	while ((i++ < MAX_COPIED_INSN) && (offset < 2 * RVI_INSN_LEN)) {
+		if (riscv_probe_decode_insn((kprobe_opcode_t *)(paddr + offset),
+					    &api) != INSN_GOOD)
+			return -1;
+		offset += GET_INSN_LENGTH(*(kprobe_opcode_t *)(paddr + offset));
+	}
+
+	op->optinsn.length = offset;
+	return 0;
+}
+
 /*
  * The kprobe based on breakpoint just requires the instrumented instruction
  * supports execute out-of-line or simulation, besides that, optimized kprobe
@@ -276,7 +320,55 @@ static void find_free_registers(struct kprobe *kp, struct optimized_kprobe *op,
  */
 static bool can_optimize(unsigned long paddr, struct optimized_kprobe *op)
 {
-	return false;
+	int ret;
+	struct arch_probe_insn api;
+	unsigned long addr, size = 0, offset = 0;
+	struct kprobe *kp = get_kprobe((kprobe_opcode_t *)paddr);
+
+	/*
+	 * Skip optimization if kprobe has been disarmed or instrumented
+	 * instruction doest not support XOI.
+	 */
+	if (!kp || (riscv_probe_decode_insn(&kp->opcode, &api) != INSN_GOOD))
+		return false;
+
+	/*
+	 * Find a instruction window large enough to contain a pair
+	 * of AUIPC/JALR, and ensure each instruction in this window
+	 * supports XOI.
+	 */
+	ret = search_copied_insn(paddr, op);
+	if (ret)
+		return false;
+
+	if (!kallsyms_lookup_size_offset(paddr, &size, &offset))
+		return false;
+
+	/* Check there is enough space for relative jump(AUIPC/JALR) */
+	if (size - offset <= op->optinsn.length)
+		return false;
+
+	/*
+	 * Decode instructions until function end, check any instruction
+	 * don't jump into the window used to emit optprobe(AUIPC/JALR).
+	 */
+	addr = paddr - offset;
+	while (addr < paddr) {
+		if (insn_jump_into_range(addr, paddr + RVC_INSN_LEN,
+					 paddr + op->optinsn.length))
+			return false;
+		addr += GET_INSN_LENGTH(*(kprobe_opcode_t *)addr);
+	}
+
+	addr = paddr + op->optinsn.length;
+	while (addr < paddr - offset + size) {
+		if (insn_jump_into_range(addr, paddr + RVC_INSN_LEN,
+					 paddr + op->optinsn.length))
+			return false;
+		addr += GET_INSN_LENGTH(*(kprobe_opcode_t *)addr);
+	}
+
+	return true;
 }
 
 int arch_prepared_optinsn(struct arch_optimized_insn *optinsn)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
