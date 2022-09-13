Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450AAC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 03:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gI8t9wTCRnh+sINBKit2N1IBDZlQddAPWVUEWCdy9NQ=; b=YyvuJCV0jYiCQo
	iigz4O9uo67kl6fQEKOBbOEjVrOjkef/ST5mztIqNbe4vhVWrZ/+6hxi7I0Nx/XD8KYlJbCHcGy9V
	31oSpWftzyrpfdFnVodXNYQ3cxAFhIpEw3Ur338kzv7IfKB+s0yjqxhyg+X4eew8cMPAJGNcqZinV
	2ns0fSbVkXOY6zvE1bxn2kusCBFgS8EgCyqU9aGoNxWuNItmkop6HZIfTpdHvC6Fp+JWe2a1eFHUF
	FSrC1noLjPUvbbYeCUJKUtiUfH8oExITzai/B4Q4EVHsd6nXe0uORMYMwO8rbEXd3zdsiQgit07VL
	DqfDKvvWAu3UiZvXQGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXwlA-00149v-Ek; Tue, 13 Sep 2022 03:38:52 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXwko-0013wy-EQ; Tue, 13 Sep 2022 03:38:32 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MRTf16HnPzHntv;
	Tue, 13 Sep 2022 11:36:25 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 11:38:25 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>, <liaochang1@huawei.com>,
	<maz@kernel.org>, <alexandru.elisei@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH V2 2/3] csky/kprobe: Optimize the performance of patching single-step slot
Date: Tue, 13 Sep 2022 11:34:53 +0800
Message-ID: <20220913033454.104519-3-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913033454.104519-1-liaochang1@huawei.com>
References: <20220913033454.104519-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_203830_706353_9C903955 
X-CRM114-Status: UNSURE (   7.75  )
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
