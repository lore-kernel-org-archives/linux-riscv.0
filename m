Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CC2C54EE9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 02:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSfcmPjFPBQ1mPibkzsDnnIFbbl6bmqwUan4ws9fIwE=; b=A4dWusClCS/hfa
	rY3LcXTa15iULqoSH+tkOcY9rsSFqKFtWJoiXJiofFi2ruvLcb03eRuImMBR/y1dMbj6m9lGcvpNO
	WVMb/ZWTZd4TqwGnVwtc61Qw9lYjKgs+lRq/MHFWLWSdAsTzMQ7lIFw1JDNiP/q8MU1vT40/1e7IH
	mCO2s6TZQ5WOUL9Utj/vG74M97l4lZfvETVqrYicoHm+BeijZwh4yzN2jCNYyx47dluvGsevsD2Th
	LUfxaP1slWKiUzAZdl6QTk//yqq7/kxSb2AwgpMfatDni0vIgb7qMofPYq57hz/7Bm1uEx8OosPvK
	OfLwOlL/yRcrg6KcdDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZN7l-001cjz-JU; Sat, 17 Sep 2022 02:00:05 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZN7H-001cS4-TX; Sat, 17 Sep 2022 01:59:38 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MTvFw1Z8SzBsPD;
	Sat, 17 Sep 2022 09:57:24 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 09:59:29 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 17 Sep
 2022 09:59:28 +0800
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
Subject: [PATCH 1/2] kprobes: make arch_init_kprobes as weak
Date: Sat, 17 Sep 2022 09:55:21 +0800
Message-ID: <20220917015522.44583-2-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220917015522.44583-1-zouyipeng@huawei.com>
References: <20220917015522.44583-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_185936_309784_8A4121D8 
X-CRM114-Status: UNSURE (   7.84  )
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
 arch/csky/kernel/probes/kprobes.c  | 5 -----
 arch/riscv/kernel/probes/kprobes.c | 5 -----
 arch/s390/kernel/kprobes.c         | 5 -----
 arch/x86/kernel/kprobes/core.c     | 5 -----
 kernel/kprobes.c                   | 5 +++++
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
index 3c6e5c725d81..d31b6ab5cea0 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -405,8 +405,3 @@ int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
 	return 0;
 }
-
-int __init arch_init_kprobes(void)
-{
-	return 0;
-}
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e6e950b7cf32..d4577108e5c9 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -362,8 +362,3 @@ int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
 	return 0;
 }
-
-int __init arch_init_kprobes(void)
-{
-	return 0;
-}
diff --git a/arch/s390/kernel/kprobes.c b/arch/s390/kernel/kprobes.c
index 0032bdbe8e3f..aaf9329a7cf4 100644
--- a/arch/s390/kernel/kprobes.c
+++ b/arch/s390/kernel/kprobes.c
@@ -544,11 +544,6 @@ int kprobe_exceptions_notify(struct notifier_block *self,
 }
 NOKPROBE_SYMBOL(kprobe_exceptions_notify);
 
-int __init arch_init_kprobes(void)
-{
-	return 0;
-}
-
 int arch_trampoline_kprobe(struct kprobe *p)
 {
 	return 0;
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 4c3c27b6aea3..e26b336f8b18 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -1055,11 +1055,6 @@ int __init arch_populate_kprobe_blacklist(void)
 					 (unsigned long)__entry_text_end);
 }
 
-int __init arch_init_kprobes(void)
-{
-	return 0;
-}
-
 int arch_trampoline_kprobe(struct kprobe *p)
 {
 	return 0;
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index ca9d834d0b84..23f6d329b53b 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -2684,6 +2684,11 @@ void kprobe_free_init_mem(void)
 	mutex_unlock(&kprobe_mutex);
 }
 
+int __init __weak arch_init_kprobes(void)
+{
+	return 0;
+}
+
 static int __init init_kprobes(void)
 {
 	int i, err = 0;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
