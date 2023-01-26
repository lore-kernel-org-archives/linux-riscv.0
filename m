Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61ECC54EED
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+NzMP31eFwjHgJFHZOy0KfQz4pDdafaHo2FLptF8G2Q=; b=tRhcrWXyfTbSfg
	SKp+OaLcpqO5SqKvYaQedder1fpD2ig77dwphfB7D3JGjVYv/sFTB02s3geww1PvME9EkUWEMtHOG
	Jo4RtID7ZA9GkMdNltaxHM6gF0SH39tJ6Xk+o9hce1OA0wP/eJAzyOHf7uUMkl9toKBBBPtmJg+et
	38wOO/8aS0x++B23AMn7uiaTEZ8OLFs+AcvzgxRCoHEpooYmZ6heJ1rPBc/HVJyXt7qCrRm6DhFPh
	nGyisdA1YD6o64PyDzeUKbw8yEQqlP6p2VlzPijg6gI8STKPcaqErJRXuV2jG+tIaZpOigFl/4Atn
	rJb2UDEPKTIyV9MEUelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4vO-00Bhs7-5a; Thu, 26 Jan 2023 16:16:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4vA-00BhoI-M3
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 16:16:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56A1DB81E0C;
	Thu, 26 Jan 2023 16:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0601C433EF;
	Thu, 26 Jan 2023 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674749774;
	bh=kpO4X4ciaqU1KybKz9EuWl1FehzDKISrOewl41Tfjt8=;
	h=From:To:Cc:Subject:Date:From;
	b=Fg25g3sqdtvEn2lld+9h1q7vBOPNK3Mvam7nrVA8Xtph/MQWRPfXM4bSUligYxw2E
	 3D/9zGFB3uONVr+7WEHMcccAq6muVuCtIarbMVFett0G4ME/U6APha1oWyarnFVpUU
	 mTSucSO8aeLCdWPZDHQOaego2FTHkr9QX1aQlzV0sWV9wpgFuBP5seRFx4Mz4FyohC
	 uQbIcYGfCAL5kk55ZLTpPrQMPFNH9sCElbizaRwEkyjp5hQTBV8h61zsE9kfgP9GcQ
	 aD6DOkUnMdPCFFh1i0XvADZmTOq4hdqLpUqeAH0h/T8tJjfrMcli2OH6o7zWkS7/Iz
	 1IUWkTotoUPvQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mhiramat@kernel.org,
	conor.dooley@microchip.com,
	penberg@kernel.org,
	mark.rutland@arm.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Date: Thu, 26 Jan 2023 11:15:59 -0500
Message-Id: <20230126161559.1467374-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_081617_073739_D592EFCF 
X-CRM114-Status: GOOD (  15.11  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The previous implementation was based on the stop_matchine mechanism,
which reduced the speed of arm/disarm_kprobe. Using minimum ebreak
instruction would get accurate atomicity.

This patch removes the patch_text of riscv, which is based on
stop_machine. Then riscv only reserved patch_text_nosync, and developers
need to be more careful in dealing with patch_text atomicity.

When CONFIG_RISCV_ISA_C=n, the ebreak could replace the whole
instruction. When CONFIG_RISCV_ISA_C=y, the patch uses 16-bit length
c.ebreak instruction, which may occupy the first part of the 32-bit
instruction and leave half the rest of the broken instruction. Because
ebreak could detour the flow to skip it, leaving it in the kernel text
memory is okay.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/patch.h     |  1 -
 arch/riscv/kernel/patch.c          | 33 ------------------------------
 arch/riscv/kernel/probes/kprobes.c | 29 ++++++++++++++++++--------
 3 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9a7d7346001e..2500782e6f5b 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -7,6 +7,5 @@
 #define _ASM_RISCV_PATCH_H
 
 int patch_text_nosync(void *addr, const void *insns, size_t len);
-int patch_text(void *addr, u32 insn);
 
 #endif /* _ASM_RISCV_PATCH_H */
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..8bd51ed8b806 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -98,36 +98,3 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
 	return ret;
 }
 NOKPROBE_SYMBOL(patch_text_nosync);
-
-static int patch_text_cb(void *data)
-{
-	struct patch_insn *patch = data;
-	int ret = 0;
-
-	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
-		ret =
-		    patch_text_nosync(patch->addr, &patch->insn,
-					    GET_INSN_LENGTH(patch->insn));
-		atomic_inc(&patch->cpu_count);
-	} else {
-		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
-			cpu_relax();
-		smp_mb();
-	}
-
-	return ret;
-}
-NOKPROBE_SYMBOL(patch_text_cb);
-
-int patch_text(void *addr, u32 insn)
-{
-	struct patch_insn patch = {
-		.addr = addr,
-		.insn = insn,
-		.cpu_count = ATOMIC_INIT(0),
-	};
-
-	return stop_machine_cpuslocked(patch_text_cb,
-				       &patch, cpu_online_mask);
-}
-NOKPROBE_SYMBOL(patch_text);
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 475989f06d6d..27f8960c321c 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -24,12 +24,18 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
 	unsigned long offset = GET_INSN_LENGTH(p->opcode);
+#ifdef CONFIG_RISCV_ISA_C
+	u32 opcode = __BUG_INSN_16;
+#else
+	u32 opcode = __BUG_INSN_32;
+#endif
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
-	patch_text(p->ainsn.api.insn, p->opcode);
-	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
-		   __BUG_INSN_32);
+	patch_text_nosync(p->ainsn.api.insn, &p->opcode, offset);
+	patch_text_nosync((void *)((unsigned long)(p->ainsn.api.insn) + offset),
+			  &opcode, GET_INSN_LENGTH(opcode));
+
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
@@ -114,16 +120,23 @@ void *alloc_insn_page(void)
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
-	if ((p->opcode & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
-		patch_text(p->addr, __BUG_INSN_32);
-	else
-		patch_text(p->addr, __BUG_INSN_16);
+#ifdef CONFIG_RISCV_ISA_C
+	u32 opcode = __BUG_INSN_16;
+#else
+	u32 opcode = __BUG_INSN_32;
+#endif
+	patch_text_nosync(p->addr, &opcode, GET_INSN_LENGTH(opcode));
 }
 
 /* remove breakpoint from text */
 void __kprobes arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_text(p->addr, p->opcode);
+#ifdef CONFIG_RISCV_ISA_C
+	u32 opcode = __BUG_INSN_16;
+#else
+	u32 opcode = __BUG_INSN_32;
+#endif
+	patch_text_nosync(p->addr, &p->opcode, GET_INSN_LENGTH(opcode));
 }
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
