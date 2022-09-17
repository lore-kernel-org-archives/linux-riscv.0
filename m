Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB243ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 02:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIMksRR3/cXTH3MDU+WG+YP4gzv2/qyGWX0cEZ69mrE=; b=Oyl1IOnG9NsKYS
	HwRFnwVVpdOPfJ+zJG4iCDIz/CfFhZXLlRTWTjZ3Pw3xAcCqayokK/4x6hCDcGAaxIvikRcYABbd7
	zTFMn0KzSLLFN1O6/MZQB7RxVA59wp7LIiAGgfPy75bkdMBirn9wmIUYpwVr+CaNXvzrje9/PBB/O
	rlDLtOakBn3cd1JejA8Yw8pRTawyfjNoCfQmCbW5qQ4RNH7WKQl2cQZDsJ3Wbz8EROree5W0y27vR
	ZJZ3Q36GgDsb8OpOTbtFTA30ifXcgzXuVT9UDw69iXQkIj6jaCF3LjpAiX3JP2w1q831Z9W/1FW1K
	CxJcR/W0wNQBPHWa/OaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZN7x-001cs6-Gp; Sat, 17 Sep 2022 02:00:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZN7I-001cT2-IU; Sat, 17 Sep 2022 01:59:38 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MTvCh2PtNzlVkl;
	Sat, 17 Sep 2022 09:55:28 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 09:59:29 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 17 Sep
 2022 09:59:29 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <hca@linux.ibm.com>,
	<gor@linux.ibm.com>, <borntraeger@linux.ibm.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <naveen.n.rao@linux.ibm.com>,
	<anil.s.keshavamurthy@intel.com>, <mhiramat@kernel.org>, <namit@vmware.com>,
	<catalin.marinas@arm.com>, <peterz@infradead.org>, <mark.rutland@arm.com>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>, <zouyipeng@huawei.com>
Subject: [PATCH 2/2] uprobes: make arch_uprobe_exception_notify as weak
Date: Sat, 17 Sep 2022 09:55:22 +0800
Message-ID: <20220917015522.44583-3-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220917015522.44583-1-zouyipeng@huawei.com>
References: <20220917015522.44583-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_185936_982244_E6658252 
X-CRM114-Status: UNSURE (   8.30  )
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

The function implementation under some arch does nothing.
We can mark it with weak attributes to improve.

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 arch/arm/probes/uprobes/core.c     | 6 ------
 arch/arm64/kernel/probes/uprobes.c | 6 ------
 arch/csky/kernel/probes/uprobes.c  | 6 ------
 arch/riscv/kernel/probes/uprobes.c | 6 ------
 kernel/events/uprobes.c            | 6 ++++++
 5 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index f5f790c6e5f8..535ea1b355ed 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -175,12 +175,6 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	instruction_pointer_set(regs, utask->vaddr);
 }
 
-int arch_uprobe_exception_notify(struct notifier_block *self,
-				 unsigned long val, void *data)
-{
-	return NOTIFY_DONE;
-}
-
 static int uprobe_trap_handler(struct pt_regs *regs, unsigned int instr)
 {
 	unsigned long flags;
diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index d49aef2657cd..687ede3375a6 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -159,12 +159,6 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 	return orig_ret_vaddr;
 }
 
-int arch_uprobe_exception_notify(struct notifier_block *self,
-				 unsigned long val, void *data)
-{
-	return NOTIFY_DONE;
-}
-
 static int uprobe_breakpoint_handler(struct pt_regs *regs,
 				     unsigned long esr)
 {
diff --git a/arch/csky/kernel/probes/uprobes.c b/arch/csky/kernel/probes/uprobes.c
index 2d31a12e46cf..67ff13d960e8 100644
--- a/arch/csky/kernel/probes/uprobes.c
+++ b/arch/csky/kernel/probes/uprobes.c
@@ -132,12 +132,6 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 	return ra;
 }
 
-int arch_uprobe_exception_notify(struct notifier_block *self,
-				 unsigned long val, void *data)
-{
-	return NOTIFY_DONE;
-}
-
 int uprobe_breakpoint_handler(struct pt_regs *regs)
 {
 	if (uprobe_pre_sstep_notifier(regs))
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index c976a21cd4bd..770f16c6e00f 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -131,12 +131,6 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 	return ra;
 }
 
-int arch_uprobe_exception_notify(struct notifier_block *self,
-				 unsigned long val, void *data)
-{
-	return NOTIFY_DONE;
-}
-
 bool uprobe_breakpoint_handler(struct pt_regs *regs)
 {
 	if (uprobe_pre_sstep_notifier(regs))
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index d9e357b7e17c..33e637f7a202 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -2343,6 +2343,12 @@ int uprobe_post_sstep_notifier(struct pt_regs *regs)
 	return 1;
 }
 
+int __weak arch_uprobe_exception_notify(struct notifier_block *self,
+				 unsigned long val, void *data)
+{
+	return NOTIFY_DONE;
+}
+
 static struct notifier_block uprobe_exception_nb = {
 	.notifier_call		= arch_uprobe_exception_notify,
 	.priority		= INT_MAX-1,	/* notified after kprobes, kgdb */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
