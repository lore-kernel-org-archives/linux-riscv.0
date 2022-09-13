Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C4AECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 02:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMzyiHTTNotnxc0KAjwz+doQVm/srxuC+JPY+9LiPKI=; b=G2jwCeRz5jnDDp
	EZKj8Mnw4Xby5YV8yexxtPkYZ7Sb2EobUESUSphPIMM1mHqQ1o/KKj7hr4uuOlE6xoIo6YI9hYAxy
	PT/iNjDjqe4kBV+IaP2ZCBcWjiRSO8AJc+jIBpofUjue9PzS63aaKDgAhmbAQVRFhrqOQvfh//34B
	8AhmEV2tjxTHV6YUHSECCUp31TQFhjUBv1la/gieep5j7RlqWELtfSl47Hdlbcr06GDAe0u6gQe5x
	XEQjXO7JROg9Gu2iXVJHjsWNVa4EklwQfu8MQztDDOfSJgIjwf1chQB4vSnQufB2wK1nYz7fO7gR+
	temOgklcOyFFWjE2dmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXvdr-000IGl-AP; Tue, 13 Sep 2022 02:27:15 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXvdn-000IAT-OB
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 02:27:13 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRS0l04YxzNm9d;
	Tue, 13 Sep 2022 10:22:30 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 10:27:05 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>, <liaochang1@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liaochang@huawei.com>, <chenguokai17@mails.ucas.ac.cn>
Subject: [PATCH V2] riscv/kprobes: allocate detour buffer from module area
Date: Tue, 13 Sep 2022 10:23:34 +0800
Message-ID: <20220913022334.83997-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_192711_981178_0C9ECB0F 
X-CRM114-Status: UNSURE (   9.14  )
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
on riscv architecture, detour buffer slot used for optprobes is
allocated from a region, the distance of which from kernel should be
less than 4GB.

For the time being, Modules region always live before the kernel.
But Vmalloc region reside far from kernel, the distance is half of the
kernel address space (See Documentation/riscv/vm-layout.rst), hence it
needs to override the alloc_optinsn_page() to make sure allocate detour
buffer from jump-safe region.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
v2:
1. Avoid to depend on CONFIG_MODUELS.
2. Override alloc_optinsn_page to allocate slot from jump-safe region.

---
 arch/riscv/kernel/probes/kprobes.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e6e950b7cf32..fd62b0b086d2 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -12,6 +12,7 @@
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
 #include <asm/patch.h>
+#include <asm/set_memory.h>
 
 #include "decode-insn.h"
 
@@ -84,6 +85,30 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 }
 
 #ifdef CONFIG_MMU
+#ifdef CONFIG_OPTPROBES
+void *alloc_optinsn_page(void)
+{
+	void *page;
+
+	page = __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR,
+				    MODULES_END, GFP_KERNEL,
+				    PAGE_KERNEL, 0, NUMA_NO_NODE,
+				    __builtin_return_address(0));
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
+}
+#endif
+
 void *alloc_insn_page(void)
 {
 	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
