Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DD5C6FA90
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhkN1RuuT66n3ihis04RhHPaj2yidvLmDjoNn0PgaB4=; b=kGyMG4C0YVrw/1
	U13NKZJWEG9HhcJvzN+XHozfvnEgCNNrIlV1Tso5zgcjW1te7zbYsRCPrttPiyWPRQ8k6x7wl7Gsn
	ECSaru0Bnk9hgpfqkIlzdqJyJbhABAHOnBk/KCBZiaYAhitKBYH3du4tsFD57bpFAhAiqWvgGDY35
	804bcUxdceEMatC30Lju/TI9dquIIU1r5vth2UYh1tnaa//p9kOmKyOfES3x3Ui+LklF41v0f/uC4
	Xmv+qmm8rQN4oga1xB+NNqKPErdJZG169Pwp6+Hhf8IFEw3jb5EtL81KjoBr5hA5lrvGM//ygr71l
	evwXhpuJLsWMsJl+RcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeOp-0033Zz-IE; Fri, 23 Sep 2022 08:51:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeOS-0033R5-EI; Fri, 23 Sep 2022 08:50:47 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYm3Q04rLzWgpB;
	Fri, 23 Sep 2022 16:46:41 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 16:50:39 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <liaochang1@huawei.com>, <alexandru.elisei@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/3] csky/kprobe: Optimize the performance of patching single-step slot
Date: Fri, 23 Sep 2022 16:46:57 +0800
Message-ID: <20220923084658.99304-3-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220923084658.99304-1-liaochang1@huawei.com>
References: <20220923084658.99304-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_015044_694673_F4E42BCD 
X-CRM114-Status: UNSURE (   7.91  )
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

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/csky/kernel/probes/kprobes.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
index 3c6e5c725d81..4feb5ce16264 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -57,7 +57,11 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
-	patch_text(p->ainsn.api.insn, p->opcode);
+	memcpy(p->ainsn.api.insn, &p->opcode, offset);
+	dcache_wb_range((unsigned long)p->ainsn.api.insn,
+			(unsigned long)p->ainsn.api.insn + offset);
+	icache_inv_range((unsigned long)p->ainsn.api.insn,
+			 (unsigned long)p->ainsn.api.insn + offset);
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
