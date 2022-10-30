Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE03FA3740
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcoIANHtzRt7c/Z+JKCzre+eoIwG8X7qPKojpqZexQI=; b=13SIuZ1VKVdVr4
	iNmPTnwHIfacTRMZPzobCxP7dLbp+7mmbSl3OuI1nLV4j9XaZdmI9Und8StpsxKUuqAJBrx+BnZZX
	5s+ur+R3mCqC41mkayvdeSuf/3g/ZFouTCrxUIYTvJJ/vi/4SjyLJThmZNtLeEGHb7bZS+jzRugdi
	2yNfvi03KfqJyfaR85JvjF9gTAGoV388+OhmQCEkEzk72dnP2GEnYpYXiEs4U2bhTltJOH4l+pVJQ
	1iO74Q3F5byEXnnonCK5IObTrU++Cj+VHu/quVKS9BPWDKkCkTAkTNfspFLPNWiMIRFAQ+V6jBCLw
	QO8Z4rIfiIZxQI66Fb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op4DH-00EYCC-7a; Sun, 30 Oct 2022 09:02:39 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op4D3-00EXyR-7X
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 09:02:32 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-03 (Coremail) with SMTP id rQCowABXCVmKPV5jkxYmBw--.33365S10;
	Sun, 30 Oct 2022 17:02:18 +0800 (CST)
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
Subject: [PATCH 6/8] riscv/kprobe: Add code to check if kprobe can be optimized
Date: Sun, 30 Oct 2022 17:01:39 +0800
Message-Id: <20221030090141.2550837-7-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030090141.2550837-1-chenguokai17@mails.ucas.ac.cn>
References: <20221030090141.2550837-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXCVmKPV5jkxYmBw--.33365S10
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1UGryUAFyrCFy3GF47XFb_yoW7Jw1kpF
	s5Ca4YqrWrJFZagrWfAws5Jr4Syws5Gr48trW7K34Fvw12qr9Igan7Kr4avFnxGF409r17
	AF40yry8uFW3ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I64
	8v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUzv3nUUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCgUPE2NeGqorWQAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_020225_684604_49B23823 
X-CRM114-Status: GOOD (  20.17  )
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

This patch adds code to check if kprobe can be optimized, regular kprobe
replaces single instruction with EBREAK or C.EBREAK, it just requires
the instrumented instruction to support execute out-of-line or simulation,
while optimized kprobe patch AUIPC/JALR pair to do a long jump, it makes
everything more compilated, espeically for kernel that is a hybrid RVI and
RVC binary, although AUIPC/JALR just need 8 bytes space, the bytes to
patch are 10 bytes long at worst case to ensure no RVI would be
truncated, so there are four methods to patch optimized kprobe.

  - Replace 2 RVI with AUIPC/JALR.
  - Replace 4 RVC with AUIPC/JALR.
  - Replace 2 RVC and 1 RVI with AUIPC/JALR.
  - Replace 3 RVC and 1 RVI with AUIPC/JALR, and patch C.NOP into last
    two bytes for alignment.

So it has to find out a instruction window large enough to patch
AUIPC/JALR from the address instrumented breakpoint, meanwhile, ensure
no instruction has chance to jump into the range of patched window.

Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/kernel/probes/opt.c | 99 ++++++++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
index 6d23c843832e..876bec539554 100644
--- a/arch/riscv/kernel/probes/opt.c
+++ b/arch/riscv/kernel/probes/opt.c
@@ -271,15 +271,103 @@ static void find_free_registers(struct kprobe *kp, struct optimized_kprobe *op,
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
+			target = addr + offset;
+		return (target >= start) && (target < end);
+	}
+#endif
+
+	if (riscv_insn_is_branch(insn))
+		target = addr + rvi_branch_imme(insn);
+	else if (riscv_insn_is_jal(insn))
+		target = addr + rvi_jal_imme(insn);
+	else
+		target = addr + offset;
+	return (target >= start) && (target < end);
+}
+
+static int search_copied_insn(unsigned long paddr, struct optimized_kprobe *op)
+{
+	int i =  1;
+	unsigned long offset = GET_INSN_LENGTH(*(kprobe_opcode_t *)paddr);
+
+	while ((i++ < MAX_COPIED_INSN) && (offset < 2 * RVI_INSN_LEN)) {
+		if (riscv_probe_decode_insn((probe_opcode_t *)paddr + offset,
+					    NULL) != INSN_GOOD)
+			return -1;
+		offset += GET_INSN_LENGTH(*(kprobe_opcode_t *)(paddr + offset));
+	}
+
+	op->optinsn.length = offset;
+	return 0;
+}
+
 /*
- * If two free registers can be found at the beginning of both
- * the start and the end of replaced code, it can be optimized
- * Also, in-function jumps need to be checked to make sure that
- * there is no jump to the second instruction to be replaced
+ * The kprobe can be optimized when no in-function jump reaches to the
+ * instructions replaced by optimized jump instructions(AUIPC/JALR).
  */
 static bool can_optimize(unsigned long paddr, struct optimized_kprobe *op)
 {
-	return false;
+	int ret;
+	unsigned long addr, size = 0, offset = 0;
+	struct kprobe *kp = get_kprobe((kprobe_opcode_t *)paddr);
+
+	/*
+	 * Skip optimization if kprobe has been disarmed or instrumented
+	 * instruction support XOI.
+	 */
+	if (!kp || (riscv_probe_decode_insn(&kp->opcode, NULL) != INSN_GOOD))
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
