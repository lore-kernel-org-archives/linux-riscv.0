Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA62C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbJ+n30NM9NBR01oMAfSX++lK1rJJG+VZGsmxziD+Fk=; b=W9sLnGWt6RPMlR
	W5pU+72jDABxFuH92dIIQv/52XschXanesqUFvX4pMhxbREz7UOl67LaC6CE1R1mSZzOYoub1k/yx
	KlcRE+52e738Yx5wm2m8YkaDdnF56Z5Ez4v9Fh9jYEmAqdfSarZ07crxkID0afQmMffj5aJnnY4jc
	sxjb6yU3taFqCqdhujNQYGJaj4HOVWXCU6Fwt306SlKrCkVemtabuLCnI6r0x5BUPljJ6O/c3sS9U
	S1GOT5QzgV5yQmUPW9R6jVvLcjxE7N0fPFYTRhFRMTAX2nB0GaE1oToLLaHF65pG2DFjvlwtzYhOG
	8sCtGv7Dgl+uDkx2i1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeOn-0033Z6-TH; Fri, 23 Sep 2022 08:51:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeOS-0033R6-EI; Fri, 23 Sep 2022 08:50:45 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYm3Q4S2lzWgy5;
	Fri, 23 Sep 2022 16:46:42 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 16:50:40 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <liaochang1@huawei.com>, <alexandru.elisei@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching single-step slot
Date: Fri, 23 Sep 2022 16:46:58 +0800
Message-ID: <20220923084658.99304-4-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220923084658.99304-1-liaochang1@huawei.com>
References: <20220923084658.99304-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_015044_694985_B17AF750 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/arm64/kernel/probes/kprobes.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index d1d182320245..29b98bc12833 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -44,13 +44,10 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
 	kprobe_opcode_t *addr = p->ainsn.api.insn;
-	void *addrs[] = {addr, addr + 1};
-	u32 insns[] = {p->opcode, BRK64_OPCODE_KPROBES_SS};
 
 	/* prepare insn slot */
-	aarch64_insn_patch_text(addrs, insns, 2);
-
-	flush_icache_range((uintptr_t)addr, (uintptr_t)(addr + MAX_INSN_SIZE));
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
