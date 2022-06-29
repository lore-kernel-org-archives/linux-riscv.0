Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2DBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPBtUIPS3t64P+GONOLBSUlK+gLP03lOhBcbc3+lvg4=; b=Dg0rXIMk78LpNw
	F7JLN5Pe31Iw188UXI/TYN7Pgo/KB9hxzJoyq1KHjE07c3fYf0p4vurM060Rk93hQudsqfECV5jTK
	bAWnDvGf4QnLXB5zKPsygrpqA4ATwFLmKYsJGwONd20s2EMX7ceUYo5rUNmf9rMQek54JsvoVNucu
	hQm5U66Psl8r+ZJGkGZmo/O70uD6cDjucq/G/poJQkSmo503SD9awKXhLCdKF3ao/dAzU9ENc/nxF
	sSIlytC07E5eO1ABt+5+uxJuGZTRSY8z+aQrl5WzscQju7MNos5pbh7FtjC2/EAiUTyo3uZTxrAPt
	v7wSxNgKWJTaCzKomkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6MIx-008ssM-1d; Wed, 29 Jun 2022 01:15:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6MIu-008sqb-41
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 01:15:42 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LXk500rRXzkWvG;
	Wed, 29 Jun 2022 09:14:12 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 29 Jun
 2022 09:15:31 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <liaochang1@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv/kprobes: allocate detour buffer from module area
Date: Wed, 29 Jun 2022 09:13:17 +0800
Message-ID: <20220629011317.259986-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_181540_374250_A18B61FE 
X-CRM114-Status: UNSURE (   9.58  )
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

To address the limitation of PC-relative branch instruction
on riscv architecture, detour buffer slot is allocated from
a area, the distance of which from kernel should be less than 4GB.

For the time being, Modules region always live before the kernel.
But Vmalloc region reside far away from kernel, the distance is
half of the kernel address space.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/riscv/kernel/probes/kprobes.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e6e950b7cf32..bc027a663b17 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -6,12 +6,14 @@
 #include <linux/extable.h>
 #include <linux/slab.h>
 #include <linux/stop_machine.h>
+#include <linux/moduleloader.h>
 #include <asm/ptrace.h>
 #include <linux/uaccess.h>
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
 #include <asm/patch.h>
+#include <asm/set_memory.h>
 
 #include "decode-insn.h"
 
@@ -86,10 +88,28 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 #ifdef CONFIG_MMU
 void *alloc_insn_page(void)
 {
+#if defined(CONFIG_MODULES) && defined(CONFIG_64BIT)
+	void *page;
+
+	page = module_alloc(PAGE_SIZE);
+	if (!page)
+		return NULL;
+
+	set_vm_flush_reset_perms(page);
+	/*
+	 * First make the page read-only, and only then make it executable to
+	 * prevent it from being W+X in between.
+	 */
+	set_memory_ro((unsigned long)page, 1);
+	set_memory_x((unsigned long)page, 1);
+
+	return page;
+#else
 	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
 				     GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
 				     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
 				     __builtin_return_address(0));
+#endif
 }
 #endif
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
