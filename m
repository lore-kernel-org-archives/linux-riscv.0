Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30961C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a31PTAYz5tNvNi7+mO3x8aOE/F4USM5WduNBNBVMt6I=; b=JJtvi4NPWsaDeN
	xeOFxQuC5DbD3NotNjjNbV1NpqnV5a0u2iP37LasMVnXHDNmzmpEjtAlSyvGsBgfO+K8I1SaHMsBV
	/lvtDIpfau+dQfeTuA7NnZgYtyn6oAJmerlZCfSmZYKAl9rUwr8aW3qLmqK8KTGN3cv5Muk+d0YM4
	P5NvO6W+xxlMki5qHTn2goarg7/x+5guT4EMXD+mJ0Gi1jzTmMDfArby9Ii/LOL0ue43LWe3a9/og
	c9J1nnhb+/FWIJapKVVXiE5b8+vIxT8VNmg1h6f9z+0cRA23aLywakNTr8f96nkVNNEvIezYkcz1y
	ATKJ2WJA7lbug0aWDBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Le-0012rI-DU; Sat, 24 Dec 2022 15:22:06 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p92wO-00H5uh-JP
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 11:43:55 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-03 (Coremail) with SMTP id rQCowABXXpbf5aZj9dVkCA--.18955S12;
	Sat, 24 Dec 2022 19:43:29 +0800 (CST)
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
Subject: [PATCH v5 8/9] riscv/kprobe: Patch AUIPC/JALR pair to optimize kprobe
Date: Sat, 24 Dec 2022 19:43:14 +0800
Message-Id: <20221224114315.850130-9-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXXpbf5aZj9dVkCA--.18955S12
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW8JrW7Xw4ruF4fWr18uFg_yoW7CryrpF
	s8GwnxJrWYkFn2grZxAws5ur1rKwsYyay3K3yDGrWfArsrJrs8Wwnakwn8Zr15GF1Fgr13
	ArnYkryruay7JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
	6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4
	xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20V
	AGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeSoGDUUUU
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCQMKE2OmnPBm9AAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_034349_183482_D8BE3DB2 
X-CRM114-Status: GOOD (  14.65  )
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

The patch optimize 'EBREAK' with 'AUIPC/JALR', introduce new patching
function to modify multiple instructions.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
---
 arch/riscv/include/asm/patch.h |  1 +
 arch/riscv/kernel/patch.c      | 23 ++++++++++---
 arch/riscv/kernel/probes/opt.c | 63 ++++++++++++++++++++++++++++++++--
 3 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9a7d7346001e..ee31539de65f 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -8,5 +8,6 @@
 
 int patch_text_nosync(void *addr, const void *insns, size_t len);
 int patch_text(void *addr, u32 insn);
+int patch_text_batch(void *addr, const void *insn, size_t size);
 
 #endif /* _ASM_RISCV_PATCH_H */
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..ce324b6a6998 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -15,7 +15,8 @@
 
 struct patch_insn {
 	void *addr;
-	u32 insn;
+	const void *insn;
+	size_t size;
 	atomic_t cpu_count;
 };
 
@@ -106,8 +107,7 @@ static int patch_text_cb(void *data)
 
 	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		ret =
-		    patch_text_nosync(patch->addr, &patch->insn,
-					    GET_INSN_LENGTH(patch->insn));
+		    patch_text_nosync(patch->addr, patch->insn, patch->size);
 		atomic_inc(&patch->cpu_count);
 	} else {
 		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
@@ -123,7 +123,8 @@ int patch_text(void *addr, u32 insn)
 {
 	struct patch_insn patch = {
 		.addr = addr,
-		.insn = insn,
+		.insn = &insn,
+		.size = GET_INSN_LENGTH(insn),
 		.cpu_count = ATOMIC_INIT(0),
 	};
 
@@ -131,3 +132,17 @@ int patch_text(void *addr, u32 insn)
 				       &patch, cpu_online_mask);
 }
 NOKPROBE_SYMBOL(patch_text);
