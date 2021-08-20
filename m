Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C515C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 12:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1DF6108F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 12:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F1DF6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l300ul9AwHe3pbJxQpby2nQzOB9ZjJA6nQlAZ2f/xX0=; b=zguhQ2jRzAZ3QM
	r1PeEIRHSj4sk7xEnJAhMoNnKjCN2VbOAwZUQs6vVjql9aMUn+mXGMR2HE36rxXwJUUgajyfAvjHp
	PjHy6ElT8p1JtOi+pw3V+ZJqOq5c/Ap+FnIX/oPlZ8tm7MqZsBsJyQh9U0zsGbigBPhDyn3Bqp+ba
	IKPtStjms670huKhYU2iNHhwvHunxblVHtMzmqZBuZPMBiHWIW+FrfI5ch8clMNM52glRrEKOCP6s
	ZkdjN8/plrHVRUXPeWVTBGleJwY+cgJ9cRTOSrNKDTZI5moQExdWX9STWWiRYOV1JhTJe1b9sAyi4
	SAAA9NdEQCIWBwTNvTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3qM-00BAO8-5P; Fri, 20 Aug 2021 12:41:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3qI-00BAM8-Mp
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 12:41:52 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Grh4S2z3PzbgCf;
 Fri, 20 Aug 2021 20:38:00 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 20 Aug 2021 20:41:46 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 20 Aug 2021 20:41:46 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>
Subject: [PATCH -next v2 1/3] riscv/vdso: Refactor asm/vdso.h
Date: Fri, 20 Aug 2021 12:50:40 +0000
Message-ID: <20210820125042.1844629-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20210820125042.1844629-1-tongtiangen@huawei.com>
References: <20210820125042.1844629-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_054151_149255_DD221654 
X-CRM114-Status: GOOD (  11.39  )
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

The asm/vdso.h will be included in vdso.lds.S in the next patch, the
following cleanup is needed to avoid syntax error:

 1.the declaration of sys_riscv_flush_icache() is moved into asm/syscall.h.
 2.the definition of struct vdso_data is moved into kernel/vdso.c.
 2.the definition of VDSO_SYMBOL is placed under "#ifndef __ASSEMBLY__".

Also remove the redundant linux/types.h include.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/include/asm/syscall.h  |  1 +
 arch/riscv/include/asm/vdso.h     | 10 ++--------
 arch/riscv/kernel/syscall_table.c |  1 -
 arch/riscv/kernel/vdso.c          |  5 ++++-
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index b933b1583c9f..34fbb3ea21d5 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -82,4 +82,5 @@ static inline int syscall_get_arch(struct task_struct *task)
 #endif
 }
 
+asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 1453a2f563bc..c1651589dd9b 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -8,13 +8,7 @@
 #ifndef _ASM_RISCV_VDSO_H
 #define _ASM_RISCV_VDSO_H
 
-#include <linux/types.h>
-
-#ifndef CONFIG_GENERIC_TIME_VSYSCALL
-struct vdso_data {
-};
-#endif
-
+#ifndef __ASSEMBLY__
 /*
  * The VDSO symbols are mapped into Linux so we can just use regular symbol
  * addressing to get their offsets in userspace.  The symbols are mapped at an
@@ -29,6 +23,6 @@ struct vdso_data {
 	(void __user *)((unsigned long)(base) + __vdso_##name);			\
 })
 
-asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
+#endif
 
 #endif /* _ASM_RISCV_VDSO_H */
diff --git a/arch/riscv/kernel/syscall_table.c b/arch/riscv/kernel/syscall_table.c
index a63c667c27b3..44b1420a2270 100644
--- a/arch/riscv/kernel/syscall_table.c
+++ b/arch/riscv/kernel/syscall_table.c
@@ -7,7 +7,6 @@
 #include <linux/linkage.h>
 #include <linux/syscalls.h>
 #include <asm-generic/syscalls.h>
-#include <asm/vdso.h>
 #include <asm/syscall.h>
 
 #undef __SYSCALL
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 25a3b8849599..72e93d218335 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -12,10 +12,13 @@
 #include <linux/binfmts.h>
 #include <linux/err.h>
 #include <asm/page.h>
+#include <asm/vdso.h>
+
 #ifdef CONFIG_GENERIC_TIME_VSYSCALL
 #include <vdso/datapage.h>
 #else
-#include <asm/vdso.h>
+struct vdso_data {
+};
 #endif
 
 extern char vdso_start[], vdso_end[];
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
