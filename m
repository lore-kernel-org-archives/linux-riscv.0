Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D716AC11F68
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 02:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9000A61D04
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 02:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9000A61D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i0NTFi2aRUfQ7FcMYQyuMbasuoH/CCS/hUvv4a1cagQ=; b=hLA9u9Vd948BO+
	TWcujrWMP5KblbF7Imt2mrMrzrUdfTPf8Atlld2tNbahY4N2R/NnS14RoonXUsYkzac9Pgz+TiXcO
	zCVo93cR3+CY7+GEV26b4i8hf+xspl4KCUkHhXstODjGcoWFVbSxthScot1tzIWpKvx/GEcaSYq1s
	2+TcHLm9UY4J65m8DSSZsgibHwjCitIYlPsDLTf93E+Fam1pTC7HhIJSugmV0i1GBrjJ+o7nGN0P3
	rb4YTiTOja78z2FR2NIOK5SnGWL8fK0WW4tsnDn8WRRMqDp5/8hZKMnGI9ThyF+uBSGIeNEkL4pOd
	n33Gx3Lpp2j1HIRcI9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly3bR-009d7d-Gh; Tue, 29 Jun 2021 02:35:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly3b2-009d5m-8B
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 02:35:34 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GDT2y1Qs2zXljJ;
 Tue, 29 Jun 2021 10:30:02 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 29 Jun 2021 10:35:20 +0800
Received: from huawei.com (10.67.174.169) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 29 Jun
 2021 10:35:19 +0800
From: Chen Lifu <chenlifu@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <guoren@linux.alibaba.com>, <chenlifu@huawei.com>, <penberg@kernel.org>,
 <mhiramat@kernel.org>, <me@packi.ch>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 1/2] riscv: implemented auipc simulate instruction
Date: Tue, 29 Jun 2021 10:34:54 +0800
Message-ID: <20210629023455.280998-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_193532_687514_9E2CD8BE 
X-CRM114-Status: GOOD (  13.75  )
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

To test the kprobe-based event tracing, we prepare
a kernel module 'kprobe_test.ko' to add the probes.
The assembly codes (partially) of the module are as follows:
...
0000000000000000 <kprobe_test_branch>:
...
0000000000000038 <.LVL1>:
  38:	00000597          	auipc	a1,0x0
  3c:	00058593          	mv	a1,a1
...

Test the kprobe-based event tracing in qemu-system-riscv64:
First, install the kprobe test module:
insmod /root/kprobe_test.ko

Then, add a probe as a new event at an 'auipc' instruction,
the following error occurs due to the instruction not allowed to probe yet:
echo "p:auipc kprobe_test:kprobe_test_branch+0x38 epc=%epc opcode=+0(%epc):x32" >> /sys/kernel/debug/tracing/kprobe_events
sh: write error: Invalid argument

This patch implemented the 'auipc' simulate instruction and allowed to probe it.
Merge this patch and perform the test again, the test results are as follows:
First, add a probe at the 'auipc' instruction:
echo "p:auipc kprobe_test:kprobe_test_branch+0x38 epc=%epc opcode=+0(%epc):x32" >> /sys/kernel/debug/tracing/kprobe_events
echo 1 > /sys/kernel/debug/tracing/events/kprobes/auipc/enable

Then, do something to run to the probe.
After that, see the traced information:
cat /sys/kernel/debug/tracing/trace
sysctl-58      [001] d...   179.126350: auipc: (kprobe_test_branch+0x38/0x10e [kprobe_test]) epc=0xffffffff016122aa opcode=0x100073

Now we can see the traced information.
The actual address of the symbol 'kprobe_test_branch' is as follows:
cat /proc/kallsyms | grep kprobe_test_branch
ffffffff01612272 t kprobe_test_branch   [kprobe_test]

Based on the traced information and the actual address of the symbol
'kprobe_test_branch', we can also see that the 'auipc' instruction
has been replaced by 'ebreak(0x100073)' instruction.

--------

Signed-off-by: Chen Lifu <chenlifu@huawei.com>
---
 arch/riscv/kernel/probes/decode-insn.c   |  2 +-
 arch/riscv/kernel/probes/simulate-insn.c | 34 ++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 0ed043acc882..5eb03fb61450 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -38,11 +38,11 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 #endif
 
-	RISCV_INSN_REJECTED(auipc,		insn);
 	RISCV_INSN_REJECTED(branch,		insn);
 
 	RISCV_INSN_SET_SIMULATE(jal,		insn);
 	RISCV_INSN_SET_SIMULATE(jalr,		insn);
+	RISCV_INSN_SET_SIMULATE(auipc,		insn);
 
 	return INSN_GOOD;
 }
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 2519ce26377d..b81719522d5c 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -83,3 +83,37 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 
 	return ret;
 }
+
+#define auipc_rd_idx(opcode) \
+	((opcode >> 7) & 0x1f)
+
+#define auipc_imm(opcode) \
+	((((opcode) >> 12) & 0xfffff) << 12)
+
+#if __riscv_xlen == 64
+#define auipc_offset(opcode)	sign_extend64(auipc_imm(opcode), 31)
+#elif __riscv_xlen == 32
+#define auipc_offset(opcode)	auipc_imm(opcode)
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	/*
+	 * auipc instruction:
+	 *  31        12 11 7 6      0
+	 * | imm[31:12] | rd | opcode |
+	 *        20       5     7
+	 */
+
+	u32 rd_idx = auipc_rd_idx(opcode);
+	unsigned long rd_val = addr + auipc_offset(opcode);
+
+	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
+		return false;
+
+	instruction_pointer_set(regs, addr + 4);
+
+	return true;
+}
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