+
+int patch_text_batch(void *addr, const void *insn, size_t size)
+{
+	struct patch_insn patch = {
+		.addr = addr,
+		.insn = insn,
+		.size = size,
+		.cpu_count = ATOMIC_INIT(0),
+	};
+
+	return stop_machine_cpuslocked(patch_text_cb, &patch, cpu_online_mask);
+}
+
+NOKPROBE_SYMBOL(patch_text_batch);
diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
index bc232fce5b39..1c0e9d218f6f 100644
--- a/arch/riscv/kernel/probes/opt.c
+++ b/arch/riscv/kernel/probes/opt.c
@@ -448,11 +448,19 @@ static bool can_optimize(unsigned long paddr, struct optimized_kprobe *op)
 
 int arch_prepared_optinsn(struct arch_optimized_insn *optinsn)
 {
-	return 0;
+	return optinsn->length;
 }
 
 int arch_check_optimized_kprobe(struct optimized_kprobe *op)
 {
+	unsigned long i;
+	struct kprobe *p;
+
+	for (i = RVC_INSN_LEN; i < op->optinsn.length; i += RVC_INSN_LEN) {
+		p = get_kprobe(op->kp.addr + i);
+		if (p && !kprobe_disabled(p))
+			return -EEXIST;
+	}
 	return 0;
 }
 
@@ -521,23 +529,74 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op,
 
 void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 {
+	if (op->optinsn.insn) {
+		free_optinsn_slot(op->optinsn.insn, 1);
+		op->optinsn.insn = NULL;
+		op->optinsn.length = 0;
+	}
 }
 
 void arch_optimize_kprobes(struct list_head *oplist)
 {
+	long offs;
+	kprobe_opcode_t insn[3];
+	struct optimized_kprobe *op, *tmp;
+
+	list_for_each_entry_safe(op, tmp, oplist, list) {
+		WARN_ON(kprobe_disabled(&op->kp));
+
+		/* Backup instructions which will be replaced by jump address */
+		memcpy(op->optinsn.copied_insn,
+		       DETOUR_ADDR(op->kp.addr, GET_INSN_LENGTH(op->kp.opcode)),
+		       op->optinsn.length - GET_INSN_LENGTH(op->kp.opcode));
+
+		/*
+		 * After patch, it should be:
+		 * auipc free_register, %hi(detour_buffer)
+		 * jalr free_register, free_register, %lo(detour_buffer)
+		 * where free_register will eventually save the return address
+		 */
+		offs = (unsigned long)op->optinsn.insn -
+		       (unsigned long)op->kp.addr;
+		insn[0] = rv_auipc(op->optinsn.rd, (offs + (1 << 11)) >> 12);
+		insn[1] = rv_jalr(op->optinsn.rd, op->optinsn.rd, offs & 0xFFF);
+		/* For 3 RVC + 1 RVI scenario, need C.NOP for padding */
+		if (op->optinsn.length > 2 * RVI_INSN_LEN)
+			insn[2] = rvc_addi(0, 0);
+
+		patch_text_batch(op->kp.addr, insn, op->optinsn.length);
+		if (memcmp(op->kp.addr, insn, op->optinsn.length))
+			continue;
+
+		list_del_init(&op->list);
+	}
 }
 
 void arch_unoptimize_kprobes(struct list_head *oplist,
 			     struct list_head *done_list)
 {
+	struct optimized_kprobe *op, *tmp;
+
+	list_for_each_entry_safe(op, tmp, oplist, list) {
+		arch_unoptimize_kprobe(op);
+		list_move(&op->list, done_list);
+	}
 }
 
 void arch_unoptimize_kprobe(struct optimized_kprobe *op)
 {
+	kprobe_opcode_t buf[MAX_COPIED_INSN];
+	unsigned long offset = GET_INSN_LENGTH(op->kp.opcode);
+
+	buf[0] = (offset == RVI_INSN_LEN) ? __BUG_INSN_32 : __BUG_INSN_16;
+	memcpy(DETOUR_ADDR(buf, offset), op->optinsn.copied_insn,
+	       op->optinsn.length - offset);
+	patch_text_batch(op->kp.addr, buf, op->optinsn.length);
 }
 
 int arch_within_optimized_kprobe(struct optimized_kprobe *op,
 				 kprobe_opcode_t *addr)
 {
-	return 0;
+	return (op->kp.addr <= addr &&
+		op->kp.addr + op->optinsn.length > addr);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
