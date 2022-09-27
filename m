Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C8BC32771
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 02:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFDjLCSzS03MBcYma24sV0eATt59K4qnambk2YrMNx8=; b=OZpNpMQB1xTVOx
	bY7tFoDCn/vKncxqf/OI+t6LUgbaX3eSW70S407FNuKpQ7mRfSEQhvvmefIFAsxcjqEpXAduSTnOS
	MsN/ql6zGg2hsjdufG8yWV87zrcaN+orX0FRRNFybbf+cdK6P/te9QIuH5YP03NJnHAWQTMmu2eso
	WSFtessdWw2caKfJEjblJltjjAHP1Kd+Y68nscbpc0upDbiLnyN10aVy8cdVlwW4A/Rk1dJZiYGLf
	iauESJ5sV7roT25BTXl4NU3tWDarg146GOFk29iXzNpJXsV9O1Op767g0gpioJxJ2I8uO/dMqaHa9
	pLAanJ2zIR56AP1qYSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0LG-007q3h-Gy; Tue, 27 Sep 2022 02:29:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0Kk-007pyL-Su; Tue, 27 Sep 2022 02:28:33 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mc3Pg1x01zpVN2;
	Tue, 27 Sep 2022 10:25:27 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:28:21 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <maz@kernel.org>,
	<alexandru.elisei@arm.com>, <liaochang1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching single-step slot
Date: Tue, 27 Sep 2022 10:24:35 +0800
Message-ID: <20220927022435.129965-4-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927022435.129965-1-liaochang1@huawei.com>
References: <20220927022435.129965-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_192831_124637_8B78CB59 
X-CRM114-Status: GOOD (  13.46  )
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

Single-step slot would not be used until kprobe is enabled, that means
no race condition occurs on it under SMP, hence it is safe to pacth ss
slot without stopping machine.

Since I and D caches are coherent within single-step slot from
aarch64_insn_patch_text_nosync(), hence no need to do it again via
flush_icache_range().

Acked-by: Will Deacon <will@kernel.org>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/arm64/kernel/probes/kprobes.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index d1d182320245..c9e4d0720285 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -44,13 +44,28 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
 	kprobe_opcode_t *addr = p->ainsn.api.insn;
-	void *addrs[] = {addr, addr + 1};
-	u32 insns[] = {p->opcode, BRK64_OPCODE_KPROBES_SS};
 
-	/* prepare insn slot */
-	aarch64_insn_patch_text(addrs, insns, 2);
-
-	flush_icache_range((uintptr_t)addr, (uintptr_t)(addr + MAX_INSN_SIZE));
+	/*
+	 * Prepare insn slot, Mark Rutland points out it depends on a coupe of
+	 * subtleties:
+	 *
+	 * - That the I-cache maintenance for these instructions is complete
+	 *   *before* the kprobe BRK is written (and aarch64_insn_patch_text_nosync()
+	 *   ensures this, but just omits causing a Context-Synchronization-Event
+	 *   on all CPUS).
+	 *
+	 * - That the kprobe BRK results in an exception (and consequently a
+	 *   Context-Synchronoization-Event), which ensures that the CPU will
+	 *   fetch thesingle-step slot instructions *after* this, ensuring that
+	 *   the new instructions are used
+	 *
+	 * It supposes to place ISB after patching to guarantee I-cache maintenance
+	 * is observed on all CPUS, however, single-step slot is installed in
+	 * the BRK exception handler, so it is unnecessary to generate
+	 * Contex-Synchronization-Event via ISB again.
+	 */
+	aarch64_insn_patch_text_nosync(addr, p->opcode);
+	aarch64_insn_patch_text_nosync(addr + 1, BRK64_OPCODE_KPROBES_SS);
 
 	/*
 	 * Needs restoring of return address after stepping xol.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
